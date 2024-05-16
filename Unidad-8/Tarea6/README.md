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
+----------+---------+----------+----------+---------+---------+--------+----------+
| id       | name    | sal_base | subsidio | salud   | pension | bono   | integral |
+----------+---------+----------+----------+---------+---------+--------+----------+
| 7ded542f | nikki69 |  7860.00 |    71.00 |  231.00 |  424.00 |  93.00 |    27.00 |
| 7def15ab | nikki71 |  1500.00 |   190.00 |  127.00 |  446.00 |  38.00 |    37.00 |
| 7df06a29 | nikki21 |  1426.00 |   517.00 |  521.00 |   40.00 |  97.00 |    35.00 |
| 7df174a3 | nikki30 | 10416.00 |   694.00 |  250.00 |   75.00 |  98.00 |    26.00 |
| 7df24692 | nikki47 | 17078.00 |   219.00 |  824.00 |  404.00 |  19.00 |    53.00 |
| 7df2f830 | nikki20 |  3060.00 |   155.00 |  681.00 |  193.00 |  82.00 |     6.00 |
| 7df3a4ea | nikki13 |  6160.00 |   205.00 |  504.00 |  199.00 |  33.00 |    36.00 |
| 7dfc7dda | nikki26 |  7053.00 |   106.00 |  665.00 |  277.00 |  56.00 |    21.00 |
| 7dfdcb06 | nikki29 |  5475.00 |   443.00 |  283.00 |  208.00 | 100.00 |    51.00 |
| 7dff1a02 | nikki59 |  3924.00 |   221.00 | 1056.00 |  408.00 |  63.00 |     4.00 |
+----------+---------+----------+----------+---------+---------+--------+----------+
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
    ->           UPDATE persona SET subsidio = sal_base * (1 + porcentaje / 100) WHERE id = per_id;
    ->       END LOOP;
    ->       CLOSE cur;
    ->   END //
DELIMITER ;

```
```sql
CALL act_sub(7);
select * from persona;
+----------+---------+----------+----------+---------+---------+--------+----------+
| id       | name    | sal_base | subsidio | salud   | pension | bono   | integral |
+----------+---------+----------+----------+---------+---------+--------+----------+
| 7ded542f | nikki69 |  7860.00 |  8410.20 |  231.00 |  424.00 |  93.00 |    27.00 |
| 7def15ab | nikki71 |  1500.00 |  1605.00 |  127.00 |  446.00 |  38.00 |    37.00 |
| 7df06a29 | nikki21 |  1426.00 |  1525.82 |  521.00 |   40.00 |  97.00 |    35.00 |
| 7df174a3 | nikki30 | 10416.00 | 11145.12 |  250.00 |   75.00 |  98.00 |    26.00 |
| 7df24692 | nikki47 | 17078.00 | 18273.46 |  824.00 |  404.00 |  19.00 |    53.00 |
| 7df2f830 | nikki20 |  3060.00 |  3274.20 |  681.00 |  193.00 |  82.00 |     6.00 |
| 7df3a4ea | nikki13 |  6160.00 |  6591.20 |  504.00 |  199.00 |  33.00 |    36.00 |
| 7dfc7dda | nikki26 |  7053.00 |  7546.71 |  665.00 |  277.00 |  56.00 |    21.00 |
| 7dfdcb06 | nikki29 |  5475.00 |  5858.25 |  283.00 |  208.00 | 100.00 |    51.00 |
| 7dff1a02 | nikki59 |  3924.00 |  4198.68 | 1056.00 |  408.00 |  63.00 |     4.00 |
+----------+---------+----------+----------+---------+---------+--------+----------+
```

- Función salud: La salud que corresponde al 4% al salario básico. Actualiza el valor en la tabla.
- Función pension: La pensión que corresponde al 4% al salario básico. Actualiza el valor en la tabla.
- Función bono: Un bono que corresponde al 8% al salario básico. Actualiza el valor en la tabla.
- Función integral: El salario integral es la suma del salario básico - salud - pension + bono + sub de transporte. Actualiza el valor en la tabla.
- Crea cada uno de las funciones anteriores para una persona en específico.
- El parámetro de entrada debe de ser un identificar de la persona.




