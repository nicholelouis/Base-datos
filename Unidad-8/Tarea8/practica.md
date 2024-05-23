```sql
Escribe un procedimiento almacenado que copie los nombres de todos los empleados cuyo salario sea superior a 3000 en una nueva tabla llamada 'empleados_destino'. Es necesario crear la tabla empleados_destiono.

DELIMITER //
CREATE PROCEDURE mas_3000()
BEGIN
    CREATE TABLE IF NOT EXISTS empleados_destino(
        id INT AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(50)
    );

    INSERT INTO empleados_destino(nombre)
    SELECT nombre FROM empleados WHERE salario > 3000;
END //
DELIMITER ;


Escribe un procedimiento almacenado que seleccione los empleados cuyos nombres contienen la letra 'a' y aumente sus salarios en un 10%.
DELIMITER //
CREATE PROCEDURE mas_10()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE emp_id INT;
    DECLARE emp_sal DECIMAL(10, 2);
    DECLARE cur CURSOR for select id, salario from empleados where nombre REGEXP 'a|A';
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO emp_id, emp_sal;
        IF done THEN 
            LEAVE read_loop;
        END IF;
        UPDATE empleados SET salario = (salario + salario * 0.1) where id = emp_id;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;


Escribe un procedimiento almacenado que seleccione empleados cuyos IDs estén en un rango específico, por ejemplo, entre 2 y 3.

DELIMITER //
CREATE PROCEDURE sel_emp(IN n1 INT, IN n2 INT)
BEGIN
    select * from empleados where id between n1 and n2;
END //
DELIMITER ;


Escribe un procedimiento almacenado que elimine todos los empleados cuyo salario esté entre 2000 y 2500.

DELIMITER //
CREATE PROCEDURE drop_emp(IN min DECIMAL(10, 2), IN max DECIMAL(10, 2))
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE emp_id INT;
    DECLARE emp_sal DECIMAL(10, 2);
    DECLARE cur CURSOR for select id, salario from empleados where salario BETWEEN min and max;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO emp_id, emp_sal;
        IF done THEN 
            LEAVE read_loop;
        END IF;
        DELETE from empleados where id = emp_id;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;


Escribe un procedimiento almacenado que aumente el salario de un empleado específico cuyo nombre se pasa como parámetro en un 20%.

DELIMITER //
CREATE PROCEDURE aumentar(IN id_em INT, IN percent INT)
BEGIN
    UPDATE empleados SET salario = salario + (salario * (percent / 100)) where id = id_em;
END //
DELIMITER ;


Crea procedimientos almacenados para realizar operaciones como insertar un nuevo usuario, actualizar el nombre de un usuario, etc.
Procedimiento para insertar un nuevo usuario.
Procedimiento para actualizar el nombre de un usuario.

DELIMITER //
CREATE PROCEDURE new_user ( IN p_UserName VARCHAR(50), IN p_Email VARCHAR(100))
BEGIN
    INSERT INTO Users (UserName, Emai)
```


PRACTIA EXAMEN
Ejercicio 1: Generación de Usuarios y Registro de Cambios***
##### Crea un procedimiento almacenado que genere un número especificado de usuarios aleatorios en la tabla users, y crea un trigger que registre cualquier cambio en los detalles de los usuarios en una tabla user_changes. 

# Procedimiento
```sql
CREATE TABLE user(
    id INT PRIMARY KEY,
    name VARCHAR(50),
    apellido1 VARCHAR(50),
    salario DECIMAL (10, 2)
);
```

```sql
DELIMITER //
CREATE PROCEDURE users_generator(IN name_base VARCHAR(50), IN name_num INT, IN ape_base VARCHAR(50), IN min_sal DECIMAL(10,2), IN max_sal DECIMAL(10,2), IN times INT)
BEGIN
    DECLARE counter INT DEFAULT 0;
    WHILE counter < times DO
        INSERT INTO user(id, name, apellido1, salario) VALUES (
            FLOOR(RAND() * 10000),
            CONCAT(name_base, FLOOR(RAND() * name_num)),
            CONCAT(ape_base, FLOOR(RAND() * name_num)),
            min_sal + FLOOR(RAND() * (max_sal - min_sal))
        );
        SET counter = counter + 1;
    END WHILE;
END //
DELIMITER ;
```
# TRIGGER 
```sql
CREATE TABLE user_changes(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_user INT,
    old_name VARCHAR(50),
    new_name VARCHAR(50),
    old_apellido VARCHAR(50),
    new_apellido VARCHAR(50),
    old_salario DECIMAL(10, 5),
    new_salario DECIMAL(10, 5),
    data_time DATETIME
);

DROP TRIGGER IF EXISTS alter_users;
DELIMITER //
CREATE TRIGGER alter_users
AFTER UPDATE ON user
FOR EACH ROW
BEGIN
    INSERT INTO user_changes(id_user, old_name, new_name, old_apellido, new_apellido, old_salario, new_salario, data_time) VALUES(
        OLD.id,
        OLD.name,
        NEW.name,
        OLD.apellido1,
        NEW.apellido1,
        OLD.salario,
        NEW.salario,
        NOW()
    );
END //
DELIMITER ;
```

Ejercicio 2: Procesamiento de Pedidos y Actualización de Inventario ***

##### Crea un procedimiento almacenado que procese todos los pedidos pendientes, actualizando el estado del pedido a 'processed' y decrementando el inventario en la tabla inventory. Usa un cursor para recorrer los pedidos.

```sql
CREATE TABLE pedidos(
    id INT AUTO_INCREMENT PRIMARY KEY,
    articulo VARCHAR(50),
    cantidad INT,
    status VARCHAR(50)
);

INSERT INTO pedidos(articulo, cantidad, status) VALUES ('carro', 2, 'pending'),  ('carro', 52, 'pending'),
 ('iphone', 345, 'pending');

CREATE TABLE inventory(
    id INT AUTO_INCREMENT PRIMARY KEY,
    producto VARCHAR(50),
    inventario INT
);

INSERT INTO inventory(producto, inventario) VALUES ('carro', 292), ('iphone', 738);
```

# PROCEDIMIENTO
```sql
DELIMITER //
CREATE PROCEDURE inventory_status()
BEGIN
DECLARE done INT DEFAULT FALSE;
DECLARE pedido_id INT;
DECLARE pedido_cantidad INT;
DECLARE pedido_articulo VARCHAR(50);

DECLARE cur CURSOR FOR SELECT id, cantidad, articulo FROM pedidos WHERE status = 'pending';
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

OPEN cur;
read_loop: LOOP
    FETCH cur INTO pedido_id, pedido_cantidad, pedido_articulo;
    IF done THEN
        LEAVE read_loop;
    END IF;

    UPDATE pedidos SET status = 'processed' WHERE id = pedido_id;

    UPDATE inventory SET inventario = inventario - pedido_cantidad WHERE producto = pedido_articulo;
END LOOP;
CLOSE cur;
END //
DELIMITER ;
```

Ejercicio 3: Función de Descuento y Trigger de Precios***

##### Crea una función que calcule el precio final después de aplicar un descuento, y un trigger que use esta función para actualizar el precio de un producto antes de insertarlo en la tabla products.

```sql
CREATE TABLE products(
    id INT AUTO_INCREMENT PRIMARY KEY,
    producto VARCHAR(50),
    precio DECIMAL(10, 2)
);

INSERT INTO products(producto, precio) VALUES ('iphone', 1098);

DELIMITER //
CREATE FUNCTION percent(pre DECIMAL(10, 2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
DECLARE total DECIMAL(10,2);
DECLARE percent INT;
SET percent = 10;

    SET total = pre - (pre * (percent / 100));
    RETURN total;

END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER actualiza_precio
BEFORE INSERT ON products
FOR EACH ROW
BEGIN
    SET NEW.precio = percent(NEW.precio);
END //
DELIMITER ;



mysql> select * from products;
+----+----------+--------+
| id | producto | precio |
+----+----------+--------+
|  1 | iphone   | 988.20 |
+----+----------+--------+
```

Ejercicio 4: Generación y Procesamiento de Pedidos***

##### Crea un procedimiento almacenado que genere pedidos aleatorios y otro procedimiento que procese esos pedidos, actualizando el inventario y el estado del pedido. Usa triggers para asegurar integridad en la cantidad de los pedidos.

```sql
CREATE TABLE pedidos(
    id VARCHAR(50) PRIMARY KEY,
    cosa VARCHAR(50),
    status VARCHAR(50),
    cant INT
);

CREATE TABLE inventory(
    id INT AUTO_INCREMENT PRIMARY KEY,
    producto VARCHAR(50),
    inventario INT
);
```
```sql
DROP FUNCTION IF EXISTS namess;
DELIMITER //
CREATE FUNCTION namess(p_name VARCHAR(50), p_num INT)
RETURNS VARCHAR(50)
NO SQL
BEGIN
DECLARE result VARCHAR(50);
SET result = CONCAT(p_name, FLOOR(RAND() * p_num));
RETURN result;
END //
DELIMITER ;

DROP FUNCTION IF EXISTS random_num;
DELIMITER //
CREATE FUNCTION random_num(min INT, max INT)
RETURNS INT
NO SQL
BEGIN
DECLARE result INT;
SET result = min + FLOOR(RAND() * (max - min));
RETURN result;
END //
DELIMITER ;

DROP FUNCTION IF EXISTS id_generator;
DELIMITER //
CREATE FUNCTION id_generator()
RETURNS VARCHAR(50)
NO SQL
BEGIN
DECLARE result VARCHAR(50);
SET result = SUBSTRING_INDEX(UUID(), '-', 1);
RETURN result;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS pedidos_generator;
DELIMITER //
CREATE PROCEDURE pedidos_generator(IN p_name VARCHAR(50), IN p_num INT, IN c_min INT, IN c_max INT, IN times INT)
BEGIN

DECLARE counter INT DEFAULT 0;
DECLARE id_ VARCHAR(50);
DECLARE name VARCHAR(50);
DECLARE cantidad INT;
DECLARE stat VARCHAR(50) DEFAULT 'pending';

WHILE counter < times DO
    SET id_ = id_generator();
    SET name = namess(p_name, p_num);
    SET cantidad = random_num(c_min, c_max);

    INSERT INTO pedidos (id, cosa, status, cant) VALUES (
        id_,
        name,
        stat,
        cantidad
    );
    INSERT INTO inventory(producto, inventario) VALUES(
        name,
        c_max + random_num(c_min, c_max)
    );
    SET counter = counter + 1;
END WHILE;
END //
DELIMITER ;
call pedidos_generator('producto', 100, 5, 532, 2);

DROP PROCEDURE IF EXISTS act_pedidos;
DELIMITER //
CREATE PROCEDURE act_pedidos()
BEGIN
DECLARE done INT DEFAULT FALSE;
DECLARE pedido_id VARCHAR(50);
DECLARE pedido_cantidad INT;
DECLARE pedido_cosa VARCHAR(50);

DECLARE cur CURSOR FOR SELECT id, cant, cosa FROM pedidos WHERE status = 'pending';
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

OPEN cur;
read_loop: LOOP
    FETCH cur INTO pedido_id, pedido_cantidad, pedido_cosa;
    IF done THEN
        LEAVE read_loop;
    END IF;

    UPDATE pedidos SET status = 'processed' WHERE id = pedido_id;

    UPDATE inventory SET inventario = inventario - pedido_cantidad WHERE producto = pedido_cosa;
END LOOP;
CLOSE cur;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS pen;
DELIMITER //
CREATE TRIGGER pen
BEFORE INSERT ON pedidos
FOR EACH ROW
BEGIN

DECLARE cantidad INT;
SELECT inventario INTO cantidad FROM inventory WHERE producto = NEW.cosa;
    IF NEW.cant > cantidad THEN
        SET NEW.cant = cantidad;
    ELSEIF NEW.cant < 0 THEN
        SET NEW.cant = 0;
    END IF;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS pen2;
DELIMITER //
CREATE TRIGGER pen2
BEFORE INSERT ON inventory
FOR EACH ROW
BEGIN
    IF NEW.inventario < 0 THEN
        SET NEW.inventario = 0;
    END IF;
END //
DELIMITER ;
```

Ejercicio 5: Función de UUID y Trigger de Registro de Cambios***

##### Crea una función que genere un UUID y un trigger que use esta función para registrar cualquier cambio en los precios de los productos en una tabla price_changes.
```sql
CREATE TABLE ventas(
    id INT AUTO_INCREMENT PRIMARY KEY,
    cosa VARCHAR(50),
    price DECIMAL(10, 2)
);

INSERT INTO ventas(cosa, price) VALUES ('carrito', 2000), ('viaje', 10000);

CREATE TABLE price_changes(
    id VARCHAR(50) PRIMARY KEY,
    cosa VARCHAR(50),
    old_price DECIMAL(10, 2),
    new_price DECIMAL(10, 2),
    data_change DATETIME
);

DELIMITER //
CREATE FUNCTION id_generator()
RETURNS VARCHAR(50)
NO SQL
BEGIN
DECLARE result VARCHAR(50);
SET result = SUBSTRING_INDEX(UUID(), '-', 1);
RETURN result;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS pen3;
DELIMITER //
CREATE TRIGGER pen3
BEFORE UPDATE ON ventas
FOR EACH ROW
BEGIN
    INSERT INTO price_changes(id, cosa, old_price, new_price, data_change) VALUES (
        id_generator(),
        OLD.cosa,
        OLD.price,
        NEW.price,
        NOW()
    );
END //
DELIMITER ;
```