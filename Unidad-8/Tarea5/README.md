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

CREATE PROCEDURE names2(IN name_b VARCHAR(50), IN sal_min DECIMAL(10,2), IN sal_max DECIMAL(10,2), IN times INT)
    -> BEGIN
    ->     DECLARE counter INT DEFAULT 0;
    -> 
    ->     WHILE counter < times DO
    ->         INSERT INTO empleados (nombre, salario)
    ->         VALUES (CONCAT(name_b, UUID()), sal_min + (RAND() * (sal_max - sal_min)));
    ->         SET counter = counter + 1;
    ->     END WHILE;
    -> END //

DELIMITER ;
```
```sql
CALL names2('Armando', 4000, 20000, 3)
select * from empleados;
+----+---------------------------------------------+----------+
| id | nombre                                      | salario  |
+----+---------------------------------------------+----------+
|  1 | Juan                                        |  3960.00 |
|  2 | María                                       |  4042.50 |
|  3 | Pedro                                       |  3200.00 |
|  9 | nichole5                                    |  2594.00 |
| 10 | nichole2                                    |  1695.00 |
| 11 | nichole4                                    |   855.00 |
| 12 | nichole5                                    |  1007.00 |
| 13 | nichole1                                    |  3434.00 |
| 14 | Armandof9e7701c-12dd-11ef-8fbc-080027077231 |  6020.94 |
| 15 | Armandof9e8c2a8-12dd-11ef-8fbc-080027077231 |  8076.12 |
| 16 | Armandof9ea2588-12dd-11ef-8fbc-080027077231 | 18317.82 |
+----+---------------------------------------------+----------+
```

3. Inserta dos filas en la tabla empleados con nombres aleatorios generados usando la función RAND() junto con ORDER BY RAND().
```sql
CREATE TABLE helper(id INT PRIMARY KEY AUTO_INCREMENT, name VARCHAR(50), salario DECIMAL(10, 2));

INSERT INTO helper(name, salario) VALUES ('sebas', 3000), ('ross', 4000), ('dan', 3500), ('Carlos', 1000);

mysql> 
mysql> DELIMITER //
mysql> 
mysql> CREATE PROCEDURE insert2(IN times INT)
    -> BEGIN
    ->     DECLARE counter INT DEFAULT 0;
    -> 
    ->     WHILE counter < times DO
    ->         INSERT INTO empleados (nombre, salario)
    ->         SELECT name, salario FROM helper ORDER BY RAND() LIMIT 1;
    ->         SET counter = counter + 1;
    ->     END WHILE;
    -> END //
Query OK, 0 rows affected (0,09 sec)

DELIMITER ;
```
```sql
select * from empleados;
+----+---------------------------------------------+----------+
| id | nombre                                      | salario  |
+----+---------------------------------------------+----------+
|  1 | Juan                                        |  3960.00 |
|  2 | María                                       |  4042.50 |
|  3 | Pedro                                       |  3200.00 |
|  9 | nichole5                                    |  2594.00 |
| 10 | nichole2                                    |  1695.00 |
| 11 | nichole4                                    |   855.00 |
| 12 | nichole5                                    |  1007.00 |
| 13 | nichole1                                    |  3434.00 |
| 14 | Armandof9e7701c-12dd-11ef-8fbc-080027077231 |  6020.94 |
| 15 | Armandof9e8c2a8-12dd-11ef-8fbc-080027077231 |  8076.12 |
| 16 | Armandof9ea2588-12dd-11ef-8fbc-080027077231 | 18317.82 |
| 17 | dan                                         |  3500.00 |
| 18 | dan                                         |  3500.00 |
+----+---------------------------------------------+----------+
```

4. Inserta cuatro filas en la tabla empleados con nombres aleatorios generados usando la función SUBSTRING_INDEX(UUID(), '-', -1).
```sql
 DELIMITER //
 CREATE PROCEDURE names3(IN name_b VARCHAR(50), IN sal_min DECIMAL(10,2), IN sal_max DECIMAL(10,2), IN times INT)
    ->  BEGIN
    ->      DECLARE counter INT DEFAULT 0;
    ->  
    ->      WHILE counter < times DO
    ->          INSERT INTO empleados (nombre, salario)
    ->          VALUES (CONCAT(name_b, SUBSTRING_INDEX(UUID(), '-', -1)), sal_min + (RAND() * (sal_max - sal_min)));
    ->          SET counter = counter + 1;
    ->      END WHILE;
    ->  END //
 DELIMITER ;

```
```sql
CALL names3('Ross', 5000, 30000, 4);

select * from empleados;
+----+---------------------------------------------+----------+
| id | nombre                                      | salario  |
+----+---------------------------------------------+----------+
|  1 | Juan                                        |  3960.00 |
|  2 | María                                       |  4042.50 |
|  3 | Pedro                                       |  3200.00 |
|  9 | nichole5                                    |  2594.00 |
| 10 | nichole2                                    |  1695.00 |
| 11 | nichole4                                    |   855.00 |
| 12 | nichole5                                    |  1007.00 |
| 13 | nichole1                                    |  3434.00 |
| 14 | Armandof9e7701c-12dd-11ef-8fbc-080027077231 |  6020.94 |
| 15 | Armandof9e8c2a8-12dd-11ef-8fbc-080027077231 |  8076.12 |
| 16 | Armandof9ea2588-12dd-11ef-8fbc-080027077231 | 18317.82 |
| 17 | dan                                         |  3500.00 |
| 18 | dan                                         |  3500.00 |
| 19 | Ross080027077231                            |  9164.75 |
| 20 | Ross080027077231                            | 20258.78 |
| 21 | Ross080027077231                            | 18799.64 |
| 22 | Ross080027077231                            | 28221.89 |
+----+---------------------------------------------+----------+
```

5. Inserta seis filas en la tabla empleados con nombres aleatorios generados usando la función RAND() y una semilla diferente.
```sql
DELIMITER //
CREATE PROCEDURE names4(IN name_b VARCHAR(50), IN min_name INT, IN max_name INT, IN sal_min DECIMAL(10,2), IN sal_max DECIMAL(10,2), IN times INT)
    -> BEGIN
    ->     DECLARE counter INT DEFAULT 0;
    -> 
    ->     WHILE counter < times DO
    ->         INSERT INTO empleados (nombre, salario)
    ->         VALUES (CONCAT(name_b, FLOOR(RAND(counter + 1) * (max_name - min_name + 1)) ), FLOOR(RAND() * (sal_max - sal_min + 1)));
    ->         SET counter = counter + 1;
    ->     END WHILE;
    -> END //
DELIMITER ;
```
```sql
CALL names4 ('nikki', 2, 8, 5390, 12000, 6);
select * from empleados;
+----+---------------------------------------------+----------+
| id | nombre                                      | salario  |
+----+---------------------------------------------+----------+
|  1 | Juan                                        |  3960.00 |
|  2 | María                                       |  4042.50 |
|  3 | Pedro                                       |  3200.00 |
|  9 | nichole5                                    |  2594.00 |
| 10 | nichole2                                    |  1695.00 |
| 11 | nichole4                                    |   855.00 |
| 12 | nichole5                                    |  1007.00 |
| 13 | nichole1                                    |  3434.00 |
| 14 | Armandof9e7701c-12dd-11ef-8fbc-080027077231 |  6020.94 |
| 15 | Armandof9e8c2a8-12dd-11ef-8fbc-080027077231 |  8076.12 |
| 16 | Armandof9ea2588-12dd-11ef-8fbc-080027077231 | 18317.82 |
| 17 | dan                                         |  3500.00 |
| 18 | dan                                         |  3500.00 |
| 19 | Ross080027077231                            |  9164.75 |
| 20 | Ross080027077231                            | 20258.78 |
| 21 | Ross080027077231                            | 18799.64 |
| 22 | Ross080027077231                            | 28221.89 |
| 29 | nikki2                                      |  5629.00 |
| 30 | nikki4                                      |  3861.00 |
| 31 | nikki6                                      |  2419.00 |
| 32 | nikki1                                      |   511.00 |
| 33 | nikki2                                      |  1911.00 |
| 34 | nikki4                                      |  1412.00 |
+----+---------------------------------------------+----------+
```
