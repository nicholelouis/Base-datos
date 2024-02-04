-- Obtener todos los clientes.

select * FROM Clientes ;

/**
┌────┬─────────────────┬───────────────────────────┐
│ id │     nombre      │           email           │
├────┼─────────────────┼───────────────────────────┤
│ 1  │ Juan Pérez      │ juan@example.com          │
│ 2  │ María Gómez     │ maria@example.com         │
│ 3  │ Carlos López    │ carlos@example.com        │
│ 4  │ Ana Rodríguez   │ ana@example.com           │
│ 5  │ Luisa Martínez  │ luisa@example.com         │
│ 6  │ Pedro Sánchez   │ pedro@example.com         │
│ 7  │ Laura García    │ laura@example.com         │
│ 8  │ Miguel Martín   │ miguel@example.com        │
│ 9  │ Elena González  │ elena@example.com         │
│ 10 │ David Torres    │ david@example.com         │
│ 11 │ Sofía Ruiz      │ sofia@example.com         │
│ 12 │ Javier López    │ javier@example.com        │
│ 13 │ Carmen Vargas   │ carmen@example.com        │
│ 14 │ Daniel Muñoz    │ daniel@example.com        │
│ 15 │ Isabel Serrano  │ isabel@example.com        │
│ 16 │ Alejandro Muñoz │ alejandro@example.com     │
│ 17 │ Raquel Herrera  │ raquel@example.com        │
│ 18 │ Francisco Mora  │ francisco@example.com     │
│ 19 │ Marina Díaz     │ marina@example.com        │
│ 20 │ Antonio Jiménez │ antonio@example.com       │
│ 21 │ Beatriz Romero  │ beatriz@example.com       │
│ 22 │ Carlos Gómez    │ carlos.gomez@example.com  │
│ 23 │ Clara Sánchez   │ clara.sanchez@example.com │
│ 24 │ Andrés Martínez │ andres@example.com        │
│ 25 │ Lucía Díaz      │ lucia@example.com         │
│ 26 │ Mario Serrano   │ mario@example.com         │
│ 27 │ Eva Torres      │ eva.torres@example.com    │
│ 28 │ Roberto Ruiz    │ roberto@example.com       │
│ 29 │ Celia García    │ celia@example.com         │
└────┴─────────────────┴───────────────────────────┘
**/

-- Obtener la cantidad total de productos en todos los pedidos

select COUNT(cantidad) as cantidad_total_prod from Pedidos ;

/**
┌─────────────────────┐
│ cantidad_total_prod │
├─────────────────────┤
│ 30                  │
└─────────────────────┘
**/

-- Obtener el precio promedio de los productos:

select AVG(precio) as precio_promedio FROM Productos ;

/**
┌──────────────────┐
│ precio_promedio  │
├──────────────────┤
│ 188.294285714286 │
└──────────────────┘
**/

-- Obtener los clientes que tienen un email válido (contiene '@'):

select email FROM Clientes where email REGEXP '^[a-z]+@[a-z]+\.[a-z]{2,3}$';

/**
┌───────────────────────┐
│         email         │
├───────────────────────┤
│ alejandro@example.com │
│ ana@example.com       │
│ andres@example.com    │
│ antonio@example.com   │
│ beatriz@example.com   │
│ carlos@example.com    │
│ carmen@example.com    │
│ celia@example.com     │
│ daniel@example.com    │
│ david@example.com     │
│ elena@example.com     │
│ francisco@example.com │
│ isabel@example.com    │
│ javier@example.com    │
│ juan@example.com      │
│ laura@example.com     │
│ lucia@example.com     │
│ luisa@example.com     │
│ maria@example.com     │
│ marina@example.com    │
│ mario@example.com     │
│ miguel@example.com    │
│ pedro@example.com     │
│ raquel@example.com    │
│ roberto@example.com   │
│ sofia@example.com     │
└───────────────────────┘
**/

-- Obtener el producto más caro.

select id, nombre, MAX(precio) FROM Productos;

/**
┌────┬────────┬─────────────┐
│ id │ nombre │ MAX(precio) │
├────┼────────┼─────────────┤
│ 1  │ Laptop │ 1200.0      │
└────┴────────┴─────────────┘
**/

-- Obtener los pedidos realizados en febrero de 2024.

SELECT * FROM Pedidos where fecha_pedido REGEXP '^2024-02-\d+$';

/**
┌───────────┬────────────┬─────────────┬──────────┬──────────────┐
│ id_pedido │ id_cliente │ id_producto │ cantidad │ fecha_pedido │
├───────────┼────────────┼─────────────┼──────────┼──────────────┤
│ 1         │ 1          │ 1           │ 2        │ 2024-02-01   │
│ 2         │ 2          │ 2           │ 1        │ 2024-02-02   │
│ 3         │ 3          │ 3           │ 3        │ 2024-02-03   │
│ 4         │ 4          │ 4           │ 1        │ 2024-02-04   │
│ 5         │ 5          │ 5           │ 2        │ 2024-02-05   │
│ 6         │ 6          │ 6           │ 1        │ 2024-02-06   │
│ 7         │ 7          │ 7           │ 3        │ 2024-02-07   │
│ 8         │ 8          │ 8           │ 2        │ 2024-02-08   │
│ 9         │ 9          │ 9           │ 1        │ 2024-02-09   │
│ 10        │ 10         │ 10          │ 2        │ 2024-02-10   │
│ 11        │ 11         │ 11          │ 1        │ 2024-02-11   │
│ 12        │ 12         │ 12          │ 3        │ 2024-02-12   │
│ 13        │ 13         │ 13          │ 1        │ 2024-02-13   │
│ 14        │ 14         │ 14          │ 2        │ 2024-02-14   │
│ 15        │ 15         │ 15          │ 1        │ 2024-02-15   │
│ 16        │ 16         │ 16          │ 3        │ 2024-02-16   │
│ 17        │ 17         │ 17          │ 2        │ 2024-02-17   │
│ 18        │ 18         │ 18          │ 1        │ 2024-02-18   │
│ 19        │ 19         │ 19          │ 2        │ 2024-02-19   │
│ 20        │ 20         │ 20          │ 1        │ 2024-02-20   │
│ 21        │ 21         │ 21          │ 3        │ 2024-02-21   │
│ 22        │ 22         │ 22          │ 1        │ 2024-02-22   │
│ 23        │ 23         │ 23          │ 2        │ 2024-02-23   │
│ 24        │ 24         │ 24          │ 1        │ 2024-02-24   │
│ 25        │ 25         │ 25          │ 3        │ 2024-02-25   │
│ 26        │ 26         │ 26          │ 2        │ 2024-02-26   │
│ 27        │ 27         │ 27          │ 1        │ 2024-02-27   │
│ 28        │ 28         │ 28          │ 2        │ 2024-02-28   │
│ 29        │ 29         │ 29          │ 1        │ 2024-02-29   │
└───────────┴────────────┴─────────────┴──────────┴──────────────┘
**/

-- Obtener la cantidad total de productos en todos los pedidos por producto.

select p.id_producto, pro.nombre, sum(p.cantidad) as cantidad_total FROM Productos as pro, Pedidos as p WHERE p.id_producto=pro.id GROUP BY p.id_producto ORDER BY p.id_producto;

/**
┌─────────────┬───────────────────────────────────┬────────────────┐
│ id_producto │              nombre               │ cantidad_total │
├─────────────┼───────────────────────────────────┼────────────────┤
│ 1           │ Laptop                            │ 2              │
│ 2           │ Smartphone                        │ 1              │
│ 3           │ TV LED                            │ 3              │
│ 4           │ Tablet                            │ 1              │
│ 5           │ Auriculares Bluetooth             │ 2              │
│ 6           │ Impresora                         │ 1              │
│ 7           │ Cámara Digital                    │ 3              │
│ 8           │ Reproductor de Audio              │ 2              │
│ 9           │ Altavoces Inalámbricos            │ 1              │
│ 10          │ Reloj Inteligente                 │ 2              │
│ 11          │ Teclado Inalámbrico               │ 1              │
│ 12          │ Ratón Óptico                      │ 3              │
│ 13          │ Monitor LED                       │ 1              │
│ 14          │ Mochila para Portátil             │ 2              │
│ 15          │ Disco Duro Externo                │ 1              │
│ 16          │ Router Wi-Fi                      │ 3              │
│ 17          │ Lámpara LED                       │ 2              │
│ 18          │ Batería Externa                   │ 1              │
│ 19          │ Estuche para Auriculares          │ 2              │
│ 20          │ Tarjeta de Memoria                │ 1              │
│ 21          │ Cargador Inalámbrico              │ 3              │
│ 22          │ Kit de Limpieza para Computadoras │ 1              │
│ 23          │ Funda para Tablet                 │ 2              │
│ 24          │ Soporte para Teléfono             │ 1              │
│ 25          │ Hub USB                           │ 3              │
│ 26          │ Webcam HD                         │ 2              │
│ 27          │ Funda para Laptop                 │ 1              │
│ 28          │ Adaptador HDMI                    │ 2              │
└─────────────┴───────────────────────────────────┴────────────────┘
**/


-- Obtener los clientes que han realizado más de un pedido.

SELECT c.id, c.nombre FROM Clientes as c, Pedidos as p WHERE c.id=p.id_cliente GROUP BY p.id_cliente HAVING COUNT(p.id_pedido) > 1;

-- Obtener los productos que tienen un precio registrado.

SELECT * FROM Productos where precio not NULL;

/**
┌────┬───────────────────────────────────┬────────┐
│ id │              nombre               │ precio │
├────┼───────────────────────────────────┼────────┤
│ 1  │ Laptop                            │ 1200.0 │
│ 2  │ Smartphone                        │ 699.99 │
│ 3  │ TV LED                            │ 799.5  │
│ 4  │ Tablet                            │ 299.99 │
│ 5  │ Auriculares Bluetooth             │ 79.99  │
│ 6  │ Impresora                         │ 199.99 │
│ 7  │ Cámara Digital                    │ 499.99 │
│ 8  │ Reproductor de Audio              │ 149.99 │
│ 9  │ Altavoces Inalámbricos            │ 129.99 │
│ 10 │ Reloj Inteligente                 │ 249.99 │
│ 11 │ Teclado Inalámbrico               │ 59.99  │
│ 12 │ Ratón Óptico                      │ 29.99  │
│ 13 │ Monitor LED                       │ 349.99 │
│ 14 │ Mochila para Portátil             │ 49.99  │
│ 15 │ Disco Duro Externo                │ 89.99  │
│ 16 │ Router Wi-Fi                      │ 69.99  │
│ 17 │ Lámpara LED                       │ 39.99  │
│ 18 │ Batería Externa                   │ 19.99  │
│ 19 │ Estuche para Auriculares          │ 14.99  │
│ 20 │ Tarjeta de Memoria                │ 24.99  │
│ 21 │ Cargador Inalámbrico              │ 34.99  │
│ 22 │ Kit de Limpieza para Computadoras │ 9.99   │
│ 23 │ Funda para Tablet                 │ 19.99  │
│ 24 │ Soporte para Teléfono             │ 14.99  │
│ 25 │ Hub USB                           │ 29.99  │
│ 26 │ Webcam HD                         │ 59.99  │
│ 27 │ Funda para Laptop                 │ 29.99  │
│ 28 │ Adaptador HDMI                    │ 12.99  │
└────┴───────────────────────────────────┴────────┘
**/

-- Obtener la fecha del primer pedido realizado:

SELECT fecha_pedido FROM Pedidos ORDER BY fecha_pedido asc LIMIT 1;

/**
┌──────────────┐
│ fecha_pedido │
├──────────────┤
│ 2024-02-01   │
└──────────────┘
**/

-- Obtener los productos cuyos nombres comienzan con 'A' o 'B':

SELECT * FROM Productos WHERE nombre REGEXP '^[AP]';

/**
┌────┬────────────────────────┬────────┐
│ id │         nombre         │ precio │
├────┼────────────────────────┼────────┤
│ 5  │ Auriculares Bluetooth  │ 79.99  │
│ 9  │ Altavoces Inalámbricos │ 129.99 │
│ 28 │ Adaptador HDMI         │ 12.99  │
└────┴────────────────────────┴────────┘
**/

-- Obtener la cantidad total de productos en todos los pedidos por cliente ordenado por cliente.

SELECT p.id_cliente, c.nombre, SUM(p.cantidad) as total_productos FROM Pedidos as p, Clientes as c WHERE c.id=p.id_cliente GROUP by p.id_cliente ORDER by p.id_cliente;
/**
┌────────────┬─────────────────┬─────────────────┐
│ id_cliente │     nombre      │ total_productos │
├────────────┼─────────────────┼─────────────────┤
│ 1          │ Juan Pérez      │ 2               │
│ 2          │ María Gómez     │ 1               │
│ 3          │ Carlos López    │ 3               │
│ 4          │ Ana Rodríguez   │ 1               │
│ 5          │ Luisa Martínez  │ 2               │
│ 6          │ Pedro Sánchez   │ 1               │
│ 7          │ Laura García    │ 3               │
│ 8          │ Miguel Martín   │ 2               │
│ 9          │ Elena González  │ 1               │
│ 10         │ David Torres    │ 2               │
│ 11         │ Sofía Ruiz      │ 1               │
│ 12         │ Javier López    │ 3               │
│ 13         │ Carmen Vargas   │ 1               │
│ 14         │ Daniel Muñoz    │ 2               │
│ 15         │ Isabel Serrano  │ 1               │
│ 16         │ Alejandro Muñoz │ 3               │
│ 17         │ Raquel Herrera  │ 2               │
│ 18         │ Francisco Mora  │ 1               │
│ 19         │ Marina Díaz     │ 2               │
│ 20         │ Antonio Jiménez │ 1               │
│ 21         │ Beatriz Romero  │ 3               │
│ 22         │ Carlos Gómez    │ 1               │
│ 23         │ Clara Sánchez   │ 2               │
│ 24         │ Andrés Martínez │ 1               │
│ 25         │ Lucía Díaz      │ 3               │
│ 26         │ Mario Serrano   │ 2               │
│ 27         │ Eva Torres      │ 1               │
│ 28         │ Roberto Ruiz    │ 2               │
│ 29         │ Celia García    │ 1               │
└────────────┴─────────────────┴─────────────────┘
**/

-- Obtener los clientes que han realizado más de un pedido en febrero de 2024.

SELECT c.nombre FROM Clientes as c, Pedidos as p where c.id=p.id_cliente and p.fecha_pedido REGEXP '^2024-02-\d+$' GROUP by p.id_cliente HAVING  COUNT(p.id_pedido) > 1;


-- Obtener los productos con precio entre 100 y 500.

SELECT * FROM Productos where precio BETWEEN 100 and 500;

/**
┌────┬────────────────────────┬────────┐
│ id │         nombre         │ precio │
├────┼────────────────────────┼────────┤
│ 4  │ Tablet                 │ 299.99 │
│ 6  │ Impresora              │ 199.99 │
│ 7  │ Cámara Digital         │ 499.99 │
│ 8  │ Reproductor de Audio   │ 149.99 │
│ 9  │ Altavoces Inalámbricos │ 129.99 │
│ 10 │ Reloj Inteligente      │ 249.99 │
│ 13 │ Monitor LED            │ 349.99 │
└────┴────────────────────────┴────────┘
**/

-- Obtener la cantidad total de productos en todos los pedidos por cliente ordenado por cantidad descendente.

SELECT p.id_cliente, c.nombre, SUM(p.cantidad) as total_productos FROM Pedidos as p, Clientes as c WHERE c.id=p.id_cliente GROUP by p.id_cliente ORDER by p.cantidad desc;

/**
┌────────────┬─────────────────┬─────────────────┐
│ id_cliente │     nombre      │ total_productos │
├────────────┼─────────────────┼─────────────────┤
│ 25         │ Lucía Díaz      │ 3               │
│ 21         │ Beatriz Romero  │ 3               │
│ 16         │ Alejandro Muñoz │ 3               │
│ 12         │ Javier López    │ 3               │
│ 7          │ Laura García    │ 3               │
│ 3          │ Carlos López    │ 3               │
│ 28         │ Roberto Ruiz    │ 2               │
│ 26         │ Mario Serrano   │ 2               │
│ 23         │ Clara Sánchez   │ 2               │
│ 19         │ Marina Díaz     │ 2               │
│ 17         │ Raquel Herrera  │ 2               │
│ 14         │ Daniel Muñoz    │ 2               │
│ 10         │ David Torres    │ 2               │
│ 8          │ Miguel Martín   │ 2               │
│ 5          │ Luisa Martínez  │ 2               │
│ 1          │ Juan Pérez      │ 2               │
│ 29         │ Celia García    │ 1               │
│ 27         │ Eva Torres      │ 1               │
│ 24         │ Andrés Martínez │ 1               │
│ 22         │ Carlos Gómez    │ 1               │
│ 20         │ Antonio Jiménez │ 1               │
│ 18         │ Francisco Mora  │ 1               │
│ 15         │ Isabel Serrano  │ 1               │
│ 13         │ Carmen Vargas   │ 1               │
│ 11         │ Sofía Ruiz      │ 1               │
│ 9          │ Elena González  │ 1               │
│ 6          │ Pedro Sánchez   │ 1               │
│ 4          │ Ana Rodríguez   │ 1               │
│ 2          │ María Gómez     │ 1               │
└────────────┴─────────────────┴─────────────────┘
**/

-- Obtener los clientes que tienen una 'a' en cualquier posición de su nombre.

SELECT * FROM Clientes where nombre REGEXP 'a';

/**
┌────┬─────────────────┬───────────────────────────┐
│ id │     nombre      │           email           │
├────┼─────────────────┼───────────────────────────┤
│ 1  │ Juan Pérez      │ juan@example.com          │
│ 2  │ María Gómez     │ maria@example.com         │
│ 3  │ Carlos López    │ carlos@example.com        │
│ 4  │ Ana Rodríguez   │ ana@example.com           │
│ 5  │ Luisa Martínez  │ luisa@example.com         │
│ 7  │ Laura García    │ laura@example.com         │
│ 8  │ Miguel Martín   │ miguel@example.com        │
│ 9  │ Elena González  │ elena@example.com         │
│ 10 │ David Torres    │ david@example.com         │
│ 11 │ Sofía Ruiz      │ sofia@example.com         │
│ 12 │ Javier López    │ javier@example.com        │
│ 13 │ Carmen Vargas   │ carmen@example.com        │
│ 14 │ Daniel Muñoz    │ daniel@example.com        │
│ 15 │ Isabel Serrano  │ isabel@example.com        │
│ 16 │ Alejandro Muñoz │ alejandro@example.com     │
│ 17 │ Raquel Herrera  │ raquel@example.com        │
│ 18 │ Francisco Mora  │ francisco@example.com     │
│ 19 │ Marina Díaz     │ marina@example.com        │
│ 21 │ Beatriz Romero  │ beatriz@example.com       │
│ 22 │ Carlos Gómez    │ carlos.gomez@example.com  │
│ 23 │ Clara Sánchez   │ clara.sanchez@example.com │
│ 24 │ Andrés Martínez │ andres@example.com        │
│ 25 │ Lucía Díaz      │ lucia@example.com         │
│ 26 │ Mario Serrano   │ mario@example.com         │
│ 27 │ Eva Torres      │ eva.torres@example.com    │
│ 29 │ Celia García    │ celia@example.com         │
└────┴─────────────────┴───────────────────────────┘
**/

-- Obtener el precio máximo de los productos.

select id, nombre, MAX(precio) FROM Productos;

/**
┌────┬────────┬─────────────┐
│ id │ nombre │ MAX(precio) │
├────┼────────┼─────────────┤
│ 1  │ Laptop │ 1200.0      │
└────┴────────┴─────────────┘
**/

-- Obtener los pedidos realizados por el cliente con ID 1 en febrero de 2024.

SELECT * FROM Pedidos where id_cliente = 1 and fecha_pedido REGEXP '^2024-02-\d+$';

/**
┌───────────┬────────────┬─────────────┬──────────┬──────────────┐
│ id_pedido │ id_cliente │ id_producto │ cantidad │ fecha_pedido │
├───────────┼────────────┼─────────────┼──────────┼──────────────┤
│ 1         │ 1          │ 1           │ 2        │ 2024-02-01   │
└───────────┴────────────┴─────────────┴──────────┴──────────────┘
**/
-- Obtener la cantidad total de productos en todos los pedidos por producto ordenado por total de productos descendente.

SELECT p.id_producto, pro.nombre, SUM(p.cantidad) as total_productos FROM Pedidos as p, Productos as pro WHERE pro.id=p.id_producto GROUP by p.id_producto ORDER by p.cantidad desc;

/**
┌─────────────┬───────────────────────────────────┬─────────────────┐
│ id_producto │              nombre               │ total_productos │
├─────────────┼───────────────────────────────────┼─────────────────┤
│ 25          │ Hub USB                           │ 3               │
│ 21          │ Cargador Inalámbrico              │ 3               │
│ 16          │ Router Wi-Fi                      │ 3               │
│ 12          │ Ratón Óptico                      │ 3               │
│ 7           │ Cámara Digital                    │ 3               │
│ 3           │ TV LED                            │ 3               │
│ 28          │ Adaptador HDMI                    │ 2               │
│ 26          │ Webcam HD                         │ 2               │
│ 23          │ Funda para Tablet                 │ 2               │
│ 19          │ Estuche para Auriculares          │ 2               │
│ 17          │ Lámpara LED                       │ 2               │
│ 14          │ Mochila para Portátil             │ 2               │
│ 10          │ Reloj Inteligente                 │ 2               │
│ 8           │ Reproductor de Audio              │ 2               │
│ 5           │ Auriculares Bluetooth             │ 2               │
│ 1           │ Laptop                            │ 2               │
│ 27          │ Funda para Laptop                 │ 1               │
│ 24          │ Soporte para Teléfono             │ 1               │
│ 22          │ Kit de Limpieza para Computadoras │ 1               │
│ 20          │ Tarjeta de Memoria                │ 1               │
│ 18          │ Batería Externa                   │ 1               │
│ 15          │ Disco Duro Externo                │ 1               │
│ 13          │ Monitor LED                       │ 1               │
│ 11          │ Teclado Inalámbrico               │ 1               │
│ 9           │ Altavoces Inalámbricos            │ 1               │
│ 6           │ Impresora                         │ 1               │
│ 4           │ Tablet                            │ 1               │
│ 2           │ Smartphone                        │ 1               │
└─────────────┴───────────────────────────────────┴─────────────────┘
**/
-- Obtener los productos que no tienen un precio registrado.

SELECT * FROM Productos where precio = NULL;

-- Obtener la fecha del último pedido realizado.

SELECT fecha_pedido FROM Pedidos ORDER BY fecha_pedido desc LIMIT 1;

/**
┌──────────────┐
│ fecha_pedido │
├──────────────┤
│ 2024-03-01   │
└──────────────┘
**/

-- Obtener los clientes cuyo nombre tiene al menos 5 caracteres.

SELECT * FROM Clientes where LENGTH(nombre) >= 5;

/**
┌────┬─────────────────┬───────────────────────────┐
│ id │     nombre      │           email           │
├────┼─────────────────┼───────────────────────────┤
│ 1  │ Juan Pérez      │ juan@example.com          │
│ 2  │ María Gómez     │ maria@example.com         │
│ 3  │ Carlos López    │ carlos@example.com        │
│ 4  │ Ana Rodríguez   │ ana@example.com           │
│ 5  │ Luisa Martínez  │ luisa@example.com         │
│ 6  │ Pedro Sánchez   │ pedro@example.com         │
│ 7  │ Laura García    │ laura@example.com         │
│ 8  │ Miguel Martín   │ miguel@example.com        │
│ 9  │ Elena González  │ elena@example.com         │
│ 10 │ David Torres    │ david@example.com         │
│ 11 │ Sofía Ruiz      │ sofia@example.com         │
│ 12 │ Javier López    │ javier@example.com        │
│ 13 │ Carmen Vargas   │ carmen@example.com        │
│ 14 │ Daniel Muñoz    │ daniel@example.com        │
│ 15 │ Isabel Serrano  │ isabel@example.com        │
│ 16 │ Alejandro Muñoz │ alejandro@example.com     │
│ 17 │ Raquel Herrera  │ raquel@example.com        │
│ 18 │ Francisco Mora  │ francisco@example.com     │
│ 19 │ Marina Díaz     │ marina@example.com        │
│ 20 │ Antonio Jiménez │ antonio@example.com       │
│ 21 │ Beatriz Romero  │ beatriz@example.com       │
│ 22 │ Carlos Gómez    │ carlos.gomez@example.com  │
│ 23 │ Clara Sánchez   │ clara.sanchez@example.com │
│ 24 │ Andrés Martínez │ andres@example.com        │
│ 25 │ Lucía Díaz      │ lucia@example.com         │
│ 26 │ Mario Serrano   │ mario@example.com         │
│ 27 │ Eva Torres      │ eva.torres@example.com    │
│ 28 │ Roberto Ruiz    │ roberto@example.com       │
│ 29 │ Celia García    │ celia@example.com         │
└────┴─────────────────┴───────────────────────────┘
**/

-- Obtener los productos que tienen la letra 'o' en cualquier posición del nombre.

SELECT * FROM Productos WHERE nombre REGEXP 'o';

/**
┌────┬───────────────────────────────────┬────────┐
│ id │              nombre               │ precio │
├────┼───────────────────────────────────┼────────┤
│ 1  │ Laptop                            │ 1200.0 │
│ 2  │ Smartphone                        │ 699.99 │
│ 5  │ Auriculares Bluetooth             │ 79.99  │
│ 6  │ Impresora                         │ 199.99 │
│ 8  │ Reproductor de Audio              │ 149.99 │
│ 9  │ Altavoces Inalámbricos            │ 129.99 │
│ 10 │ Reloj Inteligente                 │ 249.99 │
│ 11 │ Teclado Inalámbrico               │ 59.99  │
│ 12 │ Ratón Óptico                      │ 29.99  │
│ 13 │ Monitor LED                       │ 349.99 │
│ 14 │ Mochila para Portátil             │ 49.99  │
│ 15 │ Disco Duro Externo                │ 89.99  │
│ 16 │ Router Wi-Fi                      │ 69.99  │
│ 20 │ Tarjeta de Memoria                │ 24.99  │
│ 21 │ Cargador Inalámbrico              │ 34.99  │
│ 22 │ Kit de Limpieza para Computadoras │ 9.99   │
│ 24 │ Soporte para Teléfono             │ 14.99  │
│ 27 │ Funda para Laptop                 │ 29.99  │
│ 28 │ Adaptador HDMI                    │ 12.99  │
└────┴───────────────────────────────────┴────────┘
**/

-- Obtener la cantidad total de productos en todos los pedidos por cliente ordenado por cliente.

 SELECT p.id_cliente, c.nombre, SUM(p.cantidad) as total_productos FROM Pedidos as p, Clientes as c WHERE c.id=p.id_cliente GROUP by p.id_cliente ORDER by c.nombre;

/**
┌────────────┬─────────────────┬─────────────────┐
│ id_cliente │     nombre      │ total_productos │
├────────────┼─────────────────┼─────────────────┤
│ 16         │ Alejandro Muñoz │ 3               │
│ 4          │ Ana Rodríguez   │ 1               │
│ 24         │ Andrés Martínez │ 1               │
│ 20         │ Antonio Jiménez │ 1               │
│ 21         │ Beatriz Romero  │ 3               │
│ 22         │ Carlos Gómez    │ 1               │
│ 3          │ Carlos López    │ 3               │
│ 13         │ Carmen Vargas   │ 1               │
│ 29         │ Celia García    │ 1               │
│ 23         │ Clara Sánchez   │ 2               │
│ 14         │ Daniel Muñoz    │ 2               │
│ 10         │ David Torres    │ 2               │
│ 9          │ Elena González  │ 1               │
│ 27         │ Eva Torres      │ 1               │
│ 18         │ Francisco Mora  │ 1               │
│ 15         │ Isabel Serrano  │ 1               │
│ 12         │ Javier López    │ 3               │
│ 1          │ Juan Pérez      │ 2               │
│ 7          │ Laura García    │ 3               │
│ 25         │ Lucía Díaz      │ 3               │
│ 5          │ Luisa Martínez  │ 2               │
│ 19         │ Marina Díaz     │ 2               │
│ 26         │ Mario Serrano   │ 2               │
│ 2          │ María Gómez     │ 1               │
│ 8          │ Miguel Martín   │ 2               │
│ 6          │ Pedro Sánchez   │ 1               │
│ 17         │ Raquel Herrera  │ 2               │
│ 28         │ Roberto Ruiz    │ 2               │
│ 11         │ Sofía Ruiz      │ 1               │
└────────────┴─────────────────┴─────────────────┘
**/

-- Obtener los clientes cuyos nombres no contienen la letra 'i':

SELECT * FROM Clientes  WHERE nombre not REGEXP '[iI]';

/**
┌────┬─────────────────┬───────────────────────────┐
│ id │     nombre      │           email           │
├────┼─────────────────┼───────────────────────────┤
│ 1  │ Juan Pérez      │ juan@example.com          │
│ 2  │ María Gómez     │ maria@example.com         │
│ 3  │ Carlos López    │ carlos@example.com        │
│ 4  │ Ana Rodríguez   │ ana@example.com           │
│ 6  │ Pedro Sánchez   │ pedro@example.com         │
│ 7  │ Laura García    │ laura@example.com         │
│ 9  │ Elena González  │ elena@example.com         │
│ 13 │ Carmen Vargas   │ carmen@example.com        │
│ 16 │ Alejandro Muñoz │ alejandro@example.com     │
│ 17 │ Raquel Herrera  │ raquel@example.com        │
│ 22 │ Carlos Gómez    │ carlos.gomez@example.com  │
│ 23 │ Clara Sánchez   │ clara.sanchez@example.com │
│ 24 │ Andrés Martínez │ andres@example.com        │
│ 25 │ Lucía Díaz      │ lucia@example.com         │
│ 27 │ Eva Torres      │ eva.torres@example.com    │
└────┴─────────────────┴───────────────────────────┘
**/

-- Obtener los pedidos realizados por el cliente con ID 2 en febrero de 2024.

SELECT * FROM Pedidos where id_cliente = 2 and fecha_pedido REGEXP '^2024-02-\d+$';

/**
┌───────────┬────────────┬─────────────┬──────────┬──────────────┐
│ id_pedido │ id_cliente │ id_producto │ cantidad │ fecha_pedido │
├───────────┼────────────┼─────────────┼──────────┼──────────────┤
│ 2         │ 2          │ 2           │ 1        │ 2024-02-02   │
└───────────┴────────────┴─────────────┴──────────┴──────────────┘
**/

-- Obtener el precio mínimo de los productos.

select id, nombre, MIN(precio) FROM Productos; 

/**
┌────┬───────────────────────────────────┬─────────────┐
│ id │              nombre               │ MIN(precio) │
├────┼───────────────────────────────────┼─────────────┤
│ 22 │ Kit de Limpieza para Computadoras │ 9.99        │
└────┴───────────────────────────────────┴─────────────┘
**/

-- Obtener los clientes que han realizado al menos un pedido en febrero de 2024.

SELECT DISTINCT p.id_cliente, c.nombre FROM Pedidos as p, Clientes as c WHERE p.id_cliente=c.id and p.fecha_pedido REGEXP '^2024-02-\d+$';

/**
┌────────────┬─────────────────┐
│ id_cliente │     nombre      │
├────────────┼─────────────────┤
│ 1          │ Juan Pérez      │
│ 2          │ María Gómez     │
│ 3          │ Carlos López    │
│ 4          │ Ana Rodríguez   │
│ 5          │ Luisa Martínez  │
│ 6          │ Pedro Sánchez   │
│ 7          │ Laura García    │
│ 8          │ Miguel Martín   │
│ 9          │ Elena González  │
│ 10         │ David Torres    │
│ 11         │ Sofía Ruiz      │
│ 12         │ Javier López    │
│ 13         │ Carmen Vargas   │
│ 14         │ Daniel Muñoz    │
│ 15         │ Isabel Serrano  │
│ 16         │ Alejandro Muñoz │
│ 17         │ Raquel Herrera  │
│ 18         │ Francisco Mora  │
│ 19         │ Marina Díaz     │
│ 20         │ Antonio Jiménez │
│ 21         │ Beatriz Romero  │
│ 22         │ Carlos Gómez    │
│ 23         │ Clara Sánchez   │
│ 24         │ Andrés Martínez │
│ 25         │ Lucía Díaz      │
│ 26         │ Mario Serrano   │
│ 27         │ Eva Torres      │
│ 28         │ Roberto Ruiz    │
│ 29         │ Celia García    │
└────────────┴─────────────────┘
**/


-- Obtener la fecha del último pedido realizado por el cliente con ID 3.

SELECT * FROM Pedidos where id_cliente = 3 ORDER BY fecha_pedido desc LIMIT 1;

/**
┌───────────┬────────────┬─────────────┬──────────┬──────────────┐
│ id_pedido │ id_cliente │ id_producto │ cantidad │ fecha_pedido │
├───────────┼────────────┼─────────────┼──────────┼──────────────┤
│ 3         │ 3          │ 3           │ 3        │ 2024-02-03   │
└───────────┴────────────┴─────────────┴──────────┴──────────────┘
**/

-- Obtener los productos que tienen una 'a' al final del nombre.

select * FROM Productos where nombre REGEXP 'a$';

/**
┌────┬────────────────────┬────────┐
│ id │       nombre       │ precio │
├────┼────────────────────┼────────┤
│ 6  │ Impresora          │ 199.99 │
│ 18 │ Batería Externa    │ 19.99  │
│ 20 │ Tarjeta de Memoria │ 24.99  │
└────┴────────────────────┴────────┘
**/

-- Obtener los clientes cuyos nombres tienen al menos 4 vocales (mayúsculas|minúsculas).

SELECT * FROM Clientes where nombre REGEXP '[aeiouAEIOU]'

-- Obtener los productos cuyo precio tenga al menos 4 números sin contrar los decimales.

SELECT * FROM Productos WHERE precio REGEXP '\d{4}';

/**
┌────┬────────┬────────┐
│ id │ nombre │ precio │
├────┼────────┼────────┤
│ 1  │ Laptop │ 1200.0 │
└────┴────────┴────────┘
**/

-- Obtener los clientes cuyos nombres tienen al menos una 'a' seguida de una 'e'.

SELECT * FROM Clientes where nombre REGEXP 'ae';

-- Obtener los productos cuyos nombres terminan con una consonante.

select * FROM  Productos WHERE  nombre not REGEXP '[aeiou]$';

/**
┌────┬───────────────────────────────────┬────────┐
│ id │              nombre               │ precio │
├────┼───────────────────────────────────┼────────┤
│ 1  │ Laptop                            │ 1200.0 │
│ 3  │ TV LED                            │ 799.5  │
│ 4  │ Tablet                            │ 299.99 │
│ 5  │ Auriculares Bluetooth             │ 79.99  │
│ 7  │ Cámara Digital                    │ 499.99 │
│ 9  │ Altavoces Inalámbricos            │ 129.99 │
│ 13 │ Monitor LED                       │ 349.99 │
│ 14 │ Mochila para Portátil             │ 49.99  │
│ 17 │ Lámpara LED                       │ 39.99  │
│ 19 │ Estuche para Auriculares          │ 14.99  │
│ 22 │ Kit de Limpieza para Computadoras │ 9.99   │
│ 23 │ Funda para Tablet                 │ 19.99  │
│ 25 │ Hub USB                           │ 29.99  │
│ 26 │ Webcam HD                         │ 59.99  │
│ 27 │ Funda para Laptop                 │ 29.99  │
│ 28 │ Adaptador HDMI                    │ 12.99  │
└────┴───────────────────────────────────┴────────┘
**/

-- Obtener los productos cuyos nombres empiezan con una vocal.

select * FROM  Productos WHERE nombre REGEXP '^[aeiouAEIOU]';

/**
┌────┬──────────────────────────┬────────┐
│ id │          nombre          │ precio │
├────┼──────────────────────────┼────────┤
│ 5  │ Auriculares Bluetooth    │ 79.99  │
│ 6  │ Impresora                │ 199.99 │
│ 9  │ Altavoces Inalámbricos   │ 129.99 │
│ 19 │ Estuche para Auriculares │ 14.99  │
│ 28 │ Adaptador HDMI           │ 12.99  │
└────┴──────────────────────────┴────────┘
**/