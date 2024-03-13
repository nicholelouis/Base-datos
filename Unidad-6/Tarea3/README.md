# Migración y primero pasos en MySQL

![img](https://github.com/nicholelouis/Base-datos/blob/main/img/1024px-MySQL.ff87215b43fd7292af172e2a5d9b844217262571.png?raw=true)

## Tarea3

Dada una BBDD en SQLite3 realiza la migración de esta y las siguientes consultas.

### Creación de base de datos

```sql
CREATE DATABASE Tarea3;
```

### Conectar con la base de datos

```sql
USE Tarea3;
```

### Leer archivo sql

```sql
source Tarea3.sql;
```

### Dentro del archivo sql
Creación de tablas e insercion de información.

```sql
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre_cliente VARCHAR(100),
    ciudad_cliente VARCHAR(100)
);

CREATE TABLE ordenes (
    id_orden INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    fecha_orden DATE,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(100),
    precio_producto DECIMAL(10, 2)
);

CREATE TABLE detalles_ordenes (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_orden INT,
    id_producto INT,
    cantidad INT,
    FOREIGN KEY (id_orden) REFERENCES ordenes(id_orden),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

INSERT INTO clientes (id_cliente, nombre_cliente, ciudad_cliente) VALUES
(1, 'Juan', 'Ciudad A'),
(2, 'María', 'Ciudad B'),
(3, 'Pedro', 'Ciudad C');

INSERT INTO ordenes (id_orden, id_cliente, fecha_orden) VALUES
(1, 1, '2024-03-01'),
(2, 2, '2024-03-02'),
(3, 3, '2024-03-03');

INSERT INTO productos (id_producto, nombre_producto, precio_producto) VALUES
(1, 'Producto A', 50.00),
(2, 'Producto B', 75.00),
(3, 'Producto C', 100.00);

INSERT INTO detalles_ordenes (id_detalle, id_orden, id_producto, cantidad) VALUES
(1, 1, 1, 2),
(2, 2, 2, 1),
(3, 3, 3, 3);
```

## Consultas

- Mostrar todos los clientes.
```sql
select * from clientes;
+------------+----------------+----------------+
| id_cliente | nombre_cliente | ciudad_cliente |
+------------+----------------+----------------+
|          1 | Juan           | Ciudad A       |
|          2 | María          | Ciudad B       |
|          3 | Pedro          | Ciudad C       |
+------------+----------------+----------------+
```

- Mostrar todas las órdenes.
```sql
select * from ordenes;
+----------+------------+-------------+
| id_orden | id_cliente | fecha_orden |
+----------+------------+-------------+
|        1 |          1 | 2024-03-01  |
|        2 |          2 | 2024-03-02  |
|        3 |          3 | 2024-03-03  |
+----------+------------+-------------+
```


- Mostrar todos los productos
```sql
select * from productos;
+-------------+-----------------+-----------------+
| id_producto | nombre_producto | precio_producto |
+-------------+-----------------+-----------------+
|           1 | Producto A      |           50.00 |
|           2 | Producto B      |           75.00 |
|           3 | Producto C      |          100.00 |
+-------------+-----------------+-----------------+
```

- Mostrar todos los detalles de las órdenes.
```sql
select * from detalles_ordenes;
+------------+----------+-------------+----------+
| id_detalle | id_orden | id_producto | cantidad |
+------------+----------+-------------+----------+
|          1 |        1 |           1 |        2 |
|          2 |        2 |           2 |        1 |
|          3 |        3 |           3 |        3 |
+------------+----------+-------------+----------+
```

- Mostrar los primeros 5 clientes ordenados por nombre.
```sql
select * from clientes order by nombre_cliente limit 5;
+------------+----------------+----------------+
| id_cliente | nombre_cliente | ciudad_cliente |
+------------+----------------+----------------+
|          1 | Juan           | Ciudad A       |
|          2 | María          | Ciudad B       |
|          3 | Pedro          | Ciudad C       |
+------------+----------------+----------------+
```

- Mostrar los productos con un precio mayor a 50.
```sql
select * from productos where precio_producto > 50;
+-------------+-----------------+-----------------+
| id_producto | nombre_producto | precio_producto |
+-------------+-----------------+-----------------+
|           2 | Producto B      |           75.00 |
|           3 | Producto C      |          100.00 |
+-------------+-----------------+-----------------++
```

- Mostrar todas las órdenes realizadas por el cliente con ID 1.
```sql
select * from ordenes where id_cliente = 1;
+----------+------------+-------------+
| id_orden | id_cliente | fecha_orden |
+----------+------------+-------------+
|        1 |          1 | 2024-03-01  |
+----------+------------+-------------+
```

- Mostrar los clientes cuyos nombres comienzan con la letra "A".
```sql
select * from clientes where nombre_cliente regexp '^A';
```

- Mostrar las órdenes que contienen más de 2 productos.
```sql
select * from detalles_ordenes where cantidad > 2;
+------------+----------+-------------+----------+
| id_detalle | id_orden | id_producto | cantidad |
+------------+----------+-------------+----------+
|          3 |        3 |           3 |        3 |
+------------+----------+-------------+----------+
```

- Mostrar los productos ordenados por precio de forma descendente.
```sql
select * from productos order by precio_producto desc;
+-------------+-----------------+-----------------+
| id_producto | nombre_producto | precio_producto |
+-------------+-----------------+-----------------+
|           3 | Producto C      |          100.00 |
|           2 | Producto B      |           75.00 |
|           1 | Producto A      |           50.00 |
+-------------+-----------------+-----------------+
```

- Seleccionar todos los clientes y sus órdenes, incluso si no tienen órdenes.
```sql
select c.*, o.* from clientes as c LEFT JOIN ordenes as o on c.id_cliente
= o.id_cliente;
+------------+----------------+----------------+----------+------------+-------------+
| id_cliente | nombre_cliente | ciudad_cliente | id_orden | id_cliente | fecha_orden |
+------------+----------------+----------------+----------+------------+-------------+
|          1 | Juan           | Ciudad A       |        1 |          1 | 2024-03-01  |
|          2 | María          | Ciudad B       |        2 |          2 | 2024-03-02  |
|          3 | Pedro          | Ciudad C       |        3 |          3 | 2024-03-03  |
+------------+----------------+----------------+----------+------------+-------------+
```

- Seleccionar todas las órdenes junto con los productos correspondientes.
```sql
select o.*, p.* from ordenes as o join detalles_ordenes as d on d.id_orden=o.id_orden join productos as p on d.id_producto=p.id_producto;
+----------+------------+-------------+-------------+-----------------+-----------------+
| id_orden | id_cliente | fecha_orden | id_producto | nombre_producto | precio_producto |
+----------+------------+-------------+-------------+-----------------+-----------------+
|        1 |          1 | 2024-03-01  |           1 | Producto A      |           50.00 |
|        2 |          2 | 2024-03-02  |           2 | Producto B      |           75.00 |
|        3 |          3 | 2024-03-03  |           3 | Producto C      |          100.00 |
+----------+------------+-------------+-------------+-----------------+-----------------+
```

- Mostrar el nombre de los clientes que han realizado órdenes de productos que cuestan más de 50.
```sql
select c.nombre_cliente, p.precio_producto from clientes as c join ordenes as o on c.id_cliente = o.id_cliente join detalles_ordenes as d on d.id_orden=o.id_orden join productos as p on d.id_producto=p.id_producto where p.precio_producto > 50;
+----------------+-----------------+
| nombre_cliente | precio_producto |
+----------------+-----------------+
| María          |           75.00 |
| Pedro          |          100.00 |
+----------------+-----------------+
```

- Obtener el nombre de los productos que no se han ordenado aún.
```sql
select p.* from productos as p join detalles_ordenes as d on p.id_producto=d.id_producto where d.id_producto is NULL;
```

- Mostrar el nombre del cliente, el producto y la cantidad para todas las órdenes.
```sql
select c.nombre_cliente, p.nombre_producto, o.* from ordenes as o join clientes as c on c.id_cliente=o.id_cliente join detalles_ordenes as d on d.id_orden=o.id_orden join productos as p on p.id_producto=d.id_producto;
+----------------+-----------------+----------+------------+-------------+
| nombre_cliente | nombre_producto | id_orden | id_cliente | fecha_orden |
+----------------+-----------------+----------+------------+-------------+
| Juan           | Producto A      |        1 |          1 | 2024-03-01  |
| María          | Producto B      |        2 |          2 | 2024-03-02  |
| Pedro          | Producto C      |        3 |          3 | 2024-03-03  |
+----------------+-----------------+----------+------------+-------------+
```

- Obtener el nombre de los productos junto con los nombres de los clientes que han realizado órdenes de esos productos.
```sql
select c.nombre_cliente, p.nombre_producto from ordenes as o join clientes as c on c.id_cliente=o.id_cliente join detalles_ordenes as d on d.id_orden=o.id_orden join productos as p on p.id_producto=d.id_producto;
+----------------+-----------------+
| nombre_cliente | nombre_producto |
+----------------+-----------------+
| Juan           | Producto A      |
| María          | Producto B      |
| Pedro          | Producto C      |
+----------------+-----------------+
```

- Mostrar todas las órdenes con sus clientes y productos, incluso si no hay órdenes.
```sql
select c.*, o.*, p.* from clientes as c left join ordenes as o on c.id_cliente=o.id_cliente join
detalles_ordenes as d on d.id_orden=o.id_orden join productos as p on p.id_producto=d.id_producto;
+------------+----------------+----------------+----------+------------+-------------+-------------+-----------------+-----------------+
| id_cliente | nombre_cliente | ciudad_cliente | id_orden | id_cliente | fecha_orden | id_producto | nombre_producto | precio_producto |
+------------+----------------+----------------+----------+------------+-------------+-------------+-----------------+-----------------+
|          1 | Juan           | Ciudad A       |        1 |          1 | 2024-03-01  |           1 | Producto A      |           50.00 |
|          2 | María          | Ciudad B       |        2 |          2 | 2024-03-02  |           2 | Producto B      |           75.00 |
|          3 | Pedro          | Ciudad C       |        3 |          3 | 2024-03-03  |           3 | Producto C      |          100.00 |
+------------+----------------+----------------+----------+------------+-------------+-------------+-----------------+-----------------+
```

- Obtener el nombre de los clientes junto con el número total de órdenes que han realizado.
```sql
select c.nombre_cliente, count(o.id_orden) from clientes as c join ordenes as o on c.id_cliente=o.id_cliente group by c.nombre_cliente;
+----------------+-------------------+
| nombre_cliente | count(o.id_orden) |
+----------------+-------------------+
| Juan           |                 1 |
| María          |                 1 |
| Pedro          |                 1 |
+----------------+-------------------+
```

- Mostrar todas las órdenes junto con el nombre del cliente y el nombre del producto.
```sql
select o.*, c.nombre_cliente, p.nombre_producto from clientes as c join ordenes as o on c.id_cliente = o.id_cliente join detalles_ordenes as d on d.id_orden=o.id_orden join productos as p on
d.id_producto=p.id_producto;
+----------+------------+-------------+----------------+-----------------+
| id_orden | id_cliente | fecha_orden | nombre_cliente | nombre_producto |
+----------+------------+-------------+----------------+-----------------+
|        1 |          1 | 2024-03-01  | Juan           | Producto A      |
|        2 |          2 | 2024-03-02  | María          | Producto B      |
|        3 |          3 | 2024-03-03  | Pedro          | Producto C      |
+----------+------------+-------------+----------------+-----------------+
```

- Mostrar todas las órdenes con sus productos y clientes, incluso si no hay información de cliente.
```sql
select o.*, p.*, c.* from ordenes as o left join clientes as c on c.id_cliente=o.id_cliente
join detalles_ordenes as d on d.id_orden=o.id_orden join productos as p on p.id_producto=d.id_producto;
+----------+------------+-------------+-------------+-----------------+-----------------+------------+----------------+----------------+
| id_orden | id_cliente | fecha_orden | id_producto | nombre_producto | precio_producto | id_cliente | nombre_cliente | ciudad_cliente |
+----------+------------+-------------+-------------+-----------------+-----------------+------------+----------------+----------------+
|        1 |          1 | 2024-03-01  |           1 | Producto A      |           50.00 |          1 | Juan           | Ciudad A       |
|        2 |          2 | 2024-03-02  |           2 | Producto B      |           75.00 |          2 | María          | Ciudad B       |
|        3 |          3 | 2024-03-03  |           3 | Producto C      |          100.00 |          3 | Pedro          | Ciudad C       |
+----------+------------+-------------+-------------+-----------------+-----------------+------------+----------------+----------------+
```

- Obtener el nombre de los productos junto con los nombres de los clientes que han realizado órdenes de esos productos, incluyendo los productos que no han sido ordenados.
```sql
select p.*, c.*, o.* from productos as p left join detalles_ordenes as d on p.id_producto=d.id_producto join ordenes as o on d.id_orden=o.id_orden join clientes as c on c.id_cliente=o.id_cliente ;
+-------------+-----------------+-----------------+------------+----------------+----------------+----------+------------+-------------+
| id_producto | nombre_producto | precio_producto | id_cliente | nombre_cliente | ciudad_cliente | id_orden | id_cliente | fecha_orden |
+-------------+-----------------+-----------------+------------+----------------+----------------+----------+------------+-------------+
|           1 | Producto A      |           50.00 |          1 | Juan           | Ciudad A       |        1 |          1 | 2024-03-01  |
|           2 | Producto B      |           75.00 |          2 | María          | Ciudad B       |        2 |          2 | 2024-03-02  |
|           3 | Producto C      |          100.00 |          3 | Pedro          | Ciudad C       |        3 |          3 | 2024-03-03  |
+-------------+-----------------+-----------------+------------+----------------+----------------+----------+------------+-------------+
```

- Mostrar todas las órdenes junto con el nombre del cliente y el nombre del producto, incluyendo las órdenes sin productos.
```sql
select p.*, c.*, o.* from ordenes as o left join detalles_ordenes as d on d.id_orden=o.id_orden left join productos as p on p.id_producto=d.id_producto join clientes as c on c.id_cliente=o.id_cliente;
+-------------+-----------------+-----------------+------------+----------------+----------------+----------+------------+-------------+
| id_producto | nombre_producto | precio_producto | id_cliente | nombre_cliente | ciudad_cliente | id_orden | id_cliente | fecha_orden |
+-------------+-----------------+-----------------+------------+----------------+----------------+----------+------------+-------------+
|           1 | Producto A      |           50.00 |          1 | Juan           | Ciudad A       |        1 |          1 | 2024-03-01  |
|           2 | Producto B      |           75.00 |          2 | María          | Ciudad B       |        2 |          2 | 2024-03-02  |
|           3 | Producto C      |          100.00 |          3 | Pedro          | Ciudad C       |        3 |          3 | 2024-03-03  |
+-------------+-----------------+-----------------+------------+----------------+----------------+----------+------------+-------------+
```

- Obtener el nombre de los clientes junto con el número total de órdenes que han realizado, incluyendo los clientes que no han realizado órdenes.
```sql
select c.nombre_cliente, count(o.id_orden) from clientes as c left join ordenes as o on c.id_cliente=o.id_cliente group by c.nombre_cliente;
+----------------+-------------------+
| nombre_cliente | count(o.id_orden) |
+----------------+-------------------+
| Juan           |                 1 |
| María          |                 1 |
| Pedro          |                 1 |
+----------------+-------------------+
```


- Mostrar todas las órdenes con sus clientes y productos, incluyendo las órdenes y productos que no tienen información.
```sql

```

- Realizar un inner join entre clientes y órdenes.
```sql
select * from clientes as c join ordenes as o on c.id_cliente=o.id_cliente;
+------------+----------------+----------------+----------+------------+-------------+
| id_cliente | nombre_cliente | ciudad_cliente | id_orden | id_cliente | fecha_orden |
+------------+----------------+----------------+----------+------------+-------------+
|          1 | Juan           | Ciudad A       |        1 |          1 | 2024-03-01  |
|          2 | María          | Ciudad B       |        2 |          2 | 2024-03-02  |
|          3 | Pedro          | Ciudad C       |        3 |          3 | 2024-03-03  |
+------------+----------------+----------------+----------+------------+-------------+
```

- Realizar un left join entre órdenes y detalles de órdenes.
```sql
select * from ordenes as o left join detalles_ordenes as d on d.id_orden=o.id_orden;
+----------+------------+-------------+------------+----------+-------------+----------+
| id_orden | id_cliente | fecha_orden | id_detalle | id_orden | id_producto | cantidad |
+----------+------------+-------------+------------+----------+-------------+----------+
|        1 |          1 | 2024-03-01  |          1 |        1 |           1 |        2 |
|        2 |          2 | 2024-03-02  |          2 |        2 |           2 |        1 |
|        3 |          3 | 2024-03-03  |          3 |        3 |           3 |        3 |
+----------+------------+-------------+------------+----------+-------------+----------+
```

- Realizar un right join entre productos y detalles de órdenes.
```sql
select * from productos as p right join detalles_ordenes as d on p.id_producto=d.id_producto;
+-------------+-----------------+-----------------+------------+----------+-------------+----------+
| id_producto | nombre_producto | precio_producto | id_detalle | id_orden | id_producto | cantidad |
+-------------+-----------------+-----------------+------------+----------+-------------+----------+
|           1 | Producto A      |           50.00 |          1 |        1 |           1 |        2 |
|           2 | Producto B      |           75.00 |          2 |        2 |           2 |        1 |
|           3 | Producto C      |          100.00 |          3 |        3 |           3 |        3 |
+-------------+-----------------+-----------------+------------+----------+-------------+----------+
```

- Realizar un full join entre clientes y órdenes.
```sql
select * from clientes as c left join ordenes as o on c.id_cliente=o.id_cliente union all select * from clientes as c right join ordenes as o on c.id_cliente=o.id_cliente where c.id_cliente i
s NULL;
+------------+----------------+----------------+----------+------------+-------------+
| id_cliente | nombre_cliente | ciudad_cliente | id_orden | id_cliente | fecha_orden |
+------------+----------------+----------------+----------+------------+-------------+
|          1 | Juan           | Ciudad A       |        1 |          1 | 2024-03-01  |
|          2 | María          | Ciudad B       |        2 |          2 | 2024-03-02  |
|          3 | Pedro          | Ciudad C       |        3 |          3 | 2024-03-03  |
+------------+----------------+----------------+----------+------------+-------------+
```

- Realizar un full join entre órdenes y detalles de órdenes.
```sql
select * from ordenes as o left join detalles_ordenes as d on d.id_orden=o.id_orden union all select * from ordenes as o right join detalles_ordenes as d on d.id_orden=o.id_orden where o.id_orden is null;
+----------+------------+-------------+------------+----------+-------------+----------+
| id_orden | id_cliente | fecha_orden | id_detalle | id_orden | id_producto | cantidad |
+----------+------------+-------------+------------+----------+-------------+----------+
|        1 |          1 | 2024-03-01  |          1 |        1 |           1 |        2 |
|        2 |          2 | 2024-03-02  |          2 |        2 |           2 |        1 |
|        3 |          3 | 2024-03-03  |          3 |        3 |           3 |        3 |
+----------+------------+-------------+------------+----------+-------------+----------+
```

-Realizar un full join entre productos y detalles de órdenes.
```sql
select * from productos as p left join detalles_ordenes as d on p.id_producto=d.id_producto union all select * from productos as p right join detalles_ordenes as d on p.id_producto=d.id_prod
ucto where p.id_producto is null;
+-------------+-----------------+-----------------+------------+----------+-------------+----------+
| id_producto | nombre_producto | precio_producto | id_detalle | id_orden | id_producto | cantidad |
+-------------+-----------------+-----------------+------------+----------+-------------+----------+
|           1 | Producto A      |           50.00 |          1 |        1 |           1 |        2 |
|           2 | Producto B      |           75.00 |          2 |        2 |           2 |        1 |
|           3 | Producto C      |          100.00 |          3 |        3 |           3 |        3 |
+-------------+-----------------+-----------------+------------+----------+-------------+----------+
```




