# Tarea 3

Para empezar crearemos la base de datos. Para ellos deberemos de crarla usando el siguiente comado

```sql
nano empleados-dump.sql
```
Una vez creada la base de datos procedemos a insertar en el interior del fichero los comando de sql:

```sql
CREATE TABLE empleados (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT,
    salario REAL,
    departamento TEXT
);

INSERT INTO empleados (nombre, salario, departamento) VALUES ('Juan', 50000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('María', 60000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Carlos', 55000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Ana', 48000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Pedro', 70000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Laura', 52000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Javier', 48000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Carmen', 65000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Miguel', 51000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Elena', 55000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Diego', 72000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Sofía', 49000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Andrés', 60000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Isabel', 53000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Raúl', 68000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Patricia', 47000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Alejandro', 71000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Natalia', 54000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Roberto', 49000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Beatriz', 63000, 'TI');
```
Abrimos nuestra bade de datos
```sql
sqlite3 Tarea3.db
```
Comandos:
```sql
.read empleados-dump.sql
```
```sql
.table
.headers on
.mode box
```

## Muestra el nombre de todos los empleados en mayúsculas.
```sql
SELECT UPPER(nombre) AS nombre_mayusculas FROM empleados;
```
```sql
┌───────────────────┐
│ nombre_mayusculas │
├───────────────────┤
│ JUAN              │
│ MARíA             │
│ CARLOS            │
│ ANA               │
│ PEDRO             │
│ LAURA             │
│ JAVIER            │
│ CARMEN            │
│ MIGUEL            │
│ ELENA             │
│ DIEGO             │
│ SOFíA             │
│ ANDRéS            │
│ ISABEL            │
│ RAúL              │
│ PATRICIA          │
│ ALEJANDRO         │
│ NATALIA           │
│ ROBERTO           │
│ BEATRIZ           │
└───────────────────┘
```
## Calcula el valor absoluto del salario de todos los empleados.

```sql
SELECT ABS(salario) AS valor_abs FROM empleados;
```
```
┌───────────┐
│ valor_abs │
├───────────┤
│ 50000.0   │
│ 60000.0   │
│ 55000.0   │
│ 48000.0   │
│ 70000.0   │
│ 52000.0   │
│ 48000.0   │
│ 65000.0   │
│ 51000.0   │
│ 55000.0   │
│ 72000.0   │
│ 49000.0   │
│ 60000.0   │
│ 53000.0   │
│ 68000.0   │
│ 47000.0   │
│ 71000.0   │
│ 54000.0   │
│ 49000.0   │
│ 63000.0   │
└───────────┘
```
## Muestra la fecha actual

```sql
SELECT CURRENT_DATE AS fecha_actual;
```
```sql
┌──────────────┐
│ fecha_actual │
├──────────────┤
│ 2024-01-17   │
└──────────────┘
```
## Calcule el promedio de salarios de los empleados.

```sql
SELECT AVG(salario) AS promedio_salario FROM empleados;
```
```
┌──────────────────┐
│ promedio_salario │
├──────────────────┤
│ 57000.0          │
└──────────────────┘
```
## Convierte la cadena 123 a valor entero.

```sql
SELECT CAST('123' AS INTEGER) AS entero;
```
```sql
┌────────┐
│ entero │
├────────┤
│ 123    │
└────────┘
```
## Concatena el nombre y el departamento de cada empleado.

```sql
SELECT nombre || ' ' || departamento as nombre_departamento from empleados;
```
```sql
┌───────────────────────────┐
│    nombre_departamento    │
├───────────────────────────┤
│ Juan Ventas               │
│ María TI                  │
│ Carlos Ventas             │
│ Ana Recursos Humanos      │
│ Pedro TI                  │
│ Laura Ventas              │
│ Javier Recursos Humanos   │
│ Carmen TI                 │
│ Miguel Ventas             │
│ Elena Recursos Humanos    │
│ Diego TI                  │
│ Sofía Ventas              │
│ Andrés Recursos Humanos   │
│ Isabel TI                 │
│ Raúl Ventas               │
│ Patricia Recursos Humanos │
│ Alejandro TI              │
│ Natalia Ventas            │
│ Roberto Recursos Humanos  │
│ Beatriz TI                │
└───────────────────────────┘
```

## Concatena el nombre y el departamento de cada empleado con un guion como separador.

```sql
SELECT nombre || '-' || departamento as nombre_departamento from empleados;
```
```sql
┌───────────────────────────┐
│    nombre_departamento    │
├───────────────────────────┤
│ Juan-Ventas               │
│ María-TI                  │
│ Carlos-Ventas             │
│ Ana-Recursos Humanos      │
│ Pedro-TI                  │
│ Laura-Ventas              │
│ Javier-Recursos Humanos   │
│ Carmen-TI                 │
│ Miguel-Ventas             │
│ Elena-Recursos Humanos    │
│ Diego-TI                  │
│ Sofía-Ventas              │
│ Andrés-Recursos Humanos   │
│ Isabel-TI                 │
│ Raúl-Ventas               │
│ Patricia-Recursos Humanos │
│ Alejandro-TI              │
│ Natalia-Ventas            │
│ Roberto-Recursos Humanos  │
│ Beatriz-TI                │
└───────────────────────────┘
```
## Categoriza a los empleados según sus salarios.
```sql
SELECT salario, CASE WHEN salario > 50000 THEN 'Alto' ELSE 'Bajo' END AS rango_salario FROM empleados;
```
```
┌─────────┬───────────────┐
│ salario │ rango_salario │
├─────────┼───────────────┤
│ 50000.0 │ Bajo          │
│ 60000.0 │ Alto          │
│ 55000.0 │ Alto          │
│ 48000.0 │ Bajo          │
│ 70000.0 │ Alto          │
│ 52000.0 │ Alto          │
│ 48000.0 │ Bajo          │
│ 65000.0 │ Alto          │
│ 51000.0 │ Alto          │
│ 55000.0 │ Alto          │
│ 72000.0 │ Alto          │
│ 49000.0 │ Bajo          │
│ 60000.0 │ Alto          │
│ 53000.0 │ Alto          │
│ 68000.0 │ Alto          │
│ 47000.0 │ Bajo          │
│ 71000.0 │ Alto          │
│ 54000.0 │ Alto          │
│ 49000.0 │ Bajo          │
│ 63000.0 │ Alto          │
└─────────┴───────────────┘
```
## Calcule la suma totral de los salarios de los empleados
```sql
SELECT SUM(salario) as suma_salarios FROM empleados;
```
```
┌───────────────┐
│ suma_salarios │
├───────────────┤
│ 1140000.0     │
└───────────────┘
```

## Redondea el salario de todos los empleados a dos decimales.

```sql
SELECT nombre, ROUND(salario, 2) AS salario_redondeado FROM empleados;
```
```
┌───────────┬────────────────────┐
│  nombre   │ salario_redondeado │
├───────────┼────────────────────┤
│ Juan      │ 50000.0            │
│ María     │ 60000.0            │
│ Carlos    │ 55000.0            │
│ Ana       │ 48000.0            │
│ Pedro     │ 70000.0            │
│ Laura     │ 52000.0            │
│ Javier    │ 48000.0            │
│ Carmen    │ 65000.0            │
│ Miguel    │ 51000.0            │
│ Elena     │ 55000.0            │
│ Diego     │ 72000.0            │
│ Sofía     │ 49000.0            │
│ Andrés    │ 60000.0            │
│ Isabel    │ 53000.0            │
│ Raúl      │ 68000.0            │
│ Patricia  │ 47000.0            │
│ Alejandro │ 71000.0            │
│ Natalia   │ 54000.0            │
│ Roberto   │ 49000.0            │
│ Beatriz   │ 63000.0            │
└───────────┴────────────────────┘
```
## Muestra la longitud de cada nombre de empleado.

```sql
SELECT nombre, LENGTH(nombre) as longitud_nombre FROM empleados;
```
```sql
┌───────────┬─────────────────┐
│  nombre   │ longitud_nombre │
├───────────┼─────────────────┤
│ Juan      │ 4               │
│ María     │ 5               │
│ Carlos    │ 6               │
│ Ana       │ 3               │
│ Pedro     │ 5               │
│ Laura     │ 5               │
│ Javier    │ 6               │
│ Carmen    │ 6               │
│ Miguel    │ 6               │
│ Elena     │ 5               │
│ Diego     │ 5               │
│ Sofía     │ 5               │
│ Andrés    │ 6               │
│ Isabel    │ 6               │
│ Raúl      │ 4               │
│ Patricia  │ 8               │
│ Alejandro │ 9               │
│ Natalia   │ 7               │
│ Roberto   │ 7               │
│ Beatriz   │ 7               │
└───────────┴─────────────────┘
```
## Cuenta el número total de empleados en cada departamento.
```sql
SELECT departamento, COUNT(*) AS total_empleados FROM empleados GROUP BY departamento;
```
```sql
┌──────────────────┬─────────────────┐
│   departamento   │ total_empleados │
├──────────────────┼─────────────────┤
│ Recursos Humanos │ 6               │
│ TI               │ 7               │
│ Ventas           │ 7               │
└──────────────────┴─────────────────┘
```
## Muestra la hora actual.
```sql
SELECT CURRENT_TIME AS hora_actual;
```
```sql
┌─────────────┐
│ hora_actual │
├─────────────┤
│ 20:17:04    │
└─────────────┘
```
## Convierte el salario a un valor de punto flotante.
```sql
SELECT nombre, CAST(salario AS FLOAT) AS salario_flotante FROM empleados;
```
```sql
┌───────────┬──────────────────┐
│  nombre   │ salario_flotante │
├───────────┼──────────────────┤
│ Juan      │ 50000.0          │
│ María     │ 60000.0          │
│ Carlos    │ 55000.0          │
│ Ana       │ 48000.0          │
│ Pedro     │ 70000.0          │
│ Laura     │ 52000.0          │
│ Javier    │ 48000.0          │
│ Carmen    │ 65000.0          │
│ Miguel    │ 51000.0          │
│ Elena     │ 55000.0          │
│ Diego     │ 72000.0          │
│ Sofía     │ 49000.0          │
│ Andrés    │ 60000.0          │
│ Isabel    │ 53000.0          │
│ Raúl      │ 68000.0          │
│ Patricia  │ 47000.0          │
│ Alejandro │ 71000.0          │
│ Natalia   │ 54000.0          │
│ Roberto   │ 49000.0          │
│ Beatriz   │ 63000.0          │
└───────────┴──────────────────┘
```
## Muestra los primeros tres caracteres de cada nombre de empleado.
```sql
SELECT nombre, SUBSTR(nombre, 1, 3) as tres_letras from empleados;
```
```sql
┌───────────┬─────────────┐
│  nombre   │ tres_letras │
├───────────┼─────────────┤
│ Juan      │ Jua         │
│ María     │ Mar         │
│ Carlos    │ Car         │
│ Ana       │ Ana         │
│ Pedro     │ Ped         │
│ Laura     │ Lau         │
│ Javier    │ Jav         │
│ Carmen    │ Car         │
│ Miguel    │ Mig         │
│ Elena     │ Ele         │
│ Diego     │ Die         │
│ Sofía     │ Sof         │
│ Andrés    │ And         │
│ Isabel    │ Isa         │
│ Raúl      │ Raú         │
│ Patricia  │ Pat         │
│ Alejandro │ Ale         │
│ Natalia   │ Nat         │
│ Roberto   │ Rob         │
│ Beatriz   │ Bea         │
└───────────┴─────────────┘
```
## Empleados en el departamento de 'Ventas' con salarios superiores a 52000.

```sql
 SELECT nombre, departamento, salario FROM empleados WHERE departamento = 'Ventas' and salario > 52000 ORDER BY salario DESC;
```
```sql
┌─────────┬──────────────┬─────────┐
│ nombre  │ departamento │ salario │
├─────────┼──────────────┼─────────┤
│ Raúl    │ Ventas       │ 68000.0 │
│ Carlos  │ Ventas       │ 55000.0 │
│ Natalia │ Ventas       │ 54000.0 │
└─────────┴──────────────┴─────────┘
```

## Empleados cuyos nombres contienen la letra 'a' y tienen salarios ordenados de manera ascendente.

```sql
select nombre, salario from empleados where nombre like '%a%' order by salario asc;
```
```sql
┌───────────┬─────────┐
│  nombre   │ salario │
├───────────┼─────────┤
│ Patricia  │ 47000.0 │
│ Ana       │ 48000.0 │
│ Javier    │ 48000.0 │
│ Sofía     │ 49000.0 │
│ Juan      │ 50000.0 │
│ Laura     │ 52000.0 │
│ Isabel    │ 53000.0 │
│ Natalia   │ 54000.0 │
│ Carlos    │ 55000.0 │
│ Elena     │ 55000.0 │
│ María     │ 60000.0 │
│ Andrés    │ 60000.0 │
│ Beatriz   │ 63000.0 │
│ Carmen    │ 65000.0 │
│ Raúl      │ 68000.0 │
│ Alejandro │ 71000.0 │
└───────────┴─────────┘
```

## Empleados en el departamento 'Recursos Humanos' con salarios entre 45000 y 55000.

```sql
sqlite> SELECT nombre, departamento, salario FROM empleados WHERE departamento = 'Recursos Humanos' and salario between 45000 and 55000;
```
```sql
┌──────────┬──────────────────┬─────────┐
│  nombre  │   departamento   │ salario │
├──────────┼──────────────────┼─────────┤
│ Ana      │ Recursos Humanos │ 48000.0 │
│ Javier   │ Recursos Humanos │ 48000.0 │
│ Elena    │ Recursos Humanos │ 55000.0 │
│ Patricia │ Recursos Humanos │ 47000.0 │
│ Roberto  │ Recursos Humanos │ 49000.0 │
└──────────┴──────────────────┴─────────┘
```
## Empleados con salarios en orden descendente, limitando a los primeros 5 resultados

```sql
SELECT nombre, salario from empleados order by salario asc LIMIT 5;
```
```sql
┌──────────┬─────────┐
│  nombre  │ salario │
├──────────┼─────────┤
│ Patricia │ 47000.0 │
│ Ana      │ 48000.0 │
│ Javier   │ 48000.0 │
│ Sofía    │ 49000.0 │
│ Roberto  │ 49000.0 │
└──────────┴─────────┘
```
## Empleados cuyos nombres comienzan con 'M' o 'N' y tienen salarios superiores a 50000.

```sql
select nombre, salario from empleados where nombre like 'M%' or 'N%' and  salario > 50000;
```
```sql
┌────────┬─────────┐
│ nombre │ salario │
├────────┼─────────┤
│ María  │ 60000.0 │
│ Miguel │ 51000.0 │
└────────┴─────────┘
```
## Empleados en el departamento 'TI' o 'Ventas' ordenados alfabéticamente por nombre.

```sql
SELECT nombre, departamento FROM empleados WHERE departamento = 'Ventas' ORDER BY nombre asc;
```
```sql
┌─────────┬──────────────┐
│ nombre  │ departamento │
├─────────┼──────────────┤
│ Carlos  │ Ventas       │
│ Juan    │ Ventas       │
│ Laura   │ Ventas       │
│ Miguel  │ Ventas       │
│ Natalia │ Ventas       │
│ Raúl    │ Ventas       │
│ Sofía   │ Ventas       │
└─────────┴──────────────┘
```
## Empleados con salarios únicos (eliminando duplicados) en orden ascendente.

```sql
SELECT DISTINCT salario FROM empleados ORDER BY salario asc;
```
```sql
┌─────────┐
│ salario │
├─────────┤
│ 47000.0 │
│ 48000.0 │
│ 49000.0 │
│ 50000.0 │
│ 51000.0 │
│ 52000.0 │
│ 53000.0 │
│ 54000.0 │
│ 55000.0 │
│ 60000.0 │
│ 63000.0 │
│ 65000.0 │
│ 68000.0 │
│ 70000.0 │
│ 71000.0 │
│ 72000.0 │
└─────────┘
```
## Empleados cuyos nombres terminan con 'o' o 'a' y están en el departamento 'Ventas'.

```sql
SELECT nombre, departamento FROM empleados WHERE departamento = 'Ventas' and nombre like '%o' or '%a';
```
```sql
┌─────────┬──────────────┐
│ nombre  │ departamento │
├─────────┼──────────────┤
│ Laura   │ Ventas       │
│ Sofía   │ Ventas       │
│ Natalia │ Ventas       │
└─────────┴──────────────┘
```
## Empleados con salarios fuera del rango de 55000 a 70000, ordenados por departamento

```sql
SELECT nombre, salario, departamento FROM empleados WHERE salario not between 55000 and 70000 ORDER BY departamento;
```
```sql
┌───────────┬─────────┬──────────────────┐
│  nombre   │ salario │   departamento   │
├───────────┼─────────┼──────────────────┤
│ Ana       │ 48000.0 │ Recursos Humanos │
│ Javier    │ 48000.0 │ Recursos Humanos │
│ Patricia  │ 47000.0 │ Recursos Humanos │
│ Roberto   │ 49000.0 │ Recursos Humanos │
│ Diego     │ 72000.0 │ TI               │
│ Isabel    │ 53000.0 │ TI               │
│ Alejandro │ 71000.0 │ TI               │
│ Juan      │ 50000.0 │ Ventas           │
│ Laura     │ 52000.0 │ Ventas           │
│ Miguel    │ 51000.0 │ Ventas           │
│ Sofía     │ 49000.0 │ Ventas           │
│ Natalia   │ 54000.0 │ Ventas           │
└───────────┴─────────┴──────────────────┘
```
## Empleados en el departamento 'Recursos Humanos' con nombres que no contienen la letra 'e'.

```sql
SELECT nombre, departamento FROM empleados WHERE departamento = 'Recursos Humanos' and nombre NOT LIKE '%e%';
```
```sql
┌──────────┬──────────────────┐
│  nombre  │   departamento   │
├──────────┼──────────────────┤
│ Ana      │ Recursos Humanos │
│ Andrés   │ Recursos Humanos │
│ Patricia │ Recursos Humanos │
└──────────┴──────────────────┘
```