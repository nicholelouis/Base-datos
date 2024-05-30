¿Sabías que la mayoría de los adultos sanos pueden ser donantes? Aunque existen ciertas condiciones que debes cumplir para realizar con éxito una donación. Descubre los requisitos básicos para donar sangre.

Para la poder donar sangre se deben cumplir varias condiciones:

- Tener un peso superior a 50Kg.
- No haber donado en un periodo anterior a 90 días en caso de ser hombre y 120 días en caso de mujer.
- Teniendo en cuenta esta información se pide:

Crea una base datos llamada donación.
Crea una tabla llamada persona con los siguientes campos:

- Identificador Auto Incremental (Integer) PK
- Identificador (Texto)
- Peso. (Entero)
- Admitido. Texto(Si/No).(Valores de dominio:Si/No)
- Sexo. Texto (H/M).(Valores de dominio:H/M)
- Fecha Última Donación.

``SQL
DROP TABLE IF EXISTS persona;
CREATE TABLE persona(
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    identificador VARCHAR(50),
    peso INTEGER,
    admitido ENUM ('si', 'no'),
    sexo ENUM ('M', 'H'),
    fecha DATE
);
``

Se pide:

1. Realizar un procedimiento que realice la inserción de datos aleatorios en la tabla. 
El procedimiento debe de recibir como parámetro de entrada, al menos, el número de registros que se 
desea insertar y se debe de lanzar, al menos, en dos ocasiones, para verificar su correcto funcionamiento. 
Los datos deben de ser aleatorios, es decir, en cada inserción de debe de auto generar o seleccionar uno al 
azar, de los campos requeridos.


creación de funciones para el random:
``SQL
DROP FUNCTION IF EXISTS random_id;
DELIMITER //
CREATE FUNCTION random_id()
RETURNS VARCHAR(50)
NO SQL
BEGIN
DECLARE result VARCHAR(50);
    SET result = SUBSTRING_INDEX(UUID(), '-', 1);
RETURN result;
END //
DELIMITER ;

DROP FUNCTION IF EXISTS random_peso;
DELIMITER //
CREATE FUNCTION random_peso(pmin INTEGER, pmax INTEGER)
RETURNS INTEGER
NO SQL
BEGIN
DECLARE result INTEGER;
    SET result = pmin + FLOOR(RAND() * (pmax - pmin));
RETURN result;
END //
DELIMITER ;

DROP FUNCTION IF EXISTS random_enum;
DELIMITER //
CREATE FUNCTION random_enum(p1 VARCHAR(10), p2 VARCHAR(10))
RETURNS VARCHAR(10)
NO SQL
BEGIN
DECLARE result VARCHAR(10);
    SET result = IF(RAND() > 0.5, p1, p2);
RETURN result;
END //
DELIMITER ;

DROP FUNCTION IF EXISTS random_fecha;
DELIMITER //
CREATE FUNCTION random_fecha(f1 DATE)
RETURNS DATE
NO SQL
BEGIN
DECLARE result DATE;
    SET result = (SELECT DATE_ADD(f1, INTERVAL FLOOR(RAND() * 365) DAY));
    -- DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND() * 365) DAY);
RETURN result;
END //
DELIMITER ;
``

procedimiento de personas aleaotrias
``SQL
DROP PROCEDURE IF EXISTS insert_persons;
DELIMITER //
CREATE PROCEDURE insert_persons(IN pmin INTEGER, IN pmax INTEGER, IN fech DATE, IN times INTEGER)
BEGIN

DECLARE counter INTEGER DEFAULT 0;
DECLARE identificador_ VARCHAR(50);
DECLARE admitido_ VARCHAR(10);
DECLARE sexo_ VARCHAR(10);
DECLARE peso_ INTEGER;
DECLARE fecha_ DATE;

    WHILE counter < times DO
        SET identificador_ = random_id();
        SET peso_ = random_peso(pmin, pmax);
        SET admitido_ = random_enum('si', 'no');
        SET sexo_ = random_enum('H', 'M');
        SET fecha_ = random_fecha(fech);

            INSERT INTO persona(identificador, peso, admitido, sexo, fecha) VALUES (
                identificador_,
                peso_,
                admitido_,
                sexo_,
                fecha_
            );
            SET counter = counter + 1;
    END WHILE ;
END //
DELIMITER ;
CALL insert_persons(40, 95, '2023-03-20', 2);

+----+---------------+------+----------+------+------------+
| id | identificador | peso | admitido | sexo | fecha      |
+----+---------------+------+----------+------+------------+
|  1 | 5df84192      |   68 | no       | M    | 2023-06-20 |
|  2 | 5df8aba0      |   50 | no       | M    | 2023-06-13 |
+----+---------------+------+----------+------+------------+
``

2. Realiza un procedimiento que permita actualizar el la fecha de última donación, 
teniendo como parámetro de entrada el identificador de la persona, y una fecha.

``SQL
DROP PROCEDURE IF EXISTS act_fecha;
DELIMITER //
CREATE PROCEDURE act_fecha(IN fech DATE, IN id_ INTEGER)
BEGIN
    UPDATE persona SET fecha = fech WHERE id = id_;
END //
DELIMITER ;
call act_fecha('2024-10-08', 1);
+----+---------------+------+----------+------+------------+
| id | identificador | peso | admitido | sexo | fecha      |
+----+---------------+------+----------+------+------------+
|  1 | 5df84192      |   68 | no       | M    | 2024-10-08 |
|  2 | 5df8aba0      |   50 | no       | M    | 2023-06-13 |
+----+---------------+------+----------+------+------------+
``

3. Crea un procedimiento llamado CalcularTotalDonaciones que calcule la cantidad total de donaciones 
realizadas por cada persona y la almacene en una tabla llamada total_donaciones. La tabla total_donaciones 
debe tener dos columnas: id_persona (texto) y cantidad_total (integer).

``SQL
DROP PROCEDURE IF EXISTS calc_total_donaciones;
DELIMITER //
CREATE PROCEDURE calc_total_donaciones()
BEGIN
    DROP TABLE IF EXISTS total_donaciones;
    CREATE TABLE total_donaciones(
        id_persona VARCHAR(50),
        cantidad_total INTEGER
    );
    INSERT INTO total_donaciones(id_persona, cantidad_total) SELECT identificador, COUNT(*) AS total FROM 
    persona GROUP BY identificador;
END //
DELIMITER ;
CALL calc_total_donaciones();
+------------+----------------+
| id_persona | cantidad_total |
+------------+----------------+
| 5df84192   |              1 |
| 5df8aba0   |              1 |
+------------+----------------+
``

3. Crea un procedimiento que me permita eliminar una persona de la tabla total_donaciones.

``SQL
DROP PROCEDURE IF EXISTS drop_person;
DELIMITER //
CREATE PROCEDURE drop_person(IN id_ INTEGER)
BEGIN
    DELETE FROM persona WHERE id = id_;
END //
DELIMITER ;
``

Funciones:

1. Realiza una función que determine si una persona almacenada en la tabla persona puede realizar una 
donación. Para ello la función recibe como parámetro de entrada el identificador de esta persona, 
y una fecha de donación. Revisa las condiciones para que una persona pueda o no donar. Posteriormente 
actualice el valor de la última donación de la persona indicada con el parámetro de entrada.

``SQL
DROP FUNCTION IF EXISTS si_o_no;
DELIMITER //
CREATE FUNCTION si_o_no(id_ INTEGER, fecha1 DATE)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE p_sexo ENUM('H', 'M');
    DECLARE p_peso INT;
    DECLARE p_dias_ultima_donacion INT;
    DECLARE p_fecha_ultima_donacion DATE;

    -- Obtener peso, sexo y fecha de la última donación de la persona
    SELECT peso, sexo, fecha 
    INTO p_peso, p_sexo, p_fecha_ultima_donacion 
    FROM persona 
    WHERE id = id_;


    IF p_peso < 50 THEN
        RETURN FALSE;
    END IF;
    
    -- calculamos los dias que han pasado desde la ultima donación con DATEDIFF
    SET p_dias_ultima_donacion = DATEDIFF(fecha1, p_fecha_ultima_donacion);

    -- verificamos si no pudiese donar
    IF (p_sexo = 'H' AND p_dias_ultima_donacion < 90) OR 
    (p_sexo = 'M' AND p_dias_ultima_donacion < 120) THEN
        RETURN FALSE;
    END IF;

    -- Ahora si actualizamos si no retorno FALSE
    UPDATE persona SET fecha = fecha1 WHERE id = id_;
    RETURN TRUE;
END //
DELIMITER ;

SELECT si_o_no(1, '2024-12-09');
+--------------------------+
| si_o_no(1, '2024-12-09') |
+--------------------------+
|                        0 |
+--------------------------+

SELECT si_o_no(1, '2025-12-09');
+--------------------------+
| si_o_no(1, '2025-12-09') |
+--------------------------+
|                        1 |
+--------------------------+
``

2. Realiza una función que determine que persona es la que más donaciones ha realizado.

``SQL
DROP FUNCTION IF EXISTS max_donacion;
DELIMITER //
CREATE FUNCTION max_donacion()
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE id_ VARCHAR(100);
    SELECT id_persona INTO id_ FROM total_donaciones ORDER BY cantidad_total DESC LIMIT 1;
    RETURN id_;
END //
DELIMITER ;
select max_donacion();
+----------------+
| max_donacion() |
+----------------+
| 5df84192       |
+----------------+
``

Triggers

1. Realiza un trigger que actualiza total_donaciones con cada una de las inserciones que se realicen 
en la tabla Persona.

``SQL
DROP TRIGGER IF EXISTS act_total;
DELIMITER //
CREATE TRIGGER act_total
BEFORE INSERT ON persona
FOR EACH ROW
BEGIN
    IF NEW.identificador IN (SELECT identificador FROM persona) THEN
        UPDATE total_donaciones SET cantidad_total = cantidad_total + 1 WHERE id_persona = NEW.identificador;
    ELSE
        INSERT INTO total_donaciones (id_persona, cantidad_total) VALUES (NEW.identificador, 1);
    END IF;
END //
DELIMITER ;

-- OTRA OPCION QUE CALCULA EL TOTAL NUEVO
DROP TRIGGER IF EXISTS act_total;
DELIMITER //
CREATE TRIGGER act_total
AFTER INSERT ON persona
FOR EACH ROW
BEGIN
    DECLARE count_rows INT;

    -- Contar cuántas filas existen en total_donaciones con el mismo identificador
    SELECT COUNT(*) INTO count_rows FROM total_donaciones WHERE id_persona = NEW.identificador;

    IF count_rows > 0 THEN
        -- Si ya existe, actualizar el registro
        UPDATE total_donaciones
        SET cantidad_total = cantidad_total + 1
        WHERE id_persona = NEW.identificador;
    ELSE
        -- Si no existe, insertar un nuevo registro
        INSERT INTO total_donaciones (id_persona, cantidad_total)
        VALUES (NEW.identificador, 1);
    END IF;
END //
DELIMITER ;
``

2. Realiza un trigger que elimine todos los registros en la tabla persona cuando 
se elimine un registro de la tabla total_donaciones.

``SQL
DROP TRIGGER IF EXISTS drop_dona;
DELIMITER //
CREATE TRIGGER drop_dona
AFTER DELETE on persona
FOR EACH ROW
BEGIN
    DELETE from total_donaciones WHERE id_persona = OLD.identificador;
END //
DELIMITER ;
``