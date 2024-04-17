# Programación en SQL
## Tarea 1

En este ejercicio, vamos a trabajar en la creación de una base de datos simple utilizando MySQL. Esta base de datos estará diseñada para administrar información de usuarios y productos. Una vez que hayamos creado la base de datos y las tablas necesarias, vamos a implementar procedimientos almacenados y funciones para realizar operaciones comunes sobre estos datos.

Pasos:
- Crea la Base de datos
```sql
CREATE DATABASE IF NOT EXISTS SimpleDB;

USE SimpleDB;

CREATE TABLE IF NOT EXISTS Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    UserName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL
);
```

- Realiza la inserción de algunos datos de prueba
```sql

INSERT INTO Users (UserName, Email) VALUES ('Juan', 'juan@example.com');
INSERT INTO Users (UserName, Email) VALUES ('María', 'maria@example.com');
INSERT INTO Users (UserName, Email) VALUES ('Pedro', 'pedro@example.com');

INSERT INTO Products (ProductName, Price) VALUES ('Producto 1', 10.99);
INSERT INTO Products (ProductName, Price) VALUES ('Producto 2', 20.50);
INSERT INTO Products (ProductName, Price) VALUES ('Producto 3', 15.75);

+--------+-----------+-------------------+
| UserID | UserName  | Email             |
+--------+-----------+-------------------+
|      1 | Juan      | juan@example.com  |
|      2 | María     | maria@example.com |
|      3 | Pedro     | pedro@example.com |
|      4 | Nichole   | niiki@jp.com      |
|      5 | Armando   | ajvm@gmail.com    |
|      6 | Sebastian | sebas@example.com |
+--------+-----------+-------------------+
```
- Crea procedimientos almacenados para realizar operaciones como:
    - Insertar un nuevo usuario
```sql
DELIMITER //
mysql> CREATE PROCEDURE new_user(
    -> IN nombre VARCHAR(50),
    -> IN email VARCHAR(50))
    -> BEGIN
    -> INSERT INTO Users (UserName, Email) VALUES (nombre, email);
    -> END //
Query OK, 0 rows affected (0,02 sec)

CALL new_user('nico', 'nico@gmail.com');
select * from Users;
+--------+-----------+-------------------+
| UserID | UserName  | Email             |
+--------+-----------+-------------------+
|      1 | Juan      | juan@example.com  |
|      2 | María     | maria@example.com |
|      3 | Pedro     | pedro@example.com |
|      4 | Nichole   | niiki@jp.com      |
|      5 | Armando   | ajvm@gmail.com    |
|      6 | Sebastian | sebas@example.com |
|      7 | nico      | nico@gmail.com    |
+--------+-----------+-------------------+
```

```sql

- Actualizar el nombre de un usuario.
DELIMITER //
mysql> CREATE PROCEDURE modify_user( IN id INTEGER, IN nombre VARCHAR(50),
IN email VARCHAR(50))
BEGIN
UPDATE Users set UserName=nombre, Email=email WHERE UserID=id;
END//
Query OK, 0 rows affected (0,01 sec)
mysql> DELIMITER ;

CALL modify_user(3, 'tiff', 'tiff@gmail.com');
Query OK, 1 row affected (0,01 sec)
mysql> select * from Users;
+--------+-----------+-------------------+
| UserID | UserName  | Email             |
+--------+-----------+-------------------+
|      1 | Juan      | juan@example.com  |
|      2 | María     | maria@example.com |
|      3 | tiff      | tiff@gmail.com    |
|      4 | Nichole   | niiki@jp.com      |
|      5 | Armando   | ajvm@gmail.com    |
|      6 | Sebastian | sebas@example.com |
|      7 | nico      | nico@gmail.com    |
+--------+-----------+-------------------+
```

- Implementa funciones para realizar cálculos o consultas:

    - Función para calcular el precio total de un conjunto de productos.
```sql
DELIMITER //
mysql> CREATE PROCEDURE total_price()
    -> BEGIN
    -> DECLARE total DECIMAL(10, 2);
    -> SELECT SUM(Price) INTO total FROM Products;
    -> SELECT total;
    -> END //
Query OK, 0 rows affected (0,01 sec)
mysql> DELIMITER ;

CALL total_price;
+--------+
| total  |
+--------+
| 161.35 |
+--------+
```
- Función para contar el número de usuarios.
```sql
DELIMITER //
mysql> CREATE PROCEDURE total_users()
BEGIN
DECLARE total_u INTEGER;
SELECT COUNT(UserID) INTO total_u FROM Users;
SELECT total_u;
END//
Query OK, 0 rows affected (0,01 sec)
mysql> DELIMITER ;

mysql> call total_users;
+---------+
| total_u |
+---------+
|       7 |
+---------+
```








