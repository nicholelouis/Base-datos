# Optimización de Base de Datos

<p align="center">
  <img src="https://github.com/nicholelouis/Base-datos/blob/main/img/optimizacion-bd.png?raw=true" alt="Descripción de la imagen" width="300"/>
</p>

## Tarea 4
### Trabajo con Sakila
Vamos a realizar el trabajo con una BBDD existente en la documentación oficial de MySql. Su nombre es Sakila.

La base de datos está disponible en la [web oficial de MySQL](https://dev.mysql.com/doc/index-other.html).

A continuación se debe de realizar la carga de la BBDD.
```sql
source sakila.db;
```

Se pide:

- Actores que tienen de primer nombre Scarlett.
```sql
select * from actor where first_name = "Scarlett";
+----------+------------+-----------+---------------------+
| actor_id | first_name | last_name | last_update         |
+----------+------------+-----------+---------------------+
|       81 | SCARLETT   | DAMON     | 2006-02-15 04:34:33 |
|      124 | SCARLETT   | BENING    | 2006-02-15 04:34:33 |
+----------+------------+-----------+---------------------+
```

- Actores que tienen de apellido Johansson.
```sql
select * from actor where last_name = "Johansson";
+----------+------------+-----------+---------------------+
| actor_id | first_name | last_name | last_update         |
+----------+------------+-----------+---------------------+
|        8 | MATTHEW    | JOHANSSON | 2006-02-15 04:34:33 |
|       64 | RAY        | JOHANSSON | 2006-02-15 04:34:33 |
|      146 | ALBERT     | JOHANSSON | 2006-02-15 04:34:33 |
+----------+------------+-----------+---------------------+
```

- Actores que contengan una O en su nombre.
```sql
select * from actor where first_name regexp 'o';
+----------+-------------+--------------+---------------------+
| actor_id | first_name  | last_name    | last_update         |
+----------+-------------+--------------+---------------------+
|        1 | PENELOPE    | GUINESS      | 2006-02-15 04:34:33 |
|        5 | JOHNNY      | LOLLOBRIGIDA | 2006-02-15 04:34:33 |
|        9 | JOE         | SWANK        | 2006-02-15 04:34:33 |
|       11 | ZERO        | CAGE         | 2006-02-15 04:34:33 |
|       19 | BOB         | FAWCETT      | 2006-02-15 04:34:33 |
|       24 | CAMERON     | STREEP       | 2006-02-15 04:34:33 |
|       28 | WOODY       | HOFFMAN      | 2006-02-15 04:34:33 |
|       38 | TOM         | MCKELLEN     | 2006-02-15 04:34:33 |
|       39 | GOLDIE      | BRODY        | 2006-02-15 04:34:33 |
|       40 | JOHNNY      | CAGE         | 2006-02-15 04:34:33 |
|       41 | JODIE       | DEGENERES    | 2006-02-15 04:34:33 |
|       42 | TOM         | MIRANDA      | 2006-02-15 04:34:33 |
|       54 | PENELOPE    | PINKETT      | 2006-02-15 04:34:33 |
|       63 | CAMERON     | WRAY         | 2006-02-15 04:34:33 |
|       78 | GROUCHO     | SINATRA      | 2006-02-15 04:34:33 |
|       82 | WOODY       | JOLIE        | 2006-02-15 04:34:33 |
|       91 | CHRISTOPHER | BERRY        | 2006-02-15 04:34:33 |
|      104 | PENELOPE    | CRONYN       | 2006-02-15 04:34:33 |
|      106 | GROUCHO     | DUNST        | 2006-02-15 04:34:33 |
|      111 | CAMERON     | ZELLWEGER    | 2006-02-15 04:34:33 |
|      113 | MORGAN      | HOPKINS      | 2006-02-15 04:34:33 |
|      114 | MORGAN      | MCDORMAND    | 2006-02-15 04:34:33 |
|      115 | HARRISON    | BALE         | 2006-02-15 04:34:33 |
|      120 | PENELOPE    | MONROE       | 2006-02-15 04:34:33 |
|      137 | MORGAN      | WILLIAMS     | 2006-02-15 04:34:33 |
|      140 | WHOOPI      | HURT         | 2006-02-15 04:34:33 |
|      151 | GEOFFREY    | HESTON       | 2006-02-15 04:34:33 |
|      162 | OPRAH       | KILMER       | 2006-02-15 04:34:33 |
|      163 | CHRISTOPHER | WEST         | 2006-02-15 04:34:33 |
|      171 | OLYMPIA     | PFEIFFER     | 2006-02-15 04:34:33 |
|      172 | GROUCHO     | WILLIAMS     | 2006-02-15 04:34:33 |
|      176 | JON         | CHASE        | 2006-02-15 04:34:33 |
|      188 | ROCK        | DUKAKIS      | 2006-02-15 04:34:33 |
|      191 | GREGORY     | GOODING      | 2006-02-15 04:34:33 |
|      192 | JOHN        | SUVARI       | 2006-02-15 04:34:33 |
|      200 | THORA       | TEMPLE       | 2006-02-15 04:34:33 |
+----------+-------------+--------------+---------------------+
```

- Actores que contengan una O en su nombre y en una A en su apellido.
```sql
select * from actor where first_name regexp 'o' and last_name regexp 'a';

+----------+------------+--------------+---------------------+
| actor_id | first_name | last_name    | last_update         |
+----------+------------+--------------+---------------------+
|        5 | JOHNNY     | LOLLOBRIGIDA | 2006-02-15 04:34:33 |
|        9 | JOE        | SWANK        | 2006-02-15 04:34:33 |
|       11 | ZERO       | CAGE         | 2006-02-15 04:34:33 |
|       19 | BOB        | FAWCETT      | 2006-02-15 04:34:33 |
|       28 | WOODY      | HOFFMAN      | 2006-02-15 04:34:33 |
|       40 | JOHNNY     | CAGE         | 2006-02-15 04:34:33 |
|       42 | TOM        | MIRANDA      | 2006-02-15 04:34:33 |
|       63 | CAMERON    | WRAY         | 2006-02-15 04:34:33 |
|       78 | GROUCHO    | SINATRA      | 2006-02-15 04:34:33 |
|      114 | MORGAN     | MCDORMAND    | 2006-02-15 04:34:33 |
|      115 | HARRISON   | BALE         | 2006-02-15 04:34:33 |
|      137 | MORGAN     | WILLIAMS     | 2006-02-15 04:34:33 |
|      172 | GROUCHO    | WILLIAMS     | 2006-02-15 04:34:33 |
|      176 | JON        | CHASE        | 2006-02-15 04:34:33 |
|      188 | ROCK       | DUKAKIS      | 2006-02-15 04:34:33 |
|      192 | JOHN       | SUVARI       | 2006-02-15 04:34:33 |
+----------+------------+--------------+---------------------+
```

- Actores que contengan dos O en su nombre y en una A en su apellido.
```sql
select * from actor where first_name regexp '.*o.*o' and last_name regexp
 'a';
+----------+------------+-----------+---------------------+
| actor_id | first_name | last_name | last_update         |
+----------+------------+-----------+---------------------+
|       28 | WOODY      | HOFFMAN   | 2006-02-15 04:34:33 |
|       78 | GROUCHO    | SINATRA   | 2006-02-15 04:34:33 |
|      172 | GROUCHO    | WILLIAMS  | 2006-02-15 04:34:33 |
+----------+------------+-----------+---------------------+
```

- Actores donde su tercera letra sea B.
```sql
select * from actor where first_name regexp '^.{2}b';
+----------+------------+-----------+---------------------+
| actor_id | first_name | last_name | last_update         |
+----------+------------+-----------+---------------------+
|       15 | CUBA       | OLIVIER   | 2006-02-15 04:34:33 |
|       19 | BOB        | FAWCETT   | 2006-02-15 04:34:33 |
|      118 | CUBA       | ALLEN     | 2006-02-15 04:34:33 |
|      125 | ALBERT     | NOLTE     | 2006-02-15 04:34:33 |
|      146 | ALBERT     | JOHANSSON | 2006-02-15 04:34:33 |
|      182 | DEBBIE     | AKROYD    | 2006-02-15 04:34:33 |
|      189 | CUBA       | BIRCH     | 2006-02-15 04:34:33 |
+----------+------------+-----------+---------------------+
```

- Ciudades que empiezan por a.
```sql
select * from city where city regexp '^A';
+---------+-------------------------+------------+---------------------+
| city_id | city                    | country_id | last_update         |
+---------+-------------------------+------------+---------------------+
|       1 | A Coruña (La Coruña)    |         87 | 2006-02-15 04:45:25 |
|       2 | Abha                    |         82 | 2006-02-15 04:45:25 |
|       3 | Abu Dhabi               |        101 | 2006-02-15 04:45:25 |
|       4 | Acuña                   |         60 | 2006-02-15 04:45:25 |
|       5 | Adana                   |         97 | 2006-02-15 04:45:25 |
|       6 | Addis Abeba             |         31 | 2006-02-15 04:45:25 |
|       7 | Aden                    |        107 | 2006-02-15 04:45:25 |
|       8 | Adoni                   |         44 | 2006-02-15 04:45:25 |
|       9 | Ahmadnagar              |         44 | 2006-02-15 04:45:25 |
|      10 | Akishima                |         50 | 2006-02-15 04:45:25 |
|      11 | Akron                   |        103 | 2006-02-15 04:45:25 |
|      12 | al-Ayn                  |        101 | 2006-02-15 04:45:25 |
|      13 | al-Hawiya               |         82 | 2006-02-15 04:45:25 |
|      14 | al-Manama               |         11 | 2006-02-15 04:45:25 |
|      15 | al-Qadarif              |         89 | 2006-02-15 04:45:25 |
|      16 | al-Qatif                |         82 | 2006-02-15 04:45:25 |
|      17 | Alessandria             |         49 | 2006-02-15 04:45:25 |
|      18 | Allappuzha (Alleppey)   |         44 | 2006-02-15 04:45:25 |
|      19 | Allende                 |         60 | 2006-02-15 04:45:25 |
|      20 | Almirante Brown         |          6 | 2006-02-15 04:45:25 |
|      21 | Alvorada                |         15 | 2006-02-15 04:45:25 |
|      22 | Ambattur                |         44 | 2006-02-15 04:45:25 |
|      23 | Amersfoort              |         67 | 2006-02-15 04:45:25 |
|      24 | Amroha                  |         44 | 2006-02-15 04:45:25 |
|      25 | Angra dos Reis          |         15 | 2006-02-15 04:45:25 |
|      26 | Anápolis                |         15 | 2006-02-15 04:45:25 |
|      27 | Antofagasta             |         22 | 2006-02-15 04:45:25 |
|      28 | Aparecida de Goiânia    |         15 | 2006-02-15 04:45:25 |
|      29 | Apeldoorn               |         67 | 2006-02-15 04:45:25 |
|      30 | Araçatuba               |         15 | 2006-02-15 04:45:25 |
|      31 | Arak                    |         46 | 2006-02-15 04:45:25 |
|      32 | Arecibo                 |         77 | 2006-02-15 04:45:25 |
|      33 | Arlington               |        103 | 2006-02-15 04:45:25 |
|      34 | Ashdod                  |         48 | 2006-02-15 04:45:25 |
|      35 | Ashgabat                |         98 | 2006-02-15 04:45:25 |
|      36 | Ashqelon                |         48 | 2006-02-15 04:45:25 |
|      37 | Asunción                |         73 | 2006-02-15 04:45:25 |
|      38 | Athenai                 |         39 | 2006-02-15 04:45:25 |
|      39 | Atšinsk                 |         80 | 2006-02-15 04:45:25 |
|      40 | Atlixco                 |         60 | 2006-02-15 04:45:25 |
|      41 | Augusta-Richmond County |        103 | 2006-02-15 04:45:25 |
|      42 | Aurora                  |        103 | 2006-02-15 04:45:25 |
|      43 | Avellaneda              |          6 | 2006-02-15 04:45:25 |
+---------+-------------------------+------------+---------------------+
```

- Ciudades que acaban por s.
```sql
select * from city where city regexp '$s';
Empty set (0,00 sec)
```

- Ciudades del country 61.
```sql
select * from city where country_id = 61;
+---------+----------+------------+---------------------+
| city_id | city     | country_id | last_update         |
+---------+----------+------------+---------------------+
|     115 | Chisinau |         61 | 2006-02-15 04:45:25 |
+---------+----------+------------+---------------------+
```

- Ciudades del country Spain.
```sql
select * from city where country_id = (select country_id from country where country = 'Spain');
+---------+-------------------------+------------+---------------------+
| city_id | city                    | country_id | last_update         |
+---------+-------------------------+------------+---------------------+
|       1 | A Coruña (La Coruña)    |         87 | 2006-02-15 04:45:25 |
|     146 | Donostia-San Sebastián  |         87 | 2006-02-15 04:45:25 |
|     181 | Gijón                   |         87 | 2006-02-15 04:45:25 |
|     388 | Ourense (Orense)        |         87 | 2006-02-15 04:45:25 |
|     459 | Santiago de Compostela  |         87 | 2006-02-15 04:45:25 |
+---------+-------------------------+------------+---------------------+
```

- Ciudades con nombres compuestos.
```sql
select * from city where city regexp '.* .*';
+---------+----------------------------+------------+---------------------+
| city_id | city                       | country_id | last_update         |
+---------+----------------------------+------------+---------------------+
|       1 | A Coruña (La Coruña)       |         87 | 2006-02-15 04:45:25 |
|       3 | Abu Dhabi                  |        101 | 2006-02-15 04:45:25 |
|       6 | Addis Abeba                |         31 | 2006-02-15 04:45:25 |
|      18 | Allappuzha (Alleppey)      |         44 | 2006-02-15 04:45:25 |
|      20 | Almirante Brown            |          6 | 2006-02-15 04:45:25 |
|      25 | Angra dos Reis             |         15 | 2006-02-15 04:45:25 |
|      28 | Aparecida de Goiânia       |         15 | 2006-02-15 04:45:25 |
|      41 | Augusta-Richmond County    |        103 | 2006-02-15 04:45:25 |
|      45 | Bahía Blanca               |          6 | 2006-02-15 04:45:25 |
|      53 | Bandar Seri Begawan        |         16 | 2006-02-15 04:45:25 |
|      57 | Bat Yam                    |         48 | 2006-02-15 04:45:25 |
|      69 | Benin City                 |         69 | 2006-02-15 04:45:25 |
|      71 | Berhampore (Baharampur)    |         44 | 2006-02-15 04:45:25 |
|      84 | Boa Vista                  |         15 | 2006-02-15 04:45:25 |
|     100 | Cam Ranh                   |        105 | 2006-02-15 04:45:25 |
|     101 | Cape Coral                 |        103 | 2006-02-15 04:45:25 |
|     111 | Charlotte Amalie           |        106 | 2006-02-15 04:45:25 |
|     120 | Citrus Heights             |        103 | 2006-02-15 04:45:25 |
|     121 | Città del Vaticano         |         41 | 2006-02-15 04:45:25 |
|     122 | Ciudad del Este            |         73 | 2006-02-15 04:45:25 |
|     124 | Coacalco de Berriozábal    |         60 | 2006-02-15 04:45:25 |
|     141 | Deba Habe                  |         69 | 2006-02-15 04:45:25 |
|     144 | Dhule (Dhulia)             |         44 | 2006-02-15 04:45:25 |
|     146 | Donostia-San Sebastián     |         87 | 2006-02-15 04:45:25 |
|     147 | Dos Quebradas              |         24 | 2006-02-15 04:45:25 |
|     153 | El Alto                    |         14 | 2006-02-15 04:45:25 |
|     154 | El Fuerte                  |         60 | 2006-02-15 04:45:25 |
|     155 | El Monte                   |        103 | 2006-02-15 04:45:25 |
|     177 | Garden Grove               |        103 | 2006-02-15 04:45:25 |
|     185 | Grand Prairie              |        103 | 2006-02-15 04:45:25 |
|     190 | Águas Lindas de Goiás      |         15 | 2006-02-15 04:45:25 |
|     212 | Huejutla de Reyes          |         60 | 2006-02-15 04:45:25 |
|     233 | Jalib al-Shuyukh           |         53 | 2006-02-15 04:45:25 |
|     246 | José Azueta                |         60 | 2006-02-15 04:45:25 |
|     247 | Juazeiro do Norte          |         15 | 2006-02-15 04:45:25 |
|     248 | Juiz de Fora               |         15 | 2006-02-15 04:45:25 |
|     262 | Kansas City                |        103 | 2006-02-15 04:45:25 |
|     279 | Kowloon and New Kowloon    |         42 | 2006-02-15 04:45:25 |
|     288 | La Paz                     |         60 | 2006-02-15 04:45:25 |
|     289 | La Plata                   |          6 | 2006-02-15 04:45:25 |
|     290 | La Romana                  |         27 | 2006-02-15 04:45:25 |
|     297 | Le Mans                    |         34 | 2006-02-15 04:45:25 |
|     324 | Mandi Bahauddin            |         72 | 2006-02-15 04:45:25 |
|     337 | Mit Ghamr                  |         29 | 2006-02-15 04:45:25 |
|     346 | Munger (Monghyr)           |         44 | 2006-02-15 04:45:25 |
|     352 | Nabereznyje Tšelny         |         80 | 2006-02-15 04:45:25 |
|     358 | Nakhon Sawan               |         94 | 2006-02-15 04:45:25 |
|     359 | Nam Dinh                   |        105 | 2006-02-15 04:45:25 |
|     366 | Nha Trang                  |        105 | 2006-02-15 04:45:25 |
|     368 | Novi Sad                   |        108 | 2006-02-15 04:45:25 |
|     373 | Ocumare del Tuy            |        104 | 2006-02-15 04:45:25 |
|     388 | Ourense (Orense)           |         87 | 2006-02-15 04:45:25 |
|     393 | Pachuca de Soto            |         60 | 2006-02-15 04:45:25 |
|     394 | Pak Kret                   |         94 | 2006-02-15 04:45:25 |
|     395 | Palghat (Palakkad)         |         44 | 2006-02-15 04:45:25 |
|     396 | Pangkal Pinang             |         45 | 2006-02-15 04:45:25 |
|     406 | Phnom Penh                 |         18 | 2006-02-15 04:45:25 |
|     413 | Poços de Caldas            |         15 | 2006-02-15 04:45:25 |
|     418 | Purnea (Purnia)            |         44 | 2006-02-15 04:45:25 |
|     425 | Rae Bareli                 |         44 | 2006-02-15 04:45:25 |
|     430 | Richmond Hill              |         20 | 2006-02-15 04:45:25 |
|     431 | Rio Claro                  |         15 | 2006-02-15 04:45:25 |
|     441 | Saint Louis                |        103 | 2006-02-15 04:45:25 |
|     449 | San Bernardino             |        103 | 2006-02-15 04:45:25 |
|     450 | San Felipe de Puerto Plata |         27 | 2006-02-15 04:45:25 |
|     451 | San Felipe del Progreso    |         60 | 2006-02-15 04:45:25 |
|     452 | San Juan Bautista Tuxtepec |         60 | 2006-02-15 04:45:25 |
|     453 | San Lorenzo                |         73 | 2006-02-15 04:45:25 |
|     454 | San Miguel de Tucumán      |          6 | 2006-02-15 04:45:25 |
|     456 | Santa Bárbara d´Oeste      |         15 | 2006-02-15 04:45:25 |
|     457 | Santa Fé                   |          6 | 2006-02-15 04:45:25 |
|     458 | Santa Rosa                 |         75 | 2006-02-15 04:45:25 |
|     459 | Santiago de Compostela     |         87 | 2006-02-15 04:45:25 |
|     460 | Santiago de los Caballeros |         27 | 2006-02-15 04:45:25 |
|     461 | Santo André                |         15 | 2006-02-15 04:45:25 |
|     467 | Shahr-e Kord               |         46 | 2006-02-15 04:45:25 |
|     476 | Shubra al-Khayma           |         29 | 2006-02-15 04:45:25 |
|     478 | Siliguri (Shiliguri)       |         44 | 2006-02-15 04:45:25 |
|     485 | São Bernardo do Campo      |         15 | 2006-02-15 04:45:25 |
|     486 | São Leopoldo               |         15 | 2006-02-15 04:45:25 |
|     493 | South Hill                 |          5 | 2006-02-15 04:45:25 |
|     498 | Stara Zagora               |         17 | 2006-02-15 04:45:25 |
|     499 | Sterling Heights           |        103 | 2006-02-15 04:45:25 |
|     507 | Sungai Petani              |         59 | 2006-02-15 04:45:25 |
|     533 | Tel Aviv-Jaffa             |         48 | 2006-02-15 04:45:25 |
|     562 | Valle de la Pascua         |        104 | 2006-02-15 04:45:25 |
|     563 | Valle de Santiago          |         60 | 2006-02-15 04:45:25 |
|     566 | Varanasi (Benares)         |         44 | 2006-02-15 04:45:25 |
|     567 | Vicente López              |          6 | 2006-02-15 04:45:25 |
|     569 | Vila Velha                 |         15 | 2006-02-15 04:45:25 |
|     572 | Vitória de Santo Antão     |         15 | 2006-02-15 04:45:25 |
|     582 | Yamuna Nagar               |         44 | 2006-02-15 04:45:25 |
+---------+----------------------------+------------+---------------------+
```

- Películas con una duración entre 80 y 100.
```sql
select * from film where length between 80 and 100;
salida muy larga
```

- Peliculas con un rental_rate entre 1 y 3.
```sql
select * from film where rental_rate between 1 and 3;
salida muy larga
```

- Películas con un titulo de más de 12 letras.
```sql
select * from film where title regexp '[a-zA-Z]{12,}';
salida muy larga
```
- Peliculas con un rating de PG o G.
```sql 
 select * from film where rating = 'PG' or 'G';
```

- Peliculas que no tengan un rating de NC-17.
```sql 
 select * from film where rating not like 'NC-17';
```

- Peliculas con un rating PG y duracion de más de 120.
```sql 
 select * from film where rating = 'PG' and length >= 120;
```

- ¿Cuantos actores hay?
```sql 
 select count(DISTINCT actor_id) from actor;
+--------------------------+
| count(DISTINCT actor_id) |
+--------------------------+
|                      200 |
+--------------------------+
```

- ¿Cuántas ciudades tiene el country Spain?
```sql 
 select count(city_id) from city where country_id = (select country_id from country where country = 'Spain');
+----------------+
| count(city_id) |
+----------------+
|              5 |
+----------------+
```

- ¿Cuántos countries hay que empiezan por a?
```sql 
 select count(country_id) from country where country regexp '^A';
+-------------------+
| count(country_id) |
+-------------------+
|                10 |
+-------------------+
```

- Media de duración de peliculas con PG.
```sql 
 select AVG(length) from film where rating = 'PG';
+-------------+
| AVG(length) |
+-------------+
|    112.0052 |
+-------------+
```

- Suma de rental_rate de todas las peliculas.
```sql 
 select SUM(rental_rate) from film;
+------------------+
| SUM(rental_rate) |
+------------------+
|          2980.00 |
+------------------+
```

- Pelicula con mayor duración.
```sql 
 select max(length) from film;
+-------------+
| max(length) |
+-------------+
|         185 |
+-------------+
```

- Película con menor duración.
```sql 
  select MIN(length) from film;
+-------------+
| MIN(length) |
+-------------+
|          46 |
+-------------+
```

- Mostrar las ciudades del country Spain (multitabla).
```sql 
 select city from city where country_id = (select country_id from country where country = 'Spain');
+-------------------------+
| city                    |
+-------------------------+
| A Coruña (La Coruña)    |
| Donostia-San Sebastián  |
| Gijón                   |
| Ourense (Orense)        |
| Santiago de Compostela  |
+-------------------------+
```

- Mostrar el nombre de la película y el nombre de los actores.
```sql 
 select f.title, a.first_name from film_actor fa join actor a on fa.actor_id=a.actor_id join film f on fa.film_id=f.film_id;
```

- Mostrar el nombre de la película y el de sus categorías.
```sql 
 select c.name, f.title from film_category fc join category c on c.category_id=fc.category_id join film f on f.film_id=fc.film_id;
```

- Mostrar el country, la ciudad y dirección de cada miembro del staff.
```sql 
 select name, city, country, address from staff_list;
+--------------+------------+-----------+----------------------+
| name         | city       | country   | address              |
+--------------+------------+-----------+----------------------+
| Mike Hillyer | Lethbridge | Canada    | 23 Workhaven Lane    |
| Jon Stephens | Woodridge  | Australia | 1411 Lillydale Drive |
+--------------+------------+-----------+----------------------+
```

- Mostrar el country, la ciudad y dirección de cada customer.
```sql 
 select name, country, city, address from customer_list
```

- Numero de películas de cada rating
```sql 
 select rating, count(film_id) from film group by rating;
+--------+----------------+
| rating | count(film_id) |
+--------+----------------+
| PG     |            194 |
| G      |            178 |
| NC-17  |            210 |
| PG-13  |            223 |
| R      |            195 |
+--------+----------------+
```

- Cuantas películas ha realizado el actor ED CHASE.
```sql 
 select count(f.film_id) from film_actor fa join actor a on fa.actor_id=a.actor_id join film f on fa.film_id=f.film_id where a.first_name = 'ED' and a.last_name = 'CHASE';
+------------------+
| count(f.film_id) |
+------------------+
|               22 |
+------------------+
```

- Media de duración de las películas cada categoría.
```sql 
 select c.name, AVG(f.length) from film_category fc join category c on c.category_id=fc.category_id join film f on f.film_id=fc.film_id group by c.name;
+-------------+---------------+
| name        | AVG(f.length) |
+-------------+---------------+
| Action      |      111.6094 |
| Animation   |      111.0152 |
| Children    |      109.8000 |
| Classics    |      111.6667 |
| Comedy      |      115.8276 |
| Documentary |      108.7500 |
| Drama       |      120.8387 |
| Family      |      114.7826 |
| Foreign     |      121.6986 |
| Games       |      127.8361 |
| Horror      |      112.4821 |
| Music       |      113.6471 |
| New         |      111.1270 |
| Sci-Fi      |      108.1967 |
| Sports      |      128.2027 |
| Travel      |      113.3158 |
+-------------+---------------+
```

A continuación se muestran algunas de las vistas que se han utilizado en la base de datos Sakila:

```sql
--
-- View structure for view `customer_list`
--

CREATE VIEW customer_list AS
SELECT 
  cu.customer_id AS ID, 
    CONCAT(cu.first_name, _utf8mb4' ', cu.last_name) AS name, 
    a.address AS address, 
    a.postal_code AS `zip code`,
  a.phone AS phone, 
    city.city AS city, 
    country.country AS country, 
    IF(cu.active, _utf8mb4'active',_utf8mb4'') AS notes, 
    cu.store_id AS SID
FROM 
  customer AS cu JOIN address AS a 
    ON cu.address_id = a.address_id 
    JOIN city 
    ON a.city_id = city.city_id
  JOIN country 
    ON city.country_id = country.country_id;
--
-- View structure for view `film_list`
--

CREATE VIEW film_list AS
SELECT 
  film.film_id AS FID, 
    film.title AS title, 
    film.description AS description, 
    category.name AS category, 
    film.rental_rate AS price,
  film.length AS length, 
    film.rating AS rating, 
    GROUP_CONCAT(CONCAT(actor.first_name, _utf8mb4' ', actor.last_name) SEPARATOR ', ') AS actors
FROM 
  category LEFT JOIN film_category 
    ON category.category_id = film_category.category_id 
    LEFT JOIN film 
    ON film_category.film_id = film.film_id
  JOIN film_actor 
    ON film.film_id = film_actor.film_id
  JOIN actor 
    ON film_actor.actor_id = actor.actor_id
GROUP BY film.film_id, category.name;
```

Conociendo es estos momentos ya la BBDD, se pide:

- Muestra el resultado de la consulta de las vistas que se proporcionan.
```sql
select * from customer_list;
+-----+-----------------------+----------------------------------------+----------+--------------+----------------------------+---------------------------------------+--------+-----+
| ID  | name                  | address                                | zip code | phone        | city                       | country                               | notes  | SID |
+-----+-----------------------+----------------------------------------+----------+--------------+----------------------------+---------------------------------------+--------+-----+
|   1 | MARY SMITH            | 1913 Hanoi Way                         | 35200    | 28303384290  | Sasebo                     | Japan                                 | active |   1 |
|   2 | PATRICIA JOHNSON      | 1121 Loja Avenue                       | 17886    | 838635286649 | San Bernardino             | United States                         | active |   1 |
|   3 | LINDA WILLIAMS        | 692 Joliet Street                      | 83579    | 448477190408 | Athenai                    | Greece                                | active |   1 |
|   4 | BARBARA JONES         | 1566 Inegöl Manor                      | 53561    | 705814003527 | Myingyan                   | Myanmar                               | active |   2 |
|   5 | ELIZABETH BROWN       | 53 Idfu Parkway                        | 42399    | 10655648674  | Nantou                     | Taiwan                                | active |   1 |
|   6 | JENNIFER DAVIS        | 1795 Santiago de Compostela Way        | 18743    | 860452626434 | Laredo                     | United States                         | active |   2 |
|   7 | MARIA MILLER          | 900 Santiago de Compostela Parkway     | 93896    | 716571220373 | Kragujevac                 | Yugoslavia                            | active |   1 |
|   8 | SUSAN WILSON          | 478 Joliet Way                         | 77948    | 657282285970 | Hamilton                   | New Zealand                           | active |   2 |
|   9 | MARGARET MOORE        | 613 Korolev Drive                      | 45844    | 380657522649 | Masqat                     | Oman                                  | active |   2 |
|  10 | DOROTHY TAYLOR        | 1531 Salé Drive                        | 53628    | 648856936185 | Esfahan                    | Iran                                  | active |   1 |
|  11 | LISA ANDERSON         | 1542 Tarlac Parkway                    | 1027     | 635297277345 | Sagamihara                 | Japan                                 | active |   2 |
|  12 | NANCY THOMAS          | 808 Bhopal Manor                       | 10672    | 465887807014 | Yamuna Nagar               | India                                 | active |   1 |
|  13 | KAREN JACKSON         | 270 Amroha Parkway                     | 29610    | 695479687538 | Osmaniye                   | Turkey                                | active |   2 |
|  14 | BETTY WHITE           | 770 Bydgoszcz Avenue                   | 16266    | 517338314235 | Citrus Heights             | United States                         | active |   2 |
|  15 | HELEN HARRIS          | 419 Iligan Lane                        | 72878    | 990911107354 | Bhopal                     | India                                 | active |   1 |
|  16 | SANDRA MARTIN         | 360 Toulouse Parkway                   | 54308    | 949312333307 | Southend-on-Sea            | United Kingdom                        |        |   2 |
|  17 | DONNA THOMPSON        | 270 Toulon Boulevard                   | 81766    | 407752414682 | Elista                     | Russian Federation                    | active |   1 |
|  18 | CAROL GARCIA          | 320 Brest Avenue                       | 43331    | 747791594069 | Kaduna                     | Nigeria                               | active |   2 |
|  19 | RUTH MARTINEZ         | 1417 Lancaster Avenue                  | 72192    | 272572357893 | Kimberley                  | South Africa                          | active |   1 |
|  20 | SHARON ROBINSON       | 1688 Okara Way                         | 21954    | 144453869132 | Mardan                     | Pakistan                              | active |   2 |
|  21 | MICHELLE CLARK        | 262 A Coruña (La Coruña) Parkway       | 34418    | 892775750063 | Tangail                    | Bangladesh                            | active |   1 |
|  22 | LAURA RODRIGUEZ       | 28 Charlotte Amalie Street             | 37551    | 161968374323 | Salé                       | Morocco                               | active |   1 |
|  23 | SARAH LEWIS           | 1780 Hino Boulevard                    | 7716     | 902731229323 | Liepaja                    | Latvia                                | active |   2 |
|  24 | KIMBERLY LEE          | 96 Tafuna Way                          | 99865    | 934730187245 | Córdoba                    | Argentina                             | active |   2 |
|  25 | DEBORAH WALKER        | 934 San Felipe de Puerto Plata Street  | 99780    | 196495945706 | Shikarpur                  | Pakistan                              | active |   1 |
|  26 | JESSICA HALL          | 18 Duisburg Boulevard                  | 58327    | 998009777982 | Città del Vaticano         | Holy See (Vatican City State)         | active |   2 |
|  27 | SHIRLEY ALLEN         | 217 Botshabelo Place                   | 49521    | 665356572025 | Davao                      | Philippines                           | active |   2 |
|  28 | CYNTHIA YOUNG         | 1425 Shikarpur Manor                   | 65599    | 678220867005 | Munger (Monghyr)           | India                                 | active |   1 |
|  29 | ANGELA HERNANDEZ      | 786 Aurora Avenue                      | 65750    | 18461860151  | Shimonoseki                | Japan                                 | active |   2 |
|  30 | MELISSA KING          | 1668 Anápolis Street                   | 50199    | 525255540978 | Lungtan                    | Taiwan                                | active |   1 |
|  31 | BRENDA WRIGHT         | 33 Gorontalo Way                       | 30348    | 745994947458 | Kamarhati                  | India                                 | active |   2 |
|  32 | AMY LOPEZ             | 176 Mandaluyong Place                  | 65213    | 627705991774 | Jhansi                     | India                                 | active |   1 |
|  33 | ANNA HILL             | 127 Purnea (Purnia) Manor              | 79388    | 911872220378 | Alessandria                | Italy                                 | active |   2 |
|  34 | REBECCA SCOTT         | 61 Tama Street                         | 94065    | 708403338270 | Kurashiki                  | Japan                                 | active |   2 |
|  35 | VIRGINIA GREEN        | 391 Callao Drive                       | 34021    | 440512153169 | Toulouse                   | France                                | active |   2 |
|  36 | KATHLEEN ADAMS        | 334 Munger (Monghyr) Lane              | 38145    | 481183273622 | Arak                       | Iran                                  | active |   2 |
|  37 | PAMELA BAKER          | 1440 Fukuyama Loop                     | 47929    | 912257250465 | Nanyang                    | China                                 | active |   1 |
|  38 | MARTHA GONZALEZ       | 269 Cam Ranh Parkway                   | 34689    | 489783829737 | Chisinau                   | Moldova                               | active |   1 |
|  39 | DEBRA NELSON          | 306 Antofagasta Place                  | 3989     | 378318851631 | Vila Velha                 | Brazil                                | active |   1 |
|  40 | AMANDA CARTER         | 671 Graz Street                        | 94399    | 680768868518 | Nador                      | Morocco                               | active |   2 |
|  41 | STEPHANIE MITCHELL    | 42 Brindisi Place                      | 16744    | 42384721397  | Yerevan                    | Armenia                               | active |   1 |
|  42 | CAROLYN PEREZ         | 1632 Bislig Avenue                     | 61117    | 471675840679 | Pak Kret                   | Thailand                              | active |   2 |
|  43 | CHRISTINE ROBERTS     | 1447 Imus Way                          | 48942    | 539758313890 | Faaa                       | French Polynesia                      | active |   2 |
|  44 | MARIE TURNER          | 1998 Halifax Drive                     | 76022    | 177727722820 | Lipetsk                    | Russian Federation                    | active |   1 |
|  45 | JANET PHILLIPS        | 1718 Valencia Street                   | 37359    | 675292816413 | Antofagasta                | Chile                                 | active |   1 |
|  46 | CATHERINE CAMPBELL    | 46 Pjatigorsk Lane                     | 23616    | 262076994845 | Moscow                     | Russian Federation                    | active |   2 |
|  47 | FRANCES PARKER        | 686 Garland Manor                      | 52535    | 69493378813  | Juazeiro do Norte          | Brazil                                | active |   1 |
|  48 | ANN EVANS             | 909 Garland Manor                      | 69367    | 705800322606 | Niznekamsk                 | Russian Federation                    | active |   1 |
|  49 | JOYCE EDWARDS         | 725 Isesaki Place                      | 74428    | 876295323994 | Jedda                      | Saudi Arabia                          | active |   2 |
+-----+-----------------------+----------------------------------------+----------+--------------+----------------------------+---------------------------------------+--------+-----+
etc...


select * from film_category;
+---------+-------------+---------------------+
| film_id | category_id | last_update         |
+---------+-------------+---------------------+
|       1 |           6 | 2006-02-15 05:07:09 |
|       2 |          11 | 2006-02-15 05:07:09 |
|       3 |           6 | 2006-02-15 05:07:09 |
|       4 |          11 | 2006-02-15 05:07:09 |
|       5 |           8 | 2006-02-15 05:07:09 |
|       6 |           9 | 2006-02-15 05:07:09 |
|       7 |           5 | 2006-02-15 05:07:09 |
|       8 |          11 | 2006-02-15 05:07:09 |
|       9 |          11 | 2006-02-15 05:07:09 |
|      10 |          15 | 2006-02-15 05:07:09 |
|      11 |           9 | 2006-02-15 05:07:09 |
|      12 |          12 | 2006-02-15 05:07:09 |
|      13 |          11 | 2006-02-15 05:07:09 |
|      14 |           4 | 2006-02-15 05:07:09 |
|      15 |           9 | 2006-02-15 05:07:09 |
|      16 |           9 | 2006-02-15 05:07:09 |
|      17 |          12 | 2006-02-15 05:07:09 |
|      18 |           2 | 2006-02-15 05:07:09 |
|      19 |           1 | 2006-02-15 05:07:09 |
|      20 |          12 | 2006-02-15 05:07:09 |
|      21 |           1 | 2006-02-15 05:07:09 |
|      22 |          13 | 2006-02-15 05:07:09 |
|      23 |           2 | 2006-02-15 05:07:09 |
|      24 |          11 | 2006-02-15 05:07:09 |
|      25 |          13 | 2006-02-15 05:07:09 |
|      26 |          14 | 2006-02-15 05:07:09 |
|      27 |          15 | 2006-02-15 05:07:09 |
|      28 |           5 | 2006-02-15 05:07:09 |
|      29 |           1 | 2006-02-15 05:07:09 |
|      30 |          11 | 2006-02-15 05:07:09 |
|      31 |           8 | 2006-02-15 05:07:09 |
|      32 |          13 | 2006-02-15 05:07:09 |
|      33 |           7 | 2006-02-15 05:07:09 |
|      34 |          11 | 2006-02-15 05:07:09 |
+---------+-------------+---------------------+
etc...
```
- Crea 5 vistas sobre la BBDD, y realizar la consulta, para mostrar los resultados. Las vistas deben de tener 3 o más tablas de la BBDD.

  - Vista 1
  ```sql
    create view customer_spc AS (
    select max(p.amount), c.first_name, c.email, s.last_update from customer c 
    join store s on s.store_id=c.store_id 
    left join payment p on p.customer_id=c.customer_id
    where amount > 5  
    group by c.customer_id);
  Query OK, 0 rows affected (0,02 sec)
  
  +---------------+-------------+------------------------------------------+---------------------+
  | max(p.amount) | first_name  | email                                    | last_update         |
  +---------------+-------------+------------------------------------------+---------------------+
  |          9.99 | MARY        | MARY.SMITH@sakilacustomer.org            | 2006-02-15 04:57:12 |
  |         10.99 | PATRICIA    | PATRICIA.JOHNSON@sakilacustomer.org      | 2006-02-15 04:57:12 |
  |         10.99 | LINDA       | LINDA.WILLIAMS@sakilacustomer.org        | 2006-02-15 04:57:12 |
  |          8.99 | BARBARA     | BARBARA.JONES@sakilacustomer.org         | 2006-02-15 04:57:12 |
  |          9.99 | ELIZABETH   | ELIZABETH.BROWN@sakilacustomer.org       | 2006-02-15 04:57:12 |
  |          7.99 | JENNIFER    | JENNIFER.DAVIS@sakilacustomer.org        | 2006-02-15 04:57:12 |
  |          8.99 | MARIA       | MARIA.MILLER@sakilacustomer.org          | 2006-02-15 04:57:12 |
  |          9.99 | SUSAN       | SUSAN.WILSON@sakilacustomer.org          | 2006-02-15 04:57:12 |
  |          7.99 | MARGARET    | MARGARET.MOORE@sakilacustomer.org        | 2006-02-15 04:57:12 |
  |          8.99 | DOROTHY     | DOROTHY.TAYLOR@sakilacustomer.org        | 2006-02-15 04:57:12 |
  |          9.99 | LISA        | LISA.ANDERSON@sakilacustomer.org         | 2006-02-15 04:57:12 |
  |         10.99 | NANCY       | NANCY.THOMAS@sakilacustomer.org          | 2006-02-15 04:57:12 |
  |         11.99 | KAREN       | KAREN.JACKSON@sakilacustomer.org         | 2006-02-15 04:57:12 |
  |          9.99 | BETTY       | BETTY.WHITE@sakilacustomer.org           | 2006-02-15 04:57:12 |
  |          8.99 | HELEN       | HELEN.HARRIS@sakilacustomer.org          | 2006-02-15 04:57:12 |
  |          8.99 | SANDRA      | SANDRA.MARTIN@sakilacustomer.org         | 2006-02-15 04:57:12 |
  |          8.99 | DONNA       | DONNA.THOMPSON@sakilacustomer.org        | 2006-02-15 04:57:12 |
  |          8.99 | CAROL       | CAROL.GARCIA@sakilacustomer.org          | 2006-02-15 04:57:12 |
  |          9.99 | RUTH        | RUTH.MARTINEZ@sakilacustomer.org         | 2006-02-15 04:57:12 |
  |          7.99 | SHARON      | SHARON.ROBINSON@sakilacustomer.org       | 2006-02-15 04:57:12 |
  |         10.99 | MICHELLE    | MICHELLE.CLARK@sakilacustomer.org        | 2006-02-15 04:57:12 |
  |          9.99 | LAURA       | LAURA.RODRIGUEZ@sakilacustomer.org       | 2006-02-15 04:57:12 |
  |          9.99 | SARAH       | SARAH.LEWIS@sakilacustomer.org           | 2006-02-15 04:57:12 |
  |          8.99 | KIMBERLY    | KIMBERLY.LEE@sakilacustomer.org          | 2006-02-15 04:57:12 |
  +---------------+-------------+------------------------------------------+---------------------+
  etc...
  ```

  - Vista 2
    ```sql
        create view clientes_actv AS 
        select c.customer_id, c.first_name, c.last_name, COUNT(r.rental_id) AS num_alquileres FROM customer c join rental r on c.customer_id = r.customer_id 
        group by c.customer_id, c.first_name, c.last_name 
        order by num_alquileres desc;
    Query OK, 0 rows affected (0,02 sec)

    select * from clientes_actv;
    +-------------+-------------+--------------+----------------+
    | customer_id | first_name  | last_name    | num_alquileres |
    +-------------+-------------+--------------+----------------+
    |         148 | ELEANOR     | HUNT         |             46 |
    |         526 | KARL        | SEAL         |             45 |
    |         144 | CLARA       | SHAW         |             42 |
    |         236 | MARCIA      | DEAN         |             42 |
    |          75 | TAMMY       | SANDERS      |             41 |
    |         197 | SUE         | PETERS       |             40 |
    |         469 | WESLEY      | BULL         |             40 |
    |         137 | RHONDA      | KENNEDY      |             39 |
    |         178 | MARION      | SNYDER       |             39 |
    |         468 | TIM         | CARY         |             39 |
    |           5 | ELIZABETH   | BROWN        |             38 |
    |         295 | DAISY       | BATES        |             38 |
    |         410 | CURTIS      | IRBY         |             38 |
    |         459 | TOMMY       | COLLAZO      |             38 |
    |         176 | JUNE        | CARROLL      |             37 |
    |         198 | ELSIE       | KELLEY       |             37 |
    |         257 | MARSHA      | DOUGLAS      |             37 |
    |         366 | BRANDON     | HUEY         |             37 |
    |          29 | ANGELA      | HERNANDEZ    |             36 |
    |         267 | MARGIE      | WADE         |             36 |
    |         348 | ROGER       | QUINTANILLA  |             36 |
    |         354 | JUSTIN      | NGO          |             36 |
    |         380 | RUSSELL     | BRINSON      |             36 |
    |         439 | ALEXANDER   | FENNELL      |             36 |
    |          21 | MICHELLE    | CLARK        |             35 |
    |          50 | DIANE       | COLLINS      |             35 |
    |          91 | LOIS        | BUTLER       |             35 |
    |         196 | ALMA        | AUSTIN       |             35 |
    |         204 | ROSEMARY    | SCHMIDT      |             35 |
    |         273 | PRISCILLA   | LOWE         |             35 |
    |         274 | NAOMI       | JENNINGS     |             35 |
    |         368 | HARRY       | ARCE         |             35 |
    |         371 | BILLY       | POULIN       |             35 |
    |         373 | LOUIS       | LEONE        |             35 |
    |         381 | BOBBY       | BOUDREAU     |             35 |
    |         403 | MIKE        | WAY          |             35 |
    |         506 | LESLIE      | SEWARD       |             35 |
    +-------------+-------------+--------------+----------------+
    etc...
    ```

  - Vista 3
    ```sql
    create view film_per_actor as select  a.actor_id, a.first_name, a.last_name, f.film_id, f.title from actor a 
    join film_actor fa ON a.actor_id = fa.actor_id 
    join film f ON fa.film_id = f.film_id;
    Query OK, 0 rows affected (0,02 sec)

    select * from film_per_actor;
    +----------+-------------+--------------+---------+-----------------------------+
    | actor_id | first_name  | last_name    | film_id | title                       |
    +----------+-------------+--------------+---------+-----------------------------+
    |        1 | PENELOPE    | GUINESS      |       1 | ACADEMY DINOSAUR            |
    |        1 | PENELOPE    | GUINESS      |      23 | ANACONDA CONFESSIONS        |
    |        1 | PENELOPE    | GUINESS      |      25 | ANGELS LIFE                 |
    |        1 | PENELOPE    | GUINESS      |     106 | BULWORTH COMMANDMENTS       |
    |        1 | PENELOPE    | GUINESS      |     140 | CHEAPER CLYDE               |
    |        1 | PENELOPE    | GUINESS      |     166 | COLOR PHILADELPHIA          |
    |        1 | PENELOPE    | GUINESS      |     277 | ELEPHANT TROJAN             |
    |        1 | PENELOPE    | GUINESS      |     361 | GLEAMING JAWBREAKER         |
    |        1 | PENELOPE    | GUINESS      |     438 | HUMAN GRAFFITI              |
    |        1 | PENELOPE    | GUINESS      |     499 | KING EVOLUTION              |
    |        1 | PENELOPE    | GUINESS      |     506 | LADY STAGE                  |
    |        1 | PENELOPE    | GUINESS      |     509 | LANGUAGE COWBOY             |
    |        1 | PENELOPE    | GUINESS      |     605 | MULHOLLAND BEAST            |
    |        1 | PENELOPE    | GUINESS      |     635 | OKLAHOMA JUMANJI            |
    |        1 | PENELOPE    | GUINESS      |     749 | RULES HUMAN                 |
    |        1 | PENELOPE    | GUINESS      |     832 | SPLASH GUMP                 |
    |        1 | PENELOPE    | GUINESS      |     939 | VERTIGO NORTHWEST           |
    |        1 | PENELOPE    | GUINESS      |     970 | WESTWARD SEABISCUIT         |
    |        1 | PENELOPE    | GUINESS      |     980 | WIZARD COLDBLOODED          |
    |        2 | NICK        | WAHLBERG     |       3 | ADAPTATION HOLES            |
    |        2 | NICK        | WAHLBERG     |      31 | APACHE DIVINE               |
    |        2 | NICK        | WAHLBERG     |      47 | BABY HALL                   |
    |        2 | NICK        | WAHLBERG     |     105 | BULL SHAWSHANK              |
    |        2 | NICK        | WAHLBERG     |     132 | CHAINSAW UPTOWN             |
    |        2 | NICK        | WAHLBERG     |     145 | CHISUM BEHAVIOR             |
    |        2 | NICK        | WAHLBERG     |     226 | DESTINY SATURDAY            |
    |        2 | NICK        | WAHLBERG     |     249 | DRACULA CRYSTAL             |
    |        2 | NICK        | WAHLBERG     |     314 | FIGHT JAWBREAKER            |
    |        2 | NICK        | WAHLBERG     |     321 | FLASH WARS                  |
    |        2 | NICK        | WAHLBERG     |     357 | GILBERT PELICAN             |
    |        2 | NICK        | WAHLBERG     |     369 | GOODFELLAS SALUTE           |
    |        2 | NICK        | WAHLBERG     |     399 | HAPPINESS UNITED            |
    |        2 | NICK        | WAHLBERG     |     458 | INDIAN LOVE                 |
    |        2 | NICK        | WAHLBERG     |     481 | JEKYLL FROGMEN              |
    |        2 | NICK        | WAHLBERG     |     485 | JERSEY SASSY                |
    |        2 | NICK        | WAHLBERG     |     518 | LIAISONS SWEET              |
    |        2 | NICK        | WAHLBERG     |     540 | LUCKY FLYING                |
    +----------+-------------+--------------+---------+-----------------------------+
    etc...
    ```

  - Vista 4
    ```sql
        create view peliculas_populares_por_categoria as 
        select c.name, f.title, count(r.rental_id) AS num_alquileres from film f 
        join film_category fc on f.film_id = fc.film_id 
        join category c on fc.category_id = c.category_id 
        join inventory i on f.film_id = i.film_id 
        join rental r on i.inventory_id = r.inventory_id 
        group by c.name, f.title;

    select * from peliculas_populares_por_categoria;
    +-------------+-----------------------------+----------------+
    | name        | title                       | num_alquileres |
    +-------------+-----------------------------+----------------+
    | Action      | AMADEUS HOLY                |             21 |
    | Action      | AMERICAN CIRCUS             |             22 |
    | Action      | ANTITRUST TOMATOES          |             10 |
    | Action      | BAREFOOT MANCHURIAN         |             18 |
    | Action      | BERETS AGENT                |             21 |
    | Action      | BRIDE INTRIGUE              |             19 |
    | Action      | BULL SHAWSHANK              |             16 |
    | Action      | CADDYSHACK JEDI             |             16 |
    | Action      | CAMPUS REMEMBER             |             19 |
    | Action      | CASUALTIES ENCINO           |              9 |
    | Action      | CELEBRITY HORN              |             24 |
    | Action      | CLUELESS BUCKET             |             25 |
    | Action      | CROW GREASE                 |             12 |
    | Action      | DANCES NONE                 |             14 |
    | Action      | DARKO DORADO                |             11 |
    | Action      | DARN FORRESTER              |             18 |
    | Action      | DEVIL DESIRE                |             15 |
    | Action      | DRAGON SQUAD                |             11 |
    | Action      | DREAM PICKUP                |             22 |
    | Action      | DRIFTER COMMANDMENTS        |             24 |
    | Action      | EASY GLADIATOR              |             23 |
    | Action      | ENTRAPMENT SATISFACTION     |             15 |
    | Action      | EXCITEMENT EVE              |             21 |
    | Action      | FANTASY TROOPERS            |             26 |
    | Action      | FOOL MOCKINGBIRD            |             23 |
    | Action      | FORREST SONS                |             18 |
    | Action      | GLASS DYING                 |             14 |
    | Action      | GOSFORD DONNIE              |              8 |
    +-------------+-----------------------------+----------------+
    etc...
    ```

  - Vista 5
    ```sql
    create view ingresos_por_pelicula as 
    select f.film_id, f.title, COUNT(r.rental_id) as num_alquileres, SUM(p.amount) AS ingreso_total from film f 
    left join inventory i on f.film_id = i.film_id 
    left join rental r on i.inventory_id = r.inventory_id 
    left join payment p on r.rental_id = p.rental_id 
    group by f.film_id, f.title;

    select * from ingresos_por_pelicula;
    +---------+-----------------------------+----------------+---------------+
    | film_id | title                       | num_alquileres | ingreso_total |
    +---------+-----------------------------+----------------+---------------+
    |       1 | ACADEMY DINOSAUR            |             23 |         36.77 |
    |       2 | ACE GOLDFINGER              |              7 |         52.93 |
    |       3 | ADAPTATION HOLES            |             12 |         37.88 |
    |       4 | AFFAIR PREJUDICE            |             23 |         91.77 |
    |       5 | AFRICAN EGG                 |             12 |         51.88 |
    |       6 | AGENT TRUMAN                |             21 |        126.79 |
    |       7 | AIRPLANE SIERRA             |             15 |         82.85 |
    |       8 | AIRPORT POLLOCK             |             18 |        102.82 |
    |       9 | ALABAMA DEVIL               |             12 |         71.88 |
    |      10 | ALADDIN CALENDAR            |             23 |        131.77 |
    |      11 | ALAMO VIDEOTAPE             |             24 |         35.76 |
    |      12 | ALASKA PHANTOM              |             26 |         44.74 |
    |      13 | ALI FOREVER                 |              9 |         54.91 |
    |      14 | ALICE FANTASIA              |              0 |          NULL |
    |      15 | ALIEN CENTER                |             22 |         90.78 |
    |      16 | ALLEY EVOLUTION             |             14 |         52.86 |
    |      17 | ALONE TRIP                  |             18 |         62.82 |
    |      18 | ALTER VICTORY               |             22 |         32.78 |
    |      19 | AMADEUS HOLY                |             21 |         33.79 |
    |      20 | AMELIE HELLFIGHTERS         |             10 |         67.90 |
    |      21 | AMERICAN CIRCUS             |             22 |        167.78 |
    |      22 | AMISTAD MIDSUMMER           |             21 |         70.79 |
    |      23 | ANACONDA CONFESSIONS        |             21 |         60.79 |
    |      24 | ANALYZE HOOSIERS            |             14 |         55.86 |
    +---------+-----------------------------+----------------+---------------+
    etc...
    ```
## Refecrencias
[Sakila Database](https://dev.mysql.com/doc/sakila/en/sakila-introduction.html)
