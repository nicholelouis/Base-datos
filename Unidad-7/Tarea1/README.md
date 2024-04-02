# Optimización de Base de Datos

![img](https://github.com/nicholelouis/Base-datos/blob/main/img/optimizacion-bd.png?raw=true)

## Tarea 1 Trabaja con indices

Un instituto de enseñanza guarda los siguientes datos de sus alumnos:

número de inscripción, comienza desde 1 cada año,
año de inscripción,
nombre del alumno,
documento del alumno,
domicilio,
ciudad,
provincia,
clave primaria: número de inscripto y año de inscripción.

Se pide:

- Elimine la tabla "alumno" si existe.
```sql
drop table if exists alumno;
```

- Cree la tabla definiendo una clave primaria compuesta (año de inscripción y número de inscripción)
```sql
CREATE DATABASE IF NOT EXISTS instituto;
create table alumnos (
    -> num_inscripcion INT,
    -> anio_inscripcion INT,
    -> nombre VARCHAR(50),
    -> doc_alumno VARCHAR(50),
    -> domicilio VARCHAR(50),
    -> ciudad VARCHAR(50),
    -> provincia VARCHAR(50),
    -> primary key(num_inscripcion, anio_inscripcion)
    -> );

    describe alumnos;
+------------------+-------------+------+-----+---------+-------+
| Field            | Type        | Null | Key | Default | Extra |
+------------------+-------------+------+-----+---------+-------+
| num_inscripcion  | int         | NO   | PRI | NULL    |       |
| anio_inscripcion | int         | NO   | PRI | NULL    |       |
| nombre           | varchar(50) | YES  |     | NULL    |       |
| doc_alumno       | varchar(50) | YES  |     | NULL    |       |
| domicilio        | varchar(50) | YES  |     | NULL    |       |
| ciudad           | varchar(50) | YES  |     | NULL    |       |
| provincia        | varchar(50) | YES  |     | NULL    |       |
+------------------+-------------+------+-----+---------+-------+
```

- Define los siguientes indices:
    - Un índice único por el campo "documento" y un índice común por ciudad y provincia.
    ```sql
    CREATE UNIQUE INDEX idx_doc ON alumnos (doc_alumno);
    Query OK, 0 rows affected (0,04 sec)
    Records: 0  Duplicates: 0  Warnings: 0

    CREATE INDEX idx_ciudad_prov ON alumnos(ciudad, provincia);
    Query OK, 0 rows affected (0,04 sec)
    Records: 0  Duplicates: 0  Warnings: 0
    ```
    - Vea los índices de la tabla.
    ```sql
    show index from alumnos;
    +---------+------------+-----------------+--------------+------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
    | Table   | Non_unique | Key_name        | Seq_in_index | Column_name      | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
    +---------+------------+-----------------+--------------+------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
    | alumnos |          0 | PRIMARY         |            1 | num_inscripcion  | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
    | alumnos |          0 | PRIMARY         |            2 | anio_inscripcion | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
    | alumnos |          0 | idx_doc         |            1 | doc_alumno       | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
    | alumnos |          1 | idx_ciudad_prov |            1 | ciudad           | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
    | alumnos |          1 | idx_ciudad_prov |            2 | provincia        | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
    +---------+------------+-----------------+--------------+------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
    ```
- intente ingresar un alumno con clave primaria repetida.
```sql
insert into alumnos (num_inscripcion, anio_inscripcion, nombre) values (1, 2022, "nichole");
ERROR 1062 (23000): Duplicate entry '1-2022' for key 'alumnos.PRIMARY'
```

- Intente ingresar un alumno con documento repetido.
```sql
insert into alumnos (num_inscripcion, anio_inscripcion, nombre, doc_alumno) values (3, 2024, "armando", "A2222");
ERROR 1062 (23000): Duplicate entry 'A2222' for key 'alumnos.idx_doc'
```

- Ingrese varios alumnos de la misma ciudad y provincia.
```sql
insert into alumnos (num_inscripcion, anio_inscripcion, nombre, ciudad, provincia) values (4, 2022, "armando", "caracas", "Country"), (5, 2022, "sebas", "caracas", "Country"), (6, 2022, "nichole",  "caracas", "Country");
Query OK, 3 rows affected (0,01 sec)
Records: 3  Duplicates: 0  Warnings: 0
```

- Elimina los indices creados, y muestra que ya no se encuentran.
```sql
DROP INDEX idx_doc ON alumnos;

DROP INDEX idx_ciudad_prov ON alumnos;

show index from alumnos;
+---------+------------+----------+--------------+------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table   | Non_unique | Key_name | Seq_in_index | Column_name      | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+---------+------------+----------+--------------+------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| alumnos |          0 | PRIMARY  |            1 | num_inscripcion  | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| alumnos |          0 | PRIMARY  |            2 | anio_inscripcion | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+---------+------------+----------+--------------+------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
```