--Devuelve un listado con todos los pedidos que se han realizado. Los pedidos deben estar ordenados por la fecha de realización, mostrando en primer lugar los pedidos más recientes.

SELECT * FROM pedido ORDER BY fecha desc;
/**
┌────┬─────────┬────────────┬────────────┬──────────────┐
│ id │  total  │   fecha    │ id_cliente │ id_comercial │
├────┼─────────┼────────────┼────────────┼──────────────┤
│ 15 │ 370.85  │ 2019-03-11 │ 1          │ 5            │
│ 16 │ 2389.23 │ 2019-03-11 │ 1          │ 5            │
│ 13 │ 545.75  │ 2019-01-25 │ 6          │ 1            │
│ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6            │
│ 1  │ 150.5   │ 2017-10-05 │ 5          │ 2            │
│ 3  │ 65.26   │ 2017-10-05 │ 2          │ 1            │
│ 5  │ 948.5   │ 2017-09-10 │ 5          │ 2            │
│ 12 │ 3045.6  │ 2017-04-25 │ 2          │ 1            │
│ 14 │ 145.82  │ 2017-02-02 │ 6          │ 1            │
│ 9  │ 2480.4  │ 2016-10-10 │ 8          │ 3            │
│ 2  │ 270.65  │ 2016-09-10 │ 1          │ 5            │
│ 4  │ 110.5   │ 2016-08-17 │ 8          │ 3            │
│ 11 │ 75.29   │ 2016-08-17 │ 3          │ 7            │
│ 6  │ 2400.6  │ 2016-07-27 │ 7          │ 1            │
│ 7  │ 5760.0  │ 2015-09-10 │ 2          │ 1            │
│ 10 │ 250.45  │ 2015-06-27 │ 8          │ 2            │
└────┴─────────┴────────────┴────────────┴──────────────┘
**/

--Devuelve todos los datos de los dos pedidos de mayor valor.

SELECT * FROM pedido order by total desc LIMIT 2
/**
┌────┬────────┬────────────┬────────────┬──────────────┐
│ id │ total  │   fecha    │ id_cliente │ id_comercial │
├────┼────────┼────────────┼────────────┼──────────────┤
│ 7  │ 5760.0 │ 2015-09-10 │ 2          │ 1            │
│ 12 │ 3045.6 │ 2017-04-25 │ 2          │ 1            │
└────┴────────┴────────────┴────────────┴──────────────┘
**/

--Devuelve un listado con los identificadores de los clientes que han realizado algún pedido. Tenga en cuenta que no debe mostrar identificadores que estén repetidos.

SELECT DISTINCT id_cliente FROM pedido ;
/**
┌────────────┐
│ id_cliente │
├────────────┤
│ 5          │
│ 1          │
│ 2          │
│ 8          │
│ 7          │
│ 4          │
│ 3          │
│ 6          │
└────────────┘
**/

--Devuelve un listado de todos los pedidos que se realizaron durante el año 2017, cuya cantidad total sea superior a 500€.

SELECT * FROM  pedido WHERE total > 500 and fecha REGEXP '^2017';
/**
┌────┬─────────┬────────────┬────────────┬──────────────┐
│ id │  total  │   fecha    │ id_cliente │ id_comercial │
├────┼─────────┼────────────┼────────────┼──────────────┤
│ 5  │ 948.5   │ 2017-09-10 │ 5          │ 2            │
│ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6            │
│ 12 │ 3045.6  │ 2017-04-25 │ 2          │ 1            │
└────┴─────────┴────────────┴────────────┴──────────────┘
**/

--Devuelve un listado con el nombre y los apellidos de los comerciales que tienen una comisión entre 0.05 y 0.11.

SELECT nombre , apellido1 ||' '|| apellido2 as apellidos FROM comercial WHERE categoria BETWEEN  0.05 and 0.11;
/**
┌─────────┬────────────────┐
│ nombre  │   apellidos    │
├─────────┼────────────────┤
│ Diego   │ Flores Salas   │
│ Antonio │ Vega Hernández │
│ Alfredo │ Ruiz Flores    │
└─────────┴────────────────┘
**/

--Devuelve el valor de la comisión de mayor valor que existe en la tabla comercial.

SELECT  max(categoria) FROM comercial ;
/**
┌────────────────┐
│ max(categoria) │
├────────────────┤
│ 0.15           │
└────────────────┘
**/

--Devuelve el identificador, nombre y primer apellido de aquellos clientes cuyo segundo apellido no es NULL. El listado deberá estar ordenado alfabéticamente por apellidos y nombre.

SELECT id, nombre, apellido1 FROM cliente WHERE apellido2 is not NULL order by apellido1, nombre asc;
/**
┌────┬───────────┬───────────┐
│ id │  nombre   │ apellido1 │
├────┼───────────┼───────────┤
│ 5  │ Marcos    │ Loyola    │
│ 9  │ Guillermo │ López     │
│ 1  │ Aarón     │ Rivero    │
│ 3  │ Adolfo    │ Rubio     │
│ 8  │ Pepe      │ Ruiz      │
│ 2  │ Adela     │ Salas     │
│ 10 │ Daniel    │ Santana   │
│ 6  │ María     │ Santana   │
└────┴───────────┴───────────┘
**/

--Devuelve un listado de los nombres de los clientes que empiezan por A y terminan por n y también los nombres que empiezan por P. El listado deberá estar ordenado alfabéticamente.

SELECT * from cliente WHERE nombre REGEXP '^A.*n$' or nombre REGEXP '^P' ORDER BY nombre ;
/**
┌────┬────────┬───────────┬───────────┬─────────┬───────────┐
│ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │
├────┼────────┼───────────┼───────────┼─────────┼───────────┤
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │
│ 4  │ Adrián │ Suárez    │           │ Jaén    │ 300       │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │
│ 7  │ Pilar  │ Ruiz      │           │ Sevilla │ 300       │
└────┴────────┴───────────┴───────────┴─────────┴───────────┘
**/

--Devuelve un listado de los nombres de los clientes que no empiezan por A. El listado deberá estar ordenado alfabéticamente.

SELECT * from cliente WHERE nombre not REGEXP '^A' ORDER BY nombre;
/**
┌────┬───────────┬───────────┬───────────┬─────────┬───────────┐
│ id │  nombre   │ apellido1 │ apellido2 │ ciudad  │ categoria │
├────┼───────────┼───────────┼───────────┼─────────┼───────────┤
│ 10 │ Daniel    │ Santana   │ Loyola    │ Sevilla │ 125       │
│ 9  │ Guillermo │ López     │ Gómez     │ Granada │ 225       │
│ 5  │ Marcos    │ Loyola    │ Méndez    │ Almería │ 200       │
│ 6  │ María     │ Santana   │ Moreno    │ Cádiz   │ 100       │
│ 8  │ Pepe      │ Ruiz      │ Santana   │ Huelva  │ 200       │
│ 7  │ Pilar     │ Ruiz      │           │ Sevilla │ 300       │
└────┴───────────┴───────────┴───────────┴─────────┴───────────┘
**/

--Devuelve un listado con los nombres de los comerciales que terminan por el o o. Tenga en cuenta que se deberán eliminar los nombres repetidos.

SELECT DISTINCT  nombre FROM comercial WHERE nombre REGEXP 'o$';
/**
┌─────────┐
│ nombre  │
├─────────┤
│ Diego   │
│ Antonio │
│ Alfredo │
└─────────┘
**/

--Devuelve un listado con el identificador, nombre y los apellidos de todos los clientes que han realizado algún pedido. El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.

SELECT DISTINCT c.id, c.nombre, c.apellido1, c.apellido2 FROM cliente as c JOIN pedido as p on c.id=p.id_cliente order by nombre ;
/**
┌────┬────────┬───────────┬───────────┐
│ id │ nombre │ apellido1 │ apellido2 │
├────┼────────┼───────────┼───────────┤
│ 1  │ Aarón  │ Rivero    │ Gómez     │
│ 2  │ Adela  │ Salas     │ Díaz      │
│ 3  │ Adolfo │ Rubio     │ Flores    │
│ 4  │ Adrián │ Suárez    │           │
│ 5  │ Marcos │ Loyola    │ Méndez    │
│ 6  │ María  │ Santana   │ Moreno    │
│ 8  │ Pepe   │ Ruiz      │ Santana   │
│ 7  │ Pilar  │ Ruiz      │           │
└────┴────────┴───────────┴───────────┘
**/

--Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente. El resultado debe mostrar todos los datos de los pedidos y del cliente. El listado debe mostrar los datos de los clientes ordenados alfabéticamente.

SELECT c.*, p.* FROM cliente as c JOIN pedido as p on c.id=p.id_cliente order by c.nombre;
/**
┌────┬────────┬───────────┬───────────┬─────────┬───────────┬────┬─────────┬────────────┬────────────┬──────────────┐
│ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │ id │  total  │   fecha    │ id_cliente │ id_comercial │
├────┼────────┼───────────┼───────────┼─────────┼───────────┼────┼─────────┼────────────┼────────────┼──────────────┤
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 2  │ 270.65  │ 2016-09-10 │ 1          │ 5            │
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 15 │ 370.85  │ 2019-03-11 │ 1          │ 5            │
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 16 │ 2389.23 │ 2019-03-11 │ 1          │ 5            │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 3  │ 65.26   │ 2017-10-05 │ 2          │ 1            │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 7  │ 5760.0  │ 2015-09-10 │ 2          │ 1            │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 12 │ 3045.6  │ 2017-04-25 │ 2          │ 1            │
│ 3  │ Adolfo │ Rubio     │ Flores    │ Sevilla │           │ 11 │ 75.29   │ 2016-08-17 │ 3          │ 7            │
│ 4  │ Adrián │ Suárez    │           │ Jaén    │ 300       │ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6            │
│ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │ 1  │ 150.5   │ 2017-10-05 │ 5          │ 2            │
│ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │ 5  │ 948.5   │ 2017-09-10 │ 5          │ 2            │
│ 6  │ María  │ Santana   │ Moreno    │ Cádiz   │ 100       │ 13 │ 545.75  │ 2019-01-25 │ 6          │ 1            │
│ 6  │ María  │ Santana   │ Moreno    │ Cádiz   │ 100       │ 14 │ 145.82  │ 2017-02-02 │ 6          │ 1            │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 4  │ 110.5   │ 2016-08-17 │ 8          │ 3            │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 9  │ 2480.4  │ 2016-10-10 │ 8          │ 3            │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 10 │ 250.45  │ 2015-06-27 │ 8          │ 2            │
│ 7  │ Pilar  │ Ruiz      │           │ Sevilla │ 300       │ 6  │ 2400.6  │ 2016-07-27 │ 7          │ 1            │
└────┴────────┴───────────┴───────────┴─────────┴───────────┴────┴─────────┴────────────┴────────────┴──────────────┘
**/

--Devuelve un listado que muestre todos los pedidos en los que ha participado un comercial. El resultado debe mostrar todos los datos de los pedidos y de los comerciales. El listado debe mostrar los datos de los comerciales ordenados alfabéticamente.

SELECT c.*, p.* FROM comercial as c JOIN pedido as p on c.id=p.id_comercial order by c.nombre; 
/**
┌────┬─────────┬───────────┬───────────┬───────────┬────┬─────────┬────────────┬────────────┬──────────────┐
│ id │ nombre  │ apellido1 │ apellido2 │ categoria │ id │  total  │   fecha    │ id_cliente │ id_comercial │
├────┼─────────┼───────────┼───────────┼───────────┼────┼─────────┼────────────┼────────────┼──────────────┤
│ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │ 2  │ 270.65  │ 2016-09-10 │ 1          │ 5            │
│ 7  │ Antonio │ Vega      │ Hernández │ 0.11      │ 11 │ 75.29   │ 2016-08-17 │ 3          │ 7            │
│ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │ 15 │ 370.85  │ 2019-03-11 │ 1          │ 5            │
│ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │ 16 │ 2389.23 │ 2019-03-11 │ 1          │ 5            │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 3  │ 65.26   │ 2017-10-05 │ 2          │ 1            │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 6  │ 2400.6  │ 2016-07-27 │ 7          │ 1            │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 7  │ 5760.0  │ 2015-09-10 │ 2          │ 1            │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 12 │ 3045.6  │ 2017-04-25 │ 2          │ 1            │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 13 │ 545.75  │ 2019-01-25 │ 6          │ 1            │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 14 │ 145.82  │ 2017-02-02 │ 6          │ 1            │
│ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │ 4  │ 110.5   │ 2016-08-17 │ 8          │ 3            │
│ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │ 9  │ 2480.4  │ 2016-10-10 │ 8          │ 3            │
│ 2  │ Juan    │ Gómez     │ López     │ 0.13      │ 1  │ 150.5   │ 2017-10-05 │ 5          │ 2            │
│ 2  │ Juan    │ Gómez     │ López     │ 0.13      │ 5  │ 948.5   │ 2017-09-10 │ 5          │ 2            │
│ 2  │ Juan    │ Gómez     │ López     │ 0.13      │ 10 │ 250.45  │ 2015-06-27 │ 8          │ 2            │
│ 6  │ Manuel  │ Domínguez │ Hernández │ 0.13      │ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6            │
└────┴─────────┴───────────┴───────────┴───────────┴────┴─────────┴────────────┴────────────┴──────────────┘
**/

--Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado y con los datos de los comerciales asociados a cada pedido.

SELECT cli.nombre, c.*, p.* FROM comercial as c JOIN pedido as p on c.id=p.id_comercial JOIN cliente as cli on cli.id=p.id_cliente;
/**
┌────────┬────┬─────────┬───────────┬───────────┬───────────┬────┬─────────┬────────────┬────────────┬──────────────┐
│ nombre │ id │ nombre  │ apellido1 │ apellido2 │ categoria │ id │  total  │   fecha    │ id_cliente │ id_comercial │
├────────┼────┼─────────┼───────────┼───────────┼───────────┼────┼─────────┼────────────┼────────────┼──────────────┤
│ Marcos │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │ 1  │ 150.5   │ 2017-10-05 │ 5          │ 2            │
│ Aarón  │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │ 2  │ 270.65  │ 2016-09-10 │ 1          │ 5            │
│ Adela  │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 3  │ 65.26   │ 2017-10-05 │ 2          │ 1            │
│ Pepe   │ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │ 4  │ 110.5   │ 2016-08-17 │ 8          │ 3            │
│ Marcos │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │ 5  │ 948.5   │ 2017-09-10 │ 5          │ 2            │
│ Pilar  │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 6  │ 2400.6  │ 2016-07-27 │ 7          │ 1            │
│ Adela  │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 7  │ 5760.0  │ 2015-09-10 │ 2          │ 1            │
│ Adrián │ 6  │ Manuel  │ Domínguez │ Hernández │ 0.13      │ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6            │
│ Pepe   │ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │ 9  │ 2480.4  │ 2016-10-10 │ 8          │ 3            │
│ Pepe   │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │ 10 │ 250.45  │ 2015-06-27 │ 8          │ 2            │
│ Adolfo │ 7  │ Antonio │ Vega      │ Hernández │ 0.11      │ 11 │ 75.29   │ 2016-08-17 │ 3          │ 7            │
│ Adela  │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 12 │ 3045.6  │ 2017-04-25 │ 2          │ 1            │
│ María  │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 13 │ 545.75  │ 2019-01-25 │ 6          │ 1            │
│ María  │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 14 │ 145.82  │ 2017-02-02 │ 6          │ 1            │
│ Aarón  │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │ 15 │ 370.85  │ 2019-03-11 │ 1          │ 5            │
│ Aarón  │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │ 16 │ 2389.23 │ 2019-03-11 │ 1          │ 5            │
└────────┴────┴─────────┴───────────┴───────────┴───────────┴────┴─────────┴────────────┴────────────┴──────────────┘
**/

--Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2017, cuya cantidad esté entre 300 € y 1000 €.

SELECT c.*, p.* FROM cliente as c JOIN pedido as p on c.id=p.id_cliente WHERE fecha REGEXP '^2017' and total BETWEEN 300 and 1000;
/**
┌────┬────────┬───────────┬───────────┬─────────┬───────────┬────┬───────┬────────────┬────────────┬──────────────┐
│ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │ id │ total │   fecha    │ id_cliente │ id_comercial │
├────┼────────┼───────────┼───────────┼─────────┼───────────┼────┼───────┼────────────┼────────────┼──────────────┤
│ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │ 5  │ 948.5 │ 2017-09-10 │ 5          │ 2            │
└────┴────────┴───────────┴───────────┴─────────┴───────────┴────┴───────┴────────────┴────────────┴──────────────┘
**/

--Devuelve el nombre y los apellidos de todos los comerciales que ha participado en algún pedido realizado por María Santana Moreno.

SELECT DISTINCT  co.nombre, co.apellido1 ||' '|| co.apellido2 as apellidos FROM comercial as co JOIN pedido as.id=p.id_comercial JOIN cliente as c on c.id=p.id_cliente WHERE c.nombre = 'María' and c.apellido1 ='Santana' and c.apellido2='Moreno';
/**
┌────────┬───────────┐
│ nombre │ apellidos │
├────────┼───────────┤
│ Daniel │ Sáez Vega │
└────────┴───────────┘
**/

--Devuelve el nombre de todos los clientes que han realizado algún pedido con el comercial Daniel Sáez Vega.

SELECT DISTINCT c.nombre FROM comercial as co JOIN pedido as p on co.id=p.id_comercial JOIN cliente as c on c.id=p.id_cliente WHERE co.nombre = 'Daniel' and co.apellido1 ='Sáez' and co.apellido2='Vega';
/**
┌────────┐
│ nombre │
├────────┤
│ Adela  │
│ Pilar  │
│ María  │
└────────┘
**/

--Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido.

SELECT SUM(total) as total FROM pedido ;
/**
┌──────────┐
│  total   │
├──────────┤
│ 20992.83 │
└──────────┘
**/

--Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido.

SELECT AVG(total) as media_total FROM pedido ;
/**
┌─────────────┐
│ media_total │
├─────────────┤
│ 1312.051875 │
└─────────────┘
**/

--Calcula el número total de comerciales distintos que aparecen en la tabla pedido.

SELECT COUNT(DISTINCT id_comercial) as total_comerciales FROM pedido ;
/**
┌───────────────────┐
│ total_comerciales │
├───────────────────┤
│ 6                 │
└───────────────────┘
**/

--Calcula el número total de clientes que aparecen en la tabla cliente.

SELECT COUNT(id) as total_clientes FROM cliente ;
/**
┌────────────────┐
│ total_clientes │
├────────────────┤
│ 10             │
└────────────────┘
**/

--Calcula cuál es la mayor cantidad que aparece en la tabla pedido.

SELECT MAX(total) FROM pedido ;
/**
┌────────────┐
│ MAX(total) │
├────────────┤
│ 5760.0     │
└────────────┘
**/

--Calcula cuál es la menor cantidad que aparece en la tabla pedido.

SELECT min(total) FROM pedido ;
/**
┌────────────┐
│ min(total) │
├────────────┤
│ 65.26      │
└────────────┘
**/

--Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla cliente.

SELECT max(categoria) as maximo, ciudad  FROM cliente GROUP BY ciudad ;
/**
┌────────┬─────────┐
│ maximo │ ciudad  │
├────────┼─────────┤
│ 200    │ Almería │
│ 100    │ Cádiz   │
│ 225    │ Granada │
│ 200    │ Huelva  │
│ 300    │ Jaén    │
│ 300    │ Sevilla │
└────────┴─────────┘
**/

--Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes. Es decir, el mismo cliente puede haber realizado varios pedidos de diferentes cantidades el mismo día. Se pide que se calcule cuál es el pedido de máximo valor para cada uno de los días en los que un cliente ha realizado un pedido. Muestra el identificador del cliente, nombre, apellidos, la fecha y el valor de la cantidad.

SELECT c.id, c.nombre, c.apellido1, p.fecha, max(p.total) FROM pedido as p JOIN cliente as c on c.id=p.id_cliente GROUP BY c.nombre;
/**
┌────┬────────┬───────────┬────────────┬──────────────┐
│ id │ nombre │ apellido1 │   fecha    │ max(p.total) │
├────┼────────┼───────────┼────────────┼──────────────┤
│ 1  │ Aarón  │ Rivero    │ 2019-03-11 │ 2389.23      │
│ 2  │ Adela  │ Salas     │ 2015-09-10 │ 5760.0       │
│ 3  │ Adolfo │ Rubio     │ 2016-08-17 │ 75.29        │
│ 4  │ Adrián │ Suárez    │ 2017-10-10 │ 1983.43      │
│ 5  │ Marcos │ Loyola    │ 2017-09-10 │ 948.5        │
│ 6  │ María  │ Santana   │ 2019-01-25 │ 545.75       │
│ 8  │ Pepe   │ Ruiz      │ 2016-10-10 │ 2480.4       │
│ 7  │ Pilar  │ Ruiz      │ 2016-07-27 │ 2400.6       │
└────┴────────┴───────────┴────────────┴──────────────┘
**/

--Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes, teniendo en cuenta que sólo queremos mostrar aquellos pedidos que superen la cantidad de 2000 €.

SELECT c.id, c.nombre, c.apellido1, p.fecha, max(p.total) FROM pedido as p JOIN cliente as c on c.id=p.id_cliente WHERE p.total > 2000 GROUP BY c.nombre;
/**
┌────┬────────┬───────────┬────────────┬──────────────┐
│ id │ nombre │ apellido1 │   fecha    │ max(p.total) │
├────┼────────┼───────────┼────────────┼──────────────┤
│ 1  │ Aarón  │ Rivero    │ 2019-03-11 │ 2389.23      │
│ 2  │ Adela  │ Salas     │ 2015-09-10 │ 5760.0       │
│ 8  │ Pepe   │ Ruiz      │ 2016-10-10 │ 2480.4       │
│ 7  │ Pilar  │ Ruiz      │ 2016-07-27 │ 2400.6       │
└────┴────────┴───────────┴────────────┴──────────────┘
**/

--Calcula el máximo valor de los pedidos realizados para cada uno de los comerciales durante la fecha 2016-08-17. Muestra el identificador del comercial, nombre, apellidos y total.

SELECT c.id, c.nombre, c.apellido1, max(p.total) FROM comercial as c JOIN pedido as p on p.id_cliente=c.id and fecha = '2016-08-17' GROUP by p.id_comercial;
/**
┌────┬─────────┬───────────┬──────────────┐
│ id │ nombre  │ apellido1 │ max(p.total) │
├────┼─────────┼───────────┼──────────────┤
│ 8  │ Alfredo │ Ruiz      │ 110.5        │
│ 3  │ Diego   │ Flores    │ 75.29        │
└────┴─────────┴───────────┴──────────────┘
**/

--Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha realizado cada uno de clientes. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido. Estos clientes también deben aparecer en el listado indicando que el número de pedidos realizados es 0.

SELECT c.id, c.nombre, c.apellido1, p.fecha, count(p.id_cliente) as num_pedidos FROM cliente as c LEFT JOIN pedido as p on c.id=p.id_cliente GROUP BY c.nombre;
/**
┌────┬───────────┬───────────┬────────────┬─────────────┐
│ id │  nombre   │ apellido1 │   fecha    │ num_pedidos │
├────┼───────────┼───────────┼────────────┼─────────────┤
│ 1  │ Aarón     │ Rivero    │ 2016-09-10 │ 3           │
│ 2  │ Adela     │ Salas     │ 2015-09-10 │ 3           │
│ 3  │ Adolfo    │ Rubio     │ 2016-08-17 │ 1           │
│ 4  │ Adrián    │ Suárez    │ 2017-10-10 │ 1           │
│ 10 │ Daniel    │ Santana   │            │ 0           │
│ 9  │ Guillermo │ López     │            │ 0           │
│ 5  │ Marcos    │ Loyola    │ 2017-09-10 │ 2           │
│ 6  │ María     │ Santana   │ 2017-02-02 │ 2           │
│ 8  │ Pepe      │ Ruiz      │ 2015-06-27 │ 3           │
│ 7  │ Pilar     │ Ruiz      │ 2016-07-27 │ 1           │
└────┴───────────┴───────────┴────────────┴─────────────┘
**/

--Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha realizado cada uno de clientes durante el año 2017.

SELECT c.id, c.nombre, c.apellido1, count(p.id_cliente) as num_pedidos FROM cliente as c LEFT JOIN pedido as p on c.id=p.id_cliente WHERE p.fecha REGEXP '^2017' GROUP BY c.nombre;
/**
┌────┬────────┬───────────┬─────────────┐
│ id │ nombre │ apellido1 │ num_pedidos │
├────┼────────┼───────────┼─────────────┤
│ 2  │ Adela  │ Salas     │ 2           │
│ 4  │ Adrián │ Suárez    │ 1           │
│ 5  │ Marcos │ Loyola    │ 2           │
│ 6  │ María  │ Santana   │ 1           │
└────┴────────┴───────────┴─────────────┘
**/

--Devuelve un listado que muestre el identificador de cliente, nombre, primer apellido y el valor de la máxima cantidad del pedido realizado por cada uno de los clientes. El resultado debe mostrar aquellos clientes que no han realizado ningún pedido indicando que la máxima cantidad de sus pedidos realizados es 0.

SELECT c.id, c.nombre, c.apellido1, max(p.total) FROM cliente as c LEFT JOIN pedido as p on p.id_cliente=c.id GROUP by c.nombre;
/**
┌────┬───────────┬───────────┬──────────────┐
│ id │  nombre   │ apellido1 │ max(p.total) │
├────┼───────────┼───────────┼──────────────┤
│ 1  │ Aarón     │ Rivero    │ 2389.23      │
│ 2  │ Adela     │ Salas     │ 5760.0       │
│ 3  │ Adolfo    │ Rubio     │ 75.29        │
│ 4  │ Adrián    │ Suárez    │ 1983.43      │
│ 10 │ Daniel    │ Santana   │              │
│ 9  │ Guillermo │ López     │              │
│ 5  │ Marcos    │ Loyola    │ 948.5        │
│ 6  │ María     │ Santana   │ 545.75       │
│ 8  │ Pepe      │ Ruiz      │ 2480.4       │
│ 7  │ Pilar     │ Ruiz      │ 2400.6       │
└────┴───────────┴───────────┴──────────────┘
**/

--Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año.


/**

**/

--Devuelve el número total de pedidos que se han realizado cada año.


/**

**/

--Devuelve un listado con todos los pedidos que ha realizado Adela Salas Díaz. (Sin utilizar INNER JOIN).

select p.* FROM pedido as p, cliente as c where p.id_cliente=c.id and c.nombre='Adela'and c.apellido1='Salas' and c.apellido2='Díaz';
/**
┌────┬────────┬────────────┬────────────┬──────────────┐
│ id │ total  │   fecha    │ id_cliente │ id_comercial │
├────┼────────┼────────────┼────────────┼──────────────┤
│ 3  │ 65.26  │ 2017-10-05 │ 2          │ 1            │
│ 7  │ 5760.0 │ 2015-09-10 │ 2          │ 1            │
│ 12 │ 3045.6 │ 2017-04-25 │ 2          │ 1            │
└────┴────────┴────────────┴────────────┴──────────────┘
**/

--Devuelve el número de pedidos en los que ha participado el comercial Daniel Sáez Vega. (Sin utilizar INNER JOIN)

select p.* FROM pedido as p, comercial as c where p.id_comercial=c.id and c.nombre='Daniel'and c.apellido1='Sáez' and c.apellido2='Vega';
/**
┌────┬────────┬────────────┬────────────┬──────────────┐
│ id │ total  │   fecha    │ id_cliente │ id_comercial │
├────┼────────┼────────────┼────────────┼──────────────┤
│ 3  │ 65.26  │ 2017-10-05 │ 2          │ 1            │
│ 6  │ 2400.6 │ 2016-07-27 │ 7          │ 1            │
│ 7  │ 5760.0 │ 2015-09-10 │ 2          │ 1            │
│ 12 │ 3045.6 │ 2017-04-25 │ 2          │ 1            │
│ 13 │ 545.75 │ 2019-01-25 │ 6          │ 1            │
│ 14 │ 145.82 │ 2017-02-02 │ 6          │ 1            │
└────┴────────┴────────────┴────────────┴──────────────┘
**/

--Devuelve los datos del cliente que realizó el pedido más caro en el año 2019. (Sin utilizar INNER JOIN)

select c.*, max(p.total) FROM pedido as p, cliente as c where p.id_cliente=c.id and fecha REGEXP '^2019';
/**
┌────┬────────┬───────────┬───────────┬─────────┬───────────┬──────────────┐
│ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │ max(p.total) │
├────┼────────┼───────────┼───────────┼─────────┼───────────┼──────────────┤
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 2389.23      │
└────┴────────┴───────────┴───────────┴─────────┴───────────┴──────────────┘
**/

--Devuelve la fecha y la cantidad del pedido de menor valor realizado por el cliente Pepe Ruiz Santana.

SELECT p.fecha, min(p.total) FROM pedido as p, cliente as c where p.id_cliente=c.id and c.nombre='Pepe' and c.apellido1='Ruiz' and c.apellido2='Santana';
/**
┌────────────┬──────────────┐
│   fecha    │ min(p.total) │
├────────────┼──────────────┤
│ 2016-08-17 │ 110.5        │
└────────────┴──────────────┘
**/

--Devuelve un listado con los datos de los clientes y los pedidos, de todos los clientes que han realizado un pedido durante el año 2017 con un valor mayor o igual al valor medio de los pedidos realizados durante ese mismo año.

SELECT c.*, p.* FROM pedido as p, cliente as c where p.id_cliente=c.id and p.fecha REGEXP '^2017' and p.total > (SELECT AVG(total) FROM pedido WHERE fecha REGEXP '^2017');
/**
┌────┬────────┬───────────┬───────────┬─────────┬───────────┬────┬─────────┬────────────┬────────────┬──────────────┐
│ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │ id │  total  │   fecha    │ id_cliente │ id_comercial │
├────┼────────┼───────────┼───────────┼─────────┼───────────┼────┼─────────┼────────────┼────────────┼──────────────┤
│ 4  │ Adrián │ Suárez    │           │ Jaén    │ 300       │ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6            │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 12 │ 3045.6  │ 2017-04-25 │ 2          │ 1            │
└────┴────────┴───────────┴───────────┴─────────┴───────────┴────┴─────────┴────────────┴────────────┴──────────────┘
**/

--Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando IN o NOT IN).

SELECT * FROM cliente WHERE id NOT IN (SELECT DISTINCT id_cliente from pedido);
/**
┌────┬───────────┬───────────┬───────────┬─────────┬───────────┐
│ id │  nombre   │ apellido1 │ apellido2 │ ciudad  │ categoria │
├────┼───────────┼───────────┼───────────┼─────────┼───────────┤
│ 9  │ Guillermo │ López     │ Gómez     │ Granada │ 225       │
│ 10 │ Daniel    │ Santana   │ Loyola    │ Sevilla │ 125       │
└────┴───────────┴───────────┴───────────┴─────────┴───────────┘
**/

--Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando IN o NOT IN).

SELECT * FROM comercial WHERE id not in (SELECT DISTINCT id_comercial FROM pedido );
/**
┌────┬─────────┬───────────┬───────────┬───────────┐
│ id │ nombre  │ apellido1 │ apellido2 │ categoria │
├────┼─────────┼───────────┼───────────┼───────────┤
│ 4  │ Marta   │ Herrera   │ Gil       │ 0.14      │
│ 8  │ Alfredo │ Ruiz      │ Flores    │ 0.05      │
└────┴─────────┴───────────┴───────────┴───────────┘
**/

--Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).

SELECT * FROM cliente as c WHERE NOT EXISTS  (SELECT 1 FROM pedido as p WHERE p.id_cliente=c.id);
/**
┌────┬───────────┬───────────┬───────────┬─────────┬───────────┐
│ id │  nombre   │ apellido1 │ apellido2 │ ciudad  │ categoria │
├────┼───────────┼───────────┼───────────┼─────────┼───────────┤
│ 9  │ Guillermo │ López     │ Gómez     │ Granada │ 225       │
│ 10 │ Daniel    │ Santana   │ Loyola    │ Sevilla │ 125       │
└────┴───────────┴───────────┴───────────┴─────────┴───────────┘
**/

--Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).

SELECT * FROM comercial as c WHERE NOT EXISTS  (SELECT 1 FROM pedido as p WHERE p.id_comercial=c.id);
/**
┌────┬─────────┬───────────┬───────────┬───────────┐
│ id │ nombre  │ apellido1 │ apellido2 │ categoria │
├────┼─────────┼───────────┼───────────┼───────────┤
│ 4  │ Marta   │ Herrera   │ Gil       │ 0.14      │
│ 8  │ Alfredo │ Ruiz      │ Flores    │ 0.05      │
└────┴─────────┴───────────┴───────────┴───────────┘
**/
