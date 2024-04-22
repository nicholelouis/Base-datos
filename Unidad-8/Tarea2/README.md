# Programación en SLQ

<p align="center">
  <img src="https://github.com/nicholelouis/Base-datos/blob/main/img/optimizacion-bd.png?raw=true" alt="Descripción de la imagen" width="300"/>
</p>

## Tarea 2

Vamos a realizar el trabajo con una BBDD existente en la documentación oficial de MySql. Su nombre es jardineria.

Realice los siguientes procedimientos y funciones sobre la base de datos jardineria.

- Función calcular_precio_total_pedido

Nota:Dado un código de pedido la función debe calcular la suma total del pedido. Tenga en cuenta que un pedido puede contener varios productos diferentes y varias cantidades de cada producto.

    + Parámetros de entrada: codigo_pedido (INT)
    + Parámetros de salida: El precio total del pedido (FLOAT)
```sql
DELIMITER $$
mysql> CREATE FUNCTION calcular_precio_total_pedidos (id_pedido INTEGER)
    -> RETURNS FLOAT
    -> DETERMINISTIC
    -> BEGIN
    -> DECLARE total_price FLOAT;
    -> SELECT SUM(d.cantidad * d.precio_unidad) INTO total_price FROM
    -> detalle_pedido as d WHERE d.codigo_pedido = id_pedido;
    -> RETURN total_price;
    -> END$$
Query OK, 0 rows affected (0,02 sec)

mysql> DELIMITER ;
mysql> Select calcular_precio_total_pedidos(2);
+----------------------------------+
| calcular_precio_total_pedidos(2) |
+----------------------------------+
|                             7113 |
+----------------------------------+
1 row in set (0,00 sec)
```

- Función calcular_suma_pedidos_cliente

Nota:Dado un código de cliente la función debe calcular la suma total de todos los pedidos realizados por el cliente. Deberá hacer uso de la función calcular_precio_total_pedido que ha desarrollado en el apartado anterior.

    + Parámetros de entrada: codigo_cliente (INT)
    + Parámetros de salida: La suma total de todos los pedidos del cliente (FLOAT)
```sql
mysql> DELIMITER $$
CREATE FUNCTION suma_pedidos_cliente (codigo_cliente INT)
RETURNS FLOAT
DETERMINISTIC 
BEGIN 
DECLARE total_pedidos_cliente FLOAT;
SET total_pedidos_cliente = 0.0;
SELECT SUM(calcular_precio_total_pedido(codigo_pedido)) INTO total_pedidos_cliente
FROM pedido p
WHERE p.codigo_cliente=codigo_cliente;
RETURN total_pedidos_cliente;
END $$

mysql> DELIMITER ;
select suma_pedidos_cliente(1);
+-------------------------+
| suma_pedidos_cliente(1) |
+-------------------------+
|                   10365 |
+-------------------------+
```

- Función calcular_suma_pagos_cliente

Nota:Dado un código de cliente la función debe calcular la suma total de los pagos realizados por ese cliente.
    
    + Parámetros de entrada: codigo_cliente (INT)
    + Parámetros de salida: La suma total de todos los pagos del cliente (FLOAT)
    
```sql
mysql> DELIMITER $$
mysql> CREATE FUNCTION calcular_suma_pagos_cliente(codigo_cliente INT) 
    -> RETURNS FLOAT
    -> DETERMINISTIC
    -> BEGIN
    -> DECLARE total_pagos_cliente FLOAT;
    -> SELECT SUM(total)
    -> INTO total_pagos_cliente
    -> FROM pago as p
    -> WHERE p.codigo_cliente = codigo_cliente
    -> GROUP BY codigo_cliente;
    -> RETURN total_pagos_cliente;
    -> END$$
Query OK, 0 rows affected (0,07 sec)

mysql> DELIMITER ;

SELECT calcular_suma_pagos_cliente(3);
+--------------------------------+
| calcular_suma_pagos_cliente(3) |
+--------------------------------+
|                          10926 |
+--------------------------------+
```

- Procedimiento calcular_pagos_pendientes

Nota:Deberá calcular los pagos pendientes de todos los clientes. Para saber si un cliente tiene algún pago pendiente deberemos calcular cuál es la cantidad de todos los pedidos y los pagos que ha realizado. Si la cantidad de los pedidos es mayor que la de los pagos entonces ese cliente tiene pagos pendientes.

```sql
mysql> DELIMITER $$
mysql> CREATE PROCEDURE calcular_pagos_pendientes()
    -> BEGIN
    -> DECLARE codigo_cliente_var INT;
    -> DECLARE total_pedidos FLOAT;
    -> DECLARE total_pagos FLOAT;
    -> DECLARE pagos_pendientes FLOAT;
    -> DECLARE cliente_cursor CURSOR FOR
    -> SELECT codigo_cliente FROM clientes;
    -> OPEN cliente_cursor;
    -> SET pagos_pendientes = 0.0;
    -> cliente_loop: LOOP
    ->  FETCH cliente_cursor INTO codigo_cliente_var;
    -> IF (codigo_cliente_var IS NULL) THEN
    ->  LEAVE cliente_loop;
    -> END IF;
    -> SELECT SUM(calcular_precio_total_pedido(codigo_pedido)) INTO total_pedidos
    -> FROM pedidos
    -> WHERE codigo_cliente = codigo_cliente_var;
    -> SELECT SUM(monto_pago) INTO total_pagos
    -> FROM pagos
    -> WHERE codigo_cliente = codigo_cliente_var;
    -> SET pagos_pendientes = total_pedidos - total_pagos;
    -> IF (pagos_pendientes > 0) THEN
    ->  END IF;
    -> END LOOP;
    -> CLOSE cliente_cursor;
    -> END $$
Query OK, 0 rows affected (0.03 sec)

mysql> DELIMITER ;
```

## Carga de datos

Realiza la carga de la BBDD de Jardineria y describe los pasos que has realizado.

[Jardineria Database](https://github.com/jpexposito/docencia/blob/master/Primero/BAE/UNIDAD-7/tareas/tarea5/file/jardineria.sql)
