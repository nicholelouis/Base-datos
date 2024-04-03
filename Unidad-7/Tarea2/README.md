# Optimización de Base de Datos

<p align="center">
  <img src="https://github.com/nicholelouis/Base-datos/blob/main/img/optimizacion-bd.png?raw=true" alt="Descripción de la imagen" width="300"/>
</p>

## Tarea 2 
### Trabaja con indices

Una empresa guarda los siguientes datos de sus clientes, con los siguientes campos:

documento char (8) not null,
nombre varchar(30) not null,
domicilio varchar(30),
ciudad varchar(20),
provincia varchar (20),
telefono varchar(11)
Se pide:

- Elimine la tabla "cliente" si existe.
```sql
drop table if exists cliente;
```

- Cree la tabla si clave primaria y incluye a posteriori esta.
```sql
create table cliente(
    -> documento char(8) not null,
    -> nombre varchar(30) not null,
    -> domicilio varchar(30),
    -> ciudad varchar(20),
    -> provincia varchar(20),
    -> telefono varchar(50)
    -> );

alter table cliente add primary key (documento);
```

- Define los siguientes indices:

    - Un índice único por el campo "documento" y un índice común por ciudad y provincia.
    ```sql
    create unique index idx_doc on cliente(documento);
    Query OK, 0 rows affected (0,04 sec)
    Records: 0  Duplicates: 0  Warnings: 0

    create index idx_ci_prov on cliente(ciudad, provincia);
    Query OK, 0 rows affected (0,03 sec)
    Records: 0  Duplicates: 0  Warnings: 0
    ```

    - Vea los índices de la tabla.
    ```sql
    show index from cliente;
    +---------+------------+-------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
    | Table   | Non_unique | Key_name    | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
    +---------+------------+-------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
    | cliente |          0 | PRIMARY     |            1 | documento   | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
    | cliente |          0 | idx_doc     |            1 | documento   | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
    | cliente |          1 | idx_ci_prov |            1 | ciudad      | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
    | cliente |          1 | idx_ci_prov |            2 | provincia   | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
    +---------+------------+-------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
    ```

- Agregue un índice único por el campo "telefono".
```sql
create unique index idx_tlf on cliente(telefono);
```

- Elimina los índices.
```sql
drop index idx_ci_prov on cliente;

drop index idx_doc on cliente;

drop index idx_tlf on cliente;

show index from cliente;
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table   | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| cliente |          0 | PRIMARY  |            1 | documento   | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+

```