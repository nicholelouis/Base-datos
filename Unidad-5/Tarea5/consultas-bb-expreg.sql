-- Selección de libros cuyo título comienza con "H".

select codigo, titulo FROM libro WHERE titulo REGEXP '^H';

-- Libros escritos por autores cuyos nombres terminan con "ing".

select l.codigo, l.titulo, a.nombre FROM Libro as l, autor as a where a.nombre regexp 'ing$' and l.autor_id=a.id;

-- Libros con títulos que contienen la palabra "and" en cualquier posición.

select codigo, titulo from libro WHERE titulo REGEXP 'and';

-- Libros cuyo título comienza con una vocal.

select codigo, titulo FROM Libro WHERE titulo REGEXP '^[aeiouAEIOU]';

-- Libros cuyo autor tiene al menos una vocal repetida.

select l.codigo, L.titulo, a.nombre FROM Libro as l, autor as a where a.nombre regexp '[aeiou-AEIOU]{2,}' and l.autor_id=a.id;

-- Libros con precios que tienen dos dígitos decimales exactos.

select * FROM Libro where precio REGEXP '\. \d{2}$';


-- Libros cuyos títulos tienen al menos tres palabras.

SELECT * FROM libro WHERE titulo REGEXP '^[^ ]+ +[^ ]+ +[^ ]+';

-- Obtener todos los autores cuyo nombre empieza con la letra "A":

select codigo, titulo FROM libro WHERE titulo REGEXP '^A';

-- Seleccionar los libros cuyo título contiene la palabra "SQL":

select codigo, titulo from libro WHERE titulo REGEXP 'SQL';

-- Obtener todos los autores cuyo nombre termina con "ez":

SELECT * FROM autor where nombre REGEXP 'ez$';

-- Obtener todos los autores cuyo nombre tiene al menos 5 caracteres:

SELECT * FROM autor WHERE LENGTH(nombre) >=5 ;

-- Seleccionar los libros cuya editorial es diferente de "EditorialX":

select * from libro WHERE editorial <> "EditorialX";

-- Obtener todos los autores cuyo nombre contiene al menos una vocal:

SELECT * FROM autor WHERE nombre REGEXP '[aeiou-AEIOU]{1}';

-- Seleccionar los libros cuyo título comienza con una letra mayúscula:

SELECT * FROM libro WHERE titulo REGEXP '^[A-Z]';

-- Obtener todos los autores cuyo nombre no contiene la letra "r":

SELECT * FROM autor WHERE nombre not REGEXP 'p';

-- Seleccionar los libros cuya editorial empieza con la letra "P":

select editorial FROM libro WHERE editorial REGEXP '^[P]';

-- Obtener todos los autores cuyo nombre tiene exactamente 6 caracteres:

SELECT * FROM autor WHERE LENGTH(nombre) = 6;

-- Seleccionar los libros cuyo título contiene al menos un número:

select titulo FROM libro WHERE titulo REGEXP '[0-9]';

-- Obtener todos los autores cuyo nombre inicia con una vocal:

select * FROM autor WHERE nombre REGEXP '^[aeiouAEIOU]';

-- Obtener todos los autores cuyo nombre no contiene espacios en blanco:

select * FROM autor WHERE nombre REGEXP '/S';

-- Seleccionar los libros cuyo título termina con una vocal:

select * FROM autor WHERE nombre REGEXP '[aeiouAEIOU]$';

-- Obtener todos los autores cuyo nombre contiene la secuencia "er":

select * FROM autor WHERE nombre REGEXP 'er';

-- Seleccionar los libros cuyo título empieza con la palabra "The":

select titulo FROM libro WHERE titulo REGEXP '^The';

-- Obtener todos los autores cuyo nombre tiene al menos una letra mayúscula:

SELECT * FROM autor WHERE nombre REGEXP '[A-Z]';

-- Seleccionar los libros cuyo precio es un número decimal con exactamente dos decimales:

select * FROM Libro where precio REGEXP '\. \d{2}$';

-- Obtener todos los autores cuyo nombre no contiene números:

select * FROM autor WHERE nombre not REGEXP '[0-9]';


-- Seleccionar los libros cuyo título contiene al menos tres vocales:

SELECT titulo FROM libro WHERE titulo  REGEXP '[aeiouAEIOU].*[aeiouAEIOU].*[aeiouAEIOU]';

-- Obtener todos los autores cuyo nombre inicia con una consonante:

SELECT * FROM autor WHERE nombre not REGEXP '^[aeiouAEIOU]';

-- Seleccionar los libros cuyo título no contiene la palabra "Science":

select codigo, titulo from libro WHERE titulo REGEXP 'Science';

-- Obtener todos los autores cuyo nombre tiene al menos una letra repetida consecutivamente:

SELECT * FROM autor WHERE nombre REGEXP '(\w)\\1+';

-- Obtener todos los autores cuyo nombre empieza con "M" o termina con "n":

SELECT * FROM autor WHERE nombre REGEXP '^(M|.*n)$';

-- Obtener todos los autores cuyo nombre no contiene caracteres especiales:

sqlite> SELECT * FROM autor WHERE nombre NOT REGEXP '[^a-zA-Z0-9 ]';

