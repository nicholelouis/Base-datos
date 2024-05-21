# Programación en SLQ
## Tarea 7

<p align="center">
  <img src="https://github.com/nicholelouis/Base-datos/blob/main/img/optimizacion-bd.png?raw=true" alt="Descripción de la imagen" width="300"/>
</p>

## Trabajo con procedimientos de generación de información y Triggers
Crea una base de datos llamada test que contenga una tabla llamada alumnos con las siguientes columnas:

Tabla alumnos:
id (entero sin signo)
nombre (cadena de caracteres)
apellido1 (cadena de caracteres)
apellido2 (cadena de caracteres)
- nota (número real)

```sql
CREATE TABLE alumnos (
id INT,
nombre VARCHAR(50),
apellido1 VARCHAR(50),
apellido2 VARCHAR(50),
nota DECIMAL(10, 2)
);
```

Crea los siguientes triggers:

- Trigger1:trigger_check_nota_before_insert.
  Se ejecuta sobre la tabla alumnos.
  Se ejecuta antes de una operación de inserción.
  Si el nuevo valor de la nota que se quiere insertar es negativo, se guarda como 0.
  Si el nuevo valor de la nota que se quiere insertar es mayor que 10, se guarda como 10.

```sql
DELIMITER //
CREATE TRIGGER before_insert
    -> BEFORE INSERT ON alumnos
    -> FOR EACH ROW
    -> BEGIN
    -> IF NEW.nota<0
    -> THEN SET NEW.nota= 0;
    -> ELSEIF NEW.nota > 10
    -> THEN SET NEW.nota= 10;
    -> END IF ;
    -> END //
Query OK, 0 rows affected (0,02 sec)
``

- rigger2 : trigger_check_nota_before_update.
    Se ejecuta sobre la tabla alumnos.
    Se ejecuta antes de una operación de actualización.
    Si el nuevo valor de la nota que se quiere actualizar es negativo, se guarda como 0.
    Si el nuevo valor de la nota que se quiere actualizar es mayor que 10, se guarda como 10.

```sql
DELIMITER //
CREATE TRIGGER before_update
    -> BEFORE  UPDATE ON alumnos
    -> FOR EACH ROW 
    -> BEGIN
    -> IF NEW.nota < 0
    -> THEN SET NEW.nota = 0;
    -> ELSEIF NEW.nota > 10
    -> THEN SET NEW.nota = 10;
    -> END IF;
    -> END //
Query OK, 0 rows affected (0,02 sec)
DELIMITADOR ;
```

Una vez creados los triggers escriba varias sentencias de inserción y actualización sobre la tabla alumnos y verifica que los triggers se están ejecutando correctamente.

Crea el siguiente procedimiento:

    Procedimiento1:
        - Crea un procedimiento que permita realizar la inserción de un número de alumnos, con una nota mímina y máxima. Estos valores pueden oscilar entre 3, y 10.
        - Crea un procedimiento que permita realizar la inserción de un número de alumnos, con una nota mímina y máxima. Estos valores pueden oscilar entre -10, y 12.
```sql
DELIMITER //
CREATE PROCEDURE alumnos3(
    ->     IN name_b VARCHAR(50),
    ->     IN a1 VARCHAR(50),
    ->     IN a2 VARCHAR(50),
    ->     IN nota_min DECIMAL(10,2),
    ->     IN nota_max DECIMAL(10,2),
    ->     IN times INT
    -> )
    -> BEGIN
    ->     DECLARE counter INT DEFAULT 0;
    -> 
    ->     WHILE counter < times DO
    ->         INSERT INTO alumnos (id, nombre, apellido1, apellido2, nota)
    ->         VALUES (
    ->             FLOOR(RAND() * (100 - times + 1)) +1,
    ->             CONCAT(name_b, SUBSTRING(UUID(), 1, 8)),
    ->             CONCAT(a1, SUBSTRING(UUID(), 1, 8)),
    ->             CONCAT(a2, SUBSTRING(UUID(), 1, 8)),
    ->             nota_min + FLOOR(RAND() * (nota_max - nota_min + 1))
    ->         );
    ->         SET counter = counter + 1;
    ->     END WHILE;
    -> END //
Query OK, 0 rows affected (0,01 sec)
DELIMITER ;
```
```sql
CALL alumnos3('nichole', 'a', 'l', 3, 10, 5);
Query OK, 1 row affected (0,04 sec)

select * from alumnos;
+------+-----------------+-----------+-----------+-------+
| id   | nombre          | apellido1 | apellido2 | nota  |
+------+-----------------+-----------+-----------+-------+
|    1 | nichole         | a         | louis     | 10.00 |
|   55 | nichole6278a91a | a6278a928 | l6278a92c |  5.00 |
|   80 | nichole6279ff69 | a6279ffc0 | l6279ffd4 |  4.00 |
|   69 | nichole627b650f | a627b655e | l627b6570 |  9.00 |
|    5 | nichole627c0cb3 | a627c0ce4 | l627c0cee |  8.00 |
|   49 | nichole627ce317 | a627ce33c | l627ce343 |  5.00 |
+------+-----------------+-----------+-----------+-------+
6 rows in set (0,01 sec)

CALL alumnos3('nichole', 'a', 'l', -10, 12, 5);
Query OK, 1 row affected (0,11 sec)

select * from alumnos;
+------+-----------------+-----------+-----------+-------+
| id   | nombre          | apellido1 | apellido2 | nota  |
+------+-----------------+-----------+-----------+-------+
|    1 | nichole         | a         | louis     | 10.00 |
|   55 | nichole6278a91a | a6278a928 | l6278a92c |  5.00 |
|   80 | nichole6279ff69 | a6279ffc0 | l6279ffd4 |  4.00 |
|   69 | nichole627b650f | a627b655e | l627b6570 |  9.00 |
|    5 | nichole627c0cb3 | a627c0ce4 | l627c0cee |  8.00 |
|   49 | nichole627ce317 | a627ce33c | l627ce343 |  5.00 |
|   12 | nichole73a46e1d | a73a46e5f | l73a46e70 |  4.00 |
|   81 | nichole73a60ea2 | a73a60ef5 | l73a60f04 |  0.00 |
|   83 | nichole73a75290 | a73a752cf | l73a752dc |  0.00 |
|   67 | nichole73a86e98 | a73a86edc | l73a86ee7 |  0.00 |
|   45 | nichole73a9e4fa | a73a9e545 | l73a9e553 | 10.00 |
+------+-----------------+-----------+-----------+-------+
11 rows in set (0,00 sec)
```


