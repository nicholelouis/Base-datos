--Devuelve un listado con el primer apellido, segundo apellido y el nombre de todos los alumnos. El listado deberá estar ordenado alfabéticamente de menor a mayor por el primer apellido, segundo apellido y nombre.

SELECT apellido1, apellido2, nombre FROM persona WHERE id in (SELECT DISTINCT id_alumno FROM alumno_se_matricula_asignatura) ;
/**
┌───────────┬───────────┬──────────┐
│ apellido1 │ apellido2 │  nombre  │
├───────────┼───────────┼──────────┤
│ Sánchez   │ Pérez     │ Salvador │
│ Saez      │ Vega      │ Juan     │
│ Heller    │ Pagac     │ Pedro    │
│ Lakin     │ Yundt     │ Inma     │
│ Hernández │ Martínez  │ Irene    │
│ Gea       │ Ruiz      │ Sonia    │
└───────────┴───────────┴──────────┘
**/

--Averigua el nombre y los dos apellidos de los alumnos que no han dado de alta su número de teléfono en la base de datos.

SELECT apellido1, apellido2, nombre FROM persona WHERE telefono is NULL and id in (SELECT DISTINCT id_alumno FROM alumno_se_matricula_asignatura);
/**
┌───────────┬───────────┬────────┐
│ apellido1 │ apellido2 │ nombre │
├───────────┼───────────┼────────┤
│ Heller    │ Pagac     │ Pedro  │
└───────────┴───────────┴────────┘
**/

--Devuelve el listado de los alumnos que nacieron en 1999.

SELECT apellido1, apellido2, nombre FROM persona WHERE fecha_nacimiento REGEXP '^1999' and id in (SELECT DISTINCT id_alumno FROM alumno_se_matricula_asignatura);
/**

**/

--Devuelve el listado de profesores que no han dado de alta su número de teléfono en la base de datos y además su nif termina en K.

SELECT apellido1, apellido2, nombre FROM persona WHERE nif REGEXP 'K$' and id in (SELECT DISTINCT id_profesor FROM profesor);
/**
┌───────────┬───────────┬───────────┐
│ apellido1 │ apellido2 │  nombre   │
├───────────┼───────────┼───────────┤
│ Fahey     │ Considine │ Antonio   │
│ Ruecker   │ Upton     │ Guillermo │
└───────────┴───────────┴───────────┘
**/

--Devuelve el listado de las asignaturas que se imparten en el primer cuatrimestre, en el tercer curso del grado que tiene el identificador 7.

SELECT * FROM asignatura WHERE cuatrimestre = 1 AND curso=3 AND id_grado = 7;
/**
┌────┬───────────────────────────────────────────┬──────────┬─────────────┬───────┬──────────────┬─────────────┬──────────┐
│ id │                  nombre                   │ creditos │    tipo     │ curso │ cuatrimestre │ id_profesor │ id_grado │
├────┼───────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 72 │ Bases moleculares del desarrollo vegetal  │ 4.5      │ obligatoria │ 3     │ 1            │             │ 7        │
│ 73 │ Fisiología animal                         │ 4.5      │ obligatoria │ 3     │ 1            │             │ 7        │
│ 74 │ Metabolismo y biosíntesis de biomoléculas │ 6.0      │ obligatoria │ 3     │ 1            │             │ 7        │
│ 75 │ Operaciones de separación                 │ 6.0      │ obligatoria │ 3     │ 1            │             │ 7        │
│ 76 │ Patología molecular de plantas            │ 4.5      │ obligatoria │ 3     │ 1            │             │ 7        │
│ 77 │ Técnicas instrumentales básicas           │ 4.5      │ obligatoria │ 3     │ 1            │             │ 7        │
└────┴───────────────────────────────────────────┴──────────┴─────────────┴───────┴──────────────┴─────────────┴──────────┘
**/

--Devuelve un listado con los datos de todas las alumnas que se han matriculado alguna vez en el Grado en Ingeniería Informática (Plan 2015).

SELECT p.* FROM persona as p JOIN alumno_se_matricula_asignatura as a on p.id=a.id_alumno JOIN asignatura as s on a.id_asignatura=s.id JOIN grado as g on g.id=s.id WHERE g.nombre='Grado en Ingeniería Informática (Plan 2015)' and p.sexo = 'M';
/**
┌────┬───────────┬────────┬───────────┬───────────┬─────────┬────────────────────┬───────────┬──────────────────┬──────┬────────┐
│ id │    nif    │ nombre │ apellido1 │ apellido2 │ ciudad  │     direccion      │ telefono  │ fecha_nacimiento │ sexo │  tipo  │
├────┼───────────┼────────┼───────────┼───────────┼─────────┼────────────────────┼───────────┼──────────────────┼──────┼────────┤
│ 24 │ 85135690V │ Sonia  │ Gea       │ Ruiz      │ Almería │ C/ Mercurio        │ 678812017 │ 1995/04/13       │ M    │ alumno │
│ 23 │ 64753215G │ Irene  │ Hernández │ Martínez  │ Almería │ C/ Zapillo         │ 628452384 │ 1996/03/12       │ M    │ alumno │
│ 19 │ 11578526G │ Inma   │ Lakin     │ Yundt     │ Almería │ C/ Picos de Europa │ 678652431 │ 1998/09/01       │ M    │ alumno │
└────┴───────────┴────────┴───────────┴───────────┴─────────┴────────────────────┴───────────┴──────────────────┴──────┴────────┘
**/

--Devuelve un listado con todas las asignaturas ofertadas en el Grado en Ingeniería Informática (Plan 2015).

SELECT a.* FROM asignatura as a JOIN grado as g on a.id_grado=g.id WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';
/**
┌────┬──────────────────────────────────────────────────────────────┬──────────┬─────────────┬───────┬──────────────┬─────────────┬──────────┐
│ id │                            nombre                            │ creditos │    tipo     │ curso │ cuatrimestre │ id_profesor │ id_grado │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 1  │ Álgegra lineal y matemática discreta                         │ 6.0      │ básica      │ 1     │ 1            │ 3           │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 2  │ Cálculo                                                      │ 6.0      │ básica      │ 1     │ 1            │ 14          │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 3  │ Física para informática                                      │ 6.0      │ básica      │ 1     │ 1            │ 3           │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 4  │ Introducción a la programación                               │ 6.0      │ básica      │ 1     │ 1            │ 14          │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 5  │ Organización y gestión de empresas                           │ 6.0      │ básica      │ 1     │ 1            │ 3           │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 6  │ Estadística                                                  │ 6.0      │ básica      │ 1     │ 2            │ 14          │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 7  │ Estructura y tecnología de computadores                      │ 6.0      │ básica      │ 1     │ 2            │ 3           │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 8  │ Fundamentos de electrónica                                   │ 6.0      │ básica      │ 1     │ 2            │ 14          │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 9  │ Lógica y algorítmica                                         │ 6.0      │ básica      │ 1     │ 2            │ 3           │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 10 │ Metodología de la programación                               │ 6.0      │ básica      │ 1     │ 2            │ 14          │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 11 │ Arquitectura de Computadores                                 │ 6.0      │ básica      │ 2     │ 1            │ 3           │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 12 │ Estructura de Datos y Algoritmos I                           │ 6.0      │ obligatoria │ 2     │ 1            │ 3           │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 13 │ Ingeniería del Software                                      │ 6.0      │ obligatoria │ 2     │ 1            │ 14          │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 14 │ Sistemas Inteligentes                                        │ 6.0      │ obligatoria │ 2     │ 1            │ 3           │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 15 │ Sistemas Operativos                                          │ 6.0      │ obligatoria │ 2     │ 1            │ 14          │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 16 │ Bases de Datos                                               │ 6.0      │ básica      │ 2     │ 2            │ 14          │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 17 │ Estructura de Datos y Algoritmos II                          │ 6.0      │ obligatoria │ 2     │ 2            │ 14          │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 18 │ Fundamentos de Redes de Computadores                         │ 6.0      │ obligatoria │ 2     │ 2            │ 3           │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 19 │ Planificación y Gestión de Proyectos Informáticos            │ 6.0      │ obligatoria │ 2     │ 2            │ 3           │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 20 │ Programación de Servicios Software                           │ 6.0      │ obligatoria │ 2     │ 2            │ 14          │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 21 │ Desarrollo de interfaces de usuario                          │ 6.0      │ obligatoria │ 3     │ 1            │ 14          │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 22 │ Ingeniería de Requisitos                                     │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 23 │ Integración de las Tecnologías de la Información en las Orga │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
│    │ nizaciones                                                   │          │             │       │              │             │          │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 24 │ Modelado y Diseño del Software 1                             │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 25 │ Multiprocesadores                                            │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 26 │ Seguridad y cumplimiento normativo                           │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 27 │ Sistema de Información para las Organizaciones               │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 28 │ Tecnologías web                                              │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 29 │ Teoría de códigos y criptografía                             │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 30 │ Administración de bases de datos                             │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 31 │ Herramientas y Métodos de Ingeniería del Software            │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 32 │ Informática industrial y robótica                            │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 33 │ Ingeniería de Sistemas de Información                        │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 34 │ Modelado y Diseño del Software 2                             │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 35 │ Negocio Electrónico                                          │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 36 │ Periféricos e interfaces                                     │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 37 │ Sistemas de tiempo real                                      │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 38 │ Tecnologías de acceso a red                                  │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 39 │ Tratamiento digital de imágenes                              │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 40 │ Administración de redes y sistemas operativos                │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 41 │ Almacenes de Datos                                           │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 42 │ Fiabilidad y Gestión de Riesgos                              │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 43 │ Líneas de Productos Software                                 │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 44 │ Procesos de Ingeniería del Software 1                        │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 45 │ Tecnologías multimedia                                       │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 46 │ Análisis y planificación de las TI                           │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 47 │ Desarrollo Rápido de Aplicaciones                            │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 48 │ Gestión de la Calidad y de la Innovación Tecnológica         │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 49 │ Inteligencia del Negocio                                     │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 50 │ Procesos de Ingeniería del Software 2                        │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 51 │ Seguridad Informática                                        │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │
└────┴──────────────────────────────────────────────────────────────┴──────────┴─────────────┴───────┴──────────────┴─────────────┴──────────┘
**/

--Devuelve un listado de los profesores junto con el nombre del departamento al que están vinculados. El listado debe devolver cuatro columnas, primer apellido, segundo apellido, nombre y nombre del departamento. El resultado estará ordenado alfabéticamente de menor a mayor por los apellidos y el nombre.

SELECT p.apellido1, p.apellido2, p.nombre, d.nombre FROM persona as p JOIN profesor as po on p.id=po.id_profesor JOIN departamento as d on po.id_departamento=d.id;
/**
┌────────────┬────────────┬───────────┬────────────────────┐
│ apellido1  │ apellido2  │  nombre   │       nombre       │
├────────────┼────────────┼───────────┼────────────────────┤
│ Ramirez    │ Gea        │ Zoe       │ Informática        │
│ Schmidt    │ Fisher     │ David     │ Matemáticas        │
│ Lemke      │ Rutherford │ Cristina  │ Economía y Empresa │
│ Spencer    │ Lakin      │ Esther    │ Educación          │
│ Streich    │ Hirthe     │ Carmen    │ Educación          │
│ Stiedemann │ Morissette │ Alfredo   │ Química y Física   │
│ Hamill     │ Kozey      │ Manolo    │ Informática        │
│ Kohler     │ Schoen     │ Alejandro │ Matemáticas        │
│ Fahey      │ Considine  │ Antonio   │ Economía y Empresa │
│ Ruecker    │ Upton      │ Guillermo │ Educación          │
│ Monahan    │ Murray     │ Micaela   │ Agronomía          │
│ Schowalter │ Muller     │ Francesca │ Química y Física   │
└────────────┴────────────┴───────────┴────────────────────┘
**/

--Devuelve un listado con el nombre de las asignaturas, año de inicio y año de fin del curso escolar del alumno con nif 26902806M.

SELECT asi.nombre, c.anyo_inicio, c.anyo_fin FROM persona as p JOIN alumno_se_matricula_asignatura as a on p.id=a.id_alumno JOIN curso_escolar as c on c.id=a.id_curso_escolar JOIN asignatura as asi on a.id_asignatura=asi.id WHERE p.nif= '26902806M';
/**
┌──────────────────────────────────────┬─────────────┬──────────┐
│                nombre                │ anyo_inicio │ anyo_fin │
├──────────────────────────────────────┼─────────────┼──────────┤
│ Álgegra lineal y matemática discreta │ 2014        │ 2015     │
│ Cálculo                              │ 2014        │ 2015     │
│ Física para informática              │ 2014        │ 2015     │
└──────────────────────────────────────┴─────────────┴──────────┘
**/

--Devuelve un listado con el nombre de todos los departamentos que tienen profesores que imparten alguna asignatura en el Grado en Ingeniería Informática (Plan 2015).

SELECT DISTINCT p.nombre FROM persona as p JOIN profesor as pro on pro.id_profesor=p.id JOIN asignatura as a on pro.id_departamento=a.id_profesor JOIN grado as g on g.id=a.id_grado WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';
/**
┌──────────┐
│  nombre  │
├──────────┤
│ Cristina │
│ Antonio  │
└──────────┘
**/

--Devuelve un listado con todos los alumnos que se han matriculado en alguna asignatura durante el curso escolar 2018/2019.

SELECT DISTINCT p.* FROM persona as p JOIN alumno_se_matricula_asignatura as a on p.id=a.id_alumno JOIN curso_escolar as c on a.id_curso_escolar=c.id WHERE c.anyo_inicio = '2018' and c.anyo_fin= '2019';
/**
┌────┬───────────┬────────┬───────────┬───────────┬─────────┬────────────────────┬───────────┬──────────────────┬──────┬────────┐
│ id │    nif    │ nombre │ apellido1 │ apellido2 │ ciudad  │     direccion      │ telefono  │ fecha_nacimiento │ sexo │  tipo  │
├────┼───────────┼────────┼───────────┼───────────┼─────────┼────────────────────┼───────────┼──────────────────┼──────┼────────┤
│ 24 │ 85135690V │ Sonia  │ Gea       │ Ruiz      │ Almería │ C/ Mercurio        │ 678812017 │ 1995/04/13       │ M    │ alumno │
│ 23 │ 64753215G │ Irene  │ Hernández │ Martínez  │ Almería │ C/ Zapillo         │ 628452384 │ 1996/03/12       │ M    │ alumno │
│ 19 │ 11578526G │ Inma   │ Lakin     │ Yundt     │ Almería │ C/ Picos de Europa │ 678652431 │ 1998/09/01       │ M    │ alumno │
└────┴───────────┴────────┴───────────┴───────────┴─────────┴────────────────────┴───────────┴──────────────────┴──────┴────────┘
**/

--Devuelve un listado con los nombres de todos los profesores y los departamentos que tienen vinculados. El listado también debe mostrar aquellos profesores que no tienen ningún departamento asociado. El listado debe devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido y nombre del profesor. El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del departamento, apellidos y el nombre.

SELECT COALESCE(d.nombre, 0) as nombre_departamento, p.apellido1, p.apellido2, p.nombre FROM persona as p JOIN profesor as pro on pro.id_profesor=p.id JOIN departamento as d on d.id=pro.id_departamento ORDER BY d.nombre, p.apellido1, p.apellido2, p.nombre asc;
/**
┌─────────────────────┬────────────┬────────────┬───────────┐
│ nombre_departamento │ apellido1  │ apellido2  │  nombre   │
├─────────────────────┼────────────┼────────────┼───────────┤
│ Agronomía           │ Monahan    │ Murray     │ Micaela   │
│ Economía y Empresa  │ Fahey      │ Considine  │ Antonio   │
│ Economía y Empresa  │ Lemke      │ Rutherford │ Cristina  │
│ Educación           │ Ruecker    │ Upton      │ Guillermo │
│ Educación           │ Spencer    │ Lakin      │ Esther    │
│ Educación           │ Streich    │ Hirthe     │ Carmen    │
│ Informática         │ Hamill     │ Kozey      │ Manolo    │
│ Informática         │ Ramirez    │ Gea        │ Zoe       │
│ Matemáticas         │ Kohler     │ Schoen     │ Alejandro │
│ Matemáticas         │ Schmidt    │ Fisher     │ David     │
│ Química y Física    │ Schowalter │ Muller     │ Francesca │
│ Química y Física    │ Stiedemann │ Morissette │ Alfredo   │
└─────────────────────┴────────────┴────────────┴───────────┘
**/

--Devuelve un listado con los profesores que no están asociados a un departamento.

SELECT p.* FROM persona as p, profesor as pro WHERE pro.id_profesor=p.id and id_departamento is NULL;
/**

**/

--Devuelve un listado con los departamentos que no tienen profesores asociados.

SELECT d.* FROM departamento as d, profesor as p WHERE p.id_departamento=d.id and p.id_departamento is NULL;
/**

**/

--Devuelve un listado con los profesores que no imparten ninguna asignatura.

SELECT * FROM  profesor WHERE id_profesor not in (SELECT DISTINCT id_profesor FROM asignatura );
/**

**/

--Devuelve un listado con las asignaturas que no tienen un profesor asignado.

SELECT * FROM asignatura WHERE id_profesor is NULL;
/**
┌────┬──────────────────────────────────────────────────────────────┬──────────┬─────────────┬───────┬──────────────┬─────────────┬──────────┐
│ id │                            nombre                            │ creditos │    tipo     │ curso │ cuatrimestre │ id_profesor │ id_grado │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 22 │ Ingeniería de Requisitos                                     │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 23 │ Integración de las Tecnologías de la Información en las Orga │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
│    │ nizaciones                                                   │          │             │       │              │             │          │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 24 │ Modelado y Diseño del Software 1                             │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 25 │ Multiprocesadores                                            │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 26 │ Seguridad y cumplimiento normativo                           │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 27 │ Sistema de Información para las Organizaciones               │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 28 │ Tecnologías web                                              │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 29 │ Teoría de códigos y criptografía                             │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 30 │ Administración de bases de datos                             │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 31 │ Herramientas y Métodos de Ingeniería del Software            │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 32 │ Informática industrial y robótica                            │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 33 │ Ingeniería de Sistemas de Información                        │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 34 │ Modelado y Diseño del Software 2                             │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 35 │ Negocio Electrónico                                          │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 36 │ Periféricos e interfaces                                     │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 37 │ Sistemas de tiempo real                                      │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 38 │ Tecnologías de acceso a red                                  │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 39 │ Tratamiento digital de imágenes                              │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 40 │ Administración de redes y sistemas operativos                │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 41 │ Almacenes de Datos                                           │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 42 │ Fiabilidad y Gestión de Riesgos                              │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 43 │ Líneas de Productos Software                                 │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 44 │ Procesos de Ingeniería del Software 1                        │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 45 │ Tecnologías multimedia                                       │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 46 │ Análisis y planificación de las TI                           │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 47 │ Desarrollo Rápido de Aplicaciones                            │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 48 │ Gestión de la Calidad y de la Innovación Tecnológica         │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 49 │ Inteligencia del Negocio                                     │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 50 │ Procesos de Ingeniería del Software 2                        │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 51 │ Seguridad Informática                                        │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 52 │ Biologia celular                                             │ 6.0      │ básica      │ 1     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 53 │ Física                                                       │ 6.0      │ básica      │ 1     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 54 │ Matemáticas I                                                │ 6.0      │ básica      │ 1     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 55 │ Química general                                              │ 6.0      │ básica      │ 1     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 56 │ Química orgánica                                             │ 6.0      │ básica      │ 1     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 57 │ Biología vegetal y animal                                    │ 6.0      │ básica      │ 1     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 58 │ Bioquímica                                                   │ 6.0      │ básica      │ 1     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 59 │ Genética                                                     │ 6.0      │ básica      │ 1     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 60 │ Matemáticas II                                               │ 6.0      │ básica      │ 1     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 61 │ Microbiología                                                │ 6.0      │ básica      │ 1     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 62 │ Botánica agrícola                                            │ 6.0      │ obligatoria │ 2     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 63 │ Fisiología vegetal                                           │ 6.0      │ obligatoria │ 2     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 64 │ Genética molecular                                           │ 6.0      │ obligatoria │ 2     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 65 │ Ingeniería bioquímica                                        │ 6.0      │ obligatoria │ 2     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 66 │ Termodinámica y cinética química aplicada                    │ 6.0      │ obligatoria │ 2     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 67 │ Biorreactores                                                │ 6.0      │ obligatoria │ 2     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 68 │ Biotecnología microbiana                                     │ 6.0      │ obligatoria │ 2     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 69 │ Ingeniería genética                                          │ 6.0      │ obligatoria │ 2     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 70 │ Inmunología                                                  │ 6.0      │ obligatoria │ 2     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 71 │ Virología                                                    │ 6.0      │ obligatoria │ 2     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 72 │ Bases moleculares del desarrollo vegetal                     │ 4.5      │ obligatoria │ 3     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 73 │ Fisiología animal                                            │ 4.5      │ obligatoria │ 3     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 74 │ Metabolismo y biosíntesis de biomoléculas                    │ 6.0      │ obligatoria │ 3     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 75 │ Operaciones de separación                                    │ 6.0      │ obligatoria │ 3     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 76 │ Patología molecular de plantas                               │ 4.5      │ obligatoria │ 3     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 77 │ Técnicas instrumentales básicas                              │ 4.5      │ obligatoria │ 3     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 78 │ Bioinformática                                               │ 4.5      │ obligatoria │ 3     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 79 │ Biotecnología de los productos hortofrutículas               │ 4.5      │ obligatoria │ 3     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 80 │ Biotecnología vegetal                                        │ 6.0      │ obligatoria │ 3     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 81 │ Genómica y proteómica                                        │ 4.5      │ obligatoria │ 3     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 82 │ Procesos biotecnológicos                                     │ 6.0      │ obligatoria │ 3     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 83 │ Técnicas instrumentales avanzadas                            │ 4.5      │ obligatoria │ 3     │ 2            │             │ 7        │
└────┴──────────────────────────────────────────────────────────────┴──────────┴─────────────┴───────┴──────────────┴─────────────┴──────────┘
**/

--Devuelve un listado con todos los departamentos que tienen alguna asignatura que no se haya impartido en ningún curso escolar. El resultado debe mostrar el nombre del departamento y el nombre de la asignatura que no se haya impartido nunca.


/**

**/

--Devuelve el número total de alumnas que hay.

SELECT DISTINCT p.* FROM persona as p JOIN alumno_se_matricula_asignatura as a on p.id=a.id_alumno AND p.sexo = 'M';
/**
┌────┬───────────┬────────┬───────────┬───────────┬─────────┬────────────────────┬───────────┬──────────────────┬──────┬────────┐
│ id │    nif    │ nombre │ apellido1 │ apellido2 │ ciudad  │     direccion      │ telefono  │ fecha_nacimiento │ sexo │  tipo  │
├────┼───────────┼────────┼───────────┼───────────┼─────────┼────────────────────┼───────────┼──────────────────┼──────┼────────┤
│ 19 │ 11578526G │ Inma   │ Lakin     │ Yundt     │ Almería │ C/ Picos de Europa │ 678652431 │ 1998/09/01       │ M    │ alumno │
│ 23 │ 64753215G │ Irene  │ Hernández │ Martínez  │ Almería │ C/ Zapillo         │ 628452384 │ 1996/03/12       │ M    │ alumno │
│ 24 │ 85135690V │ Sonia  │ Gea       │ Ruiz      │ Almería │ C/ Mercurio        │ 678812017 │ 1995/04/13       │ M    │ alumno │
└────┴───────────┴────────┴───────────┴───────────┴─────────┴────────────────────┴───────────┴──────────────────┴──────┴────────┘
**/

--Calcula cuántos alumnos nacieron en 1999.

SELECT COUNT(DISTINCT p.id) as alum_99 FROM persona as p JOIN alumno_se_matricula_asignatura as a on p.id=a.id_alumno WHERE fecha_nacimiento REGEXP '^1999';
/**
┌─────────┐
│ alum_99 │
├─────────┤
│ 0       │
└─────────┘
**/

--Calcula cuántos profesores hay en cada departamento. El resultado sólo debe mostrar dos columnas, una con el nombre del departamento y otra con el número de profesores que hay en ese departamento. El resultado sólo debe incluir los departamentos que tienen profesores asociados y deberá estar ordenado de mayor a menor por el número de profesores.

SELECT count(p.id_profesor) as num_pro, d.nombre FROM profesor as p JOIN departamento as d on p.id_departamento=d.id GROUP BY d.nombre;
/**
┌─────────┬────────────────────┐
│ num_pro │       nombre       │
├─────────┼────────────────────┤
│ 1       │ Agronomía          │
│ 2       │ Economía y Empresa │
│ 3       │ Educación          │
│ 2       │ Informática        │
│ 2       │ Matemáticas        │
│ 2       │ Química y Física   │
└─────────┴────────────────────┘
**/

--Devuelve un listado con todos los departamentos y el número de profesores que hay en cada uno de ellos. Tenga en cuenta que pueden existir departamentos que no tienen profesores asociados. Estos departamentos también tienen que aparecer en el listado.

SELECT COALESCE(d.nombre, NULL) as departamento, count(p.id_profesor) as num_pro FROM profesor as p JOIN departamento as d on p.id_departamento=d.id GROUP BY d.nombre;
/**
┌────────────────────┬─────────┐
│    departamento    │ num_pro │
├────────────────────┼─────────┤
│ Agronomía          │ 1       │
│ Economía y Empresa │ 2       │
│ Educación          │ 3       │
│ Informática        │ 2       │
│ Matemáticas        │ 2       │
│ Química y Física   │ 2       │
└────────────────────┴─────────┘
**/

--Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno. Tenga en cuenta que pueden existir grados que no tienen asignaturas asociadas. Estos grados también tienen que aparecer en el listado. El resultado deberá estar ordenado de mayor a menor por el número de asignaturas.

SELECT g.nombre as grado, COALESCE(count(a.id), 0) as asignaturas FROM grado as g JOIN asignatura as a on g.id=a.id_grado GROUP BY grado ;
/**
┌─────────────────────────────────────────────┬─────────────┐
│                    grado                    │ asignaturas │
├─────────────────────────────────────────────┼─────────────┤
│ Grado en Biotecnología (Plan 2015)          │ 32          │
│ Grado en Ingeniería Informática (Plan 2015) │ 51          │
└─────────────────────────────────────────────┴─────────────┘
**/

--Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno, de los grados que tengan más de 40 asignaturas asociadas.

SELECT g.nombre as grado, count(a.id) as asignaturas FROM grado as g JOIN asignatura as a on g.id=a.id_grado GROUP BY grado HAVING count(a.id) > 40;
/**
┌─────────────────────────────────────────────┬─────────────┐
│                    grado                    │ asignaturas │
├─────────────────────────────────────────────┼─────────────┤
│ Grado en Ingeniería Informática (Plan 2015) │ 51          │
└─────────────────────────────────────────────┴─────────────┘
**/

--Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos que hay para cada tipo de asignatura. El resultado debe tener tres columnas: nombre del grado, tipo de asignatura y la suma de los créditos de todas las asignaturas que hay de ese tipo. Ordene el resultado de mayor a menor por el número total de crédidos.

SELECT g.nombre, a.tipo, SUM(a.creditos) as total_creditos FROM grado as g JOIN asignatura as a on g.id=a.id_grado GROUP BY g.nombre, a.tipo order BY total_creditos desc;
/**
┌─────────────────────────────────────────────┬─────────────┬────────────────┐
│                   nombre                    │    tipo     │ total_creditos │
├─────────────────────────────────────────────┼─────────────┼────────────────┤
│ Grado en Ingeniería Informática (Plan 2015) │ optativa    │ 180.0          │
│ Grado en Biotecnología (Plan 2015)          │ obligatoria │ 120.0          │
│ Grado en Ingeniería Informática (Plan 2015) │ básica      │ 72.0           │
│ Grado en Biotecnología (Plan 2015)          │ básica      │ 60.0           │
│ Grado en Ingeniería Informática (Plan 2015) │ obligatoria │ 54.0           │
└─────────────────────────────────────────────┴─────────────┴────────────────┘
**/

--Devuelve un listado que muestre cuántos alumnos se han matriculado de alguna asignatura en cada uno de los cursos escolares. El resultado deberá mostrar dos columnas, una columna con el año de inicio del curso escolar y otra con el número de alumnos matriculados.

SELECT c.anyo_inicio, count(DISTINCT a.id_alumno) as num_alumnos FROM curso_escolar as c JOIN alumno_se_matricula_asignatura as a on c.id=a.id_alumno GROUP BY c.id;
/**
┌─────────────┬─────────────┐
│ anyo_inicio │ num_alumnos │
├─────────────┼─────────────┤
│ 2014        │ 1           │
│ 2015        │ 1           │
│ 2017        │ 1           │
└─────────────┴─────────────┘
**/

--Devuelve un listado con el número de asignaturas que imparte cada profesor. El listado debe tener en cuenta aquellos profesores que no imparten ninguna asignatura. El resultado mostrará cinco columnas: id, nombre, primer apellido, segundo apellido y número de asignaturas. El resultado estará ordenado de mayor a menor por el número de asignaturas.

SELECT p.id, p.nombre, p.apellido1, p.apellido2, coalesce(COUNT(a.id), 0) as num_asig FROM persona as p JOIN profesor as pro on pro.id_profesor=p.id JOIN asignatura as a on pro.id_departamento=a.id_profesor GROUP BY p.id ORDER by num_asig desc;
/**
┌────┬──────────┬───────────┬────────────┬──────────┐
│ id │  nombre  │ apellido1 │ apellido2  │ num_asig │
├────┼──────────┼───────────┼────────────┼──────────┤
│ 8  │ Cristina │ Lemke     │ Rutherford │ 10       │
│ 16 │ Antonio  │ Fahey     │ Considine  │ 10       │
└────┴──────────┴───────────┴────────────┴──────────┘
**/

--Devuelve todos los datos del alumno más joven.

SELECT DISTINCT  p.* FROM persona as p JOIN alumno_se_matricula_asignatura as a on p.id=a.id_alumno ORDER BY fecha_nacimiento desc LIMIT 1;
/**
┌────┬───────────┬────────┬───────────┬───────────┬─────────┬───────────────────┬──────────┬──────────────────┬──────┬────────┐
│ id │    nif    │ nombre │ apellido1 │ apellido2 │ ciudad  │     direccion     │ telefono │ fecha_nacimiento │ sexo │  tipo  │
├────┼───────────┼────────┼───────────┼───────────┼─────────┼───────────────────┼──────────┼──────────────────┼──────┼────────┤
│ 4  │ 17105885A │ Pedro  │ Heller    │ Pagac     │ Almería │ C/ Estrella fugaz │          │ 2000/10/05       │ H    │ alumno │
└────┴───────────┴────────┴───────────┴───────────┴─────────┴───────────────────┴──────────┴──────────────────┴──────┴────────┘
**/

--Devuelve un listado con los profesores que no están asociados a un departamento.

select * FROM profesor WHERE id_departamento is NULL;
/**

**/

--Devuelve un listado con los profesores que tienen un departamento asociado y que no imparten ninguna asignatura.

select * FROM profesor WHERE id_departamento is not NULL and id_profesor in (SELECT DISTINCT id_profesor FROM asignatura );
/**
┌─────────────┬─────────────────┐
│ id_profesor │ id_departamento │
├─────────────┼─────────────────┤
│ 3           │ 1               │
│ 14          │ 1               │
└─────────────┴─────────────────┘
**/

--Devuelve un listado con las asignaturas que no tienen un profesor asignado.

SELECT * FROM asignatura WHERE id_profesor is NULL;
/**
┌────┬──────────────────────────────────────────────────────────────┬──────────┬─────────────┬───────┬──────────────┬─────────────┬──────────┐
│ id │                            nombre                            │ creditos │    tipo     │ curso │ cuatrimestre │ id_profesor │ id_grado │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 22 │ Ingeniería de Requisitos                                     │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 23 │ Integración de las Tecnologías de la Información en las Orga │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
│    │ nizaciones                                                   │          │             │       │              │             │          │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 24 │ Modelado y Diseño del Software 1                             │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 25 │ Multiprocesadores                                            │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 26 │ Seguridad y cumplimiento normativo                           │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 27 │ Sistema de Información para las Organizaciones               │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 28 │ Tecnologías web                                              │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 29 │ Teoría de códigos y criptografía                             │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 30 │ Administración de bases de datos                             │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 31 │ Herramientas y Métodos de Ingeniería del Software            │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 32 │ Informática industrial y robótica                            │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 33 │ Ingeniería de Sistemas de Información                        │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 34 │ Modelado y Diseño del Software 2                             │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 35 │ Negocio Electrónico                                          │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 36 │ Periféricos e interfaces                                     │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 37 │ Sistemas de tiempo real                                      │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 38 │ Tecnologías de acceso a red                                  │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 39 │ Tratamiento digital de imágenes                              │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 40 │ Administración de redes y sistemas operativos                │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 41 │ Almacenes de Datos                                           │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 42 │ Fiabilidad y Gestión de Riesgos                              │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 43 │ Líneas de Productos Software                                 │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 44 │ Procesos de Ingeniería del Software 1                        │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 45 │ Tecnologías multimedia                                       │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 46 │ Análisis y planificación de las TI                           │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 47 │ Desarrollo Rápido de Aplicaciones                            │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 48 │ Gestión de la Calidad y de la Innovación Tecnológica         │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 49 │ Inteligencia del Negocio                                     │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 50 │ Procesos de Ingeniería del Software 2                        │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 51 │ Seguridad Informática                                        │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 52 │ Biologia celular                                             │ 6.0      │ básica      │ 1     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 53 │ Física                                                       │ 6.0      │ básica      │ 1     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 54 │ Matemáticas I                                                │ 6.0      │ básica      │ 1     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 55 │ Química general                                              │ 6.0      │ básica      │ 1     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 56 │ Química orgánica                                             │ 6.0      │ básica      │ 1     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 57 │ Biología vegetal y animal                                    │ 6.0      │ básica      │ 1     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 58 │ Bioquímica                                                   │ 6.0      │ básica      │ 1     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 59 │ Genética                                                     │ 6.0      │ básica      │ 1     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 60 │ Matemáticas II                                               │ 6.0      │ básica      │ 1     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 61 │ Microbiología                                                │ 6.0      │ básica      │ 1     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 62 │ Botánica agrícola                                            │ 6.0      │ obligatoria │ 2     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 63 │ Fisiología vegetal                                           │ 6.0      │ obligatoria │ 2     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 64 │ Genética molecular                                           │ 6.0      │ obligatoria │ 2     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 65 │ Ingeniería bioquímica                                        │ 6.0      │ obligatoria │ 2     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 66 │ Termodinámica y cinética química aplicada                    │ 6.0      │ obligatoria │ 2     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 67 │ Biorreactores                                                │ 6.0      │ obligatoria │ 2     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 68 │ Biotecnología microbiana                                     │ 6.0      │ obligatoria │ 2     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 69 │ Ingeniería genética                                          │ 6.0      │ obligatoria │ 2     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 70 │ Inmunología                                                  │ 6.0      │ obligatoria │ 2     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 71 │ Virología                                                    │ 6.0      │ obligatoria │ 2     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 72 │ Bases moleculares del desarrollo vegetal                     │ 4.5      │ obligatoria │ 3     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 73 │ Fisiología animal                                            │ 4.5      │ obligatoria │ 3     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 74 │ Metabolismo y biosíntesis de biomoléculas                    │ 6.0      │ obligatoria │ 3     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 75 │ Operaciones de separación                                    │ 6.0      │ obligatoria │ 3     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 76 │ Patología molecular de plantas                               │ 4.5      │ obligatoria │ 3     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 77 │ Técnicas instrumentales básicas                              │ 4.5      │ obligatoria │ 3     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 78 │ Bioinformática                                               │ 4.5      │ obligatoria │ 3     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 79 │ Biotecnología de los productos hortofrutículas               │ 4.5      │ obligatoria │ 3     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 80 │ Biotecnología vegetal                                        │ 6.0      │ obligatoria │ 3     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 81 │ Genómica y proteómica                                        │ 4.5      │ obligatoria │ 3     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 82 │ Procesos biotecnológicos                                     │ 6.0      │ obligatoria │ 3     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 83 │ Técnicas instrumentales avanzadas                            │ 4.5      │ obligatoria │ 3     │ 2            │             │ 7        │
└────┴──────────────────────────────────────────────────────────────┴──────────┴─────────────┴───────┴──────────────┴─────────────┴──────────┘
**/

--Devuelve un listado con todos los departamentos que no han impartido asignaturas en ningún curso escolar.

SELECT * FROM departamento WHERE id not in (SELECT d.id FROM departamento as d JOIN profesor as p on d.id=p.id_departamento JOIN asignatura as a on p.id_profesor=a.id_profesor);
/**
┌────┬─────────────────────┐
│ id │       nombre        │
├────┼─────────────────────┤
│ 2  │ Matemáticas         │
│ 3  │ Economía y Empresa  │
│ 4  │ Educación           │
│ 5  │ Agronomía           │
│ 6  │ Química y Física    │
│ 7  │ Filología           │
│ 8  │ Derecho             │
│ 9  │ Biología y Geología │
└────┴─────────────────────┘
**/

