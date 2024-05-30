Crear un procedimiento almacenado en MySQL que permita realizar depósitos 
en la cuenta de un cliente y devuelva el saldo actualizado. 
El procedimiento debe utilizar parámetros de entrada (IN), de salida (OUT), 
y de entrada/salida (INOUT).

-- Crear la tabla
``SQL
DROP TABLE IF EXISTS cuentas;
CREATE TABLE cuentas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    saldo DECIMAL(10, 2)
);
INSERT INTO cuentas (nombre, saldo) VALUES ('Juan Perez', 1000.00);
INSERT INTO cuentas (nombre, saldo) VALUES ('Maria Lopez', 1500.00);
``

-- PROCEDIMIENTO
``SQL
DROP PROCEDURE IF EXISTS deposito;
DELIMITER //
CREATE PROCEDURE deposito(
    IN nombre_cliente VARCHAR(50),
    INOUT monto DECIMAL(10, 2),
    OUT nuevo_saldo DECIMAL(10, 2)
)
BEGIN
    -- Actualizar el saldo de la cuenta
    UPDATE cuentas
    SET saldo = saldo + monto
    WHERE nombre = nombre_cliente;

    -- Obtener el nuevo saldo
    SELECT saldo INTO nuevo_saldo
    FROM cuentas
    WHERE nombre = nombre_cliente;

    -- Devolver el monto depositado (puede ser modificado dentro del procedimiento si es necesario)
    SET monto = monto;
END //
DELIMITER ;
`` 
llamando al procedimeinto para demostrar que funciona:
``SQL
-- Declarar variables para los parámetros
SET @nombre_cliente = 'Juan Perez';
SET @monto = 200.00;  -- Monto a depositar
SET @nuevo_saldo = 0.00;  -- Esta variable recibirá el nuevo saldo

-- Llamar al procedimiento
CALL deposito(@nombre_cliente, @monto, @nuevo_saldo);

-- Mostrar los resultados
SELECT @monto AS monto_depositado, @nuevo_saldo AS saldo_actual;

``