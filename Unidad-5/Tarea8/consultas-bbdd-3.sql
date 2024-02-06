-- Consulta para obtener el nombre y la edad de los clientes que han comprado coches de la marca Toyota.
SELECT cli.nombre, cli.edad FROM clientes as cli, coches as c, ventas as v where v.id_cliente=cli.id_cliente and v.id_coche=c.id_coche and marca REGEXP 'Toyota';

/**
┌────────────┬──────┐
│   nombre   │ edad │
├────────────┼──────┤
│ Juan Pérez │ 30   │
└────────────┴──────┘
**/
-- Consulta para calcular el precio promedio de los coches vendidos.
SELECT AVG(c.precio) as precio_promedio FROM coches as c, ventas as v WHERE c.id_coche=v.id_coche;

/**
┌──────────────────┐
│ precio_promedio  │
├──────────────────┤
│ 28777.7777777778 │
└──────────────────┘
**/
-- Consulta para obtener el modelo y la marca de los coches vendidos a clientes menores de 30 años.
SELECT v.id_venta, c.modelo, c.precio, cli.nombre, cli.edad FROM clientes as cli, coches as c, ventas as v where v.id_cliente=cli.id_cliente and v.id_coche=c.id_coche and cli.edad < 30;

/**
┌──────────┬────────────────┬─────────┬─────────────────┬──────┐
│ id_venta │     modelo     │ precio  │     nombre      │ edad │
├──────────┼────────────────┼─────────┼─────────────────┼──────┤
│ 2        │ Hatchback 2021 │ 22000.0 │ María Gómez     │ 25   │
│ 4        │ Coupé 2022     │ 28000.0 │ Ana Martínez    │ 28   │
│ 7        │ Híbrido 2022   │ 27000.0 │ Miguel González │ 27   │
│ 9        │ Eléctrico 2021 │ 40000.0 │ Elena Torres    │ 29   │
└──────────┴────────────────┴─────────┴─────────────────┴──────┘
**/

-- Consulta para contar el número de coches vendidos de cada marca.
SELECT COUNT(v.id_venta), c.marca FROM coches as c, ventas as v WHERE v.id_coche=c.id_coche GROUP BY c.marca;

/**
┌───────────────────┬────────────┐
│ COUNT(v.id_venta) │   marca    │
├───────────────────┼────────────┤
│ 1                 │ Chevrolet  │
│ 1                 │ Ford       │
│ 1                 │ Honda      │
│ 1                 │ Hyundai    │
│ 1                 │ Mazda      │
│ 1                 │ Nissan     │
│ 1                 │ Tesla      │
│ 1                 │ Toyota     │
│ 1                 │ Volkswagen │
└───────────────────┴────────────┘
**/

-- Consulta para obtener el nombre y la dirección de los clientes que han llevado a reparar sus coches en 2024.
SELECT c.nombre, c.direccion FROM clientes as c, reparacion as r WHERE c.id_cliente=r.id_cliente and r.fecha_reparación REGEXP '^2024-\d+-\d+$';

/**
┌─────────────────┬────────────────┐
│     nombre      │   direccion    │
├─────────────────┼────────────────┤
│ Francisco Ruiz  │ Calle I #222   │
│ Elena Torres    │ Avenida J #333 │
│ Juan Pérez      │ Calle A #123   │
│ María Gómez     │ Avenida B #456 │
│ Carlos López    │ Calle C #789   │
│ Ana Martínez    │ Avenida D #101 │
│ Pedro Rodríguez │ Calle E #234   │
│ Laura Sánchez   │ Avenida F #567 │
│ Miguel González │ Calle G #890   │
│ Isabel Díaz     │ Avenida H #111 │
│ Francisco Ruiz  │ Calle I #222   │
│ Elena Torres    │ Avenida J #333 │
└─────────────────┴────────────────┘
**/

-- Consulta para calcular el total gastado en reparaciones por cada cliente.
--             ***LA TABLA REPARACIÖN NO TIENE PRECIO***
SELECT c.nombre, COUNT(r.id_cliente) FROM clientes as c, reparacion as r WHERE r.id_cliente=c.id_cliente GROUP BY r.id_cliente;

/**
┌─────────────────┬─────────────────────┐
│     nombre      │ COUNT(r.id_cliente) │
├─────────────────┼─────────────────────┤
│ Juan Pérez      │ 2                   │
│ María Gómez     │ 2                   │
│ Carlos López    │ 2                   │
│ Ana Martínez    │ 2                   │
│ Pedro Rodríguez │ 2                   │
│ Laura Sánchez   │ 2                   │
│ Miguel González │ 2                   │
│ Isabel Díaz     │ 2                   │
│ Francisco Ruiz  │ 2                   │
│ Elena Torres    │ 2                   │
└─────────────────┴─────────────────────┘
**/

-- Consulta para obtener el nombre y la edad de los clientes que han comprado coches de más de 30000 euros.

select ci.nombre, ci.edad FROM clientes as ci, coches as co, ventas as v WHERE v.id_cliente=ci.id_cliente and v.id_coche=co.id_coche and co.precio > 30.000;

/**
┌─────────────────┬──────┐
│     nombre      │ edad │
├─────────────────┼──────┤
│ Juan Pérez      │ 30   │
│ María Gómez     │ 25   │
│ Carlos López    │ 35   │
│ Ana Martínez    │ 28   │
│ Pedro Rodríguez │ 40   │
│ Laura Sánchez   │ 32   │
│ Miguel González │ 27   │
│ Isabel Díaz     │ 38   │
│ Elena Torres    │ 29   │
└─────────────────┴──────┘
**/

-- Consulta para calcular el precio medio de los coches vendidos en 2023.

ELECT AVG(c.precio) as precio_promedio_2023 FROM coches as c, ventas as v WHERE v.id_coche=c.id_coche and v.fecha_venta REGEXP '^2023-\d+-\d+$';
/**
┌──────────────────────┐
│ precio_promedio_2023 │
├──────────────────────┤
│ 28777.7777777778     │
└──────────────────────┘
**/

-- Consulta para obtener el nombre y la dirección de los clientes que han comprado coches de la marca Ford.
SELECT ci.nombre, ci.direccion FROM clientes as ci, coches as co, ventas as v WHERE v.id_cliente=ci.id_cliente and v.id_coche=co.id_coche and co.marca REGEXP 'Ford';

/**
┌──────────────┬──────────────┐
│    nombre    │  direccion   │
├──────────────┼──────────────┤
│ Carlos López │ Calle C #789 │
└──────────────┴──────────────┘
**/

-- Consulta para contar el número de coches vendidos por año.

SELECT COUNT(id_venta) as numero_ventas, fecha_venta FROM ventas GROUP by fecha_venta;

/**
┌───────────────┬─────────────┐
│ numero_ventas │ fecha_venta │
├───────────────┼─────────────┤
│ 2             │ 2023-01-15  │
│ 2             │ 2023-02-20  │
│ 2             │ 2023-03-25  │
│ 2             │ 2023-04-10  │
│ 2             │ 2023-05-05  │
│ 2             │ 2023-06-15  │
│ 2             │ 2023-07-20  │
│ 2             │ 2023-08-25  │
│ 2             │ 2023-10-05  │
└───────────────┴─────────────┘
**/

-- Consulta para obtener el nombre y la edad de los clientes que han comprado coches de más de 30000 euros y llevado a reparar sus coches.

SELECT ci.nombre, ci.edad FROM clientes as ci, coches as c, ventas as v, reparacion as r WHERE v.id_coche=c.id_coche and v.id_cliente=ci.id_cliente and r.id_cliente=ci.id_cliente and r.id_coche= ci.id_cliente and c.precio > 30.000;

/**
┌──────────────┬──────┐
│    nombre    │ edad │
├──────────────┼──────┤
│ Juan Pérez   │ 30   │
│ María Gómez  │ 25   │
│ Isabel Díaz  │ 38   │
│ Elena Torres │ 29   │
│ Juan Pérez   │ 30   │
│ María Gómez  │ 25   │
│ Isabel Díaz  │ 38   │
│ Elena Torres │ 29   │
└──────────────┴──────┘
**/

-- Consulta para calcular el precio total de los coches vendidos a clientes menores de 30 años.
select SUM(c.precio) as precio_total FROM clientes as ci, coches as c, ventas as v WHERE v.id_coche=c.id_coche and v.id_cliente=ci.id_cliente and ci.edad < 30;

/**
┌──────────────┐
│ precio_total │
├──────────────┤
│ 117000.0     │
└──────────────┘
**/

--Consulta para obtener el modelo y el año de los coches vendidos en 2023 y llevados a reparar.

SELECT c.modelo, c.año FROM clientes as ci, coches as c, ventas as v, reparacion as r WHERE v.id_coche=c.id_coche and v.id_cliente=ci.id_cliente and r.id_cliente=ci.id_cliente and r.id_coche=c.id_coche and v.fecha_venta REGEXP '^2023-\d+-\d+$';

/**
┌────────────────┬──────┐
│     modelo     │ año  │
├────────────────┼──────┤
│ Sedán 2022     │ 2022 │
│ Hatchback 2021 │ 2021 │
│ Deportivo 2023 │ 2023 │
│ Eléctrico 2021 │ 2021 │
│ Sedán 2022     │ 2022 │
│ Hatchback 2021 │ 2021 │
│ Deportivo 2023 │ 2023 │
│ Eléctrico 2021 │ 2021 │
└────────────────┴──────┘
**/
-- Consulta para contar el número de coches vendidos por cliente.

SELECT COUNT(v.id_cliente) as compras, c.nombre FROM ventas as v, clientes as c WHERE v.id_cliente=c.id_cliente GROUP BY v.id_cliente HAVING COUNT(v.id_cliente) > 0;
/**
┌─────────┬─────────────────┐
│ compras │     nombre      │
├─────────┼─────────────────┤
│ 1       │ Juan Pérez      │
│ 1       │ María Gómez     │
│ 1       │ Carlos López    │
│ 1       │ Ana Martínez    │
│ 1       │ Pedro Rodríguez │
│ 1       │ Laura Sánchez   │
│ 1       │ Miguel González │
│ 1       │ Isabel Díaz     │
│ 1       │ Elena Torres    │
└─────────┴─────────────────┘
**/
-- Consulta para obtener el nombre y el precio de los coches vendidos a clientes mayores de 35 años.

SELECT co.modelo, co.precio FROM clientes as ci, coches as co, ventas as v WHERE v.id_cliente=ci.id_cliente and v.id_coche=co.id_coche and ci.edad > 35;

/**
┌────────────────┬─────────┐
│     modelo     │ precio  │
├────────────────┼─────────┤
│ Camioneta 2023 │ 32000.0 │
│ Deportivo 2023 │ 35000.0 │
└────────────────┴─────────┘
**/
--Consulta para calcular el precio total de los coches vendidos a clientes que viven en una calle (en la dirección).

select SUM(c.precio) as precio_total FROM clientes as ci, coches as c, ventas as v WHERE v.id_coche=c.id_coche and v.id_cliente=ci.id_cliente and ci.direccion REGEXP 'Calle A #123';

/**
┌──────────────┐
│ precio_total │
├──────────────┤
│ 25000.0      │
└──────────────┘
**/

--Consulta para obtener el nombre y la dirección de los clientes que han comprado coches de más de 30000 euros y llevado a reparar sus coches en 2024.

SELECT ci.nombre, ci.direccion FROM clientes as ci, coches as c, ventas as v, reparacion as r WHERE v.id_coche=c.id_coche and v.id_cliente=ci.id_cliente and r.id_cliente=ci.id_cliente and r.id_coche= ci.id_cliente and c.precio > 30.000 and r.fecha_reparación REGEXP '^2024-\d+-\d+$';

/**
┌──────────────┬────────────────┐
│    nombre    │   direccion    │
├──────────────┼────────────────┤
│ María Gómez  │ Avenida B #456 │
│ Elena Torres │ Avenida J #333 │
│ María Gómez  │ Avenida B #456 │
│ Elena Torres │ Avenida J #333 │
└──────────────┴────────────────┘
**/

-- Consulta para calcular el precio medio de los coches vendidos en 2023 y llevados a reparar por clientes menores de 30 años.

ELECT AVG(c.precio) as precio_promedio FROM clientes as ci, coches as c, ventas as v, reparacion as r WHERE v.id_coche=c.id_coche and v.id_cliente=ci.id_cliente and r.id_cliente=ci.id_cliente and r.id_coche= ci.id_cliente and ci.edad < 30 and v.fecha_venta  REGEXP '^2023-\d+-\d+$';

/**
┌─────────────────┐
│ precio_promedio │
├─────────────────┤
│ 31000.0         │
└─────────────────┘
**/
-- Consulta para obtener el modelo y el año de los coches vendidos por clientes que tienen una dirección que contiene la palabra "Avenida".

SELECT  co.modelo, co.año FROM clientes as ci, coches as co, ventas as v WHERE v.id_cliente=ci.id_cliente and v.id_coche=co.id_coche and ci.direccion REGEXP '^Avenida';

/**
┌────────────────┬──────┐
│     modelo     │ año  │
├────────────────┼──────┤
│ Hatchback 2021 │ 2021 │
│ Coupé 2022     │ 2022 │
│ Compacto 2021  │ 2021 │
│ Deportivo 2023 │ 2023 │
│ Eléctrico 2021 │ 2021 │
└────────────────┴──────┘
**/
-- Consulta para contar el número de reparaciones realizadas en 2024 por cada cliente.

SELECT COUNT(r.id_reparación) as reparaciones_2024, c.nombre FROM clientes as c, reparacion as r WHERE c.id_cliente=r.id_cliente and r.fecha_reparación REGEXP '^2024-\d+-\d+$' GROUP BY c.id_cliente;

/**
┌───────────────────┬─────────────────┐
│ reparaciones_2024 │     nombre      │
├───────────────────┼─────────────────┤
│ 1                 │ Juan Pérez      │
│ 1                 │ María Gómez     │
│ 1                 │ Carlos López    │
│ 1                 │ Ana Martínez    │
│ 1                 │ Pedro Rodríguez │
│ 1                 │ Laura Sánchez   │
│ 1                 │ Miguel González │
│ 1                 │ Isabel Díaz     │
│ 2                 │ Francisco Ruiz  │
│ 2                 │ Elena Torres    │
└───────────────────┴─────────────────┘
**/