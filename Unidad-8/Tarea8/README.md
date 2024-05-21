# Programación en SLQ
## Tarea 8

<p align="center">
  <img src="https://github.com/nicholelouis/Base-datos/blob/main/img/optimizacion-bd.png?raw=true" alt="Descripción de la imagen" width="300"/>
</p>

## Trabajo con procedimientos de generación de información, Funciones y Triggers

Crea una base de datos llamada test que contenga una tabla llamada alumnos con las siguientes columnas:

Tabla alumnos:

- id (entero sin signo)
- nombre (cadena de caracteres)
- apellido1 (cadena de caracteres)
- apellido2 (cadena de caracteres)
- email (cadena de caracteres)

```sql
CREATE TABLE alumnos(
    id INT,
    nombre VARCHAR(50),
    apellido1 VARCHAR(50),
    apellido2 VARCHAR(50),
    email VARCHAR(100)
);
```
1. Escribe una función llamado crear_email que dados los parámetros de entrada: nombre, apellido1, apellido2 y dominio, cree una dirección de email y la devuelva como salida.
Función: crear_email
    Entrada:
        nombre (cadena de caracteres)
        apellido1 (cadena de caracteres)
        apellido2 (cadena de caracteres)
        dominio (cadena de caracteres)
    Salida:
    email (cadena de caracteres)

El email devuelve una dirección de correo electrónico con el siguiente formato:

El primer carácter del parámetro nombre.

Los tres primeros caracteres del parámetro apellido1.

Los tres primeros caracteres del parámetro apellido2.

El carácter @.

El dominio pasado como parámetro.

La dirección de email debe estar en minúsculas.

```sql
DELIMITER //
CREATE FUNCTION new_email(nombre VARCHAR(50), apellido1 VARCHAR(50), apellido2 VARCHAR(50), dominio VARCHAR(50))
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
DECLARE name CHAR(1);
DECLARE ap1 CHAR(3);
DECLARE ap2 CHAR(3);
DECLARE email VARCHAR(50);

SET name = drop_accent(SUBSTRING(nombre,1, 1));
SET ap1 = drop_accent(SUBSTRING(apellido1, 1, 3));
SET ap2 = drop_accent(SUBSTRING(apellido2, 1, 3));

SET email = CONCAT(UPPER(CONCAT(name, ap1, ap2)), '@', dominio, '.com');
RETURN email;

END //
DELIMITER ;
```

También crea una función llamada eliminar_acentos que reciba una cadena de caracteres y devuelva la misma cadena sin acentos. La función tendrá que reemplazar todas las vocales que tengan acento por la misma vocal pero sin acento. Por ejemplo, si la función recibe como parámetro de entrada la cadena María la función debe devolver la cadena Maria.

Función: eliminar_acentos

Entrada:
cadena (cadena de caracteres)
Salida:
(cadena de caracteres)
La función crear_email deberá hacer uso de la función eliminar_acentos.

```sql
DELIMITER //
CREATE FUNCTION drop_accent(words VARCHAR(100))
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
DECLARE txt VARCHAR(100);
SET txt = LOWER(words);

SET txt = REPLACE(txt, 'á', 'a');
SET txt = REPLACE(txt, 'é', 'e');
SET txt = REPLACE(txt, 'í', 'i');
SET txt = REPLACE(txt, 'ó', 'o');
SET txt = REPLACE(txt, 'ú', 'u');

RETURN txt;
END //
DELIMITER ;
```

Una vez creada la tabla escriba un trigger con las siguientes características:

- Trigger:
trigger_crear_email_before_insert. Se ejecuta sobre la tabla alumnos. Se ejecuta antes de una operación de inserción.Si el nuevo valor del email que se quiere insertar es NULL, entonces se le creará automáticamente una dirección de email y se insertará en la tabla. Si el nuevo valor del email no es NULL se guardará en la tabla el valor del email.

```sql
DELIMITER //
CREATE TRIGGER email_before
BEFORE INSERT ON alumnos
FOR EACH ROW
BEGIN
IF NEW.email IS NULL THEN
    SET NEW.email = new_email(NEW.nombre, NEW.apellido1, NEW.apellido2, 'default');
END IF;
END //
DELIMITER ;
```

Verificación:
- Realiza inserciones en la tabla y verifica el correcto funcionamiento de las funciones y triggers.
- Realiza un procedimiento que realice la inserción de un número de elementos que se pasa como parámetro. Incluye la máxima aleatoridad posible.

```sql
INSERT INTO alumnos (id, nombre, apellido1, apellido2) VALUES (1, 'nichole', 'arboleda', 'louis');
select * from alumnos;
+------+---------+-----------+-----------+---------------------+
| id   | nombre  | apellido1 | apellido2 | email               |
+------+---------+-----------+-----------+---------------------+
|    1 | nichole | arboleda  | louis     | NARBLOU@default.com |
+------+---------+-----------+-----------+---------------------+
```

```sql
DROP PROCEDURE IF EXISTS students_generator;
DELIMITER //
CREATE PROCEDURE students_generator(IN name_b VARCHAR(50),IN n_num INT, IN ap1 VARCHAR(50), IN ap2 VARCHAR(50), IN times INT)
BEGIN
    DECLARE COUNTER INT DEFAULT 0;
    DECLARE n VARCHAR(50);
    DECLARE a1 VARCHAR(50);
    DECLARE a2 VARCHAR(50);
    DECLARE i INT;

    WHILE counter < times DO
        SET i = FLOOR(RAND() * 10000);
        SET n = '';
        SET a1 = '';
        SET a2 = '';

        SET n = CONCAT(n, FLOOR(RAND() * n_num));
        SET a1 = CONCAT(ap1, FLOOR(RAND() * n_num));
        SET a2 = CONCAT(ap2, FLOOR(RAND() * n_num));

        INSERT INTO alumnos (id, nombre, apellido1, apellido2)
        VALUES(i, n, a1, a2);

        SET counter = counter + 1;
    END WHILE;
END //
DELIMITER ;
```
```sql
CALL students_generator('n', 1000, 'a', 'l', 10);
select * from alumnos;
+------+---------+-----------+-----------+---------------------+
| id   | nombre  | apellido1 | apellido2 | email               |
+------+---------+-----------+-----------+---------------------+
|    1 | nichole | arboleda  | louis     | NARBLOU@default.com |
|  951 | 656     | a998      | l23       | 6A99L23@default.com |
| 1201 | 530     | a294      | l878      | 5A29L87@default.com |
| 5096 | 912     | a34       | l434      | 9A34L43@default.com |
|  700 | 46      | a20       | l962      | 4A20L96@default.com |
| 7532 | 877     | a129      | l15       | 8A12L15@default.com |
| 6873 | 390     | a891      | l284      | 3A89L28@default.com |
| 7503 | 897     | a234      | l480      | 8A23L48@default.com |
| 7003 | 59      | a196      | l805      | 5A19L80@default.com |
| 4386 | 775     | a561      | l481      | 7A56L48@default.com |
| 7217 | 164     | a659      | l801      | 1A65L80@default.com |
+------+---------+-----------+-----------+---------------------+
```