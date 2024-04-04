# Optimización de Base de Datos

<p align="center">
  <img src="https://github.com/nicholelouis/Base-datos/blob/main/img/optimizacion-bd.png?raw=true" alt="Descripción de la imagen" width="300"/>
</p>

## Tarea 3
### Trabaja con indices

Vamos a continuar trabajando con índices. Se pide ejecutar cada una de las acciones necesarias para realizar las operaciones indicadas.

Las operaciones son las siguientes:

Crea una base de datos que tendrá por nombre Base_Indices.

En la BD crea una tabla de nombre MOVIMIENTO con la siguiente estructura:

| Nombre del campo | Tipo de dato | Propiedades              |
|------------------|--------------|--------------------------|
| Identificador    | int          | AUTO_INCREMENT, Clave primaria |
| Articulo         | varchar(50)  | Obligatorio              |
| Fecha            | date         | Obligatorio              |
| Cantidad         | int          | Obligatorio              |

```sql
create table MOVIMIENTO(
    -> identificador INT AUTO_INCREMENT PRIMARY KEY,
    -> articulo varchar(50) NOT NULL,
    -> fecha date NOT NULL,
    -> cantidad INT NOT NULL
    -> );
```

- Ejecuta la siguiente sentencia sql para generar datos de prueba:
```sql
CREATE TABLE NumerosUnicos (
Numero INT AUTO_INCREMENT PRIMARY KEY
);

INSERT INTO NumerosUnicos (Numero)
SELECT NULL FROM INFORMATION_SCHEMA.COLUMNS LIMIT 5000;

INSERT INTO MOVIMIENTO (Identificador, Articulo, Fecha, Cantidad)
SELECT 
    n.Numero,
    CONCAT('Producto', n.Numero),
    DATE_ADD('2012-01-01', INTERVAL FLOOR(RAND() * 120) DAY),
    FLOOR(RAND() * 1000000) + 1
FROM 
    NumerosUnicos n;

    DROP TABLE NumerosUnicos;
```

- Realiza una count sobre la tabla.
```sql
select count(*) from MOVIMIENTO;
+----------+
| count(*) |
+----------+
|     3586 |
+----------+
```

- Crea con la sentencia CREATE TABLE…SELECT… un duplicado de la tabla MOVIMIENTO a la que llamaremos MOVIMIENTO_BIS.
```sql
create table MOVIMIENTO_BIS select * from MOVIMIENTO;
Query OK, 3586 rows affected (0,31 sec)
Records: 3586  Duplicates: 0  Warnings: 0
```

- Con la cláusula DESCRIBE observa cuál es la situación de la tabla clonada, ¿Qué le pasa al índice y a la propiedad AUTO_INCREMENT?
```sql
mysql> describe MOVIMIENTO;
+---------------+-------------+------+-----+---------+----------------+
| Field         | Type        | Null | Key | Default | Extra          |
+---------------+-------------+------+-----+---------+----------------+
| identificador | int         | NO   | PRI | NULL    | auto_increment |
| articulo      | varchar(50) | NO   |     | NULL    |                |
| fecha         | date        | NO   |     | NULL    |                |
| cantidad      | int         | NO   |     | NULL    |                |
+---------------+-------------+------+-----+---------+----------------+

mysql> describe MOVIMIENTO_BIS;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| identificador | int         | NO   |     | 0       |       |
| articulo      | varchar(50) | NO   |     | NULL    |       |
| fecha         | date        | NO   |     | NULL    |       |
| cantidad      | int         | NO   |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
4 rows in set (0,00 sec)
```
Al clonar la tabla no se clono el indice/clave primaria, por lo tanto tampoco el auto_increament.

- Utilizando EXPLAIN observa el plan de ejecución de la consulta que devuelve toda la información de los movimientos con identificador=3. Tanto en la tabla MOVIMIENTOS como en la tabla MOVIMIENTOS_bis. Escribe tus conclusiones al respecto.
```sql
DESCRIBE select * from MOVIMIENTO_BIS where identificador=3;
+----+-------------+----------------+------------+------+----------------------+----------------------+---------+-------+------+----------+-------+
| id | select_type | table          | partitions | type | possible_keys        | key                  | key_len | ref   | rows | filtered | Extra |
+----+-------------+----------------+------------+------+----------------------+----------------------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | MOVIMIENTO_BIS | NULL       | ref  | IX_IDENTIFICADOR_BIS | IX_IDENTIFICADOR_BIS | 4       | const |    1 |   100.00 | NULL  |
+----+-------------+----------------+------------+------+----------------------+----------------------+---------+-------+------+----------+-------+
1 row in set, 1 warning (0,00 sec)

mysql> DESCRIBE select * from MOVIMIENTO where identificador=3;
+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
| id | select_type | table      | partitions | type  | possible_keys | key     | key_len | ref   | rows | filtered | Extra |
+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | MOVIMIENTO | NULL       | const | PRIMARY       | PRIMARY | 4       | const |    1 |   100.00 | NULL  |
+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
```

- Supongamos que las consultas de rango que se van a hacer en nuestra tabla son frecuentes y además no por el identificador, sino por la fecha. Este es motivo suficiente para que sea la fecha un índice de tabla y así mejorar el tiempo de respuesta de nuestras consultas. En la tabla MOVIMIENTO_BIS creamos un índice para la fecha (IX_FECHA_BIS) y otro índice para el identificador (IX_IDENTIFICADOR).
```sql
CREATE INDEX IX_FECHA_BIS on MOVIMIENTO(fecha);
Query OK, 0 rows affected (0,14 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> CREATE INDEX IX_IDENTIFICADOR_BIS on MOVIMIENTO(identificador);
Query OK, 0 rows affected (0,07 sec)
Records: 0  Duplicates: 0  Warnings: 0
```

- Analiza el plan de ejecución de las siguientes consultas y observa la diferencia
```sql
mysql> DESCRIBE select * from MOVIMIENTO_BIS where identificador=3;
+----+-------------+----------------+------------+------+----------------------+----------------------+---------+-------+------+----------+-------+
| id | select_type | table          | partitions | type | possible_keys        | key                  | key_len | ref   | rows | filtered | Extra |
+----+-------------+----------------+------------+------+----------------------+----------------------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | MOVIMIENTO_BIS | NULL       | ref  | IX_IDENTIFICADOR_BIS | IX_IDENTIFICADOR_BIS | 4       | const |    1 |   100.00 | NULL  |
+----+-------------+----------------+------------+------+----------------------+----------------------+---------+-------+------+----------+-------+
1 row in set, 1 warning (0,00 sec)

mysql> DESCRIBE select * from MOVIMIENTO where identificador=3;
+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
| id | select_type | table      | partitions | type  | possible_keys | key     | key_len | ref   | rows | filtered | Extra |
+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | MOVIMIENTO | NULL       | const | PRIMARY       | PRIMARY | 4       | const |    1 |   100.00 | NULL  |
+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
```
Fíjata en que en la consulta 1 pedimos todos los campos. ¿A través de que indice se busca? ¿Por qué crees que lo hace así? En la consulta 2 solo pedimos el identificador. ¿A través de que índice busca? ¿Por qué crees que lo hace así? Analiza la ejecución.

En la Consulta 1, donde pedimos todos los campos de la tabla MOVIMIENTO filtramos por identificador mientras que en la consulta 2 donde solo pedimos el identificador en la tabla MOVIMIENTO_BIS utiliza el índice IX_IDENTIFICADOR para buscar eficientemente los registros que coincidan con el valor del identificador.

- Analiza el plan de ejecución de las siguientes consultas y observa la diferencia:
```sql
mysql> explain SELECT fecha FROM MOVIMIENTO WHERE fecha BETWEEN 01/01/2012 and 01/03/2012;
+----+-------------+------------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table      | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+------------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 3586 |    10.00 | Using where |
+----+-------------+------------+------------+------+---------------+------+---------+------+------+----------+-------------+
1 row in set, 1 warning (0,00 sec)

mysql> explain SELECT * FROM MOVIMIENTO WHERE fecha BETWEEN 01/01/2012 and 01/03/2012;
+----+-------------+------------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table      | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+------------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 3586 |    10.00 | Using where |
+----+-------------+------------+------------+------+---------------+------+---------+------+------+----------+-------------+
1 row in set, 1 warning (0,00 sec)
```
Fijate que en la consulta 2 pedimos todos los campos. ¿A través de que índice busca? ¿Por qué crees que lo hace así? En la consulta 1 solo pedimos la fecha. ¿A través de que índice busca? ¿Por qué crees que lo hace así? Analiza la ejecución.

En ninguna de las dos consultas se menciona ningún índice en la columna key, lo que nos infroma que no se está utilizando ningún índice para optimizar la búsqueda. El tipo de acceso es ALL, lo que indica que se está realizando un escaneo completo de la tabla, lo cual puede ser menos eficiente, especialmente en tablas grandes como esta.

- Vamos a crear un índice por fecha (IX_FECHA) en la tabla MOVIMIENTO, puesto que no lo tenía, en este caso la tabla ya tenía un indice, la clave primaria.
```sql
CREATE INDEX IX_FECHA_BIS on MOVIMIENTO(fecha);
Query OK, 0 rows affected (0,14 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> CREATE INDEX IX_IDENTIFICADOR_BIS on MOVIMIENTO(identificador);
Query OK, 0 rows affected (0,07 sec)
Records: 0  Duplicates: 0  Warnings: 0
```
Al crear un índice en el campo fecha de la tabla MOVIMIENTO, se espera mejorar el rendimiento de las consultas que involucran filtrado por fecha.

- Visualiza los indices de las tablas MOVIMIENTO y MOVIMIENTO_BIS.

Analiza el plan de ejecución de las siguientes consultas y observa la diferencia: 

```sql
DESCRIBE SELECT fecha FROM MOVIMIENTO WHERE fecha BETWEEN 01/01/2012 AND 01/03/2012;
+----+-------------+------------+------------+------+---------------+----------+---------+-------+------+----------+-------------+
| id | select_type | table      | partitions | type | possible_keys | key      | key_len | ref   | rows | filtered | Extra       |
+----+-------------+------------+------------+------+---------------+----------+---------+-------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO | NULL       | ref  | IX_FECHA      | IX_FECHA | 3       | const |    1 |   100.00 | Using index |
+----+-------------+------------+------------+------+---------------+----------+---------+-------+------+----------+-------------+
1 row in set, 1 warning (0,00 sec)

mysql> DESCRIBE SELECT * FROM MOVIMIENTO WHERE fecha BETWEEN 01/01/2012 AND 01/03/2012;
+----+-------------+------------+------------+------+---------------+----------+---------+-------+------+----------+-------+
| id | select_type | table      | partitions | type | possible_keys | key      | key_len | ref   | rows | filtered | Extra |
+----+-------------+------------+------------+------+---------------+----------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | MOVIMIENTO | NULL       | ref  | IX_FECHA      | IX_FECHA | 3       | const |    1 |   100.00 | NULL  |
+----+-------------+------------+------------+------+---------------+----------+---------+-------+------+----------+-------+
1 row in set, 1 warning (0,00 sec)

mysql> DESCRIBE SELECT fecha FROM MOVIMIENTO_BIS WHERE fecha BETWEEN 01/01/2012 AND 01/03/2012;
+----+-------------+----------------+------------+------+---------------+--------------+---------+-------+------+----------+-------------+
| id | select_type | table          | partitions | type | possible_keys | key          | key_len | ref   | rows | filtered | Extra       |
+----+-------------+----------------+------------+------+---------------+--------------+---------+-------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO_BIS | NULL       | ref  | IX_FECHA_BIS  | IX_FECHA_BIS | 3       | const |    1 |   100.00 | Using index |
+----+-------------+----------------+------------+------+---------------+--------------+---------+-------+------+----------+-------------+
1 row in set, 1 warning (0,00 sec)

mysql> DESCRIBE SELECT * FROM MOVIMIENTO_BIS WHERE fecha BETWEEN 01/01/2012 AND 01/03/2012;
+----+-------------+----------------+------------+------+---------------+--------------+---------+-------+------+----------+-------+
| id | select_type | table          | partitions | type | possible_keys | key          | key_len | ref   | rows | filtered | Extra |
+----+-------------+----------------+------------+------+---------------+--------------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | MOVIMIENTO_BIS | NULL       | ref  | IX_FECHA_BIS  | IX_FECHA_BIS | 3       | const |    1 |   100.00 | NULL  |
+----+-------------+----------------+------------+------+---------------+--------------+---------+-------+------+----------+-------+
1 row in set, 1 warning (0,00 sec)
```

Después de crear el índice por fecha en la tabla MOVIMIENTO, podemos observar que las consultas que filtran por fecha utilizan este nuevo índice para mejorar el rendimiento.

En Consulta 2 y Consulta 4, donde se seleccionan todos los campos de las tablas MOVIMIENTO y MOVIMIENTO_BIS, respectivamente, también observamos que el motor de base de datos utiliza el índice creado en el campo fecha para realizar la búsqueda eficiente basada en el rango de fechas.