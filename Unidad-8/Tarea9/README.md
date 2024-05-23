# Programación en SLQ
## Tarea 8

<p align="center">
  <img src="https://github.com/nicholelouis/Base-datos/blob/main/img/optimizacion-bd.png?raw=true" alt="Descripción de la imagen" width="300"/>
</p>

## Trabajo con procedimientos de generación de información, Funciones y Triggers

```sql
DROP TABLE IF EXISTS alumnos;
CREATE TABLE alumnos(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido1 VARCHAR(50),
    apellido2 VARCHAR(50),
    email VARCHAR(100)
);

INSERT INTO alumnos(nombre, apellido1, apellido2, email) VALUES ('armandito', 'jose', 'v', 'av@gmail.com'), ('nikki', 'louis', 'a', 'nikki@gmail.com');

select * from alumnos;
+----+-----------+-----------+-----------+-----------------+
| id | nombre    | apellido1 | apellido2 | email           |
+----+-----------+-----------+-----------+-----------------+
|  1 | armandito | jose      | v         | ajvm@gmail.com  |
|  2 | nikki     | louis     | a         | nikki@gmail.com |
+----+-----------+-----------+-----------+-----------------+
```

- Modifica el ejercicio anterior y añade un nuevo trigger que las siguientes características: 

Se ejecuta sobre la tabla alumnos.

Se ejecuta después de una operación de actualización.

Cada vez que un alumno modifique su dirección de email se deberá 

insertar un nuevo registro en una tabla llamada log_cambios_email.
La tabla log_cambios_email contiene los siguientes campos:
- id: clave primaria (entero autonumérico)
- id_alumno: id del alumno (entero)
- fecha_hora: marca de tiempo con el instante del cambio (fecha y hora)
- old_email: valor anterior del email (cadena de caracteres)
- new_email: nuevo valor con el que se ha actualizado

```sql
DROP TABLE IF EXISTS log_cambios_email;
CREATE TABLE log_cambios_email(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_alumno INT,
    fecha_hora DATETIME,
    old_email VARCHAR(100),
    new_email VARCHAR(100)
);
```
```sql
DROP TRIGGER IF EXISTS log_cambio;
DELIMITER //
CREATE TRIGGER log_cambio
BEFORE UPDATE ON alumnos
FOR EACH ROW
BEGIN
    IF NEW.email <> OLD.email THEN
        INSERT INTO log_cambios_email(id_alumno, fecha_hora, old_email, new_email) VALUES (OLD.id, Now(), OLD.email, NEW.email);
    END IF;
END //
DELIMITER ;
```

```sql
UPDATE alumnos SET email = 'ajvmn@gmail.com' where id = 1;
select * from log_cambios_email;
+----+-----------+---------------------+----------------+-----------------+
| id | id_alumno | fecha_hora          | old_email      | new_email       |
+----+-----------+---------------------+----------------+-----------------+
|  1 |         1 | 2024-05-23 04:04:07 | ajvm@gmail.com | ajvmn@gmail.com |
+----+-----------+---------------------+----------------+-----------------+
```

- Añade un nuevo trigger que tenga las siguientes características:

Se ejecuta sobre la tabla alumnos.
Se ejecuta después de una operación de borrado.
Cada vez que se elimine un alumno de la tabla alumnos se deberá insertar un nuevo registro en una tabla llamada log_alumnos_eliminados.

La tabla log_alumnos_eliminados contiene los siguientes campos:
- id: clave primaria (entero autonumérico)
- id_alumno: id del alumno (entero)
- fecha_hora: marca de tiempo con el instante del cambio (fecha y hora)
- nombre: nombre del alumno eliminado (cadena de caracteres)
- apellido1: primer apellido del alumno eliminado (cadena de caracteres)
- apellido2: segundo apellido del alumno eliminado (cadena de caracteres)
- email: email del alumno eliminado (cadena de caracteres).

```sql
CREATE TABLE log_alumnos_eliminados(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_alumno INT,
    fecha_hora DATE,
    nombre VARCHAR(50),
    apellido1 VARCHAR(50),
    apellido2 VARCHAR(50),
    email VARCHAR(50)
);
```
```sql
DELIMITER //
CREATE TRIGGER  del_alu
AFTER DELETE ON alumnos
FOR EACH ROW
BEGIN
    INSERT INTO log_alumnos_eliminados(id_alumno, fecha_hora, nombre, apellido1, apellido2, email) VALUES(OLD.id, Now(), OLD.nombre, OLD.apellido1, OLD.apellido2, OLD.email);
END //
DELIMITER ;
```

```sql
DELETE FROM alumnos WHERE id = 2;
select * from log_alumnos_eliminados;
+----+-----------+------------+--------+-----------+-----------+-----------------+
| id | id_alumno | fecha_hora | nombre | apellido1 | apellido2 | email           |
+----+-----------+------------+--------+-----------+-----------+-----------------+
|  1 |         2 | 2024-05-23 | nikki  | louis     | a         | nikki@gmail.com |
+----+-----------+------------+--------+-----------+-----------+-----------------+
```