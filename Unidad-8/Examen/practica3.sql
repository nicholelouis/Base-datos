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


1. procedimeinto informacion aleatorias
``SQL
DROP PROCEDURE IF EXISTS;
DELIMITER //
CREATE PROCEDURE add_accounts(IN name VARCHAR(50), IN min INTEGER, IN max INTEGER, IN times INT)
BEGIN
DECLARE counter INTEGER DEFAULT 0;
DECLARE nombre_ VARCHAR(50);
DECLARE saldo_ DECIMAL(10, 2);

    WHILE counter < times DO
        SET nombre_ = CONCAT(name, FLOOR(RAND() * (1000 - 1) + 1));
        SET saldo_ = min + RAND() * (max - min);

        INSERT INTO cuentas(nombre, saldo) VALUES (
            nombre_,
            saldo_
        );
        SET counter = counter + 1;
    END WHILE;
END //
DELIMITER ;
``

2. Realiza un procedimiento que permita realizar un depósito en la cuenta de un cliente y devolver el 
saldo actualizado. El procedimiento debe tener los siguientes parámetros:

IN nombre_cliente: El nombre del cliente que recibirá el depósito.
INOUT monto: El monto a depositar. Este parámetro debe pasar el valor de entrada y devolver 
el mismo valor después del depósito.
OUT nuevo_saldo: El nuevo saldo de la cuenta después del depósito

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
-- llamando al procedimeinto para demostrar que funciona:
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

3. Realiza un procedimiento que permita realizar una retirada de dinero de la cuenta de un cliente y 
devolver el saldo actualizado. El procedimiento debe tener los siguientes parámetros:

IN nombre_cliente: El nombre del cliente que realizará la retirada.
INOUT monto: El monto a retirar. Este parámetro debe pasar el valor de entrada y devolver el mismo 
valor después de la retirada.
OUT nuevo_saldo: El nuevo saldo de la cuenta después de la retirada.

``SQL
DROP PROCEDURE IF EXISTS retiro;
DELIMITER //
CREATE PROCEDURE retiro(IN nombre_cliente VARCHAR(50), INOUT monto DECIMAL(10, 2), OUT nuevo_saldo DECIMAL(10, 2))
BEGIN
    UPDATE cuentas
    SET saldo = saldo - monto
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
CALL retiro(@nombre_cliente, @monto, @nuevo_saldo);

Funciones

1. Realiza una función que calcule el saldo total de todas las cuentas.
``SQL
DROP FUNCTION IF EXISTS calcular_saldo_total;
DELIMITER //
CREATE FUNCTION calcular_saldo_total() 
RETURNS DECIMAL(10, 2)
READS SQL DATA
BEGIN
    DECLARE total DECIMAL(10, 2);
    SELECT SUM(saldo) INTO total FROM cuentas;
    RETURN total;
END //
DELIMITER ;
select calcular_saldo_total();
``

2. Realiza una función que devuelva el nombre del cliente con el saldo más alto.
``SQL
DROP FUNCTION IF EXISTS cliente_mas_saldo;
DELIMITER //
CREATE FUNCTION cliente_mas_saldo() 
RETURNS VARCHAR(50)
READS SQL DATA
BEGIN
    DECLARE max_saldo DECIMAL(10, 2);
    DECLARE cliente VARCHAR(50);
    SELECT nombre INTO cliente FROM cuentas WHERE saldo = (SELECT MAX(saldo) FROM cuentas);
    RETURN cliente;
END //
DELIMITER ;
select cliente_mas_saldo();
``

Disparadores (Triggers)

1. Realiza un trigger que actualice el saldo total de todas las cuentas cada vez que se realice un 
depósito o una retirada.
``SQL
DROP TRIGGER IF EXISTS actualizar_saldo_total;
DELIMITER //
CREATE TRIGGER actualizar_saldo_total
AFTER INSERT ON transacciones
FOR EACH ROW
BEGIN
    DECLARE total DECIMAL(10, 2);
    SELECT SUM(saldo) INTO total FROM cuentas;
    UPDATE saldo_total SET total = total;
END;
//
DELIMITER ;
``

2. Realiza un trigger que elimine automáticamente una cuenta cuando su saldo sea igual a cero después 
de una retirada.
``SQL
DROP TRIGGER IF EXISTS eliminar_cuenta;
DELIMITER //
CREATE TRIGGER eliminar_cuenta
AFTER UPDATE ON cuentas
FOR EACH ROW
BEGIN
    IF NEW.saldo <= 0 THEN
        DELETE FROM cuentas WHERE id = NEW.id;
    END IF;
END;
//
DELIMITER ;
``