# Programación en SLQ

<p align="center">
  <img src="https://github.com/nicholelouis/Base-datos/blob/main/img/optimizacion-bd.png?raw=true" alt="Descripción de la imagen" width="300"/>
</p>

## Tarea 4

Trabajo con cursores la BBDD Empleados

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
En base a la tabla anterior:

- Escribe un procedimiento almacenado que copie los nombres de todos los empleados cuyo salario sea superior a 3000 en una nueva tabla llamada 'empleados_destino'. Es necesario crear la tabla empleados_destiono.
```sql
CREATE TABLE empleados_destino(name VARCHAR(50));
Query OK, 0 rows affected (0,05 sec)
mysql>   DELIMITER //
mysql>   CREATE PROCEDURE worker()
    ->   BEGIN
    ->       DECLARE done INT DEFAULT FALSE;
    ->       DECLARE emp_id INT;
    ->       DECLARE emp_nombre VARCHAR(100);
    ->       DECLARE emp_salario DECIMAL(10, 2);
    ->       DECLARE cur CURSOR FOR SELECT id, nombre FROM empleados where salario > 3000;
    ->       DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    -> 
    ->       OPEN cur;
    ->       read_loop: LOOP
    ->           FETCH cur INTO emp_id, emp_nombre;
    ->           IF done THEN
    ->               LEAVE read_loop;
    ->           END IF;
    ->           INSERT INTO empleados_destino (name) VALUES (emp_nombre);
    ->       END LOOP;
    ->       CLOSE cur;
    ->   END //
Query OK, 0 rows affected (0,09 sec)

mysql>   DELIMITER ;
mysql> CALL worker();
Query OK, 0 rows affected (0,02 sec)

mysql> select * from empleados_destino;
+--------+
| name   |
+--------+
| María  |
| Pedro  |
+--------+
2 rows in set (0,00 sec)
```

- Escribe un procedimiento almacenado que seleccione los empleados cuyos nombres contienen la letra 'a' y aumente sus salarios en un 10%.
```sql
mysql> select * from empleados;
+----+--------+---------+
| id | nombre | salario |
+----+--------+---------+
|  1 | Juan   | 3000.00 |
|  2 | María  | 3675.00 |
|  3 | Pedro  | 3200.00 |
+----+--------+---------+
mysql>   DELIMITER //
mysql>   CREATE PROCEDURE aumentar_salarios()
    ->   BEGIN
    ->       DECLARE done INT DEFAULT FALSE;
    ->       DECLARE emp_id INT;
    ->       DECLARE emp_nombre VARCHAR(100);
    ->       DECLARE emp_salario DECIMAL(10, 2);
    ->       DECLARE cur CURSOR FOR SELECT id, nombre, salario FROM empleados WHERE nombre REGEXP 'a';
    ->       DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    -> 
    ->       OPEN cur;
    ->       read_loop: LOOP
    ->           FETCH cur INTO emp_id, emp_nombre, emp_salario;
    ->           IF done THEN
    ->               LEAVE read_loop;
    ->           END IF;
    ->           UPDATE empleados SET salario = salario * (1 + 10 / 100) WHERE id = emp_id;
    ->       END LOOP;
    ->       CLOSE cur;
    ->   END //
Query OK, 0 rows affected (0,01 sec)

mysql>   DELIMITER ;
mysql> CALL aumentar_salarios();
Query OK, 0 rows affected (0,02 sec)

mysql> select * from empleados;
+----+--------+---------+
| id | nombre | salario |
+----+--------+---------+
|  1 | Juan   | 3300.00 |
|  2 | María  | 4042.50 |
|  3 | Pedro  | 3200.00 |
+----+--------+---------+
3 rows in set (0,00 sec)
```

- Escribe un procedimiento almacenado que seleccione empleados cuyos IDs estén en un rango específico, por ejemplo, entre 2 y 3.
```sql
mysql>   DELIMITER //
mysql>   CREATE PROCEDURE ids(IN min INT, IN max INT)
    ->   BEGIN
    ->       DECLARE done INT DEFAULT FALSE;
    ->       DECLARE emp_id INT;
    ->       DECLARE cur CURSOR FOR SELECT id FROM empleados WHERE id BETWEEN min and max;
    ->       DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    -> 
    ->       OPEN cur;
    ->       read_loop: LOOP
    ->           FETCH cur INTO emp_id;
    ->           IF done THEN
    ->               LEAVE read_loop;
    ->           END IF;
    ->           SELECT id from empleados where id = emp_id;
    ->       END LOOP;
    ->       CLOSE cur;
    ->   END //
Query OK, 0 rows affected (0,01 sec)

mysql>   DELIMITER ;
mysql> CALL ids(1, 2);
+----+
| id |
+----+
|  1 |
+----+
1 row in set (0,00 sec)

+----+
| id |
+----+
|  2 |
+----+
1 row in set (0,00 sec)

Query OK, 0 rows affected (0,00 sec)
```
- Escribe un procedimiento almacenado que elimine todos los empleados cuyo salario esté entre 2000 y 2500.
```sql
mysql>   CREATE PROCEDURE del(IN min DECIMAL(10,2), IN max DECIMAL(10,2))
    ->   BEGIN
    ->       DECLARE done INT DEFAULT FALSE;
    ->       DECLARE emp_id INT;
    ->       DECLARE emp_nombre VARCHAR(100);
    ->       DECLARE emp_salario DECIMAL(10, 2);
    ->       DECLARE cur CURSOR FOR SELECT id FROM empleados WHERE salario BETWEEN min and max;
    ->       DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    -> 
    ->       OPEN cur;
    ->       read_loop: LOOP
    ->           FETCH cur INTO emp_id;
    ->           IF done THEN
    ->               LEAVE read_loop;
    ->           END IF;
    ->           DELETE FROM empleados WHERE id = emp_id;
    ->       END LOOP;
    ->       CLOSE cur;
    ->   END //
Query OK, 0 rows affected (0,01 sec)

mysql>   DELIMITER ;
mysql> CALL del(2000, 2500);
Query OK, 0 rows affected (0,00 sec)

mysql> select * from empleados;
+----+--------+---------+
| id | nombre | salario |
+----+--------+---------+
|  1 | Juan   | 3960.00 |
|  2 | María  | 4042.50 |
|  3 | Pedro  | 3200.00 |
+----+--------+---------+
3 rows in set (0,00 sec)

```

- Escribe un procedimiento almacenado que aumente el salario de un empleado específico cuyo nombre se pasa como parámetro en un 20%.
```sql
mysql>   DELIMITER //
mysql>   CREATE PROCEDURE name_dos(IN name VARCHAR(50))
    ->   BEGIN
    ->       DECLARE done INT DEFAULT FALSE;
    ->       DECLARE emp_id INT;
    ->       DECLARE emp_nombre VARCHAR(100);
    ->       DECLARE emp_salario DECIMAL(10, 2);
    ->       DECLARE cur CURSOR FOR SELECT id FROM empleados WHERE nombre = name;
    ->       DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    -> 
    ->       OPEN cur;
    ->       read_loop: LOOP
    ->           FETCH cur INTO emp_id;
    ->           IF done THEN
    ->               LEAVE read_loop;
    ->           END IF;
    ->           UPDATE empleados SET salario = salario * (1 + 20 / 100) WHERE id = emp_id;
    ->       END LOOP;
    ->       CLOSE cur;
    ->   END //
Query OK, 0 rows affected (0,01 sec)

mysql>   DELIMITER ;
mysql> CALL name_dos('Juan');
Query OK, 0 rows affected (0,01 sec)

mysql> select * from empleados;
+----+--------+---------+
| id | nombre | salario |
+----+--------+---------+
|  1 | Juan   | 3960.00 |
|  2 | María  | 4042.50 |
|  3 | Pedro  | 3200.00 |
+----+--------+---------+
3 rows in set (0,00 sec)
```
