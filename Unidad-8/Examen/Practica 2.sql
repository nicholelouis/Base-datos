--¿Sabías que la gestión adecuada del inventario es crucial para el éxito de cualquier tienda? Aunque existen ciertas condiciones que debes cumplir para mantener un inventario eficiente. Descubre los requisitos básicos para la gestión de inventarios.

-- Para gestionar el inventario se deben cumplir varias condiciones:

-- El producto debe tener un precio superior a $0.
-- No haber recibido un nuevo lote del mismo producto en un periodo anterior a 30 días.
-- Teniendo en cuenta esta información se pide:

-- Crea una base de datos llamada inventario.

create table inventario(
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    precio DECIMAL(10, 2),
    stock INTEGER,
    categoria VARCHAR(50),
    fecha_ultima_entrada DATETIME
);

-- Crea una tabla llamada producto con los siguientes campos:

-- Identificador Auto Incremental (Integer) PK
-- Nombre del producto (Texto) 
-- Precio (Decimal)
-- Stock (Entero)
-- Categoría (Texto)
-- Fecha Última Entrada (Datetime)


-- Se pide:

-- Realiza los siguientes procedimientos:

-- (1) Realizar un procedimiento que realice la inserción de datos aleatorios en la tabla. El procedimiento debe recibir como parámetro de entrada, al menos, el número de registros que se desea insertar y se debe lanzar, al menos, en dos ocasiones, para verificar su correcto funcionamiento. Los datos deben ser aleatorios, es decir, en cada inserción se debe auto generar o seleccionar uno al azar, de los campos requeridos.

DROP FUNCTION IF EXISTS random_name;
DELIMITER //
CREATE FUNCTION random_name(sname VARCHAR(50))
RETURNS VARCHAR(50)
NO SQL
BEGIN
DECLARE result VARCHAR(50);
SET result = CONCAT(sname, FLOOR(RAND() * 1000 - 1));
RETURN result;
END //
DELIMITER ;

DROP FUNCTION IF EXISTS random_price;
DELIMITER //
CREATE FUNCTION random_price(pmin INTEGER, pmax INTEGER)
RETURNS DECIMAL(10, 2)
NO SQL
BEGIN
DECLARE result DECIMAL(10, 2);
SET result = pmin + (RAND() * (pmax - pmin));
RETURN result;
END //
DELIMITER ;

DELIMITER //
CREATE FUNCTION random_stock(pmin INTEGER, pmax INTEGER)
RETURNS INTEGER
NO SQL
BEGIN
DECLARE result INTEGER;
SET result = pmin + FLOOR(RAND() * (pmax - pmin));
RETURN result;
END //
DELIMITER ;

DELIMITER //
CREATE FUNCTION random_date(date DATETIME)
RETURNS DATETIME
NO SQL
BEGIN
DECLARE result DATETIME;
SET result = (SELECT DATE_ADD(date, INTERVAL FLOOR(RAND() * 365) DAY));
RETURN result;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS get_random_inventory;
DELIMITER //
CREATE PROCEDURE get_random_inventory(IN sname VARCHAR(50), IN pmin INTEGER, IN pmax INTEGER, IN smin INTEGER, IN smax INTEGER, IN datet DATETIME, IN scate VARCHAR(50), IN times INTEGER)
BEGIN

DECLARE counter INTEGER DEFAULT 0;
DECLARE name VARCHAR(50);
DECLARE pre DECIMAL(10, 2);
DECLARE stc INTEGER;
DECLARE categ VARCHAR(50);
DECLARE fec DATETIME;

WHILE counter < times DO

    SET name = random_name(sname);
    SET pre = random_price(pmin, pmax);
    SET stc = random_stock(smin, smax);
    SET categ = random_name(scate);
    SET fec = random_date(datet);
    INSERT INTO inventario(nombre, precio, stock, categoria, fecha_ultima_entrada) VALUES (name, pre, stc, categ, fec);
    SET counter = counter + 1;
END WHILE;
END //
DELIMITER ;


-- (2) Realiza un procedimiento que permita actualizar la fecha de última entrada, teniendo como parámetro de entrada el identificador del producto y una fecha.

DROP PROCEDURE IF EXISTS act_fecha;
DELIMITER //
CREATE PROCEDURE act_fecha(IN id_ INTEGER, IN fecha DATETIME)
BEGIN
    UPDATE inventario SET fecha_ultima_entrada = fecha WHERE id = id_;
END //
DELIMITER ;


-- (3) Crea un procedimiento llamado CalcularTotalStock que calcule la cantidad total de productos en stock por cada categoría y la almacene en una tabla llamada total_stock. La tabla total_stock debe tener dos columnas: categoria (texto) y cantidad_total (integer).

CREATE TABLE total_stock(
    categoria VARCHAR(50),
    cant_total INTEGER
);

-- OPCIÓN 1
DELIMITER //
CREATE PROCEDURE calc_total_stock()
BEGIN
 INSERT INTO total_stock(categoria, cant_total) SELECT categoria, SUM(stock) FROM inventario GROUP BY categoria;
END //
DELIMITER ;

-- OPCION 2
DROP PROCEDURE IF EXISTS calc_total_stock;
DELIMITER //

CREATE PROCEDURE calc_total_stock()
BEGIN
    INSERT INTO total_stock(categoria, cant_total)
    SELECT categoria, SUM(stock) 
    FROM inventario
    GROUP BY categoria
    ON DUPLICATE KEY UPDATE
    cant_total = VALUES(cant_total);
END //

DELIMITER ;


-- (4) Crea un procedimiento que permita eliminar una categoría de la tabla total_stock.

DROP PROCEDURE IF EXISTS drop_category;
DELIMITER //
CREATE PROCEDURE drop_category(IN catg VARCHAR(50))
BEGIN
    DELETE FROM total_stock WHERE categoria = catg;
END //
DELIMITER ;

-- Realizar cada una de las siguientes funciones:

-- (1) Realiza una función que determine si un producto almacenado en la tabla producto puede recibir una nueva entrada. 
-- Para ello, la función recibe como parámetro de entrada el identificador del producto y una fecha de entrada. Revisa las 
-- condiciones para que un producto pueda o no recibir una nueva entrada. Posteriormente, actualice el valor de la última entrada del producto indicado con el parámetro de entrada.

DROP FUNCTION IF EXISTS update_stock;
DELIMITER //
CREATE FUNCTION update_stock(id_ INTEGER, fecha DATETIME)
RETURNS BOOLEAN
READS SQL DATA
BEGIN
    DECLARE puede_recibir BOOLEAN DEFAULT FALSE;
    DECLARE ultima_entrada DATE;
    DECLARE pre DECIMAL(10, 2);

    SELECT MAX(fecha_ultima_entrada), MAX(precio) INTO ultima_entrada, pre FROM inventario WHERE id = id_;

    IF ultima_entrada IS NULL OR DATEDIFF(fecha, ultima_entrada) > 30 THEN
        IF pre > 0 THEN
            SET puede_recibir = TRUE;
        END IF;
    END if;

    IF puede_recibir THEN
        UPDATE inventario SET fecha_ultima_entrada = fecha WHERE id = id_;
    END IF;

    RETURN puede_recibir;
END //
DELIMITER ;


-- (2) Realiza una función que determine cuál es la categoría con más productos en stock.

DROP FUNCTION IF EXISTS more_stock;
DELIMITER //
CREATE FUNCTION more_stock()
RETURNS VARCHAR(50)
READS SQL DATA
BEGIN
DECLARE result VARCHAR(50);
    SELECT categoria INTO result
    FROM inventario
    ORDER BY stock DESC
    LIMIT 1;
    RETURN result;
END //
DELIMITER ;

-- Triggers

-- (1) Realiza un trigger que actualice total_stock con cada una de las inserciones que se realicen en la tabla producto.

DROP TRIGGER IF EXISTS act_stock;
DELIMITER //
CREATE TRIGGER act_stock
AFTER INSERT ON inventario
FOR EACH ROW
BEGIN
    CALL calc_total_stock();
END //
DELIMITER ;
    

-- (2) Realiza un trigger que elimine todos los registros en la tabla producto cuando se elimine un registro de la tabla total_stock.

DROP TRIGGER IF EXISTS drop_prod;
DELIMITER //
CREATE TRIGGER drop_prod
AFTER DELETE ON total_stock
FOR EACH ROW
BEGIN
    DELETE FROM inventario WHERE categoria = OLD.categoria;
END //
DELIMITER ;
