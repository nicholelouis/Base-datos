# Programación en SLQ

<p align="center">
  <img src="https://github.com/nicholelouis/Base-datos/blob/main/img/optimizacion-bd.png?raw=true" alt="Descripción de la imagen" width="300"/>
</p>

## Tarea 3

La base de datos de "empleados" es un sistema diseñado para gestionar información relacionada con los empleados de una empresa. Esta base de datos está estructurada en torno a la entidad principal "empleados", que contiene información detallada sobre cada empleado. La estructura de la base de datos se compone de una única tabla principal llamada "empleados".

La tabla "empleados" está diseñada con las siguientes columnas:

- id: Esta columna sirve como identificador único para cada empleado. Es de tipo entero y se genera automáticamente utilizando la propiedad AUTO_INCREMENT.
- nombre: Almacena el nombre completo de cada empleado. Es de tipo cadena de caracteres (VARCHAR) con una longitud máxima de 100 caracteres.
- salario: Esta columna registra el salario de cada empleado. Se define como un número decimal (DECIMAL) con una precisión de 10 dígitos en total y 2 dígitos después del punto decimal.

```sql
-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS empresa;
USE empresa;

-- Crear la tabla empleados
CREATE TABLE empleados (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    salario DECIMAL(10, 2)
);

-- Insertar algunos datos de ejemplo
INSERT INTO empleados (nombre, salario) VALUES
('Juan', 3000.00),
('María', 3500.00),
('Pedro', 3200.00);
```
```sql
+----+--------+---------+
| id | nombre | salario |
+----+--------+---------+
|  1 | Juan   | 3000.00 |
|  2 | María  | 3500.00 |
|  3 | Pedro  | 3200.00 |
+----+--------+---------+
```
En base a la tabla anterior

- 1.- Escribe un procedimiento almacenado que aumente los salarios de todos los empleados en un 5%, pero excluya a aquellos cuyo salario sea superior a 3200. El procedimiento debe tener parámetros de entrada.

```sql
mysql> DELIMITER $$
mysql> CREATE PROCEDURE aumentar_salarios(IN porcentaje DECIMAL(5,2), IN max_sal DECIMAL(10,2))
    -> BEGIN 
    -> DECLARE done INT DEFAULT FALSE;
    -> DECLARE emp_id INT;
    -> DECLARE emp_nombre VARCHAR(100);
    -> DECLARE emp_salario DECIMAL(10, 2);
    -> DECLARE cur CURSOR FOR SELECT id, nombre, salario FROM empleados;
    ->  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    -> 
    -> OPEN cur;
    -> read_loop: LOOP
    -> FETCH cur INTO emp_id, emp_nombre, emp_salario;
    -> IF done THEN
    -> LEAVE read_loop;
    -> END IF;
    -> UPDATE empleados SET salario = salario * (1 + porcentaje / 100) WHERE salario > max_sal and id = emp_id;
    -> END LOOP;
    -> CLOSE cur;
    -> END $$
Query OK, 0 rows affected (0,03 sec)

mysql> CALL aumentar_salarios(5, 3200);
Query OK, 0 rows affected (0,01 sec)

select * from empleados;
+----+--------+---------+
| id | nombre | salario |
+----+--------+---------+
|  1 | Juan   | 3000.00 |
|  2 | María  | 3675.00 |
|  3 | Pedro  | 3200.00 |
+----+--------+---------+
```
- 2.- Escribe un procedimiento almacenado que calcule el salario anual de cada empleado (asumiendo que trabajan todo el año) y lo imprima.

```sql
  DELIMITER //
  CREATE PROCEDURE salario_anual4(IN month INTEGER, IN idd INTEGER)
  BEGIN
      DECLARE done INT DEFAULT FALSE;
      DECLARE emp_salario DECIMAL(10, 2);
      DECLARE cur CURSOR FOR SELECT salario FROM empleados;
      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

      OPEN cur;
      read_loop: LOOP
          FETCH cur INTO emp_salario;
          IF done THEN
              LEAVE read_loop;
          END IF;
          SELECT salario * month as total, id, nombre from empleados WHERE id = idd;
      END LOOP;
      CLOSE cur;
  END //
  DELIMITER ;

+----------+----+--------+
| total    | id | nombre |
+----------+----+--------+
| 44100.00 |  2 | María  |
+----------+----+--------+
1 row in set (0,01 sec)
```

- 3.- Escribe un procedimiento almacenado que cuente y muestre el número de empleados en cada rango de salario (por ejemplo, menos de 3000, entre 3000 y 5000, más de 5000). El procedimiento debe tener parámetros de entrada.

```sql
DELIMITER //
mysql>   CREATE PROCEDURE sal_between(IN min DECIMAL(10,2), IN max DECIMAL(10,2) )
    ->   BEGIN
    ->       DECLARE done INT DEFAULT FALSE;
    ->       DECLARE emp_id INT;
    ->       DECLARE emp_nombre VARCHAR(100);
    ->       DECLARE emp_salario DECIMAL(10, 2);
    ->       DECLARE cur CURSOR FOR SELECT id, nombre, salario FROM empleados;
    ->       DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    -> 
    ->       OPEN cur;
    ->       read_loop: LOOP
    ->           FETCH cur INTO emp_id, emp_nombre, emp_salario;
    ->           IF done THEN
    ->               LEAVE read_loop;
    ->           END IF;
    ->           SELECT count(id) as numero_empleados from empleados where salario BETWEEN min and max;
    ->       END LOOP;
    ->       CLOSE cur;
    ->   END //
Query OK, 0 rows affected (0,00 sec)

+------------------+
| numero_empleados |
+------------------+
|                1 |
+------------------+
1 row in set (0,00 sec)
```
