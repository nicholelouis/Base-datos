--Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.

SELECT p.*, f.nombre FROM producto as p, fabricante as f where f.codigo=p.codigo_fabricante
/**
┌────────┬─────────────────────────────────┬────────┬───────────────────┬─────────────────┐
│ codigo │             nombre              │ precio │ codigo_fabricante │     nombre      │
├────────┼─────────────────────────────────┼────────┼───────────────────┼─────────────────┤
│ 1      │ Disco duro SATA3 1TB            │ 86.99  │ 5                 │ Seagate         │
│ 2      │ Memoria RAM DDR4 8GB            │ 120.0  │ 6                 │ Crucial         │
│ 3      │ Disco SSD 1 TB                  │ 150.99 │ 4                 │ Samsung         │
│ 4      │ GeForce GTX 1050Ti              │ 185.0  │ 7                 │ Gigabyte        │
│ 5      │ GeForce GTX 1080 Xtreme         │ 755.0  │ 6                 │ Crucial         │
│ 6      │ Monitor 24 LED Full HD          │ 202.0  │ 1                 │ Asus            │
│ 7      │ Monitor 27 LED Full HD          │ 245.99 │ 1                 │ Asus            │
│ 8      │ Portátil Yoga 520               │ 559.0  │ 2                 │ Lenovo          │
│ 9      │ Portátil Ideapd 320             │ 444.0  │ 2                 │ Lenovo          │
│ 10     │ Impresora HP Deskjet 3720       │ 59.99  │ 3                 │ Hewlett-Packard │
│ 11     │ Impresora HP Laserjet Pro M26nw │ 180.0  │ 3                 │ Hewlett-Packard │
└────────┴─────────────────────────────────┴────────┴───────────────────┴─────────────────┘
**/

--Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.

SELECT p.*, f.nombre FROM producto as p, fabricante as f where f.codigo=p.codigo_fabricante ORDER BY f.nombre;
/**
┌────────┬─────────────────────────────────┬────────┬───────────────────┬─────────────────┐
│ codigo │             nombre              │ precio │ codigo_fabricante │     nombre      │
├────────┼─────────────────────────────────┼────────┼───────────────────┼─────────────────┤
│ 6      │ Monitor 24 LED Full HD          │ 202.0  │ 1                 │ Asus            │
│ 7      │ Monitor 27 LED Full HD          │ 245.99 │ 1                 │ Asus            │
│ 2      │ Memoria RAM DDR4 8GB            │ 120.0  │ 6                 │ Crucial         │
│ 5      │ GeForce GTX 1080 Xtreme         │ 755.0  │ 6                 │ Crucial         │
│ 4      │ GeForce GTX 1050Ti              │ 185.0  │ 7                 │ Gigabyte        │
│ 10     │ Impresora HP Deskjet 3720       │ 59.99  │ 3                 │ Hewlett-Packard │
│ 11     │ Impresora HP Laserjet Pro M26nw │ 180.0  │ 3                 │ Hewlett-Packard │
│ 8      │ Portátil Yoga 520               │ 559.0  │ 2                 │ Lenovo          │
│ 9      │ Portátil Ideapd 320             │ 444.0  │ 2                 │ Lenovo          │
│ 3      │ Disco SSD 1 TB                  │ 150.99 │ 4                 │ Samsung         │
│ 1      │ Disco duro SATA3 1TB            │ 86.99  │ 5                 │ Seagate         │
└────────┴─────────────────────────────────┴────────┴───────────────────┴─────────────────┘
**/

--Devuelve una lista con el identificador del producto, nombre del producto, identificador del fabricante y nombre del fabricante, de todos los productos de la base de datos.

SELECT  p.codigo, p.nombre, f.codigo, f.nombre FROM producto as p, fabricante as f where f.codigo=p.codigo_fabricante;
/**
┌────────┬─────────────────────────────────┬────────┬─────────────────┐
│ codigo │             nombre              │ codigo │     nombre      │
├────────┼─────────────────────────────────┼────────┼─────────────────┤
│ 1      │ Disco duro SATA3 1TB            │ 5      │ Seagate         │
│ 2      │ Memoria RAM DDR4 8GB            │ 6      │ Crucial         │
│ 3      │ Disco SSD 1 TB                  │ 4      │ Samsung         │
│ 4      │ GeForce GTX 1050Ti              │ 7      │ Gigabyte        │
│ 5      │ GeForce GTX 1080 Xtreme         │ 6      │ Crucial         │
│ 6      │ Monitor 24 LED Full HD          │ 1      │ Asus            │
│ 7      │ Monitor 27 LED Full HD          │ 1      │ Asus            │
│ 8      │ Portátil Yoga 520               │ 2      │ Lenovo          │
│ 9      │ Portátil Ideapd 320             │ 2      │ Lenovo          │
│ 10     │ Impresora HP Deskjet 3720       │ 3      │ Hewlett-Packard │
│ 11     │ Impresora HP Laserjet Pro M26nw │ 3      │ Hewlett-Packard │
└────────┴─────────────────────────────────┴────────┴─────────────────┘
**/

--Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.

SELECT p.nombre, min(p.precio) as precio, f.nombre FROM producto as p, fabricante as f where f.codigo=p.codigo_fabricante;
/**
┌───────────────────────────┬────────┬─────────────────┐
│          nombre           │ precio │     nombre      │
├───────────────────────────┼────────┼─────────────────┤
│ Impresora HP Deskjet 3720 │ 59.99  │ Hewlett-Packard │
└───────────────────────────┴────────┴─────────────────┘
**/

--Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.

SELECT p.nombre, max(p.precio) as precio, f.nombre FROM producto as p, fabricante as f where f.codigo=p.codigo_fabricante;
/**
┌─────────────────────────┬────────┬─────────┐
│         nombre          │ precio │ nombre  │
├─────────────────────────┼────────┼─────────┤
│ GeForce GTX 1080 Xtreme │ 755.0  │ Crucial │
└─────────────────────────┴────────┴─────────┘
**/

--Devuelve una lista de todos los productos del fabricante Lenovo.

SELECT * FROM producto as p, fabricante as f where f.codigo=p.codigo_fabricante and f.nombre='Lenovo';
/**
┌────────┬─────────────────────┬────────┬───────────────────┬────────┬────────┐
│ codigo │       nombre        │ precio │ codigo_fabricante │ codigo │ nombre │
├────────┼─────────────────────┼────────┼───────────────────┼────────┼────────┤
│ 8      │ Portátil Yoga 520   │ 559.0  │ 2                 │ 2      │ Lenovo │
│ 9      │ Portátil Ideapd 320 │ 444.0  │ 2                 │ 2      │ Lenovo │
└────────┴─────────────────────┴────────┴───────────────────┴────────┴────────┘
**/

--Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.

SELECT * FROM producto as p, fabricante as f where f.codigo=p.codigo_fabricante and f.nombre='Crucial' and p.precio > 200;
/**
┌────────┬─────────────────────────┬────────┬───────────────────┬────────┬─────────┐
│ codigo │         nombre          │ precio │ codigo_fabricante │ codigo │ nombre  │
├────────┼─────────────────────────┼────────┼───────────────────┼────────┼─────────┤
│ 5      │ GeForce GTX 1080 Xtreme │ 755.0  │ 6                 │ 6      │ Crucial │
└────────┴─────────────────────────┴────────┴───────────────────┴────────┴─────────┘
**/

--Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Sin utilizar el operador IN.

SELECT * FROM producto as p, fabricante as f where f.codigo=p.codigo_fabricante and f.nombre='Asus' or f.nombre='Hewlett-Packardy' or f.nombre='Seagate';
/**
┌────────┬─────────────────────────────────┬────────┬───────────────────┬────────┬─────────┐
│ codigo │             nombre              │ precio │ codigo_fabricante │ codigo │ nombre  │
├────────┼─────────────────────────────────┼────────┼───────────────────┼────────┼─────────┤
│ 1      │ Disco duro SATA3 1TB            │ 86.99  │ 5                 │ 5      │ Seagate │
│ 2      │ Memoria RAM DDR4 8GB            │ 120.0  │ 6                 │ 5      │ Seagate │
│ 3      │ Disco SSD 1 TB                  │ 150.99 │ 4                 │ 5      │ Seagate │
│ 4      │ GeForce GTX 1050Ti              │ 185.0  │ 7                 │ 5      │ Seagate │
│ 5      │ GeForce GTX 1080 Xtreme         │ 755.0  │ 6                 │ 5      │ Seagate │
│ 6      │ Monitor 24 LED Full HD          │ 202.0  │ 1                 │ 1      │ Asus    │
│ 6      │ Monitor 24 LED Full HD          │ 202.0  │ 1                 │ 5      │ Seagate │
│ 7      │ Monitor 27 LED Full HD          │ 245.99 │ 1                 │ 1      │ Asus    │
│ 7      │ Monitor 27 LED Full HD          │ 245.99 │ 1                 │ 5      │ Seagate │
│ 8      │ Portátil Yoga 520               │ 559.0  │ 2                 │ 5      │ Seagate │
│ 9      │ Portátil Ideapd 320             │ 444.0  │ 2                 │ 5      │ Seagate │
│ 10     │ Impresora HP Deskjet 3720       │ 59.99  │ 3                 │ 5      │ Seagate │
│ 11     │ Impresora HP Laserjet Pro M26nw │ 180.0  │ 3                 │ 5      │ Seagate │
└────────┴─────────────────────────────────┴────────┴───────────────────┴────────┴─────────┘
**/

--Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.

SELECT * FROM producto as p, fabricante as f where f.codigo=p.codigo_fabricante and f.nombre in ('Asus', 'Hewlett-Packardy', 'Seagate');
/**
┌────────┬────────────────────────┬────────┬───────────────────┬────────┬─────────┐
│ codigo │         nombre         │ precio │ codigo_fabricante │ codigo │ nombre  │
├────────┼────────────────────────┼────────┼───────────────────┼────────┼─────────┤
│ 1      │ Disco duro SATA3 1TB   │ 86.99  │ 5                 │ 5      │ Seagate │
│ 6      │ Monitor 24 LED Full HD │ 202.0  │ 1                 │ 1      │ Asus    │
│ 7      │ Monitor 27 LED Full HD │ 245.99 │ 1                 │ 1      │ Asus    │
└────────┴────────────────────────┴────────┴───────────────────┴────────┴─────────┘
**/

--Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.

SELECT p.nombre, p.precio FROM producto as p, fabricante as f where f.codigo=p.codigo_fabricante and f.nombre REGEXP 'e$';
/**
┌──────────────────────┬────────┐
│        nombre        │ precio │
├──────────────────────┼────────┤
│ Disco duro SATA3 1TB │ 86.99  │
│ GeForce GTX 1050Ti   │ 185.0  │
└──────────────────────┴────────┘
**/

--Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.

SELECT p.nombre, p.precio, f.nombre FROM producto as p, fabricante as f where f.codigo=p.codigo_fabricante and f.nombre REGEXP '.*w.*';
/**
┌─────────────────────────────────┬────────┬─────────────────┐
│             nombre              │ precio │     nombre      │
├─────────────────────────────────┼────────┼─────────────────┤
│ Impresora HP Deskjet 3720       │ 59.99  │ Hewlett-Packard │
│ Impresora HP Laserjet Pro M26nw │ 180.0  │ Hewlett-Packard │
└─────────────────────────────────┴────────┴─────────────────┘
**/

--Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)

SELECT p.nombre, p.precio, f.nombre as fabricante FROM producto as p, fabricante as f where f.codigo=p.codigo_fabricante and p.precio >= 180 ORDER BY p.precio desc, p.nombre;
/**
┌─────────────────────────────────┬────────┬─────────────────┐
│             nombre              │ precio │   fabricante    │
├─────────────────────────────────┼────────┼─────────────────┤
│ GeForce GTX 1080 Xtreme         │ 755.0  │ Crucial         │
│ Portátil Yoga 520               │ 559.0  │ Lenovo          │
│ Portátil Ideapd 320             │ 444.0  │ Lenovo          │
│ Monitor 27 LED Full HD          │ 245.99 │ Asus            │
│ Monitor 24 LED Full HD          │ 202.0  │ Asus            │
│ GeForce GTX 1050Ti              │ 185.0  │ Gigabyte        │
│ Impresora HP Laserjet Pro M26nw │ 180.0  │ Hewlett-Packard │
└─────────────────────────────────┴────────┴─────────────────┘
**/

--Devuelve un listado con el identificador y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos.

SELECT f.codigo, f.nombre FROM producto as p, fabricante as f where f.codigo=p.codigo_fabricante;
/**
┌────────┬─────────────────┐
│ codigo │     nombre      │
├────────┼─────────────────┤
│ 5      │ Seagate         │
│ 6      │ Crucial         │
│ 4      │ Samsung         │
│ 7      │ Gigabyte        │
│ 6      │ Crucial         │
│ 1      │ Asus            │
│ 1      │ Asus            │
│ 2      │ Lenovo          │
│ 2      │ Lenovo          │
│ 3      │ Hewlett-Packard │
│ 3      │ Hewlett-Packard │
└────────┴─────────────────┘
**/

--Consultas con multitabla con LEFT JOIN y RIGHT JOIN

--Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.

select * from fabricante as f left join producto as p on f.codigo = p.codigo_fabricante;
/**
┌────────┬─────────────────┬────────┬─────────────────────────────────┬────────┬───────────────────┐
│ codigo │     nombre      │ codigo │             nombre              │ precio │ codigo_fabricante │
├────────┼─────────────────┼────────┼─────────────────────────────────┼────────┼───────────────────┤
│ 1      │ Asus            │ 6      │ Monitor 24 LED Full HD          │ 202.0  │ 1                 │
│ 1      │ Asus            │ 7      │ Monitor 27 LED Full HD          │ 245.99 │ 1                 │
│ 2      │ Lenovo          │ 9      │ Portátil Ideapd 320             │ 444.0  │ 2                 │
│ 2      │ Lenovo          │ 8      │ Portátil Yoga 520               │ 559.0  │ 2                 │
│ 3      │ Hewlett-Packard │ 10     │ Impresora HP Deskjet 3720       │ 59.99  │ 3                 │
│ 3      │ Hewlett-Packard │ 11     │ Impresora HP Laserjet Pro M26nw │ 180.0  │ 3                 │
│ 4      │ Samsung         │ 3      │ Disco SSD 1 TB                  │ 150.99 │ 4                 │
│ 5      │ Seagate         │ 1      │ Disco duro SATA3 1TB            │ 86.99  │ 5                 │
│ 6      │ Crucial         │ 5      │ GeForce GTX 1080 Xtreme         │ 755.0  │ 6                 │
│ 6      │ Crucial         │ 2      │ Memoria RAM DDR4 8GB            │ 120.0  │ 6                 │
│ 7      │ Gigabyte        │ 4      │ GeForce GTX 1050Ti              │ 185.0  │ 7                 │
│ 8      │ Huawei          │        │                                 │        │                   │
│ 9      │ Xiaomi          │        │                                 │        │                   │
└────────┴─────────────────┴────────┴─────────────────────────────────┴────────┴───────────────────┘
**/

--Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.

SELECT * FROM fabricante as f LEFT JOIN producto as p on f.codigo=p.codigo_fabricante WHERE p.codigo_fabricante is NULL;
/**
┌────────┬────────┬────────┬────────┬────────┬───────────────────┐
│ codigo │ nombre │ codigo │ nombre │ precio │ codigo_fabricante │
├────────┼────────┼────────┼────────┼────────┼───────────────────┤
│ 8      │ Huawei │        │        │        │                   │
│ 9      │ Xiaomi │        │        │        │                   │
└────────┴────────┴────────┴────────┴────────┴───────────────────┘
**/

--CONSULTAS CON CALCULOS:

--Calcula el número total de productos que hay en la tabla productos.

SELECT COUNT(codigo) as total_productos FROM producto ;
/**
┌─────────────────┐
│ total_productos │
├─────────────────┤
│ 11              │
└─────────────────┘
**/

--Calcula el número total de fabricantes que hay en la tabla fabricante.

SELECT COUNT(codigo) as total_fabricantes FROM fabricante ;
/**
┌───────────────────┐
│ total_fabricantes │
├───────────────────┤
│ 9                 │
└───────────────────┘
**/

--Calcula el número de valores distintos de identificador de fabricante aparecen en la tabla productos.

SELECT count(DISTINCT codigo_fabricante) as fabricantes_cod FROM producto ;
/**
┌─────────────────┐
│ fabricantes_cod │
├─────────────────┤
│ 7               │
└─────────────────┘
**/

--Calcula la media del precio de todos los productos.

SELECT AVG(precio) as media_precio FROM producto;
/**
┌──────────────────┐
│   media_precio   │
├──────────────────┤
│ 271.723636363636 │
└──────────────────┘
**/

--Calcula el precio más barato de todos los productos.

select min(precio) from producto;
/**
┌─────────────┐
│ min(precio) │
├─────────────┤
│ 59.99       │
└─────────────┘
**/

--Calcula el precio más caro de todos los productos.

select max(precio) from producto;
/**
┌─────────────┐
│ max(precio) │
├─────────────┤
│ 755.0       │
└─────────────┘
**/

--Lista el nombre y el precio del producto más barato.

select nombre, min(precio) as precio from producto;
/**
┌───────────────────────────┬────────┐
│          nombre           │ precio │
├───────────────────────────┼────────┤
│ Impresora HP Deskjet 3720 │ 59.99  │
└───────────────────────────┴────────┘
**/

--Lista el nombre y el precio del producto más caro.

select nombre, max(precio) as precio from producto;
/**
┌─────────────────────────┬────────┐
│         nombre          │ precio │
├─────────────────────────┼────────┤
│ GeForce GTX 1080 Xtreme │ 755.0  │
└─────────────────────────┴────────┘
**/

--Calcula la suma de los precios de todos los productos.

SELECT SUM(precio) as total_precio FROM  producto ;
/**
┌──────────────┐
│ total_precio │
├──────────────┤
│ 2988.96      │
└──────────────┘
**/

--Calcula el número de productos que tiene el fabricante Asus.

SELECT count(p.codigo) FROM producto as p, fabricante as f where f.codigo=p.codigo_fabricante and f.nombre='Asus';
/**
┌─────────────────┐
│ count(p.codigo) │
├─────────────────┤
│ 2               │
└─────────────────┘
**/

--Calcula la media del precio de todos los productos del fabricante Asus.

SELECT avg(p.precio) as total_precio FROM producto as p, fabricante as f where f.codigo=p.codigo_fabricante and f.nombre='Asus';
/**
┌──────────────┐
│ total_precio │
├──────────────┤
│ 223.995      │
└──────────────┘
**/

--Calcula el precio más barato de todos los productos del fabricante Asus.

SELECT min(p.precio) as total_precio FROM producto as p, fabricante as f where f.codigo=p.codigo_fabricante and f.nombre='Asus';
/**
┌──────────────┐
│ total_precio │
├──────────────┤
│ 202.0        │
└──────────────┘
**/

--Calcula el precio más caro de todos los productos del fabricante Asus.

select max(p.precio) from producto as p, fabricante as f where p.codigo_fabricante = f.codigo and f.nombre in ("Asus");
/**
┌───────────────┐
│ max(p.precio) │
├───────────────┤
│ 245.99        │
└───────────────┘
**/

--Calcula la suma de todos los productos del fabricante Asus.

SELECT sum(p.precio) as total_precio FROM producto as p, fabricante as f where f.codigo=p.codigo_fabricante and f.nombre='Asus';
/**
┌──────────────┐
│ total_precio │
├──────────────┤
│ 447.99       │
└──────────────┘
**/

--Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene el fabricante Crucial.

SELECT max(p.precio) as max, min(p.precio) as mi, avg(p.precio), count(p.codigo) FROM producto as p, fabricante as f where f.codigo=p.codigo_fabricante and f.nombre='Crucial';
/**
┌───────┬───────┬───────────────┬─────────────────┐
│  max  │  mi   │ avg(p.precio) │ count(p.codigo) │
├───────┼───────┼───────────────┼─────────────────┤
│ 755.0 │ 120.0 │ 437.5         │ 2               │
└───────┴───────┴───────────────┴─────────────────┘
**/

--Muestra el número total de productos que tiene cada uno de los fabricantes. El listado también debe incluir los fabricantes que no tienen ningún producto. El resultado mostrará dos columnas, una con el nombre del fabricante y otra con el número de productos que tiene. Ordene el resultado descendentemente por el número de productos.

SELECT count(p.codigo), f.nombre FROM fabricante as f left join producto as p on f.codigo = p.codigo_fabricante GROUP BY f.codigo;
/**
┌─────────────────┬─────────────────┐
│ count(p.codigo) │     nombre      │
├─────────────────┼─────────────────┤
│ 2               │ Asus            │
│ 2               │ Lenovo          │
│ 2               │ Hewlett-Packard │
│ 1               │ Samsung         │
│ 1               │ Seagate         │
│ 2               │ Crucial         │
│ 1               │ Gigabyte        │
│ 0               │ Huawei          │
│ 0               │ Xiaomi          │
└─────────────────┴─────────────────┘
**/

--

SELECT count(p.codigo), f.nombre FROM fabricante as f left join producto as p on f.codigo = p.codigo_fabricante GROUP BY f.codigo;
/**
┌─────────────────┬─────────────────┐
│ count(p.codigo) │     nombre      │
├─────────────────┼─────────────────┤
│ 2               │ Asus            │
│ 2               │ Lenovo          │
│ 2               │ Hewlett-Packard │
│ 1               │ Samsung         │
│ 1               │ Seagate         │
│ 2               │ Crucial         │
│ 1               │ Gigabyte        │
│ 0               │ Huawei          │
│ 0               │ Xiaomi          │
└─────────────────┴─────────────────┘
**/

--Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes. El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.

SELECT f.nombre, max(p.precio) as max, min(p.precio) as min, avg(p.precio) as media from fabricante as f, producto as p where p.codigo_fabricante = f.codigo GROUP BY f.nombre;
/**
┌─────────────────┬────────┬────────┬─────────┐
│     nombre      │  max   │  min   │  media  │
├─────────────────┼────────┼────────┼─────────┤
│ Asus            │ 245.99 │ 202.0  │ 223.995 │
│ Crucial         │ 755.0  │ 120.0  │ 437.5   │
│ Gigabyte        │ 185.0  │ 185.0  │ 185.0   │
│ Hewlett-Packard │ 180.0  │ 59.99  │ 119.995 │
│ Lenovo          │ 559.0  │ 444.0  │ 501.5   │
│ Samsung         │ 150.99 │ 150.99 │ 150.99  │
│ Seagate         │ 86.99  │ 86.99  │ 86.99   │
└─────────────────┴────────┴────────┴─────────┘
**/

--Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. No es necesario mostrar el nombre del fabricante, con el identificador del fabricante es suficiente.

SELECT max(p.precio) as max, min(p.precio) as min, avg(p.precio) as media, count(p.codigo) as total, f.codigo from fabricante as f, producto as p where p.codigo_fabricante = f.codigo and p.precio > 200 GROUP BY f.codigo;
/**
┌────────┬───────┬─────────┬───────┬────────┐
│  max   │  min  │  media  │ total │ codigo │
├────────┼───────┼─────────┼───────┼────────┤
│ 245.99 │ 202.0 │ 223.995 │ 2     │ 1      │
│ 559.0  │ 444.0 │ 501.5   │ 2     │ 2      │
│ 755.0  │ 755.0 │ 755.0   │ 1     │ 6      │
└────────┴───────┴─────────┴───────┴────────┘
**/

--Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. Es necesario mostrar el nombre del fabricante.

SELECT max(p.precio) as max, min(p.precio) as min, avg(p.precio) as media, count(p.codigo) as total, f.nombre from fabricante as f, producto as p where p.codigo_fabricante = f.codigo and p.precio > 200 GROUP BY f.codigo;
/**
┌────────┬───────┬─────────┬───────┬─────────┐
│  max   │  min  │  media  │ total │ nombre  │
├────────┼───────┼─────────┼───────┼─────────┤
│ 245.99 │ 202.0 │ 223.995 │ 2     │ Asus    │
│ 559.0  │ 444.0 │ 501.5   │ 2     │ Lenovo  │
│ 755.0  │ 755.0 │ 755.0   │ 1     │ Crucial │
└────────┴───────┴─────────┴───────┴─────────┘
**/

--Calcula el número de productos que tienen un precio mayor o igual a 180€.

SELECT count(codigo) as num_prod FROM producto WHERE precio >= 180
/**
┌──────────┐
│ num_prod │
├──────────┤
│ 7        │
└──────────┘
**/

--Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 180€.

SELECT count(codigo) as num_prod, codigo_fabricante FROM producto WHERE precio >= 180 GROUP BY codigo_fabricante ;
/**
┌──────────┬───────────────────┐
│ num_prod │ codigo_fabricante │
├──────────┼───────────────────┤
│ 2        │ 1                 │
│ 2        │ 2                 │
│ 1        │ 3                 │
│ 1        │ 6                 │
│ 1        │ 7                 │
└──────────┴───────────────────┘
**/

--Lista el precio medio los productos de cada fabricante, mostrando solamente el identificador del fabricante.

SELECT codigo_fabricante , avg(precio) as media FROM producto GROUP BY codigo_fabricante ;
/**
┌───────────────────┬─────────┐
│ codigo_fabricante │  media  │
├───────────────────┼─────────┤
│ 1                 │ 223.995 │
│ 2                 │ 501.5   │
│ 3                 │ 119.995 │
│ 4                 │ 150.99  │
│ 5                 │ 86.99   │
│ 6                 │ 437.5   │
│ 7                 │ 185.0   │
└───────────────────┴─────────┘
**/

--Lista el precio medio los productos de cada fabricante, mostrando solamente el nombre del fabricante.

SELECT f.nombre , avg(p.precio) as media FROM producto as p, fabricante as f where f.codigo=p.codigo_fabricante GROUP BY codigo_fabricante ;
/**
┌─────────────────┬─────────┐
│     nombre      │  media  │
├─────────────────┼─────────┤
│ Asus            │ 223.995 │
│ Lenovo          │ 501.5   │
│ Hewlett-Packard │ 119.995 │
│ Samsung         │ 150.99  │
│ Seagate         │ 86.99   │
│ Crucial         │ 437.5   │
│ Gigabyte        │ 185.0   │
└─────────────────┴─────────┘
**/

--Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o igual a 150€.

SELECT f.*, avg(p.precio) as media FROM producto as p, fabricante as f where f.codigo=p.codigo_fabricante GROUP BY f.nombre HAVING  avg(p.precio) >= 150
/**
┌────────┬──────────┬─────────┐
│ codigo │  nombre  │  media  │
├────────┼──────────┼─────────┤
│ 1      │ Asus     │ 223.995 │
│ 6      │ Crucial  │ 437.5   │
│ 7      │ Gigabyte │ 185.0   │
│ 2      │ Lenovo   │ 501.5   │
│ 4      │ Samsung  │ 150.99  │
└────────┴──────────┴─────────┘
**/

--Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos.

SELECT f.nombre, count(p.codigo) as productos FROM producto as p, fabricante as f where f.codigo=p.codigo_fabricante GROUP BY f.nombre HAVING count(p.codigo) >= 2;
/**
┌─────────────────┬───────────┐
│     nombre      │ productos │
├─────────────────┼───────────┤
│ Asus            │ 2         │
│ Crucial         │ 2         │
│ Hewlett-Packard │ 2         │
│ Lenovo          │ 2         │
└─────────────────┴───────────┘
**/

--Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. No es necesario mostrar el nombre de los fabricantes que no tienen productos que cumplan la condición.

select f.nombre, count(p.codigo) as total from producto as p, fabricante as f where p.codigo_fabricante=f.codigo and p.precio >= 220 GROUP by f.nombre;
/**
┌─────────┬───────┐
│ nombre  │ total │
├─────────┼───────┤
│ Asus    │ 1     │
│ Crucial │ 1     │
│ Lenovo  │ 2     │
└─────────┴───────┘
**/

--Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. El listado debe mostrar el nombre de todos los fabricantes, es decir, si hay algún fabricante que no tiene productos con un precio superior o igual a 220€ deberá aparecer en el listado con un valor igual a 0 en el número de productos.

SELECT f.nombre, COUNT(p.nombre) AS num_productos                                         ...> FROM fabricante AS f
   ...> LEFT JOIN producto AS p ON p.codigo_fabricante = f.codigo
   ...> GROUP BY f.nombre;
/**
┌─────────────────┬───────────────┐
│     nombre      │ num_productos │
├─────────────────┼───────────────┤
│ Asus            │ 2             │
│ Crucial         │ 2             │
│ Gigabyte        │ 1             │
│ Hewlett-Packard │ 2             │
│ Huawei          │ 0             │
│ Lenovo          │ 2             │
│ Samsung         │ 1             │
│ Seagate         │ 1             │
│ Xiaomi          │ 0             │
└─────────────────┴───────────────┘
**/

--Devuelve un listado con los nombres de los fabricantes donde la suma del precio de todos sus productos es superior a 1000 €.

SELECT f.nombre, SUM(p.precio) as total FROM producto as p, fabricante as f where f.codigo=p.codigo_fabricante GROUP BY f.nombre HAVING sum(p.precio) >1000;
/**
┌────────┬────────┐
│ nombre │ total  │
├────────┼────────┤
│ Lenovo │ 1003.0 │
└────────┴────────┘
**/

--Devuelve un listado con el nombre del producto más caro que tiene cada fabricante. El resultado debe tener tres columnas: nombre del producto, precio y nombre del fabricante. El resultado tiene que estar ordenado alfabéticamente de menor a mayor por el nombre del fabricante

SELECT p.nombre, max(p.precio) as max, f.nombre FROM producto as p, fabricante as f where f.codigo=p.codigo_fabricante GROUP BY f.nombre ORDER BY f.nombre desc;
/**
┌─────────────────────────────────┬────────┬─────────────────┐
│             nombre              │  max   │     nombre      │
├─────────────────────────────────┼────────┼─────────────────┤
│ Disco duro SATA3 1TB            │ 86.99  │ Seagate         │
│ Disco SSD 1 TB                  │ 150.99 │ Samsung         │
│ Portátil Yoga 520               │ 559.0  │ Lenovo          │
│ Impresora HP Laserjet Pro M26nw │ 180.0  │ Hewlett-Packard │
│ GeForce GTX 1050Ti              │ 185.0  │ Gigabyte        │
│ GeForce GTX 1080 Xtreme         │ 755.0  │ Crucial         │
│ Monitor 27 LED Full HD          │ 245.99 │ Asus            │
└─────────────────────────────────┴────────┴─────────────────┘
**/

--SUB CONSULTAS SIN INNER JOIN

--Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).

SELECT p.* FROM producto as p, fabricante as f where f.codigo=p.codigo_fabricante and f.nombre = 'Lenovo';
/**
┌────────┬─────────────────────┬────────┬───────────────────┐
│ codigo │       nombre        │ precio │ codigo_fabricante │
├────────┼─────────────────────┼────────┼───────────────────┤
│ 8      │ Portátil Yoga 520   │ 559.0  │ 2                 │
│ 9      │ Portátil Ideapd 320 │ 444.0  │ 2                 │
└────────┴─────────────────────┴────────┴───────────────────┘
**/

--Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).

SELECT p.* FROM producto as p WHERE precio = (SELECT max(p.precio) from producto as p, fabricante as f where f.codigo=p.codigo_fabricante and f.nombre='Lenovo');

/**
┌────────┬───────────────────┬────────┬───────────────────┐
│ codigo │      nombre       │ precio │ codigo_fabricante │
├────────┼───────────────────┼────────┼───────────────────┤
│ 8      │ Portátil Yoga 520 │ 559.0  │ 2                 │
└────────┴───────────────────┴────────┴───────────────────┘
**/

--Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.

SELECT p.* FROM producto as p WHERE precio >= (SELECT max(p.precio) from producto as p, fabricante as f where f.codigo=p.codigo_fabricante and f.nombre='Lenovo');

/**
┌────────┬─────────────────────────┬────────┬───────────────────┐
│ codigo │         nombre          │ precio │ codigo_fabricante │
├────────┼─────────────────────────┼────────┼───────────────────┤
│ 5      │ GeForce GTX 1080 Xtreme │ 755.0  │ 6                 │
│ 8      │ Portátil Yoga 520       │ 559.0  │ 2                 │
└────────┴─────────────────────────┴────────┴───────────────────┘
**/

--Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.

SELECT p.* from producto as p, fabricante as f where f.codigo=p.codigo_fabricante and f.nombre='Lenovo' and precio > (SELECT avg(p.precio) from producto as p, fabricante as f where f.codigo=p.codigo_fabricante and f.nombre='Lenovo');
/**
┌────────┬───────────────────┬────────┬───────────────────┐
│ codigo │      nombre       │ precio │ codigo_fabricante │
├────────┼───────────────────┼────────┼───────────────────┤
│ 8      │ Portátil Yoga 520 │ 559.0  │ 2                 │
└────────┴───────────────────┴────────┴───────────────────┘
**/

--Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando IN o NOT IN).

SELECT nombre FROM fabricante WHERE codigo in (SELECT DISTINCT codigo_fabricante FROM producto );

/**
┌─────────────────┐
│     nombre      │
├─────────────────┤
│ Asus            │
│ Lenovo          │
│ Hewlett-Packard │
│ Samsung         │
│ Seagate         │
│ Crucial         │
│ Gigabyte        │
└─────────────────┘
**/

--Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando IN o NOT IN).

SELECT nombre FROM fabricante WHERE codigo not in (SELECT DISTINCT codigo_fabricante FROM producto );

/**
┌────────┐
│ nombre │
├────────┤
│ Huawei │
│ Xiaomi │
└────────┘
**/

--Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).

SELECT nombre FROM fabricante as f WHERE EXISTS (SELECT 1 FROM producto WHERE f.codigo=codigo_fabricante );
/**
┌─────────────────┐
│     nombre      │
├─────────────────┤
│ Asus            │
│ Lenovo          │
│ Hewlett-Packard │
│ Samsung         │
│ Seagate         │
│ Crucial         │
│ Gigabyte        │
└─────────────────┘
**/

--Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).

SELECT nombre FROM fabricante as f WHERE NOT EXISTS (SELECT 1 FROM producto WHERE f.codigo=codigo_fabricante );

/**
┌────────┐
│ nombre │
├────────┤
│ Huawei │
│ Xiaomi │
└────────┘
**/

--Lista el nombre de cada fabricante con el nombre y el precio de su producto más caro.

SELECT f.nombre, p.nombre, max(p.precio) from producto as p, fabricante as f where p.codigo_fabricante=f.codigo group by f.nombre;

/**
┌─────────────────┬─────────────────────────────────┬───────────────┐
│     nombre      │             nombre              │ max(p.precio) │
├─────────────────┼─────────────────────────────────┼───────────────┤
│ Asus            │ Monitor 27 LED Full HD          │ 245.99        │
│ Crucial         │ GeForce GTX 1080 Xtreme         │ 755.0         │
│ Gigabyte        │ GeForce GTX 1050Ti              │ 185.0         │
│ Hewlett-Packard │ Impresora HP Laserjet Pro M26nw │ 180.0         │
│ Lenovo          │ Portátil Yoga 520               │ 559.0         │
│ Samsung         │ Disco SSD 1 TB                  │ 150.99        │
│ Seagate         │ Disco duro SATA3 1TB            │ 86.99         │
└─────────────────┴─────────────────────────────────┴───────────────┘
**/

--Devuelve un listado de todos los productos que tienen un precio mayor o igual a la media de todos los productos de su mismo fabricante.

SELECT p.nombre, p.precio, f.nombre FROM producto as p JOIN fabricante as f ON p.codigo_fabricante = f.codigo WHERE p.precio >= (SELECT avg(pr.precio) FROM producto as pr WHERE pr.codigo_fabricante=p.codigo_fabricante) ORDER BY f.nombre;
/**
┌─────────────────────────────────┬────────┬─────────────────┐
│             nombre              │ precio │     nombre      │
├─────────────────────────────────┼────────┼─────────────────┤
│ Monitor 27 LED Full HD          │ 245.99 │ Asus            │
│ GeForce GTX 1080 Xtreme         │ 755.0  │ Crucial         │
│ GeForce GTX 1050Ti              │ 185.0  │ Gigabyte        │
│ Impresora HP Laserjet Pro M26nw │ 180.0  │ Hewlett-Packard │
│ Portátil Yoga 520               │ 559.0  │ Lenovo          │
│ Disco SSD 1 TB                  │ 150.99 │ Samsung         │
│ Disco duro SATA3 1TB            │ 86.99  │ Seagate         │
└─────────────────────────────────┴────────┴─────────────────┘
**/

--Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo número de productos que el fabricante Lenovo.

SELECT f.nombre, count(p.nombre) from fabricante as f, producto as p where p.codigo_fabricante=f.codigo GROUP BY f.nombre HAVING count(p.nombre) = (SELECT count(p.nombre) from fabricante as f, producto as p where p.codigo_fabricante=f.codigo and f.nombre='Lenovo');
/**
┌─────────────────┬─────────────────┐
│     nombre      │ count(p.nombre) │
├─────────────────┼─────────────────┤
│ Asus            │ 2               │
│ Crucial         │ 2               │
│ Hewlett-Packard │ 2               │
│ Lenovo          │ 2               │
└─────────────────┴─────────────────┘
**/


