# Optimización de Base de Datos

<p align="center">
  <img src="https://github.com/nicholelouis/Base-datos/blob/main/img/optimizacion-bd.png?raw=true" alt="Descripción de la imagen" width="300"/>
</p>

## Tarea 5
### Trabajo con BBDD Jardineria

Vamos a realizar el trabajo con una BBDD existente en la documentación oficial de MySql. Su nombre es Jardineria.

El diagrama ER de la base de datos es el siguiente:
<p align="center">
  <img src="https://github.com/nicholelouis/Base-datos/blob/main/Unidad-7/Tarea5/image.png" alt="Descripción de la imagen" width="300"/>
</p>

## Carga de datos

```sql
create database if not exist jardineria;
use jardineria;
source jardineria.db;
```

## Índices

- Consulte cuáles son los índices que hay en la tabla producto utilizando las instrucciones SQL que nos permiten obtener esta información de la tabla.
```sql
show index from producto;
+----------+------------+----------+--------------+-----------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table    | Non_unique | Key_name | Seq_in_index | Column_name     | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+----------+------------+----------+--------------+-----------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| producto |          0 | PRIMARY  |            1 | codigo_producto | A         |         276 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| producto |          1 | gama     |            1 | gama            | A         |           4 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+----------+------------+----------+--------------+-----------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
```

- Haga uso de EXPLAIN para obtener información sobre cómo se están realizando las consultas y diga cuál de las dos consultas realizará menos comparaciones para encontrar el producto que estamos buscando. ¿Cuántas comparaciones se realizan en cada caso? ¿Por qué?.
```sql
SELECT *
FROM producto
WHERE codigo_producto = 'OR-114';

+----+-------------+----------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
| id | select_type | table    | partitions | type  | possible_keys | key     | key_len | ref   | rows | filtered | Extra |
+----+-------------+----------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | producto | NULL       | const | PRIMARY       | PRIMARY | 62      | const |    1 |   100.00 | NULL  |
+----+-------------+----------+------------+-------+---------------+---------+---------+-------+------+----------+-------+


SELECT *
FROM producto
WHERE nombre = 'Evonimus Pulchellus';

+----+-------------+----------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table    | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+----------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | producto | NULL       | ALL  | NULL          | NULL | NULL    | NULL |  276 |    10.00 | Using where |
+----+-------------+----------+------------+------+---------------+------+---------+------+------+----------+-------------+
```

Dado los resultados de los describe podemos concluir que la primera consulta es más eficiente, ya que esta haciendo uso de la primary key, índice primario, por lo tanto solo esta recorriendo una fila, a diferencia de la segunda consulta que recorre las 276 filas de la tabla para poder hallar la coincidencia.

- Suponga que estamos trabajando con la base de datos jardineria y queremos saber optimizar las siguientes consultas. ¿Cuál de las dos sería más eficiente?. Se recomienda hacer uso de EXPLAIN para obtener información sobre cómo se están realizando las consultas.
```sql
SELECT AVG(total)
FROM pago
WHERE YEAR(fecha_pago) = 2008;

+----+-------------+-------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+-------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | pago  | NULL       | ALL  | NULL          | NULL | NULL    | NULL |   26 |   100.00 | Using where |
+----+-------------+-------+------------+------+---------------+------+---------+------+------+----------+-------------+

SELECT AVG(total)
FROM pago
WHERE fecha_pago >= '2008-01-01' AND fecha_pago <= '2008-12-31';

+----+-------------+-------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+-------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | pago  | NULL       | ALL  | NULL          | NULL | NULL    | NULL |   26 |    11.11 | Using where |
+----+-------------+-------+------------+------+---------------+------+---------+------+------+----------+-------------+
```

Ninguna de las dos consultas esta utilizando un índice, la unica diferencia que podemos encontrar entre estas dos es el campo de filtered, el cual por definición del manual de Mysql 'Percentage of rows filtered by table condition', de lo cual podemos inferir que a menos columnas esperadas más eficiente sería nuestra consulta.

- Optimiza la siguiente consulta creando índices cuando sea necesario. Se recomienda hacer uso de EXPLAIN para obtener información sobre cómo se están realizando las consultas
```sql
SELECT *
FROM cliente INNER JOIN pedido
ON cliente.codigo_cliente = pedido.codigo_cliente
WHERE cliente.nombre_cliente LIKE 'A%';

Describe SIN indice:
+----+-------------+---------+------------+------+----------------+----------------+---------+-----------------------------------+------+----------+-------------+
| id | select_type | table   | partitions | type | possible_keys  | key            | key_len | ref                               | rows | filtered | Extra       |
+----+-------------+---------+------------+------+----------------+----------------+---------+-----------------------------------+------+----------+-------------+
|  1 | SIMPLE      | cliente | NULL       | ALL  | PRIMARY        | NULL           | NULL    | NULL                              |   36 |    11.11 | Using where |
|  1 | SIMPLE      | pedido  | NULL       | ref  | codigo_cliente | codigo_cliente | 4       | jardineria.cliente.codigo_cliente |    1 |   100.00 | NULL        |
+----+-------------+---------+------------+------+----------------+----------------+---------+-----------------------------------+------+----------+-------------+

Describe con índice:
CREATE INDEX idx_nombre_cliente ON cliente (nombre_cliente);
+----+-------------+---------+------------+-------+----------------------------+--------------------+---------+-----------------------------------+------+----------+-----------------------+
| id | select_type | table   | partitions | type  | possible_keys              | key                | key_len | ref                               | rows | filtered | Extra                 |
+----+-------------+---------+------------+-------+----------------------------+--------------------+---------+-----------------------------------+------+----------+-----------------------+
|  1 | SIMPLE      | cliente | NULL       | range | PRIMARY,idx_nombre_cliente | idx_nombre_cliente | 202     | NULL                              |    3 |   100.00 | Using index condition |
|  1 | SIMPLE      | pedido  | NULL       | ref   | codigo_cliente             | codigo_cliente     | 4       | jardineria.cliente.codigo_cliente |    6 |   100.00 | NULL                  |
+----+-------------+---------+------------+-------+----------------------------+--------------------+---------+-----------------------------------+------+----------+-----------------------+
```

Podemos apreciar que al crear el índice sobre la columna nombre_cliente recorremos solamente 3 filas, a diferencia de la consulta anterior donde recoremos las 36 filas de la tabla para hallar una coincidencia.

- ¿Por qué no es posible optimizar el tiempo de ejecución de las siguientes consultas, incluso haciendo uso de índices?
```sql
SELECT *
FROM cliente INNER JOIN pedido
ON cliente.codigo_cliente = pedido.codigo_cliente
WHERE cliente.nombre_cliente LIKE '%A%';

SELECT *
FROM cliente INNER JOIN pedido
ON cliente.codigo_cliente = pedido.codigo_cliente
WHERE cliente.nombre_cliente LIKE '%A';
```

Las consultas que buscan coincidencias que terminen o comiencen con un caracter cualquiera '%' no puden aprovechar los indices de una manera eficaz.
En la primera consulta se esta buscando todas la ocurrencias de la A en cualquier pocision '%A%', por ello el motor debe buscar en todos los valores de dicha tabla, el uso de un índice no haría más eficiente esta consulta, similar con la segunda consulta.
Basicamente el uso de índices en las consultas que tienen comodines '%' no mejorara significativamente la eficacia de la consulta.

- Crea un índice de tipo FULLTEXT sobre las columnas nombre y descripcion de la tabla producto.
```sql
CREATE FULLTEXT INDEX idx_nombre_descripcion ON producto(nombre, descripcion);
describe producto;
+-------------------+---------------+------+-----+---------+-------+
| Field             | Type          | Null | Key | Default | Extra |
+-------------------+---------------+------+-----+---------+-------+
| codigo_producto   | varchar(15)   | NO   | PRI | NULL    |       |
| nombre            | varchar(70)   | NO   | MUL | NULL    |       |
| gama              | varchar(50)   | NO   | MUL | NULL    |       |
| dimensiones       | varchar(25)   | YES  |     | NULL    |       |
| proveedor         | varchar(50)   | YES  |     | NULL    |       |
| descripcion       | text          | YES  |     | NULL    |       |
| cantidad_en_stock | smallint      | NO   |     | NULL    |       |
| precio_venta      | decimal(15,2) | NO   |     | NULL    |       |
| precio_proveedor  | decimal(15,2) | YES  |     | NULL    |       |
+-------------------+---------------+------+-----+---------+-------+
```

- Una vez creado el índice del ejercicio anterior realiza las siguientes consultas haciendo uso de la función MATCH, para buscar todos los productos que:

    - Contienen la palabra planta en el nombre o en la descripción. - Realice una consulta para cada uno de los modos de búsqueda full-text que existen en MySQL (IN NATURAL LANGUAGE MODE, IN BOOLEAN MODE y WITH QUERY EXPANSION) y compare los resultados que ha obtenido en cada caso.
```sql 
SELECT * FROM producto
  -> WHERE MATCH(nombre, descripcion) AGAINST('planta');
+-----------------+-----------------------------------+-------------+-------------+-----------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------+--------------+------------------+
| codigo_producto | nombre                            | gama        | dimensiones | proveedor             | descripcion                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | cantidad_en_stock | precio_venta | precio_proveedor |
+-----------------+-----------------------------------+-------------+-------------+-----------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------+--------------+------------------+
| AR-004          | Melissa                           | Aromáticas  | 15-20       | Murcia Seasons        | Es una planta perenne (dura varios años) conocida por el agradable y característico olor a limón que desprenden en verano. Nunca debe faltar en la huerta o jardín por su agradable aroma y por los variados usos que tiene: planta olorosa, condimentaria y medicinal. Su cultivo es muy fácil. Le va bien un suelo ligero, con buen drenaje y riego sin exceso. A pleno sol o por lo menos 5 horas de sol por día. Cada año, su abonado mineral correspondiente.En otoño, la melisa pierde el agradable olor a limón que desprende en verano sus flores azules y blancas. En este momento se debe cortar a unos 20 cm. del suelo. Brotará de forma densa en primavera.                                                                                                                                                                                                                                                                                                                                                                                         |               140 |         1.00 |             0.00 |
| AR-001          | Ajedrea                           | Aromáticas  | 15-20       | Murcia Seasons        | Planta aromática que fresca se utiliza para condimentar carnes y ensaladas, y seca, para pastas, sopas y guisantes                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |               140 |         1.00 |             0.00 |
| AR-008          | Thymus Citriodra (Tomillo limón)  | Aromáticas  | 15-20       | Murcia Seasons        | Nombre común o vulgar: Tomillo, Tremoncillo Familia: Labiatae (Labiadas).Origen: Región mediterránea.Arbustillo bajo, de 15 a 40 cm de altura. Las hojas son muy pequeñas, de unos 6 mm de longitud; según la variedad pueden ser verdes, verdes grisáceas, amarillas, o jaspeadas. Las flores aparecen de mediados de primavera hasta bien entrada la época estival y se presentan en racimos terminales que habitualmente son de color violeta o púrpura aunque también pueden ser blancas. Esta planta despide un intenso y típico aroma, que se incrementa con el roce. El tomillo resulta de gran belleza cuando está en flor. El tomillo atrae a avispas y abejas. En jardinería se usa como manchas, para hacer borduras, para aromatizar el ambiente, llenar huecos, cubrir rocas, para jardines en miniatura, etc. Arranque las flores y hojas secas del tallo y añadálos a un popurri, introdúzcalos en saquitos de hierbas o en la almohada.También puede usar las ramas secas con flores para añadir aroma y textura a cestos abiertos.              |               140 |         1.00 |             0.00 |
| AR-009          | Thymus Vulgaris                   | Aromáticas  | 15-20       | Murcia Seasons        | Nombre común o vulgar: Tomillo, Tremoncillo Familia: Labiatae (Labiadas). Origen: Región mediterránea. Arbustillo bajo, de 15 a 40 cm de altura. Las hojas son muy pequeñas, de unos 6 mm de longitud; según la variedad pueden ser verdes, verdes grisáceas, amarillas, o jaspeadas. Las flores aparecen de mediados de primavera hasta bien entrada la época estival y se presentan en racimos terminales que habitualmente son de color violeta o púrpura aunque también pueden ser blancas. Esta planta despide un intenso y típico aroma, que se incrementa con el roce. El tomillo resulta de gran belleza cuando está en flor. El tomillo atrae a avispas y abejas.
En jardinería se usa como manchas, para hacer borduras, para aromatizar el ambiente, llenar huecos, cubrir rocas, para jardines en miniatura, etc. Arranque las flores y hojas secas del tallo y añadálos a un popurri, introdúzcalos en saquitos de hierbas o en la almohada. También puede usar las ramas secas con flores para añadir aroma y textura a cestos abiertos.         |               140 |         1.00 |             0.00 |
| FR-100          | Nectarina                         | Frutales    | 8/10        | Frutales Talavera S.A | Se trata de un árbol derivado por mutación de los melocotoneros comunes, y los únicos caracteres diferenciales son la ausencia de tomentosidad en la piel del fruto. La planta, si se deja crecer libremente, adopta un porte globoso con unas dimensiones medias de 4-6 metros                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |                50 |        11.00 |             8.00 |
+-----------------+-----------------------------------+-------------+-------------+-----------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------+--------------+------------------+
5 rows in set (0.00 sec)     
```

    - Contienen la palabra planta seguida de cualquier carácter o conjunto de caracteres, en el nombre o en la descripción.
        ```sql 
        
        ```

    - Empiezan con la palabra planta en el nombre o en la descripción.
        ```sql 
        
        ```

    - Contienen la palabra tronco o la palabra árbol en el nombre o en la descripción.
        ```sql 
        
        ```

    - Contienen la palabra tronco y la palabra árbol en el nombre o en la descripción.
        ```sql 
        
        ```

    - Contienen la palabra tronco pero no contienen la palabra árbol en el nombre o en la descripción.
        ```sql 
        
        ```

    - Contiene la frase proviene de las costas en el nombre o en la descripción.
        ```sql 
        
        ```

    - Crea un índice de tipo INDEX compuesto por las columnas apellido_contacto y nombre_contacto de la tabla cliente.
        ```sql 
        
        ```

    - Una vez creado el índice del ejercicio anterior realice las siguientes consultas haciendo uso de EXPLAIN:
    
        - Busca el cliente Javier Villar. ¿Cuántas filas se han examinado hasta encontrar el resultado?
            ```sql 
            
            ```

        - Busca el cliente anterior utilizando solamente el apellido Villar.
            ```sql 
            
            ```

        - ¿Cuántas filas se han examinado hasta encontrar el resultado?
            ```sql 
            
            ```

        - Busca el cliente anterior utilizando solamente el nombre Javier. ¿Cuántas filas se han examinado hasta encontrar el resultado? ¿Qué ha ocurrido en este caso?
            ```sql 
            
            ```

    - Calcula cuál podría ser un buen valor para crear un índice sobre un prefijo de la columna nombre_cliente de la tabla cliente. Tenga en cuenta que un buen valor será aquel que nos permita utilizar el menor número de caracteres para diferenciar todos los valores que existen en la columna sobre la que estamos creando el índice.
            ```sql 
            
            ```

        - En primer lugar calculamos cuántos valores distintos existen en la columna nombre_cliente. Necesitarás utilizar la función COUNT y DISTINCT.
            ```sql 
            
            ```

        - Haciendo uso de la función LEFT ve calculando el número de caracteres que necesitas utilizar como prefijo para diferenciar todos los valores de la columna. Necesitarás la función COUNT, DISTINCT y LEFT.
            ```sql 
            
            ```

        - Una vez que hayas encontrado el valor adecuado para el prefijo, crea el índice sobre la columna nombre_cliente de la tabla cliente.
            ```sql 
            
            ```

        - Ejecuta algunas consultas de prueba sobre el índice que acabas de crear.
            ```sql 
            
            ```

## Vistas

- Escriba una vista que se llame listado_pagos_clientes que muestre un listado donde aparezcan todos los clientes y los pagos que ha realizado cada uno de ellos. La vista deberá tener las siguientes columnas: nombre y apellidos del cliente concatenados, teléfono, ciudad, pais, fecha_pago, total del pago, id de la transacción
    ```sql 
    create view listado_pagos_clientes as select concat(c.nombre_contacto, ' ', c.apellido_contacto), c.telefono, c.ciudad, c.pais, p.fecha_pago, p.total, p.id_transaccion from cliente c join pago p on c.codigo_cliente=p.codigo_cliente;

  select * from listado_pagos_clientes;
  +-----------------------------------------------------+-------------+--------------------------+-----------+------------+----------+----------------+
  | concat(c.nombre_contacto, ' ', c.apellido_contacto) | telefono    | ciudad                   | pais      | fecha_pago | total    | id_transaccion |
  +-----------------------------------------------------+-------------+--------------------------+-----------+------------+----------+----------------+
  | Daniel G GoldFish                                   | 5556901745  | San Francisco            | USA       | 2008-11-10 |  2000.00 | ak-std-000001  |
  | Daniel G GoldFish                                   | 5556901745  | San Francisco            | USA       | 2008-12-10 |  2000.00 | ak-std-000002  |
  | Anne Wright                                         | 5557410345  | Miami                    | USA       | 2009-01-16 |  5000.00 | ak-std-000003  |
  | Anne Wright                                         | 5557410345  | Miami                    | USA       | 2009-02-16 |  5000.00 | ak-std-000004  |
  | Anne Wright                                         | 5557410345  | Miami                    | USA       | 2009-02-19 |   926.00 | ak-std-000005  |
  | Link Flaute                                         | 5552323129  | New York                 | USA       | 2007-01-08 | 20000.00 | ak-std-000006  |
  | Link Flaute                                         | 5552323129  | New York                 | USA       | 2007-01-08 | 20000.00 | ak-std-000007  |
  | Link Flaute                                         | 5552323129  | New York                 | USA       | 2007-01-08 | 20000.00 | ak-std-000008  |
  | Link Flaute                                         | 5552323129  | New York                 | USA       | 2007-01-08 | 20000.00 | ak-std-000009  |
  | Link Flaute                                         | 5552323129  | New York                 | USA       | 2007-01-08 |  1849.00 | ak-std-000010  |
  | Akane Tendo                                         | 55591233210 | Miami                    | USA       | 2006-01-18 | 23794.00 | ak-std-000011  |
  | Jose Bermejo                                        | 654987321   | Madrid                   | Spain     | 2009-01-13 |  2390.00 | ak-std-000012  |
  | Guillermo Rengifo                                   | 689234750   | Madrid                   | Spain     | 2009-01-06 |   929.00 | ak-std-000013  |
  | Pedro Camunas                                       | 34914873241 | San Lorenzo del Escorial | Spain     | 2008-08-04 |  2246.00 | ak-std-000014  |
  | Juan Rodriguez                                      | 34912453217 | Madrid                   | Spain     | 2008-07-15 |  4160.00 | ak-std-000015  |
  | Javier Villar                                       | 654865643   | Madrid                   | Spain     | 2009-01-15 |  2081.00 | ak-std-000016  |
  | Javier Villar                                       | 654865643   | Madrid                   | Spain     | 2009-02-15 | 10000.00 | ak-std-000035  |
  | Maria Rodriguez                                     | 666555444   | Fuenlabrada              | Spain     | 2009-02-16 |  4399.00 | ak-std-000017  |
  | Luis Martinez                                       | 916458762   | Santa cruz de Tenerife   | Spain     | 2009-03-06 |   232.00 | ak-std-000018  |
  | Maria Santillana                                    | 915576622   | Sotogrande               | Spain     | 2009-03-26 |   272.00 | ak-std-000019  |
  | Eva Mar\u00eda S\u00e1nchez                                   | 916877445   | Madrid                   | Spain     | 2008-03-18 | 18846.00 | ak-std-000020  |
  | Mat\u00edas San Mart\u00edn                                   | 916544147   | Madrid                   | Spain     | 2009-02-08 | 10972.00 | ak-std-000021  |
  | Benito Lopez                                        | 675432926   | Getafe                   | Spain     | 2009-01-13 |  8489.00 | ak-std-000022  |
  | Sara Marquez                                        | 675124537   | Fuenlabrada              | Spain     | 2009-01-16 |  7863.00 | ak-std-000024  |
  | Jacob Jones                                         | 2 9261-2433 | Sydney                   | Australia | 2007-10-06 |  3321.00 | ak-std-000025  |
  | Justin Smith                                        | 2 8005-7161 | Sydney                   | Australia | 2006-05-26 |  1171.00 | ak-std-000026  |
  +-----------------------------------------------------+-------------+--------------------------+-----------+------------+----------+----------------+
    ```

- Escriba una vista que se llame listado_pedidos_clientes que muestre un listado donde aparezcan todos los clientes y los pedidos que ha realizado cada uno de ellos. La vista deberá tener las siguientes columnas: código del cliente, nombre y apellidos del cliente concatendados, teléfono, ciudad, pais, código del pedido, fecha del pedido, fecha esperada, fecha de entrega y la cantidad total del pedido, que será la suma del producto de todas las cantidades por el precio de cada unidad, que aparecen en cada línea de pedido.
    ```sql 
    create view listado_pedidos_clientes as SELECT c.codigo_cliente, CONCAT(c.nombre_cliente, ' ', c.apellido_contacto) as nombre, c.telefono, c.ciudad, c.pais, p.codigo_pedido, p.fecha_pedido, p.fecha_entrega,   SUM(d.cantidad * d.precio_unidad) AS cantidad_total_pedido FROM cliente c JOIN pedido p ON c.codigo_cliente = p.codigo_cliente JOIN detalle_pedido d ON p.codigo_pedido = d.codigo_pedido GROUP BY c.codigo_cliente, nombre,  c.telefono, c.ciudad, c.pais, p.codigo_pedido, p.fecha_pedido, p.fecha_entrega;
  
  
  select * from listado_pedidos_clientes;
  +----------------+-----------------------------------------+-------------+--------------------------+-----------+---------------+--------------+---------------+-----------------------+
  | codigo_cliente | nombre                                  | telefono    | ciudad                   | pais      | codigo_pedido | fecha_pedido | fecha_entrega | cantidad_total_pedido |
  +----------------+-----------------------------------------+-------------+--------------------------+-----------+---------------+--------------+---------------+-----------------------+
  |              5 | Tendo Garden Tendo                      | 55591233210 | Miami                    | USA       |             1 | 2006-01-17   | 2006-01-19    |               1567.00 |
  |              5 | Tendo Garden Tendo                      | 55591233210 | Miami                    | USA       |             2 | 2007-10-23   | 2007-10-26    |               7113.00 |
  |              5 | Tendo Garden Tendo                      | 55591233210 | Miami                    | USA       |             3 | 2008-06-20   | NULL          |              10850.00 |
  |              5 | Tendo Garden Tendo                      | 55591233210 | Miami                    | USA       |             4 | 2009-01-20   | NULL          |               2624.00 |
  |              1 | GoldFish Garden GoldFish                | 5556901745  | San Francisco            | USA       |             8 | 2008-11-09   | 2008-11-14    |               1065.00 |
  |              1 | GoldFish Garden GoldFish                | 5556901745  | San Francisco            | USA       |             9 | 2008-12-22   | 2008-12-28    |               2535.00 |
  |              3 | Gardening Associates Wright             | 5557410345  | Miami                    | USA       |            10 | 2009-01-15   | NULL          |               2920.00 |
  |              1 | GoldFish Garden GoldFish                | 5556901745  | San Francisco            | USA       |            11 | 2009-01-20   | NULL          |                820.00 |
  |              1 | GoldFish Garden GoldFish                | 5556901745  | San Francisco            | USA       |            12 | 2009-01-22   | NULL          |                290.00 |
  |              7 | Beragua Bermejo                         | 654987321   | Madrid                   | Spain     |            13 | 2009-01-12   | 2009-01-15    |                738.00 |
  |              7 | Beragua Bermejo                         | 654987321   | Madrid                   | Spain     |            14 | 2009-01-02   | NULL          |                829.00 |
  |              7 | Beragua Bermejo                         | 654987321   | Madrid                   | Spain     |            15 | 2009-01-09   | 2009-01-11    |                214.00 |
  |              7 | Beragua Bermejo                         | 654987321   | Madrid                   | Spain     |            16 | 2009-01-06   | 2009-01-15    |                234.00 |
  |              7 | Beragua Bermejo                         | 654987321   | Madrid                   | Spain     |            17 | 2009-01-08   | 2009-01-11    |                375.00 |
  |              9 | Naturagua Rengifo                       | 689234750   | Madrid                   | Spain     |            18 | 2009-01-05   | 2009-01-07    |                116.00 |
  |              9 | Naturagua Rengifo                       | 689234750   | Madrid                   | Spain     |            19 | 2009-01-18   | NULL          |                333.00 |
  |              9 | Naturagua Rengifo                       | 689234750   | Madrid                   | Spain     |            20 | 2009-01-20   | NULL          |                292.00 |
  |              9 | Naturagua Rengifo                       | 689234750   | Madrid                   | Spain     |            21 | 2009-01-09   | 2009-01-09    |                182.00 |
  |              9 | Naturagua Rengifo                       | 689234750   | Madrid                   | Spain     |            22 | 2009-01-11   | 2009-01-13    |                  6.00 |
  |              5 | Tendo Garden Tendo                      | 55591233210 | Miami                    | USA       |            23 | 2008-12-30   | NULL          |               1640.00 |
  |             14 | Dardena S.A. Rodriguez                  | 34912453217 | Madrid                   | Spain     |            24 | 2008-07-14   | 2008-07-25    |                287.00 |
  |              1 | GoldFish Garden GoldFish                | 5556901745  | San Francisco            | USA       |            25 | 2009-02-02   | NULL          |               1455.00 |
  |              3 | Gardening Associates Wright             | 5557410345  | Miami                    | USA       |            26 | 2009-02-06   | NULL          |                675.00 |
  |              3 | Gardening Associates Wright             | 5557410345  | Miami                    | USA       |            27 | 2009-02-07   | NULL          |                504.00 |
  |              3 | Gardening Associates Wright             | 5557410345  | Miami                    | USA       |            28 | 2009-02-10   | 2009-02-20    |               2052.00 |
  |             14 | Dardena S.A. Rodriguez                  | 34912453217 | Madrid                   | Spain     |            29 | 2008-08-01   | 2008-09-01    |               1324.00 |
  |             13 | Camunas Jardines S.L. Camunas           | 34914873241 | San Lorenzo del Escorial | Spain     |            30 | 2008-08-03   | 2008-08-31    |                711.00 |
  |             13 | Camunas Jardines S.L. Camunas           | 34914873241 | San Lorenzo del Escorial | Spain     |            31 | 2008-09-04   | 2008-10-04    |                244.00 |
  |              4 | Gerudo Valley Flaute                    | 5552323129  | New York                 | USA       |            32 | 2007-01-07   | 2007-01-27    |               3089.00 |
  |              4 | Gerudo Valley Flaute                    | 5552323129  | New York                 | USA       |            33 | 2007-05-20   | NULL          |              73226.00 |
  |              4 | Gerudo Valley Flaute                    | 5552323129  | New York                 | USA       |            34 | 2007-06-20   | 2008-06-28    |               1532.00 |
  |              4 | Gerudo Valley Flaute                    | 5552323129  | New York                 | USA       |            35 | 2008-03-10   | NULL          |               1718.00 |
  |             14 | Dardena S.A. Rodriguez                  | 34912453217 | Madrid                   | Spain     |            36 | 2008-10-15   | 2008-12-10    |                311.00 |
  |              4 | Gerudo Valley Flaute                    | 5552323129  | New York                 | USA       |            37 | 2008-11-03   | NULL          |               2284.00 |
  |             19 | Golf S.A. Martinez                      | 916458762   | Santa cruz de Tenerife   | Spain     |            38 | 2009-03-05   | 2009-03-07    |                 98.00 |
  |             19 | Golf S.A. Martinez                      | 916458762   | Santa cruz de Tenerife   | Spain     |            39 | 2009-03-06   | 2009-03-09    |                108.00 |
  |             19 | Golf S.A. Martinez                      | 916458762   | Santa cruz de Tenerife   | Spain     |            40 | 2009-03-09   | 2009-03-13    |                 12.00 |
  |             19 | Golf S.A. Martinez                      | 916458762   | Santa cruz de Tenerife   | Spain     |            41 | 2009-03-12   | 2009-03-13    |                 10.00 |
  |             19 | Golf S.A. Martinez                      | 916458762   | Santa cruz de Tenerife   | Spain     |            42 | 2009-03-22   | 2009-03-27    |                  4.00 |
  |             23 | Sotogrande Santillana                   | 915576622   | Sotogrande               | Spain     |            43 | 2009-03-25   | 2009-03-28    |                  9.00 |
  |             23 | Sotogrande Santillana                   | 915576622   | Sotogrande               | Spain     |            44 | 2009-03-26   | 2009-03-30    |                  5.00 |
  |             23 | Sotogrande Santillana                   | 915576622   | Sotogrande               | Spain     |            45 | 2009-04-01   | 2009-03-07    |                 10.00 |
  |             23 | Sotogrande Santillana                   | 915576622   | Sotogrande               | Spain     |            46 | 2009-04-03   | 2009-03-05    |                 84.00 |
  |             23 | Sotogrande Santillana                   | 915576622   | Sotogrande               | Spain     |            47 | 2009-04-15   | 2009-03-17    |                164.00 |
  |             26 | Jardines y Mansiones Cactus SL S\u00e1nchez  | 916877445   | Madrid                   | Spain     |            48 | 2008-03-17   | 2008-03-29    |               6398.00 |
  |             26 | Jardines y Mansiones Cactus SL S\u00e1nchez  | 916877445   | Madrid                   | Spain     |            49 | 2008-07-12   | 2008-07-30    |                625.00 |
  |             26 | Jardines y Mansiones Cactus SL S\u00e1nchez  | 916877445   | Madrid                   | Spain     |            50 | 2008-03-17   | NULL          |               3506.00 |
  |             26 | Jardines y Mansiones Cactus SL S\u00e1nchez  | 916877445   | Madrid                   | Spain     |            51 | 2008-10-01   | 2008-10-14    |               7750.00 |
  |             26 | Jardines y Mansiones Cactus SL S\u00e1nchez  | 916877445   | Madrid                   | Spain     |            52 | 2008-12-07   | NULL          |                700.00 |
  |             13 | Camunas Jardines S.L. Camunas           | 34914873241 | San Lorenzo del Escorial | Spain     |            53 | 2008-10-15   | 2008-11-09    |                141.00 |
  |             14 | Dardena S.A. Rodriguez                  | 34912453217 | Madrid                   | Spain     |            54 | 2009-01-11   | NULL          |                669.00 |
  |             14 | Dardena S.A. Rodriguez                  | 34912453217 | Madrid                   | Spain     |            55 | 2008-12-10   | 2009-01-11    |               1569.00 |
  |             13 | Camunas Jardines S.L. Camunas           | 34914873241 | San Lorenzo del Escorial | Spain     |            56 | 2008-12-19   | NULL          |                377.00 |
  |             13 | Camunas Jardines S.L. Camunas           | 34914873241 | San Lorenzo del Escorial | Spain     |            57 | 2009-01-05   | NULL          |                773.00 |
  |              3 | Gardening Associates Wright             | 5557410345  | Miami                    | USA       |            58 | 2009-01-24   | 2009-01-30    |               4775.00 |
  |              1 | GoldFish Garden GoldFish                | 5556901745  | San Francisco            | USA       |            59 | 2008-11-09   | 2008-11-14    |                700.00 |
  |              1 | GoldFish Garden GoldFish                | 5556901745  | San Francisco            | USA       |            60 | 2008-12-22   | 2008-12-28    |                700.00 |
  |              3 | Gardening Associates Wright             | 5557410345  | Miami                    | USA       |            61 | 2009-01-15   | NULL          |                700.00 |
  |              1 | GoldFish Garden GoldFish                | 5556901745  | San Francisco            | USA       |            62 | 2009-01-20   | NULL          |                700.00 |
  |              1 | GoldFish Garden GoldFish                | 5556901745  | San Francisco            | USA       |            63 | 2009-01-22   | NULL          |                700.00 |
  |              1 | GoldFish Garden GoldFish                | 5556901745  | San Francisco            | USA       |            64 | 2009-01-24   | 2009-01-30    |                700.00 |
  |              1 | GoldFish Garden GoldFish                | 5556901745  | San Francisco            | USA       |            65 | 2009-02-02   | NULL          |                700.00 |
  |              3 | Gardening Associates Wright             | 5557410345  | Miami                    | USA       |            66 | 2009-02-06   | NULL          |                700.00 |
  |              3 | Gardening Associates Wright             | 5557410345  | Miami                    | USA       |            67 | 2009-02-07   | NULL          |                700.00 |
  |              3 | Gardening Associates Wright             | 5557410345  | Miami                    | USA       |            68 | 2009-02-10   | 2009-02-20    |                700.00 |
  |             15 | Jardin de Flores Villar                 | 654865643   | Madrid                   | Spain     |            74 | 2009-01-14   | NULL          |               3562.00 |
  |             15 | Jardin de Flores Villar                 | 654865643   | Madrid                   | Spain     |            75 | 2009-01-11   | 2009-01-13    |               1048.00 |
  |             15 | Jardin de Flores Villar                 | 654865643   | Madrid                   | Spain     |            76 | 2008-11-15   | 2008-11-23    |               2223.00 |
  |             15 | Jardin de Flores Villar                 | 654865643   | Madrid                   | Spain     |            77 | 2009-01-03   | NULL          |                588.00 |
  |             15 | Jardin de Flores Villar                 | 654865643   | Madrid                   | Spain     |            78 | 2008-12-15   | 2008-12-17    |               4660.00 |
  |             28 | Agrojardin Lopez                        | 675432926   | Getafe                   | Spain     |            79 | 2009-01-12   | 2009-01-13    |                300.00 |
  |             28 | Agrojardin Lopez                        | 675432926   | Getafe                   | Spain     |            80 | 2009-01-25   | NULL          |               5773.00 |
  |             28 | Agrojardin Lopez                        | 675432926   | Getafe                   | Spain     |            81 | 2009-01-18   | NULL          |                120.00 |
  |             28 | Agrojardin Lopez                        | 675432926   | Getafe                   | Spain     |            82 | 2009-01-20   | 2009-01-29    |               2176.00 |
  |             28 | Agrojardin Lopez                        | 675432926   | Getafe                   | Spain     |            83 | 2009-01-24   | NULL          |                120.00 |
  |             35 | Tutifruti S.A Jones                     | 2 9261-2433 | Sydney                   | Australia |            89 | 2007-10-05   | 2007-12-10    |                710.00 |
  |             27 | Jardiner\u00edas Mat\u00edas SL San Mart\u00edn        | 916544147   | Madrid                   | Spain     |            90 | 2009-02-07   | NULL          |                 41.00 |
  |             27 | Jardiner\u00edas Mat\u00edas SL San Mart\u00edn        | 916544147   | Madrid                   | Spain     |            91 | 2009-03-18   | 2009-03-27    |               1384.00 |
  |             27 | Jardiner\u00edas Mat\u00edas SL San Mart\u00edn        | 916544147   | Madrid                   | Spain     |            92 | 2009-04-19   | 2009-05-03    |               2906.00 |
  |             27 | Jardiner\u00edas Mat\u00edas SL San Mart\u00edn        | 916544147   | Madrid                   | Spain     |            93 | 2009-05-03   | 2009-05-17    |                882.00 |
  |             27 | Jardiner\u00edas Mat\u00edas SL San Mart\u00edn        | 916544147   | Madrid                   | Spain     |            94 | 2009-10-18   | NULL          |               5759.00 |
  |             35 | Tutifruti S.A Jones                     | 2 9261-2433 | Sydney                   | Australia |            95 | 2008-01-04   | 2008-01-19    |                605.00 |
  |             35 | Tutifruti S.A Jones                     | 2 9261-2433 | Sydney                   | Australia |            96 | 2008-03-20   | 2008-04-13    |                660.00 |
  |             35 | Tutifruti S.A Jones                     | 2 9261-2433 | Sydney                   | Australia |            97 | 2008-10-08   | 2008-11-25    |                322.00 |
  |             35 | Tutifruti S.A Jones                     | 2 9261-2433 | Sydney                   | Australia |            98 | 2009-01-08   | NULL          |               1024.00 |
  |             16 | Flores Marivi Rodriguez                 | 666555444   | Fuenlabrada              | Spain     |            99 | 2009-02-15   | NULL          |               2070.00 |
  |             16 | Flores Marivi Rodriguez                 | 666555444   | Fuenlabrada              | Spain     |           100 | 2009-01-10   | 2009-01-15    |                800.00 |
  |             16 | Flores Marivi Rodriguez                 | 666555444   | Fuenlabrada              | Spain     |           101 | 2009-03-07   | NULL          |                209.00 |
  |             16 | Flores Marivi Rodriguez                 | 666555444   | Fuenlabrada              | Spain     |           102 | 2008-12-28   | 2009-01-08    |                660.00 |
  |             30 | Jardineria Sara Marquez                 | 675124537   | Fuenlabrada              | Spain     |           103 | 2009-01-15   | 2009-01-24    |                304.00 |
  |             30 | Jardineria Sara Marquez                 | 675124537   | Fuenlabrada              | Spain     |           104 | 2009-03-02   | 2009-03-06    |               1760.00 |
  |             30 | Jardineria Sara Marquez                 | 675124537   | Fuenlabrada              | Spain     |           105 | 2009-02-14   | NULL          |               1506.00 |
  |             30 | Jardineria Sara Marquez                 | 675124537   | Fuenlabrada              | Spain     |           106 | 2009-05-13   | 2009-05-20    |               1077.00 |
  |             30 | Jardineria Sara Marquez                 | 675124537   | Fuenlabrada              | Spain     |           107 | 2009-04-06   | 2009-04-10    |               3216.00 |
  |             16 | Flores Marivi Rodriguez                 | 666555444   | Fuenlabrada              | Spain     |           108 | 2009-04-09   | 2009-04-15    |                660.00 |
  |             38 | El Jardin Viviente S.L Smith            | 2 8005-7161 | Sydney                   | Australia |           109 | 2006-05-25   | 2006-07-28    |                553.00 |
  |             38 | El Jardin Viviente S.L Smith            | 2 8005-7161 | Sydney                   | Australia |           110 | 2007-03-19   | 2007-04-24    |                149.00 |
  |             36 | Flores S.L. Romero                      | 654352981   | Madrid                   | Spain     |           111 | 2008-03-05   | 2008-03-30    |                700.00 |
  |             36 | Flores S.L. Romero                      | 654352981   | Madrid                   | Spain     |           112 | 2009-03-05   | 2009-05-07    |                700.00 |
  |             36 | Flores S.L. Romero                      | 654352981   | Madrid                   | Spain     |           113 | 2008-10-28   | 2009-01-09    |                700.00 |
  |             36 | Flores S.L. Romero                      | 654352981   | Madrid                   | Spain     |           114 | 2009-01-15   | 2009-01-31    |                700.00 |
  |             36 | Flores S.L. Romero                      | 654352981   | Madrid                   | Spain     |           115 | 2008-11-29   | 2009-02-27    |                700.00 |
  |             38 | El Jardin Viviente S.L Smith            | 2 8005-7161 | Sydney                   | Australia |           116 | 2008-06-28   | 2008-08-01    |                264.00 |
  |             38 | El Jardin Viviente S.L Smith            | 2 8005-7161 | Sydney                   | Australia |           117 | 2008-08-25   | NULL          |                154.00 |
  |             16 | Flores Marivi Rodriguez                 | 666555444   | Fuenlabrada              | Spain     |           118 | 2009-02-15   | NULL          |                700.00 |
  |             16 | Flores Marivi Rodriguez                 | 666555444   | Fuenlabrada              | Spain     |           119 | 2009-01-10   | 2009-01-15    |                700.00 |
  |             16 | Flores Marivi Rodriguez                 | 666555444   | Fuenlabrada              | Spain     |           120 | 2009-03-07   | NULL          |                700.00 |
  |             16 | Flores Marivi Rodriguez                 | 666555444   | Fuenlabrada              | Spain     |           121 | 2008-12-28   | 2009-01-08    |                700.00 |
  |             16 | Flores Marivi Rodriguez                 | 666555444   | Fuenlabrada              | Spain     |           122 | 2009-04-09   | 2009-04-15    |                700.00 |
  |             30 | Jardineria Sara Marquez                 | 675124537   | Fuenlabrada              | Spain     |           123 | 2009-01-15   | 2009-01-24    |                700.00 |
  |             30 | Jardineria Sara Marquez                 | 675124537   | Fuenlabrada              | Spain     |           124 | 2009-03-02   | 2009-03-06    |                700.00 |
  |             30 | Jardineria Sara Marquez                 | 675124537   | Fuenlabrada              | Spain     |           125 | 2009-02-14   | NULL          |                700.00 |
  |             30 | Jardineria Sara Marquez                 | 675124537   | Fuenlabrada              | Spain     |           126 | 2009-05-13   | 2009-05-20    |                700.00 |
  |             30 | Jardineria Sara Marquez                 | 675124537   | Fuenlabrada              | Spain     |           127 | 2009-04-06   | 2009-04-10    |                700.00 |
  |             38 | El Jardin Viviente S.L Smith            | 2 8005-7161 | Sydney                   | Australia |           128 | 2008-11-10   | 2008-12-29    |                 51.00 |
  +----------------+-----------------------------------------+-------------+--------------------------+-----------+---------------+--------------+---------------+-----------------------+

    ```

- Utilice las vistas que ha creado en los pasos anteriores para devolver un listado de los clientes de la ciudad de Madrid que han realizado pagos.
    ```sql 
    select * from listado_pagos_clientes where ciudad = 'Madrid';
  +-----------------------------------------------------+-------------+--------+-------+------------+----------+----------------+
  | concat(c.nombre_contacto, ' ', c.apellido_contacto) | telefono    | ciudad | pais  | fecha_pago | total    | id_transaccion |
  +-----------------------------------------------------+-------------+--------+-------+------------+----------+----------------+
  | Jose Bermejo                                        | 654987321   | Madrid | Spain | 2009-01-13 |  2390.00 | ak-std-000012  |
  | Guillermo Rengifo                                   | 689234750   | Madrid | Spain | 2009-01-06 |   929.00 | ak-std-000013  |
  | Juan Rodriguez                                      | 34912453217 | Madrid | Spain | 2008-07-15 |  4160.00 | ak-std-000015  |
  | Javier Villar                                       | 654865643   | Madrid | Spain | 2009-01-15 |  2081.00 | ak-std-000016  |
  | Javier Villar                                       | 654865643   | Madrid | Spain | 2009-02-15 | 10000.00 | ak-std-000035  |
  | Eva Mar\u00eda S\u00e1nchez                                   | 916877445   | Madrid | Spain | 2008-03-18 | 18846.00 | ak-std-000020  |
  | Mat\u00edas San Mart\u00edn                                   | 916544147   | Madrid | Spain | 2009-02-08 | 10972.00 | ak-std-000021  |
  +-----------------------------------------------------+-------------+--------+-------+------------+----------+----------------+

    ```

- Utilice las vistas que ha creado en los pasos anteriores para devolver un listado de los clientes que todavía no han recibido su pedido.
    ```sql 
    select * from listado_pedidos_clientes where fecha_entrega is null;
  +----------------+-----------------------------------------+-------------+--------------------------+-----------+---------------+--------------+---------------+-----------------------+
  | codigo_cliente | nombre                                  | telefono    | ciudad                   | pais      | codigo_pedido | fecha_pedido | fecha_entrega | cantidad_total_pedido |
  +----------------+-----------------------------------------+-------------+--------------------------+-----------+---------------+--------------+---------------+-----------------------+
  |              5 | Tendo Garden Tendo                      | 55591233210 | Miami                    | USA       |             3 | 2008-06-20   | NULL          |              10850.00 |
  |              5 | Tendo Garden Tendo                      | 55591233210 | Miami                    | USA       |             4 | 2009-01-20   | NULL          |               2624.00 |
  |              3 | Gardening Associates Wright             | 5557410345  | Miami                    | USA       |            10 | 2009-01-15   | NULL          |               2920.00 |
  |              1 | GoldFish Garden GoldFish                | 5556901745  | San Francisco            | USA       |            11 | 2009-01-20   | NULL          |                820.00 |
  |              1 | GoldFish Garden GoldFish                | 5556901745  | San Francisco            | USA       |            12 | 2009-01-22   | NULL          |                290.00 |
  |              7 | Beragua Bermejo                         | 654987321   | Madrid                   | Spain     |            14 | 2009-01-02   | NULL          |                829.00 |
  |              9 | Naturagua Rengifo                       | 689234750   | Madrid                   | Spain     |            19 | 2009-01-18   | NULL          |                333.00 |
  |              9 | Naturagua Rengifo                       | 689234750   | Madrid                   | Spain     |            20 | 2009-01-20   | NULL          |                292.00 |
  |              5 | Tendo Garden Tendo                      | 55591233210 | Miami                    | USA       |            23 | 2008-12-30   | NULL          |               1640.00 |
  |              1 | GoldFish Garden GoldFish                | 5556901745  | San Francisco            | USA       |            25 | 2009-02-02   | NULL          |               1455.00 |
  |              3 | Gardening Associates Wright             | 5557410345  | Miami                    | USA       |            26 | 2009-02-06   | NULL          |                675.00 |
  |              3 | Gardening Associates Wright             | 5557410345  | Miami                    | USA       |            27 | 2009-02-07   | NULL          |                504.00 |
  |              4 | Gerudo Valley Flaute                    | 5552323129  | New York                 | USA       |            33 | 2007-05-20   | NULL          |              73226.00 |
  |              4 | Gerudo Valley Flaute                    | 5552323129  | New York                 | USA       |            35 | 2008-03-10   | NULL          |               1718.00 |
  |              4 | Gerudo Valley Flaute                    | 5552323129  | New York                 | USA       |            37 | 2008-11-03   | NULL          |               2284.00 |
  |             26 | Jardines y Mansiones Cactus SL S\u00e1nchez  | 916877445   | Madrid                   | Spain     |            50 | 2008-03-17   | NULL          |               3506.00 |
  |             26 | Jardines y Mansiones Cactus SL S\u00e1nchez  | 916877445   | Madrid                   | Spain     |            52 | 2008-12-07   | NULL          |                700.00 |
  |             14 | Dardena S.A. Rodriguez                  | 34912453217 | Madrid                   | Spain     |            54 | 2009-01-11   | NULL          |                669.00 |
  |             13 | Camunas Jardines S.L. Camunas           | 34914873241 | San Lorenzo del Escorial | Spain     |            56 | 2008-12-19   | NULL          |                377.00 |
  |             13 | Camunas Jardines S.L. Camunas           | 34914873241 | San Lorenzo del Escorial | Spain     |            57 | 2009-01-05   | NULL          |                773.00 |
  |              3 | Gardening Associates Wright             | 5557410345  | Miami                    | USA       |            61 | 2009-01-15   | NULL          |                700.00 |
  |              1 | GoldFish Garden GoldFish                | 5556901745  | San Francisco            | USA       |            62 | 2009-01-20   | NULL          |                700.00 |
  |              1 | GoldFish Garden GoldFish                | 5556901745  | San Francisco            | USA       |            63 | 2009-01-22   | NULL          |                700.00 |
  |              1 | GoldFish Garden GoldFish                | 5556901745  | San Francisco            | USA       |            65 | 2009-02-02   | NULL          |                700.00 |
  |              3 | Gardening Associates Wright             | 5557410345  | Miami                    | USA       |            66 | 2009-02-06   | NULL          |                700.00 |
  |              3 | Gardening Associates Wright             | 5557410345  | Miami                    | USA       |            67 | 2009-02-07   | NULL          |                700.00 |
  |             15 | Jardin de Flores Villar                 | 654865643   | Madrid                   | Spain     |            74 | 2009-01-14   | NULL          |               3562.00 |
  |             15 | Jardin de Flores Villar                 | 654865643   | Madrid                   | Spain     |            77 | 2009-01-03   | NULL          |                588.00 |
  |             28 | Agrojardin Lopez                        | 675432926   | Getafe                   | Spain     |            80 | 2009-01-25   | NULL          |               5773.00 |
  |             28 | Agrojardin Lopez                        | 675432926   | Getafe                   | Spain     |            81 | 2009-01-18   | NULL          |                120.00 |
  |             28 | Agrojardin Lopez                        | 675432926   | Getafe                   | Spain     |            83 | 2009-01-24   | NULL          |                120.00 |
  |             27 | Jardiner\u00edas Mat\u00edas SL San Mart\u00edn        | 916544147   | Madrid                   | Spain     |            90 | 2009-02-07   | NULL          |                 41.00 |
  |             27 | Jardiner\u00edas Mat\u00edas SL San Mart\u00edn        | 916544147   | Madrid                   | Spain     |            94 | 2009-10-18   | NULL          |               5759.00 |
  |             35 | Tutifruti S.A Jones                     | 2 9261-2433 | Sydney                   | Australia |            98 | 2009-01-08   | NULL          |               1024.00 |
  |             16 | Flores Marivi Rodriguez                 | 666555444   | Fuenlabrada              | Spain     |            99 | 2009-02-15   | NULL          |               2070.00 |
  |             16 | Flores Marivi Rodriguez                 | 666555444   | Fuenlabrada              | Spain     |           101 | 2009-03-07   | NULL          |                209.00 |
  |             30 | Jardineria Sara Marquez                 | 675124537   | Fuenlabrada              | Spain     |           105 | 2009-02-14   | NULL          |               1506.00 |
  |             38 | El Jardin Viviente S.L Smith            | 2 8005-7161 | Sydney                   | Australia |           117 | 2008-08-25   | NULL          |                154.00 |
  |             16 | Flores Marivi Rodriguez                 | 666555444   | Fuenlabrada              | Spain     |           118 | 2009-02-15   | NULL          |                700.00 |
  |             16 | Flores Marivi Rodriguez                 | 666555444   | Fuenlabrada              | Spain     |           120 | 2009-03-07   | NULL          |                700.00 |
  |             30 | Jardineria Sara Marquez                 | 675124537   | Fuenlabrada              | Spain     |           125 | 2009-02-14   | NULL          |                700.00 |
  +----------------+-----------------------------------------+-------------+--------------------------+-----------+---------------+--------------+---------------+-----------------------+
    ```

- Utilice las vistas que ha creado en los pasos anteriores para calcular el número de pedidos que se ha realizado cada uno de los clientes.
    ```sql 
    select codigo_cliente, count(codigo_cliente) as total_pedidos from listado_pedidos_clientes group by
   codigo_cliente;
  +----------------+---------------+
  | codigo_cliente | total_pedidos |
  +----------------+---------------+
  |              5 |             5 |
  |              1 |            11 |
  |              3 |             9 |
  |              7 |             5 |
  |              9 |             5 |
  |             14 |             5 |
  |             13 |             5 |
  |              4 |             5 |
  |             19 |             5 |
  |             23 |             5 |
  |             26 |             5 |
  |             15 |             5 |
  |             28 |             5 |
  |             35 |             5 |
  |             27 |             5 |
  |             16 |            10 |
  |             30 |            10 |
  |             38 |             5 |
  |             36 |             5 |
  +----------------+---------------+
    ```

- Utilice las vistas que ha creado en los pasos anteriores para calcular el valor del pedido máximo y mínimo que ha realizado cada cliente.
    ```sql 
    select min(cantidad_total_pedido) from listado_pedidos_clientes;
  +----------------------------+
  | min(cantidad_total_pedido) |
  +----------------------------+
  |                       4.00 |
  +----------------------------+
  
  select max(cantidad_total_pedido) from listado_pedidos_clientes;
  +----------------------------+
  | max(cantidad_total_pedido) |
  +----------------------------+
  |                   73226.00 |
  +----------------------------+
    ```

- Modifique el nombre de las vista listado_pagos_clientes y asígnele el nombre listado_de_pagos. Una vez que haya modificado el nombre de la vista ejecute una consulta utilizando el nuevo nombre de la vista para comprobar que sigue funcionando correctamente.
    ```sql 
    
    ```

- Elimine las vistas que ha creado en los pasos anteriores.
    ```sql 
    
    ```

## Refecrencias
[Jardineria Database](https://dev.mysql.com/doc/sakila/en/sakila-introduction.html)
