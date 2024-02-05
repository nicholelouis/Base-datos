-- Listar los coches vendidos con sus modelos y precios, junto con los nombres de los clientes que los compraron.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. ¿Qué es lo que no me han pedido?

SELECT v.id_venta, c.modelo, c.precio, cli.nombre FROM clientes as cli, coches as c, ventas as v where v.id_cliente=cli.id_cliente and v.id_coche=c.id_coche;

/**
┌──────────┬────────────────┬─────────┬─────────────────┐
│ id_venta │     modelo     │ precio  │     nombre      │
├──────────┼────────────────┼─────────┼─────────────────┤
│ 1        │ Sedán 2022     │ 25000.0 │ Juan Pérez      │
│ 2        │ Hatchback 2021 │ 22000.0 │ María Gómez     │
│ 3        │ SUV 2023       │ 30000.0 │ Carlos López    │
│ 4        │ Coupé 2022     │ 28000.0 │ Ana Martínez    │
│ 5        │ Camioneta 2023 │ 32000.0 │ Pedro Rodríguez │
│ 6        │ Compacto 2021  │ 20000.0 │ Laura Sánchez   │
│ 7        │ Híbrido 2022   │ 27000.0 │ Miguel González │
│ 8        │ Deportivo 2023 │ 35000.0 │ Isabel Díaz     │
│ 9        │ Eléctrico 2021 │ 40000.0 │ Elena Torres    │
└──────────┴────────────────┴─────────┴─────────────────┘
**/


-- Encontrar los clientes que han comprado coches con precios superiores al promedio de todos los coches vendidos.
  -- Cosas que debo de tener en cuenta:
    -- Precios superiores.
    -- Obtener la media. AVG(precio)

SELECT ci.nombre, co.precio, v.id_venta FROM clientes as ci, coches as co, ventas as v WHERE v.id_cliente=ci.id_cliente and v.id_coche=co.id_coche and precio > (SELECT AVG(precio) FROM coches);

/**
┌─────────────────┬─────────┬──────────┐
│     nombre      │ precio  │ id_venta │
├─────────────────┼─────────┼──────────┤
│ Carlos López    │ 30000.0 │ 3        │
│ Pedro Rodríguez │ 32000.0 │ 5        │
│ Isabel Díaz     │ 35000.0 │ 8        │
│ Elena Torres    │ 40000.0 │ 9        │
└─────────────────┴─────────┴──────────┘
**/

-- Mostrar los modelos de coches y sus precios que no han sido vendidos aún:

  -- Cosas que debo de tener en cuenta:
    -- Coches que han sido vendidos.
    -- Quiero los coches que no han sido vendidos. NOT id_coche IN ventas

SELECT id_coche, modelo, precio FROM coches WHERE id_coche not IN (SELECT co.id_coche FROM coches as co, ventas as v WHERE co.id_coche=v.id_coche);

/**
┌──────────┬─────────────┬─────────┐
│ id_coche │   modelo    │ precio  │
├──────────┼─────────────┼─────────┤
│ 9        │ Pickup 2022 │ 31000.0 │
└──────────┴─────────────┴─────────┘
**/

-- Calcular el total gastado por todos los clientes en coches:
  -- Cosas que debo de tener en cuenta:
    -- Me estan pidiendo la suma total de todos los coches vendidos, NO de aquellos que aún no se han vendido.

SELECT SUM(c.precio) as total_ingresos FROM coches as c, ventas as v where v.id_coche=c.id_coche;

/**
┌────────────────┐
│ total_ingresos │
├────────────────┤
│ 259000.0       │
└────────────────┘
**/

-- Listar los coches vendidos junto con la fecha de venta y el nombre del cliente, ordenados por fecha de venta de forma descendente:
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. ¿Por qué campo tengo que ordenadar. Es uno o más campos?

SELECT v.id_venta, c.modelo, c.marca, cli.nombre, v.fecha_venta FROM clientes as cli, coches as c, ventas as v where v.id_cliente=cli.id_cliente and v.id_coche=c.id_coche ORDER BY v.fecha_venta DESC;

/**
┌──────────┬────────────────┬────────────┬─────────────────┬─────────────┐
│ id_venta │     modelo     │   marca    │     nombre      │ fecha_venta │
├──────────┼────────────────┼────────────┼─────────────────┼─────────────┤
│ 9        │ Eléctrico 2021 │ Tesla      │ Elena Torres    │ 2023-10-05  │
│ 8        │ Deportivo 2023 │ Mazda      │ Isabel Díaz     │ 2023-08-25  │
│ 7        │ Híbrido 2022   │ Hyundai    │ Miguel González │ 2023-07-20  │
│ 6        │ Compacto 2021  │ Volkswagen │ Laura Sánchez   │ 2023-06-15  │
│ 5        │ Camioneta 2023 │ Nissan     │ Pedro Rodríguez │ 2023-05-05  │
│ 4        │ Coupé 2022     │ Chevrolet  │ Ana Martínez    │ 2023-04-10  │
│ 3        │ SUV 2023       │ Ford       │ Carlos López    │ 2023-03-25  │
│ 2        │ Hatchback 2021 │ Honda      │ María Gómez     │ 2023-02-20  │
│ 1        │ Sedán 2022     │ Toyota     │ Juan Pérez      │ 2023-01-15  │
└──────────┴────────────────┴────────────┴─────────────────┴─────────────┘
**/

-- Encontrar el modelo de coche más caro.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. MAX

SELECT id_coche, modelo , marca , año , MAX(precio) as precio FROM coches ;

/**
┌──────────┬────────────────┬───────┬──────┬─────────┐
│ id_coche │     modelo     │ marca │ año  │ precio  │
├──────────┼────────────────┼───────┼──────┼─────────┤
│ 10       │ Eléctrico 2021 │ Tesla │ 2021 │ 40000.0 │
└──────────┴────────────────┴───────┴──────┴─────────┘
**/

-- Mostrar los clientes que han comprado al menos un coche (un coche o más) y la cantidad de coches comprados.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. COUNT

 SELECT c.*, COUNT(v.id_cliente) as numero_compras FROM clientes as c, ventas as v WHERE v.id_cliente=c.id_cliente GROUP BY v.id_cliente HAVING COUNT(v.id_cliente) > 0;

 /**
┌────────────┬─────────────────┬──────┬────────────────┬────────────────┐
│ id_cliente │     nombre      │ edad │   direccion    │ numero_compras │
├────────────┼─────────────────┼──────┼────────────────┼────────────────┤
│ 1          │ Juan Pérez      │ 30   │ Calle A #123   │ 1              │
│ 2          │ María Gómez     │ 25   │ Avenida B #456 │ 1              │
│ 3          │ Carlos López    │ 35   │ Calle C #789   │ 1              │
│ 4          │ Ana Martínez    │ 28   │ Avenida D #101 │ 1              │
│ 5          │ Pedro Rodríguez │ 40   │ Calle E #234   │ 1              │
│ 6          │ Laura Sánchez   │ 32   │ Avenida F #567 │ 1              │
│ 7          │ Miguel González │ 27   │ Calle G #890   │ 1              │
│ 8          │ Isabel Díaz     │ 38   │ Avenida H #111 │ 1              │
│ 10         │ Elena Torres    │ 29   │ Avenida J #333 │ 1              │
└────────────┴─────────────────┴──────┴────────────────┴────────────────┘
 **/

-- Encontrar los clientes que han comprado coches de la marca 'Toyota':
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. Like | regexp | =. Tabla normalizada ?.

SELECT ci.* FROM clientes as ci, coches as co, ventas as v WHERE v.id_cliente=ci.id_cliente and v.id_coche=co.id_coche AND co.marca REGEXP  'Toyota';

/**
┌────────────┬────────────┬──────┬──────────────┐
│ id_cliente │   nombre   │ edad │  direccion   │
├────────────┼────────────┼──────┼──────────────┤
│ 1          │ Juan Pérez │ 30   │ Calle A #123 │
└────────────┴────────────┴──────┴──────────────┘
**/

-- Calcular el promedio de edad de los clientes que han comprado coches de más de 25,000.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. 

select AVG(ci.edad) as edad_promedio FROM clientes as ci, coches as co, ventas as v WHERE v.id_cliente=ci.id_cliente and v.id_coche=co.id_coche and co.precio > 25.000
/**
┌──────────────────┐
│  edad_promedio   │
├──────────────────┤
│ 31.5555555555556 │
└──────────────────┘
**/

-- Mostrar los modelos de coches y sus precios que fueron comprados por clientes mayores de 30 años.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?.

SELECT v.id_venta, c.modelo, c.precio, cli.nombre, cli.edad FROM clientes as cli, coches as c, ventas as v where v.id_cliente=cli.id_cliente and v.id_coche=c.id_coche and cli.edad > 30;

/**
┌──────────┬────────────────┬─────────┬─────────────────┬──────┐
│ id_venta │     modelo     │ precio  │     nombre      │ edad │
├──────────┼────────────────┼─────────┼─────────────────┼──────┤
│ 3        │ SUV 2023       │ 30000.0 │ Carlos López    │ 35   │
│ 5        │ Camioneta 2023 │ 32000.0 │ Pedro Rodríguez │ 40   │
│ 6        │ Compacto 2021  │ 20000.0 │ Laura Sánchez   │ 32   │
│ 8        │ Deportivo 2023 │ 35000.0 │ Isabel Díaz     │ 38   │
└──────────┴────────────────┴─────────┴─────────────────┴──────┘
**/

-- Encontrar los coches vendidos en el año 2022 junto con la cantidad total de ventas en ese año.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?.

SELECT *, SUM(id_venta) as cantidad_ventas_2022 FROM ventas where fecha_venta REGEXP '^2022-\d+-\d+$';

/**
┌──────────┬────────────┬──────────┬─────────────┬──────────────────────┐
│ id_venta │ id_cliente │ id_coche │ fecha_venta │ cantidad_ventas_2022 │
├──────────┼────────────┼──────────┼─────────────┼──────────────────────┤
│          │            │          │             │                      │
└──────────┴────────────┴──────────┴─────────────┴──────────────────────┘
**/

-- Listar los coches cuyos precios son mayores que el precio promedio de coches vendidos a clientes menores de 30 años.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. AVG

SELECT * FROM coches where precio > (SELECT AVG(c.precio) FROM clientes as cli, coches as c, ventas as v where v.id_cliente=cli.id_cliente and v.id_coche=c.id_coche and cli.edad > 30);

/**
┌──────────┬────────────────┬────────┬──────┬─────────┐
│ id_coche │     modelo     │ marca  │ año  │ precio  │
├──────────┼────────────────┼────────┼──────┼─────────┤
│ 3        │ SUV 2023       │ Ford   │ 2023 │ 30000.0 │
│ 5        │ Camioneta 2023 │ Nissan │ 2023 │ 32000.0 │
│ 8        │ Deportivo 2023 │ Mazda  │ 2023 │ 35000.0 │
│ 9        │ Pickup 2022    │ Ram    │ 2022 │ 31000.0 │
│ 10       │ Eléctrico 2021 │ Tesla  │ 2021 │ 40000.0 │
└──────────┴────────────────┴────────┴──────┴─────────┘
**/

-- Calcular el total de ventas por marca de coche, ordenado de forma descendente por el total de ventas:
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. COUNT| DESC|ASC precio

SELECT COUNT(v.id_venta) as numero_ventas, c.marca  FROM ventas as v, coches as c where v.id_coche=c.id_coche GROUP BY c.marca ORDER BY COUNT(v.id_venta);

/**
┌───────────────┬────────────┐
│ numero_ventas │   marca    │
├───────────────┼────────────┤
│ 1             │ Chevrolet  │
│ 1             │ Ford       │
│ 1             │ Honda      │
│ 1             │ Hyundai    │
│ 1             │ Mazda      │
│ 1             │ Nissan     │
│ 1             │ Tesla      │
│ 1             │ Toyota     │
│ 1             │ Volkswagen │
└───────────────┴────────────┘
**/