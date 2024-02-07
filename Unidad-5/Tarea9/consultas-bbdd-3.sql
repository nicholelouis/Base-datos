-- Obtener el nombre del alumno y el nombre de la clase en la que está inscrito.

SELECT a.nombre, c.nombre FROM Alumnos as a, Clases as c JOIN Inscripciones as i on c.id=i.id_clase and a.id=id_alumno;
/**
┌────────┬────────────────────────┐
│ nombre │         nombre         │
├────────┼────────────────────────┤
│ Juan   │ Matemáticas 101        │
│ Juan   │ Historia Antigua       │
│ María  │ Literatura Moderna     │
│ María  │ Biología Avanzada      │
│ Pedro  │ Química Orgánica       │
│ Pedro  │ Física Cuántica        │
│ Laura  │ Arte Contemporáneo     │
│ Laura  │ Inglés Avanzado        │
│ Carlos │ Economía Internacional │
│ Ana    │ Derecho Penal          │
└────────┴────────────────────────┘
**/

-- Obtener el nombre del alumno y la materia de las clases en las que está inscrito.

SELECT a.nombre, c.materia FROM Alumnos as a, Clases as c JOIN Inscripciones as i on c.id=i.id_clase and a.id=id_alumno;
/**
┌────────┬─────────────┐
│ nombre │   materia   │
├────────┼─────────────┤
│ Juan   │ Matemáticas │
│ Juan   │ Historia    │
│ María  │ Literatura  │
│ María  │ Biología    │
│ Pedro  │ Química     │
│ Pedro  │ Física      │
│ Laura  │ Arte        │
│ Laura  │ Idiomas     │
│ Carlos │ Economía    │
│ Ana    │ Derecho     │
└────────┴─────────────┘
**/
-- Obtener el nombre del alumno, la edad y el nombre del profesor de las clases en las que está inscrito.

SELECT a.nombre, a.edad, c.profesor FROM Alumnos as a, Clases as c JOIN Inscripciones as i on c.id=i.id_clase and a.id=id_alumno;
/**
┌────────┬──────┬────────────┐
│ nombre │ edad │  profesor  │
├────────┼──────┼────────────┤
│ Juan   │ 20   │ Profesor X │
│ Juan   │ 20   │ Profesor Y │
│ María  │ 21   │ Profesor Z │
│ María  │ 21   │ Profesor W │
│ Pedro  │ 19   │ Profesor V │
│ Pedro  │ 19   │ Profesor U │
│ Laura  │ 22   │ Profesor T │
│ Laura  │ 22   │ Profesor S │
│ Carlos │ 20   │ Profesor R │
│ Ana    │ 19   │ Profesor Q │
└────────┴──────┴────────────┘
**/
-- Obtener el nombre del alumno y la dirección de las clases en las que está inscrito.

SELECT nombre , direccion FROM Alumnos;
/**
┌────────┬───────────┐
│ nombre │ direccion │
├────────┼───────────┤
│ Juan   │ Calle A   │
│ María  │ Calle B   │
│ Pedro  │ Calle C   │
│ Laura  │ Calle D   │
│ Carlos │ Calle E   │
│ Ana    │ Calle F   │
│ Sofía  │ Calle G   │
│ Diego  │ Calle H   │
│ Lucía  │ Calle I   │
│ Miguel │ Calle J   │
└────────┴───────────┘
**/
-- Obtener el nombre del alumno y el nombre de la clase junto con el profesor.

SELECT a.nombre, c.nombre , c.profesor FROM Alumnos as a, Clases as c JOIN Inscripciones as i on c.id=i.id_clase and a.id=id_alumno;
/**
┌────────┬────────────────────────┬────────────┐
│ nombre │         nombre         │  profesor  │
├────────┼────────────────────────┼────────────┤
│ Juan   │ Matemáticas 101        │ Profesor X │
│ Juan   │ Historia Antigua       │ Profesor Y │
│ María  │ Literatura Moderna     │ Profesor Z │
│ María  │ Biología Avanzada      │ Profesor W │
│ Pedro  │ Química Orgánica       │ Profesor V │
│ Pedro  │ Física Cuántica        │ Profesor U │
│ Laura  │ Arte Contemporáneo     │ Profesor T │
│ Laura  │ Inglés Avanzado        │ Profesor S │
│ Carlos │ Economía Internacional │ Profesor R │
│ Ana    │ Derecho Penal          │ Profesor Q │
└────────┴────────────────────────┴────────────┘
**/
-- Obtener el nombre del alumno, la materia y el nombre del profesor de las clases en las que está inscrito.

SELECT a.nombre, c.nombre , c.profesor FROM Alumnos as a, Clases as c JOIN Inscripciones as i on c.id=i.id_clase and a.id=id_alumno;
/**
┌────────┬────────────────────────┬────────────┐
│ nombre │         nombre         │  profesor  │
├────────┼────────────────────────┼────────────┤
│ Juan   │ Matemáticas 101        │ Profesor X │
│ Juan   │ Historia Antigua       │ Profesor Y │
│ María  │ Literatura Moderna     │ Profesor Z │
│ María  │ Biología Avanzada      │ Profesor W │
│ Pedro  │ Química Orgánica       │ Profesor V │
│ Pedro  │ Física Cuántica        │ Profesor U │
│ Laura  │ Arte Contemporáneo     │ Profesor T │
│ Laura  │ Inglés Avanzado        │ Profesor S │
│ Carlos │ Economía Internacional │ Profesor R │
│ Ana    │ Derecho Penal          │ Profesor Q │
└────────┴────────────────────────┴────────────┘
**/
-- Obtener el nombre del alumno, la edad y la materia de las clases en las que está inscrito.

SELECT a.nombre, a.edad, c.materia FROM Alumnos as a, Clases as c JOIN Inscripciones as i on c.id=i.id_clase and a.id=id_alumno;
/**
┌────────┬──────┬─────────────┐
│ nombre │ edad │   materia   │
├────────┼──────┼─────────────┤
│ Juan   │ 20   │ Matemáticas │
│ Juan   │ 20   │ Historia    │
│ María  │ 21   │ Literatura  │
│ María  │ 21   │ Biología    │
│ Pedro  │ 19   │ Química     │
│ Pedro  │ 19   │ Física      │
│ Laura  │ 22   │ Arte        │
│ Laura  │ 22   │ Idiomas     │
│ Carlos │ 20   │ Economía    │
│ Ana    │ 19   │ Derecho     │
└────────┴──────┴─────────────┘
**/
-- Obtener el nombre del alumno, la dirección y el profesor de las clases en las que está inscrito.

SELECT a.nombre, a.direccion, c.materia FROM Alumnos as a, Clases as c JOIN Inscripciones as i on c.id=i.id_clase and a.id=id_alumno;
/**
┌────────┬───────────┬─────────────┐
│ nombre │ direccion │   materia   │
├────────┼───────────┼─────────────┤
│ Juan   │ Calle A   │ Matemáticas │
│ Juan   │ Calle A   │ Historia    │
│ María  │ Calle B   │ Literatura  │
│ María  │ Calle B   │ Biología    │
│ Pedro  │ Calle C   │ Química     │
│ Pedro  │ Calle C   │ Física      │
│ Laura  │ Calle D   │ Arte        │
│ Laura  │ Calle D   │ Idiomas     │
│ Carlos │ Calle E   │ Economía    │
│ Ana    │ Calle F   │ Derecho     │
└────────┴───────────┴─────────────┘
**/
-- Obtener el nombre del alumno y la materia de las clases en las que está inscrito, ordenado por el nombre del alumno.

SELECT a.nombre, c.materia FROM Alumnos as a, Clases as c JOIN Inscripciones as i on c.id=i.id_clase and a.id=id_alumno order by a.nombre;
/**
┌────────┬─────────────┐
│ nombre │   materia   │
├────────┼─────────────┤
│ Ana    │ Derecho     │
│ Carlos │ Economía    │
│ Juan   │ Matemáticas │
│ Juan   │ Historia    │
│ Laura  │ Arte        │
│ Laura  │ Idiomas     │
│ María  │ Literatura  │
│ María  │ Biología    │
│ Pedro  │ Química     │
│ Pedro  │ Física      │
└────────┴─────────────┘
**/
-- Contar cuántos alumnos están inscritos en cada clase.

SELECT COUNT(a.nombre), c.nombre FROM Alumnos as a, Clases as c JOIN Inscripciones as i on c.id=i.id_clase and a.id=id_alumno GROUP BY c.nombre;
/**
┌─────────────────┬────────────────────────┐
│ COUNT(a.nombre) │         nombre         │
├─────────────────┼────────────────────────┤
│ 1               │ Arte Contemporáneo     │
│ 1               │ Biología Avanzada      │
│ 1               │ Derecho Penal          │
│ 1               │ Economía Internacional │
│ 1               │ Física Cuántica        │
│ 1               │ Historia Antigua       │
│ 1               │ Inglés Avanzado        │
│ 1               │ Literatura Moderna     │
│ 1               │ Matemáticas 101        │
│ 1               │ Química Orgánica       │
└─────────────────┴────────────────────────┘
**/
