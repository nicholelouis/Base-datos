# Programación en SLQ
## Tarea 5

<p align="center">
  <img src="https://github.com/nicholelouis/Base-datos/blob/main/img/optimizacion-bd.png?raw=true" alt="Descripción de la imagen" width="300"/>
</p>

## Trabajo con procedimientos de generación de información

dado el procedimiento base:

```sql
DELIMITER //

CREATE PROCEDURE my_loop(IN iterations INT)
BEGIN
    DECLARE counter INT DEFAULT 0;

    WHILE counter < iterations DO
        -- Coloca aquí el código que deseas ejecutar en cada iteración del bucle
        -- Por ejemplo, puedes imprimir el valor del contador
        SELECT counter;

        SET counter = counter + 1;
    END WHILE;
END//

DELIMITER ;

-- Llama al procedimiento 
CALL my_loop(5);
```

1. Inserta cinco filas en la tabla empleados con nombres aleatorios generados usando la función CONCAT() junto con RAND().
```sql
CREATE PROCEDURE names(IN name_b VARCHAR(50), IN min_name INT, IN max_name INT, IN sal_min DECIMAL(10,2), IN sal_max DECIMAL(10,2), IN times INT)
    -> BEGIN
    ->     DECLARE counter INT DEFAULT 0;
    -> 
    ->     WHILE counter < times DO
    ->         INSERT INTO empleados (nombre, salario)
    ->         VALUES (CONCAT(name_b, FLOOR(RAND() * (max_name - min_name + 1)) ), FLOOR(RAND() * (sal_max - sal_min + 1)));
    ->         SET counter = counter + 1;
    ->     END WHILE;
    -> END //
Query OK, 0 rows affected (0,01 sec)
DELIMITER ;
```
```sql
CALL names ('nichole', 1, 6, 4000, 8000, 5);
Query OK, 1 row affected (0,03 sec)

mysql> select * from empleados;
+----+----------+---------+
| id | nombre   | salario |
+----+----------+---------+
|  1 | Juan     | 3960.00 |
|  2 | María    | 4042.50 |
|  3 | Pedro    | 3200.00 |
|  9 | nichole5 | 2594.00 |
| 10 | nichole2 | 1695.00 |
| 11 | nichole4 |  855.00 |
| 12 | nichole5 | 1007.00 |
| 13 | nichole1 | 3434.00 |
+----+----------+---------+
```
2. Inserta tres filas en la tabla empleados con nombres aleatorios generados usando la función UUID().
```sql

```
```sql

```

3. Inserta dos filas en la tabla empleados con nombres aleatorios generados usando la función RAND() junto con ORDER BY RAND().
```sql

```
```sql

```

4. Inserta cuatro filas en la tabla empleados con nombres aleatorios generados usando la función SUBSTRING_INDEX(UUID(), '-', -1).
```sql

```
```sql

```

5. Inserta seis filas en la tabla empleados con nombres aleatorios generados usando la función RAND() y una semilla diferente.
```sql

```
```sql

```
