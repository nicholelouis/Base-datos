# Programación en SLQ
## Tarea 6

<p align="center">
  <img src="https://github.com/nicholelouis/Base-datos/blob/main/img/optimizacion-bd.png?raw=true" alt="Descripción de la imagen" width="300"/>
</p>

## Trabajo con procedimientos de generación de información
### Salario

Una de las preguntas más comunes que se hacen las personas cuando empiezan su vida laboral, suele ser qué es el salario base. Y es que es normal que la gente ande un poco confundida ya que, si no tienes conocimientos en este campo, es fácil hacerse un lío con términos como:

    - Salario base.
    - Base reguladora.
    - Salario bruto.
    - Salario neto.
      Etc.

Teniendo en cuenta esta información se pide:

- Crea una base datos llamada salario.
```sql
CREATE DATABASE tarea6;
USE tarea6
```

- Crea una tabla llamada persona con los siguientes campos:

    - Identificador. (Texto)(PK).
    - Nombre (Texto).
    - Salario_base. (Escoge el tipo de dato).
    - Subsidio(Escoge el tipo de dato).
    - Salud(Escoge el tipo de dato).
    - Pensión(Escoge el tipo de dato).
    - Bono(Escoge el tipo de dato).
    - Integral(Escoge el tipo de dato).
```sql
CREATE TABLE persona(
id VARCHAR(50) PRIMARY KEY,
name VARCHAR(50),
sal_base DECIMAL(10, 2),
subsidio DECIMAL(10, 2),
salud DECIMAL(10, 2),
pension DECIMAL(10, 2),
bono DECIMAL(10, 2),
integral DECIMAL(10, 2)
);
```
- Creación de un procedimiento de forma aleatoria con las siguientes características:

    - Parámetro de entrada el número de registros (Mínimo 10, y realiza la prueba varias veces).
```sql
DELIMITER //
CREATE PROCEDURE names(IN name_b VARCHAR(50), IN sal_min DECIMAL(10, 2), IN sal_max DECIMAL(10, 2), IN sub_min DECIMAL(10, 2), IN sub_max DECIMAL(10, 2), IN salu_min DECIMAL(10, 2), IN salu_max DECIMAL(10, 2), IN pen_min DECIMAL(10, 2), IN pen_max DECIMAL(10, 2), IN bon_min DECIMAL(10, 2), IN bon_max DECIMAL(10, 2), IN int_min DECIMAL(10, 2), IN int_max DECIMAL(10, 2), in times INT)
BEGIN
    DECLARE counter INT DEFAULT 0;

    WHILE counter < times DO
        INSERT INTO empleados (id, name, sal_base, subsidio, salud, pension, bono, integral)
        VALUES (SUBSTRING_INDEX(UUID(), '-', 1), CONCAT(name_b, FLOOR(RAND() * (100 - 1 + 1)) ), FLOOR(RAND() * (sal_max - sal_min + 1)), FLOOR(RAND() * (sub_max - sub_min + 1)), FLOOR(RAND() * (salu_max - salu_min + 1)), FLOOR(RAND() * (pen_max - pen_min + 1)), FLOOR(RAND() * (bon_max - bon_min + 1)), FLOOR(RAND() * (int_max - int_min + 1)));
        SET counter = counter + 1;
    END WHILE;
END //
```
```sql
CALL create_personas('nikki', 2000, 20000, 100, 800, 200, 1340, 900, 1500, 50, 150, 10, 65, 10);

select * from persona;
+----------+---------+----------+----------+---------+---------+-------+----------+
| id       | name    | sal_base | subsidio | salud   | pension | bono  | integral |
+----------+---------+----------+----------+---------+---------+-------+----------+
| e38f4401 | nikki32 |  4425.00 |   186.00 |  675.00 |   96.00 |  2.00 |    37.00 |
| e390daff | nikki22 |  2731.00 |    51.00 | 1043.00 |  211.00 |  1.00 |     1.00 |
| e3929474 | nikki9  |  7187.00 |   492.00 |  360.00 |  282.00 | 40.00 |    34.00 |
| e3937e1b | nikki84 |  6875.00 |   266.00 |  861.00 |  381.00 | 92.00 |    36.00 |
| e3943896 | nikki51 | 11271.00 |   410.00 |   56.00 |  295.00 | 30.00 |     3.00 |
| e394d661 | nikki36 | 11696.00 |   110.00 |  957.00 |  435.00 | 10.00 |    18.00 |
| e3956ed9 | nikki36 | 14886.00 |    26.00 |  808.00 |  257.00 |  1.00 |    45.00 |
| e396ee84 | nikki98 |  9198.00 |   415.00 |  487.00 |  216.00 | 52.00 |    29.00 |
| e3979e5b | nikki8  | 14628.00 |   576.00 |  769.00 |  543.00 | 50.00 |    43.00 |
| e3984c88 | nikki35 |  8411.00 |   191.00 | 1097.00 |  596.00 |  7.00 |    22.00 |
+----------+---------+----------+----------+---------+---------+-------+----------+
10 rows in set (0,00 sec)
```

- Cree una función para cada punto teniendo en cuenta que:

- Función subsidio_transporte: El subsidio de transporte equivale al 7% al salario básico. Actualiza el valor en la tabla.
```sql
DELIMITER //
CREATE PROCEDURE act_sub(IN porcentaje DECIMAL(5,2))
    ->   BEGIN
    ->       DECLARE done INT DEFAULT FALSE;
    ->       DECLARE per_id VARCHAR(50);
    ->       DECLARE per_sal DECIMAL(10, 2);
    ->       DECLARE per_sub DECIMAL(10, 2);
    ->       DECLARE cur CURSOR FOR SELECT id, sal_base, subsidio FROM persona;
    ->       DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    -> 
    ->       OPEN cur;
    ->       read_loop: LOOP
    ->           FETCH cur INTO per_id, per_sal, per_sub;
    ->           IF done THEN
    ->               LEAVE read_loop;
    ->           END IF;
    ->           UPDATE persona SET subsidio = sal_base * (porcentaje / 100) WHERE id = per_id;
    ->       END LOOP;
    ->       CLOSE cur;
    ->   END //
DELIMITER ;

```
```sql
CALL act_sub(7);
select * from persona;
+----------+---------+----------+----------+---------+---------+-------+----------+
| id       | name    | sal_base | subsidio | salud   | pension | bono  | integral |
+----------+---------+----------+----------+---------+---------+-------+----------+
| e38f4401 | nikki32 |  4425.00 |   309.75 |  675.00 |   96.00 |  2.00 |    37.00 |
| e390daff | nikki22 |  2731.00 |   191.17 | 1043.00 |  211.00 |  1.00 |     1.00 |
| e3929474 | nikki9  |  7187.00 |   503.09 |  360.00 |  282.00 | 40.00 |    34.00 |
| e3937e1b | nikki84 |  6875.00 |   481.25 |  861.00 |  381.00 | 92.00 |    36.00 |
| e3943896 | nikki51 | 11271.00 |   788.97 |   56.00 |  295.00 | 30.00 |     3.00 |
| e394d661 | nikki36 | 11696.00 |   818.72 |  957.00 |  435.00 | 10.00 |    18.00 |
| e3956ed9 | nikki36 | 14886.00 |  1042.02 |  808.00 |  257.00 |  1.00 |    45.00 |
| e396ee84 | nikki98 |  9198.00 |   643.86 |  487.00 |  216.00 | 52.00 |    29.00 |
| e3979e5b | nikki8  | 14628.00 |  1023.96 |  769.00 |  543.00 | 50.00 |    43.00 |
| e3984c88 | nikki35 |  8411.00 |   588.77 | 1097.00 |  596.00 |  7.00 |    22.00 |
+----------+---------+----------+----------+---------+---------+-------+----------+
```

- Función salud: La salud que corresponde al 4% al salario básico. Actualiza el valor en la tabla.
```sql
DELIMITER //
CREATE PROCEDURE act_salud(IN porcentaje DECIMAL(5,2))
    ->   BEGIN
    ->       DECLARE done INT DEFAULT FALSE;
    ->       DECLARE per_id VARCHAR(50);
    ->       DECLARE per_sal DECIMAL(10, 2);
    ->       DECLARE per_salu DECIMAL(10, 2);
    ->       DECLARE cur CURSOR FOR SELECT id, sal_base, salud FROM persona;
    ->       DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    -> 
    ->       OPEN cur;
    ->       read_loop: LOOP
    ->           FETCH cur INTO per_id, per_sal, per_salu;
    ->           IF done THEN
    ->               LEAVE read_loop;
    ->           END IF;
    ->           UPDATE persona SET salud = sal_base * (porcentaje / 100) WHERE id = per_id;
    ->       END LOOP;
    ->       CLOSE cur;
    ->   END //
DELIMITER ;
```
```sql
call act_salud(4);
select * from persona;
+----------+---------+----------+----------+--------+---------+-------+----------+
| id       | name    | sal_base | subsidio | salud  | pension | bono  | integral |
+----------+---------+----------+----------+--------+---------+-------+----------+
| e38f4401 | nikki32 |  4425.00 |   309.75 | 177.00 |   96.00 |  2.00 |    37.00 |
| e390daff | nikki22 |  2731.00 |   191.17 | 109.24 |  211.00 |  1.00 |     1.00 |
| e3929474 | nikki9  |  7187.00 |   503.09 | 287.48 |  282.00 | 40.00 |    34.00 |
| e3937e1b | nikki84 |  6875.00 |   481.25 | 275.00 |  381.00 | 92.00 |    36.00 |
| e3943896 | nikki51 | 11271.00 |   788.97 | 450.84 |  295.00 | 30.00 |     3.00 |
| e394d661 | nikki36 | 11696.00 |   818.72 | 467.84 |  435.00 | 10.00 |    18.00 |
| e3956ed9 | nikki36 | 14886.00 |  1042.02 | 595.44 |  257.00 |  1.00 |    45.00 |
| e396ee84 | nikki98 |  9198.00 |   643.86 | 367.92 |  216.00 | 52.00 |    29.00 |
| e3979e5b | nikki8  | 14628.00 |  1023.96 | 585.12 |  543.00 | 50.00 |    43.00 |
| e3984c88 | nikki35 |  8411.00 |   588.77 | 336.44 |  596.00 |  7.00 |    22.00 |
+----------+---------+----------+----------+--------+---------+-------+----------+
```

- Función pension: La pensión que corresponde al 4% al salario básico. Actualiza el valor en la tabla.
```sql
mysql>   DELIMITER //
mysql>   CREATE PROCEDURE act_pen(IN porcentaje DECIMAL(5,2))
    ->   BEGIN
    ->       DECLARE done INT DEFAULT FALSE;
    ->       DECLARE per_id VARCHAR(50);
    ->       DECLARE per_sal DECIMAL(10, 2);
    ->       DECLARE per_pen DECIMAL(10, 2);
    ->       DECLARE cur CURSOR FOR SELECT id, sal_base, pension FROM persona;
    ->       DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    -> 
    ->       OPEN cur;
    ->       read_loop: LOOP
    ->           FETCH cur INTO per_id, per_sal, per_pen;
    ->           IF done THEN
    ->               LEAVE read_loop;
    ->           END IF;
    ->           UPDATE persona SET pension = sal_base * (porcentaje / 100) WHERE id = per_id;
    ->       END LOOP;
    ->       CLOSE cur;
    ->   END //
Query OK, 0 rows affected (0,06 sec)

mysql>   DELIMITER ;
```
```sql
call act_pen(4);
Query OK, 0 rows affected (0,17 sec)

mysql> select * from persona;
+----------+---------+----------+----------+--------+---------+-------+----------+
| id       | name    | sal_base | subsidio | salud  | pension | bono  | integral |
+----------+---------+----------+----------+--------+---------+-------+----------+
| e38f4401 | nikki32 |  4425.00 |   309.75 | 177.00 |  177.00 |  2.00 |    37.00 |
| e390daff | nikki22 |  2731.00 |   191.17 | 109.24 |  109.24 |  1.00 |     1.00 |
| e3929474 | nikki9  |  7187.00 |   503.09 | 287.48 |  287.48 | 40.00 |    34.00 |
| e3937e1b | nikki84 |  6875.00 |   481.25 | 275.00 |  275.00 | 92.00 |    36.00 |
| e3943896 | nikki51 | 11271.00 |   788.97 | 450.84 |  450.84 | 30.00 |     3.00 |
| e394d661 | nikki36 | 11696.00 |   818.72 | 467.84 |  467.84 | 10.00 |    18.00 |
| e3956ed9 | nikki36 | 14886.00 |  1042.02 | 595.44 |  595.44 |  1.00 |    45.00 |
| e396ee84 | nikki98 |  9198.00 |   643.86 | 367.92 |  367.92 | 52.00 |    29.00 |
| e3979e5b | nikki8  | 14628.00 |  1023.96 | 585.12 |  585.12 | 50.00 |    43.00 |
| e3984c88 | nikki35 |  8411.00 |   588.77 | 336.44 |  336.44 |  7.00 |    22.00 |
+----------+---------+----------+----------+--------+---------+-------+----------+
10 rows in set (0,00 sec)
```

- Función bono: Un bono que corresponde al 8% al salario básico. Actualiza el valor en la tabla.
```sql
  DELIMITER //
  CREATE PROCEDURE act_bono(IN porcentaje DECIMAL(5,2))
  BEGIN
      DECLARE done INT DEFAULT FALSE;
      DECLARE per_id VARCHAR(50);
      DECLARE per_sal DECIMAL(10, 2);
      DECLARE per_bon DECIMAL(10, 2);
      DECLARE cur CURSOR FOR SELECT id, sal_base, bono FROM persona;
      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

      OPEN cur;
      read_loop: LOOP
          FETCH cur INTO per_id, per_sal, per_bon;
          IF done THEN
              LEAVE read_loop;
          END IF;
          UPDATE persona SET bono = sal_base * (porcentaje / 100) WHERE id = per_id;
      END LOOP;
      CLOSE cur;
  END //
  DELIMITER ;
```
```sql
call act_bono(8);
Query OK, 0 rows affected (0,06 sec)

mysql> select * drom persona;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'drom persona' at line 1
mysql> select * from persona;
+----------+---------+----------+----------+--------+---------+---------+----------+
| id       | name    | sal_base | subsidio | salud  | pension | bono    | integral |
+----------+---------+----------+----------+--------+---------+---------+----------+
| e38f4401 | nikki32 |  4425.00 |   309.75 | 177.00 |  177.00 |  354.00 |    37.00 |
| e390daff | nikki22 |  2731.00 |   191.17 | 109.24 |  109.24 |  218.48 |     1.00 |
| e3929474 | nikki9  |  7187.00 |   503.09 | 287.48 |  287.48 |  574.96 |    34.00 |
| e3937e1b | nikki84 |  6875.00 |   481.25 | 275.00 |  275.00 |  550.00 |    36.00 |
| e3943896 | nikki51 | 11271.00 |   788.97 | 450.84 |  450.84 |  901.68 |     3.00 |
| e394d661 | nikki36 | 11696.00 |   818.72 | 467.84 |  467.84 |  935.68 |    18.00 |
| e3956ed9 | nikki36 | 14886.00 |  1042.02 | 595.44 |  595.44 | 1190.88 |    45.00 |
| e396ee84 | nikki98 |  9198.00 |   643.86 | 367.92 |  367.92 |  735.84 |    29.00 |
| e3979e5b | nikki8  | 14628.00 |  1023.96 | 585.12 |  585.12 | 1170.24 |    43.00 |
| e3984c88 | nikki35 |  8411.00 |   588.77 | 336.44 |  336.44 |  672.88 |    22.00 |
+----------+---------+----------+----------+--------+---------+---------+----------+
10 rows in set (0,00 sec)

```

- Función integral: El salario integral es la suma del salario básico - salud - pension + bono + sub de transporte. Actualiza el valor en la tabla.
```sql
  DELIMITER //
  CREATE PROCEDURE act_bono(IN porcentaje DECIMAL(5,2))
  BEGIN
      DECLARE done INT DEFAULT FALSE;
      DECLARE per_id VARCHAR(50);
      DECLARE per_sal DECIMAL(10, 2);
      DECLARE per_bon DECIMAL(10, 2);
      DECLARE cur CURSOR FOR SELECT id, sal_base, bono FROM persona;
      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

      OPEN cur;
      read_loop: LOOP
          FETCH cur INTO per_id, per_sal, per_bon;
          IF done THEN
              LEAVE read_loop;
          END IF;
          UPDATE persona SET integral = sal_base - salud - pension + bono + subsidio WHERE id = per_id;
      END LOOP;
      CLOSE cur;
  END //
  DELIMITER ;
```
```sql

```

- Crea cada uno de las funciones anteriores para una persona en específico.
- El parámetro de entrada debe de ser un identificar de la persona.
```sql

```
```sql

```




