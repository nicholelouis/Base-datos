-- Proporciona una consulta que muestre solo los clientes de Brasil.

SELECT * FROM customers WHERE Country REGEXP 'Brazil';
/**
┌────────────┬───────────┬───────────┬──────────────────────────────────────────────────┬─────────────────────────────────┬─────────────────────┬───────┬─────────┬────────────┬────────────────────┬────────────────────┬───────────────────────────────┬──────────────┐
│ CustomerId │ FirstName │ LastName  │                     Company                      │             Address             │        City         │ State │ Country │ PostalCode │       Phone        │        Fax         │             Email             │ SupportRepId │
├────────────┼───────────┼───────────┼──────────────────────────────────────────────────┼─────────────────────────────────┼─────────────────────┼───────┼─────────┼────────────┼────────────────────┼────────────────────┼───────────────────────────────┼──────────────┤
│ 1          │ Luís      │ Gonçalves │ Embraer - Empresa Brasileira de Aeronáutica S.A. │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP    │ Brazil  │ 12227-000  │ +55 (12) 3923-5555 │ +55 (12) 3923-5566 │ luisg@embraer.com.br          │ 3            │
│ 10         │ Eduardo   │ Martins   │ Woodstock Discos                                 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP    │ Brazil  │ 01007-010  │ +55 (11) 3033-5446 │ +55 (11) 3033-4564 │ eduardo@woodstock.com.br      │ 4            │
│ 11         │ Alexandre │ Rocha     │ Banco do Brasil S.A.                             │ Av. Paulista, 2022              │ São Paulo           │ SP    │ Brazil  │ 01310-200  │ +55 (11) 3055-3278 │ +55 (11) 3055-8131 │ alero@uol.com.br              │ 5            │
│ 12         │ Roberto   │ Almeida   │ Riotur                                           │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ    │ Brazil  │ 20040-020  │ +55 (21) 2271-7000 │ +55 (21) 2271-7070 │ roberto.almeida@riotur.gov.br │ 3            │
│ 13         │ Fernanda  │ Ramos     │                                                  │ Qe 7 Bloco G                    │ Brasília            │ DF    │ Brazil  │ 71020-677  │ +55 (61) 3363-5547 │ +55 (61) 3363-7855 │ fernadaramos4@uol.com.br      │ 4            │
└────────────┴───────────┴───────────┴──────────────────────────────────────────────────┴─────────────────────────────────┴─────────────────────┴───────┴─────────┴────────────┴────────────────────┴────────────────────┴───────────────────────────────┴──────────────┘
**/

-- Proporciona una consulta que muestre las facturas de clientes que son de Brasil. La tabla resultante debe mostrar el nombre completo del cliente, ID de factura, fecha de la factura y país de facturación.

SELECT c.firstname, c.lastname, i.billingcountry, i.invoicedate, invoiceid  FROM invoices as i join customers as c on c.customerid=i.customerid WHERE country = 'Brazil';
/**
┌───────────┬───────────┬────────────────┬─────────────────────┬───────────┐
│ FirstName │ LastName  │ BillingCountry │     InvoiceDate     │ InvoiceId │
├───────────┼───────────┼────────────────┼─────────────────────┼───────────┤
│ Luís      │ Gonçalves │ Brazil         │ 2010-03-11 00:00:00 │ 98        │
│ Luís      │ Gonçalves │ Brazil         │ 2010-06-13 00:00:00 │ 121       │
│ Luís      │ Gonçalves │ Brazil         │ 2010-09-15 00:00:00 │ 143       │
│ Luís      │ Gonçalves │ Brazil         │ 2011-05-06 00:00:00 │ 195       │
│ Luís      │ Gonçalves │ Brazil         │ 2012-10-27 00:00:00 │ 316       │
│ Luís      │ Gonçalves │ Brazil         │ 2012-12-07 00:00:00 │ 327       │
│ Luís      │ Gonçalves │ Brazil         │ 2013-08-07 00:00:00 │ 382       │
│ Eduardo   │ Martins   │ Brazil         │ 2009-04-09 00:00:00 │ 25        │
│ Eduardo   │ Martins   │ Brazil         │ 2010-11-14 00:00:00 │ 154       │
│ Eduardo   │ Martins   │ Brazil         │ 2011-02-16 00:00:00 │ 177       │
│ Eduardo   │ Martins   │ Brazil         │ 2011-05-21 00:00:00 │ 199       │
│ Eduardo   │ Martins   │ Brazil         │ 2012-01-09 00:00:00 │ 251       │
│ Eduardo   │ Martins   │ Brazil         │ 2013-07-02 00:00:00 │ 372       │
│ Eduardo   │ Martins   │ Brazil         │ 2013-08-12 00:00:00 │ 383       │
│ Alexandre │ Rocha     │ Brazil         │ 2009-09-06 00:00:00 │ 57        │
│ Alexandre │ Rocha     │ Brazil         │ 2009-10-17 00:00:00 │ 68        │
│ Alexandre │ Rocha     │ Brazil         │ 2010-06-17 00:00:00 │ 123       │
│ Alexandre │ Rocha     │ Brazil         │ 2012-01-22 00:00:00 │ 252       │
│ Alexandre │ Rocha     │ Brazil         │ 2012-04-25 00:00:00 │ 275       │
│ Alexandre │ Rocha     │ Brazil         │ 2012-07-28 00:00:00 │ 297       │
│ Alexandre │ Rocha     │ Brazil         │ 2013-03-18 00:00:00 │ 349       │
│ Roberto   │ Almeida   │ Brazil         │ 2009-05-23 00:00:00 │ 34        │
│ Roberto   │ Almeida   │ Brazil         │ 2010-11-14 00:00:00 │ 155       │
│ Roberto   │ Almeida   │ Brazil         │ 2010-12-25 00:00:00 │ 166       │
│ Roberto   │ Almeida   │ Brazil         │ 2011-08-25 00:00:00 │ 221       │
│ Roberto   │ Almeida   │ Brazil         │ 2013-03-31 00:00:00 │ 350       │
│ Roberto   │ Almeida   │ Brazil         │ 2013-07-03 00:00:00 │ 373       │
│ Roberto   │ Almeida   │ Brazil         │ 2013-10-05 00:00:00 │ 395       │
│ Fernanda  │ Ramos     │ Brazil         │ 2009-06-05 00:00:00 │ 35        │
│ Fernanda  │ Ramos     │ Brazil         │ 2009-09-07 00:00:00 │ 58        │
│ Fernanda  │ Ramos     │ Brazil         │ 2009-12-10 00:00:00 │ 80        │
│ Fernanda  │ Ramos     │ Brazil         │ 2010-07-31 00:00:00 │ 132       │
│ Fernanda  │ Ramos     │ Brazil         │ 2012-01-22 00:00:00 │ 253       │
│ Fernanda  │ Ramos     │ Brazil         │ 2012-03-03 00:00:00 │ 264       │
│ Fernanda  │ Ramos     │ Brazil         │ 2012-11-01 00:00:00 │ 319       │
└───────────┴───────────┴────────────────┴─────────────────────┴───────────┘
**/

-- Proporciona una consulta que muestre solo los empleados que son Agentes de Ventas.

SELECT employeeid, firstname, firstname, title FROM employees WHERE Title REGEXP '^Sales';

/**
┌────────────┬───────────┬───────────┬─────────────────────┐
│ EmployeeId │ FirstName │ FirstName │        Title        │
├────────────┼───────────┼───────────┼─────────────────────┤
│ 2          │ Nancy     │ Nancy     │ Sales Manager       │
│ 3          │ Jane      │ Jane      │ Sales Support Agent │
│ 4          │ Margaret  │ Margaret  │ Sales Support Agent │
│ 5          │ Steve     │ Steve     │ Sales Support Agent │
└────────────┴───────────┴───────────┴─────────────────────┘
**/

-- Proporciona una consulta que muestre una lista única de países de facturación de la tabla de Facturas.

SELECT BillingCountry FROM invoices group by BillingCountry ;
/**
┌────────────────┐
│ BillingCountry │
├────────────────┤
│ Argentina      │
│ Australia      │
│ Austria        │
│ Belgium        │
│ Brazil         │
│ Canada         │
│ Chile          │
│ Czech Republic │
│ Denmark        │
│ Finland        │
│ France         │
│ Germany        │
│ Hungary        │
│ India          │
│ Ireland        │
│ Italy          │
│ Netherlands    │
│ Norway         │
│ Poland         │
│ Portugal       │
│ Spain          │
│ Sweden         │
│ USA            │
│ United Kingdom │
└────────────────┘
**/

--Proporciona una consulta que muestre las facturas de clientes que son de Brasil.

SELECT * FROM invoices WHERE BillingCountry = 'Brazil';

/**
┌───────────┬────────────┬─────────────────────┬─────────────────────────────────┬─────────────────────┬──────────────┬────────────────┬───────────────────┬───────┐
│ InvoiceId │ CustomerId │     InvoiceDate     │         BillingAddress          │     BillingCity     │ BillingState │ BillingCountry │ BillingPostalCode │ Total │
├───────────┼────────────┼─────────────────────┼─────────────────────────────────┼─────────────────────┼──────────────┼────────────────┼───────────────────┼───────┤
│ 25        │ 10         │ 2009-04-09 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 8.91  │
│ 34        │ 12         │ 2009-05-23 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 0.99  │
│ 35        │ 13         │ 2009-06-05 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 1.98  │
│ 57        │ 11         │ 2009-09-06 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 1.98  │
│ 58        │ 13         │ 2009-09-07 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 3.96  │
│ 68        │ 11         │ 2009-10-17 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 13.86 │
│ 80        │ 13         │ 2009-12-10 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 5.94  │
│ 98        │ 1          │ 2010-03-11 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 3.98  │
│ 121       │ 1          │ 2010-06-13 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 3.96  │
│ 123       │ 11         │ 2010-06-17 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 8.91  │
│ 132       │ 13         │ 2010-07-31 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 0.99  │
│ 143       │ 1          │ 2010-09-15 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 5.94  │
│ 154       │ 10         │ 2010-11-14 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 1.98  │
│ 155       │ 12         │ 2010-11-14 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 1.98  │
│ 166       │ 12         │ 2010-12-25 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 13.86 │
│ 177       │ 10         │ 2011-02-16 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 3.96  │
│ 195       │ 1          │ 2011-05-06 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 0.99  │
│ 199       │ 10         │ 2011-05-21 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 5.94  │
│ 221       │ 12         │ 2011-08-25 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 8.91  │
│ 251       │ 10         │ 2012-01-09 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 0.99  │
│ 252       │ 11         │ 2012-01-22 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 1.98  │
│ 253       │ 13         │ 2012-01-22 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 1.98  │
│ 264       │ 13         │ 2012-03-03 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 13.86 │
│ 275       │ 11         │ 2012-04-25 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 3.96  │
│ 297       │ 11         │ 2012-07-28 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 5.94  │
│ 316       │ 1          │ 2012-10-27 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 1.98  │
│ 319       │ 13         │ 2012-11-01 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 8.91  │
│ 327       │ 1          │ 2012-12-07 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 13.86 │
│ 349       │ 11         │ 2013-03-18 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 0.99  │
│ 350       │ 12         │ 2013-03-31 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 1.98  │
│ 372       │ 10         │ 2013-07-02 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 1.98  │
│ 373       │ 12         │ 2013-07-03 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 3.96  │
│ 382       │ 1          │ 2013-08-07 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 8.91  │
│ 383       │ 10         │ 2013-08-12 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 13.86 │
│ 395       │ 12         │ 2013-10-05 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 5.94  │
└───────────┴────────────┴─────────────────────┴─────────────────────────────────┴─────────────────────┴──────────────┴────────────────┴───────────────────┴───────┘
**/

--Proporciona una consulta que muestre las facturas asociadas con cada agente de ventas. La tabla resultante debe incluir el nombre completo del Agente de Ventas.
SELECT e.LastName, e.FirstName, i.* FROM employees as e join invoices as i on e.city=i.billingcity;

/**
┌──────────┬───────────┬───────────┬────────────┬─────────────────────┬────────────────┬─────────────┬──────────────┬────────────────┬───────────────────┬───────┐
│ LastName │ FirstName │ InvoiceId │ CustomerId │     InvoiceDate     │ BillingAddress │ BillingCity │ BillingState │ BillingCountry │ BillingPostalCode │ Total │
├──────────┼───────────┼───────────┼────────────┼─────────────────────┼────────────────┼─────────────┼──────────────┼────────────────┼───────────────────┼───────┤
│ Adams    │ Andrew    │ 4         │ 14         │ 2009-01-06 00:00:00 │ 8210 111 ST NW │ Edmonton    │ AB           │ Canada         │ T6G 2C7           │ 8.91  │
│ Adams    │ Andrew    │ 133       │ 14         │ 2010-08-13 00:00:00 │ 8210 111 ST NW │ Edmonton    │ AB           │ Canada         │ T6G 2C7           │ 1.98  │
│ Adams    │ Andrew    │ 156       │ 14         │ 2010-11-15 00:00:00 │ 8210 111 ST NW │ Edmonton    │ AB           │ Canada         │ T6G 2C7           │ 3.96  │
│ Adams    │ Andrew    │ 178       │ 14         │ 2011-02-17 00:00:00 │ 8210 111 ST NW │ Edmonton    │ AB           │ Canada         │ T6G 2C7           │ 5.94  │
│ Adams    │ Andrew    │ 230       │ 14         │ 2011-10-08 00:00:00 │ 8210 111 ST NW │ Edmonton    │ AB           │ Canada         │ T6G 2C7           │ 0.99  │
│ Adams    │ Andrew    │ 351       │ 14         │ 2013-03-31 00:00:00 │ 8210 111 ST NW │ Edmonton    │ AB           │ Canada         │ T6G 2C7           │ 1.98  │
│ Adams    │ Andrew    │ 362       │ 14         │ 2013-05-11 00:00:00 │ 8210 111 ST NW │ Edmonton    │ AB           │ Canada         │ T6G 2C7           │ 13.86 │
└──────────┴───────────┴───────────┴────────────┴─────────────────────┴────────────────┴─────────────┴──────────────┴────────────────┴───────────────────┴───────┘
**/

--Proporciona una consulta que muestre el Total de la Factura, nombre del cliente, país y nombre del Agente de Ventas para todas las facturas y clientes.
SELECT i.total, c.firstname, c.country, e.firstname FROM invoices as i join customers as c, employees as e on i.customerid=c.customerid and e.employeeid=c.supportrepid;

/**
┌───────┬───────────┬────────────────┬───────────┐
│ Total │ FirstName │    Country     │ FirstName │
├───────┼───────────┼────────────────┼───────────┤
│ 3.98  │ Luís      │ Brazil         │ Jane      │
│ 3.96  │ Luís      │ Brazil         │ Jane      │
│ 5.94  │ Luís      │ Brazil         │ Jane      │
│ 0.99  │ Luís      │ Brazil         │ Jane      │
│ 1.98  │ Luís      │ Brazil         │ Jane      │
│ 13.86 │ Luís      │ Brazil         │ Jane      │
│ 8.91  │ Luís      │ Brazil         │ Jane      │
│ 1.98  │ Leonie    │ Germany        │ Steve     │
│ 13.86 │ Leonie    │ Germany        │ Steve     │
│ 8.91  │ Leonie    │ Germany        │ Steve     │
│ 1.98  │ Leonie    │ Germany        │ Steve     │
│ 3.96  │ Leonie    │ Germany        │ Steve     │
│ 5.94  │ Leonie    │ Germany        │ Steve     │
│ 0.99  │ Leonie    │ Germany        │ Steve     │
│ 3.98  │ François  │ Canada         │ Jane      │
│ 13.86 │ François  │ Canada         │ Jane      │
│ 8.91  │ François  │ Canada         │ Jane      │
│ 1.98  │ François  │ Canada         │ Jane      │
│ 3.96  │ François  │ Canada         │ Jane      │
│ 5.94  │ François  │ Canada         │ Jane      │
│ 0.99  │ François  │ Canada         │ Jane      │
│ 3.96  │ Bjørn     │ Norway         │ Margaret  │
│ 5.94  │ Bjørn     │ Norway         │ Margaret  │
│ 0.99  │ Bjørn     │ Norway         │ Margaret  │
│ 1.98  │ Bjørn     │ Norway         │ Margaret  │
│ 15.86 │ Bjørn     │ Norway         │ Margaret  │
│ 8.91  │ Bjørn     │ Norway         │ Margaret  │
│ 1.98  │ Bjørn     │ Norway         │ Margaret  │
│ 1.98  │ František │ Czech Republic │ Margaret  │
│ 3.96  │ František │ Czech Republic │ Margaret  │
│ 5.94  │ František │ Czech Republic │ Margaret  │
│ 0.99  │ František │ Czech Republic │ Margaret  │
│ 1.98  │ František │ Czech Republic │ Margaret  │
│ 16.86 │ František │ Czech Republic │ Margaret  │
│ 8.91  │ František │ Czech Republic │ Margaret  │
│ 8.91  │ Helena    │ Czech Republic │ Steve     │
│ 1.98  │ Helena    │ Czech Republic │ Steve     │
│ 3.96  │ Helena    │ Czech Republic │ Steve     │
│ 5.94  │ Helena    │ Czech Republic │ Steve     │
│ 0.99  │ Helena    │ Czech Republic │ Steve     │
│ 1.98  │ Helena    │ Czech Republic │ Steve     │
│ 25.86 │ Helena    │ Czech Republic │ Steve     │
│ 1.98  │ Astrid    │ Austria        │ Steve     │
│ 18.86 │ Astrid    │ Austria        │ Steve     │
│ 8.91  │ Astrid    │ Austria        │ Steve     │
│ 1.98  │ Astrid    │ Austria        │ Steve     │
│ 3.96  │ Astrid    │ Austria        │ Steve     │
│ 5.94  │ Astrid    │ Austria        │ Steve     │
│ 0.99  │ Astrid    │ Austria        │ Steve     │
│ 5.94  │ Daan      │ Belgium        │ Margaret  │
│ 0.99  │ Daan      │ Belgium        │ Margaret  │
│ 1.98  │ Daan      │ Belgium        │ Margaret  │
│ 13.86 │ Daan      │ Belgium        │ Margaret  │
│ 8.91  │ Daan      │ Belgium        │ Margaret  │
│ 1.98  │ Daan      │ Belgium        │ Margaret  │
│ 3.96  │ Daan      │ Belgium        │ Margaret  │
│ 1.98  │ Kara      │ Denmark        │ Margaret  │
│ 3.96  │ Kara      │ Denmark        │ Margaret  │
│ 5.94  │ Kara      │ Denmark        │ Margaret  │
│ 0.99  │ Kara      │ Denmark        │ Margaret  │
│ 1.98  │ Kara      │ Denmark        │ Margaret  │
│ 13.86 │ Kara      │ Denmark        │ Margaret  │
│ 8.91  │ Kara      │ Denmark        │ Margaret  │
│ 8.91  │ Eduardo   │ Brazil         │ Margaret  │
│ 1.98  │ Eduardo   │ Brazil         │ Margaret  │
│ 3.96  │ Eduardo   │ Brazil         │ Margaret  │
│ 5.94  │ Eduardo   │ Brazil         │ Margaret  │
│ 0.99  │ Eduardo   │ Brazil         │ Margaret  │
│ 1.98  │ Eduardo   │ Brazil         │ Margaret  │
│ 13.86 │ Eduardo   │ Brazil         │ Margaret  │
│ 1.98  │ Alexandre │ Brazil         │ Steve     │
│ 13.86 │ Alexandre │ Brazil         │ Steve     │
│ 8.91  │ Alexandre │ Brazil         │ Steve     │
│ 1.98  │ Alexandre │ Brazil         │ Steve     │
│ 3.96  │ Alexandre │ Brazil         │ Steve     │
│ 5.94  │ Alexandre │ Brazil         │ Steve     │
│ 0.99  │ Alexandre │ Brazil         │ Steve     │
│ 0.99  │ Roberto   │ Brazil         │ Jane      │
│ 1.98  │ Roberto   │ Brazil         │ Jane      │
│ 13.86 │ Roberto   │ Brazil         │ Jane      │
│ 8.91  │ Roberto   │ Brazil         │ Jane      │
│ 1.98  │ Roberto   │ Brazil         │ Jane      │
│ 3.96  │ Roberto   │ Brazil         │ Jane      │
│ 5.94  │ Roberto   │ Brazil         │ Jane      │
│ 1.98  │ Fernanda  │ Brazil         │ Margaret  │
│ 3.96  │ Fernanda  │ Brazil         │ Margaret  │
│ 5.94  │ Fernanda  │ Brazil         │ Margaret  │
│ 0.99  │ Fernanda  │ Brazil         │ Margaret  │
│ 1.98  │ Fernanda  │ Brazil         │ Margaret  │
│ 13.86 │ Fernanda  │ Brazil         │ Margaret  │
│ 8.91  │ Fernanda  │ Brazil         │ Margaret  │
│ 8.91  │ Mark      │ Canada         │ Steve     │
│ 1.98  │ Mark      │ Canada         │ Steve     │
│ 3.96  │ Mark      │ Canada         │ Steve     │
│ 5.94  │ Mark      │ Canada         │ Steve     │
│ 0.99  │ Mark      │ Canada         │ Steve     │
│ 1.98  │ Mark      │ Canada         │ Steve     │
│ 13.86 │ Mark      │ Canada         │ Steve     │
│ 1.98  │ Jennifer  │ Canada         │ Jane      │
│ 13.86 │ Jennifer  │ Canada         │ Jane      │
│ 9.91  │ Jennifer  │ Canada         │ Jane      │
│ 1.98  │ Jennifer  │ Canada         │ Jane      │
│ 3.96  │ Jennifer  │ Canada         │ Jane      │
│ 5.94  │ Jennifer  │ Canada         │ Jane      │
│ 0.99  │ Jennifer  │ Canada         │ Jane      │
│ 0.99  │ Frank     │ USA            │ Margaret  │
│ 1.98  │ Frank     │ USA            │ Margaret  │
│ 13.86 │ Frank     │ USA            │ Margaret  │
│ 8.91  │ Frank     │ USA            │ Margaret  │
│ 1.98  │ Frank     │ USA            │ Margaret  │
│ 3.96  │ Frank     │ USA            │ Margaret  │
│ 5.94  │ Frank     │ USA            │ Margaret  │
│ 1.98  │ Jack      │ USA            │ Steve     │
│ 3.96  │ Jack      │ USA            │ Steve     │
│ 5.94  │ Jack      │ USA            │ Steve     │
│ 0.99  │ Jack      │ USA            │ Steve     │
│ 1.98  │ Jack      │ USA            │ Steve     │
│ 13.86 │ Jack      │ USA            │ Steve     │
│ 10.91 │ Jack      │ USA            │ Steve     │
│ 1.98  │ Michelle  │ USA            │ Jane      │
│ 3.96  │ Michelle  │ USA            │ Jane      │
│ 5.94  │ Michelle  │ USA            │ Jane      │
│ 0.99  │ Michelle  │ USA            │ Jane      │
│ 1.98  │ Michelle  │ USA            │ Jane      │
│ 13.86 │ Michelle  │ USA            │ Jane      │
│ 8.91  │ Michelle  │ USA            │ Jane      │
│ 1.98  │ Tim       │ USA            │ Jane      │
│ 13.86 │ Tim       │ USA            │ Jane      │
│ 8.91  │ Tim       │ USA            │ Jane      │
│ 1.98  │ Tim       │ USA            │ Jane      │
│ 3.96  │ Tim       │ USA            │ Jane      │
│ 5.94  │ Tim       │ USA            │ Jane      │
│ 1.99  │ Tim       │ USA            │ Jane      │
│ 1.98  │ Dan       │ USA            │ Margaret  │
│ 13.86 │ Dan       │ USA            │ Margaret  │
│ 8.91  │ Dan       │ USA            │ Margaret  │
│ 3.98  │ Dan       │ USA            │ Margaret  │
│ 3.96  │ Dan       │ USA            │ Margaret  │
│ 5.94  │ Dan       │ USA            │ Margaret  │
│ 0.99  │ Dan       │ USA            │ Margaret  │
│ 3.96  │ Kathy     │ USA            │ Steve     │
│ 5.94  │ Kathy     │ USA            │ Steve     │
│ 0.99  │ Kathy     │ USA            │ Steve     │
│ 1.98  │ Kathy     │ USA            │ Steve     │
│ 13.86 │ Kathy     │ USA            │ Steve     │
│ 8.91  │ Kathy     │ USA            │ Steve     │
│ 1.98  │ Kathy     │ USA            │ Steve     │
│ 1.98  │ Heather   │ USA            │ Margaret  │
│ 3.96  │ Heather   │ USA            │ Margaret  │
│ 5.94  │ Heather   │ USA            │ Margaret  │
│ 0.99  │ Heather   │ USA            │ Margaret  │
│ 3.98  │ Heather   │ USA            │ Margaret  │
│ 13.86 │ Heather   │ USA            │ Margaret  │
│ 8.91  │ Heather   │ USA            │ Margaret  │
│ 13.86 │ John      │ USA            │ Margaret  │
│ 8.91  │ John      │ USA            │ Margaret  │
│ 1.98  │ John      │ USA            │ Margaret  │
│ 3.96  │ John      │ USA            │ Margaret  │
│ 5.94  │ John      │ USA            │ Margaret  │
│ 0.99  │ John      │ USA            │ Margaret  │
│ 1.98  │ John      │ USA            │ Margaret  │
│ 1.98  │ Frank     │ USA            │ Jane      │
│ 15.86 │ Frank     │ USA            │ Jane      │
│ 8.91  │ Frank     │ USA            │ Jane      │
│ 1.98  │ Frank     │ USA            │ Jane      │
│ 7.96  │ Frank     │ USA            │ Jane      │
│ 5.94  │ Frank     │ USA            │ Jane      │
│ 0.99  │ Frank     │ USA            │ Jane      │
│ 5.94  │ Victor    │ USA            │ Steve     │
│ 0.99  │ Victor    │ USA            │ Steve     │
│ 1.98  │ Victor    │ USA            │ Steve     │
│ 18.86 │ Victor    │ USA            │ Steve     │
│ 8.91  │ Victor    │ USA            │ Steve     │
│ 1.98  │ Victor    │ USA            │ Steve     │
│ 3.96  │ Victor    │ USA            │ Steve     │
│ 1.98  │ Richard   │ USA            │ Margaret  │
│ 3.96  │ Richard   │ USA            │ Margaret  │
│ 5.94  │ Richard   │ USA            │ Margaret  │
│ 0.99  │ Richard   │ USA            │ Margaret  │
│ 1.98  │ Richard   │ USA            │ Margaret  │
│ 23.86 │ Richard   │ USA            │ Margaret  │
│ 8.91  │ Richard   │ USA            │ Margaret  │
│ 8.91  │ Patrick   │ USA            │ Margaret  │
│ 1.98  │ Patrick   │ USA            │ Margaret  │
│ 3.96  │ Patrick   │ USA            │ Margaret  │
│ 5.94  │ Patrick   │ USA            │ Margaret  │
│ 0.99  │ Patrick   │ USA            │ Margaret  │
│ 1.98  │ Patrick   │ USA            │ Margaret  │
│ 13.86 │ Patrick   │ USA            │ Margaret  │
│ 1.98  │ Julia     │ USA            │ Steve     │
│ 13.86 │ Julia     │ USA            │ Steve     │
│ 8.91  │ Julia     │ USA            │ Steve     │
│ 1.98  │ Julia     │ USA            │ Steve     │
│ 3.96  │ Julia     │ USA            │ Steve     │
│ 11.94 │ Julia     │ USA            │ Steve     │
│ 0.99  │ Julia     │ USA            │ Steve     │
│ 0.99  │ Robert    │ Canada         │ Jane      │
│ 1.98  │ Robert    │ Canada         │ Jane      │
│ 13.86 │ Robert    │ Canada         │ Jane      │
│ 8.91  │ Robert    │ Canada         │ Jane      │
│ 1.98  │ Robert    │ Canada         │ Jane      │
│ 3.96  │ Robert    │ Canada         │ Jane      │
│ 5.94  │ Robert    │ Canada         │ Jane      │
│ 1.98  │ Edward    │ Canada         │ Jane      │
│ 3.96  │ Edward    │ Canada         │ Jane      │
│ 5.94  │ Edward    │ Canada         │ Jane      │
│ 0.99  │ Edward    │ Canada         │ Jane      │
│ 1.98  │ Edward    │ Canada         │ Jane      │
│ 13.86 │ Edward    │ Canada         │ Jane      │
│ 8.91  │ Edward    │ Canada         │ Jane      │
│ 8.91  │ Martha    │ Canada         │ Steve     │
│ 1.98  │ Martha    │ Canada         │ Steve     │
│ 3.96  │ Martha    │ Canada         │ Steve     │
│ 5.94  │ Martha    │ Canada         │ Steve     │
│ 0.99  │ Martha    │ Canada         │ Steve     │
│ 1.98  │ Martha    │ Canada         │ Steve     │
│ 13.86 │ Martha    │ Canada         │ Steve     │
│ 1.98  │ Aaron     │ Canada         │ Margaret  │
│ 13.86 │ Aaron     │ Canada         │ Margaret  │
│ 8.91  │ Aaron     │ Canada         │ Margaret  │
│ 1.98  │ Aaron     │ Canada         │ Margaret  │
│ 3.96  │ Aaron     │ Canada         │ Margaret  │
│ 5.94  │ Aaron     │ Canada         │ Margaret  │
│ 0.99  │ Aaron     │ Canada         │ Margaret  │
│ 0.99  │ Ellie     │ Canada         │ Jane      │
│ 1.98  │ Ellie     │ Canada         │ Jane      │
│ 13.86 │ Ellie     │ Canada         │ Jane      │
│ 8.91  │ Ellie     │ Canada         │ Jane      │
│ 1.98  │ Ellie     │ Canada         │ Jane      │
│ 3.96  │ Ellie     │ Canada         │ Jane      │
│ 5.94  │ Ellie     │ Canada         │ Jane      │
│ 1.98  │ João      │ Portugal       │ Margaret  │
│ 3.96  │ João      │ Portugal       │ Margaret  │
│ 5.94  │ João      │ Portugal       │ Margaret  │
│ 0.99  │ João      │ Portugal       │ Margaret  │
│ 1.98  │ João      │ Portugal       │ Margaret  │
│ 13.86 │ João      │ Portugal       │ Margaret  │
│ 10.91 │ João      │ Portugal       │ Margaret  │
│ 1.98  │ Madalena  │ Portugal       │ Margaret  │
│ 3.96  │ Madalena  │ Portugal       │ Margaret  │
│ 5.94  │ Madalena  │ Portugal       │ Margaret  │
│ 0.99  │ Madalena  │ Portugal       │ Margaret  │
│ 1.98  │ Madalena  │ Portugal       │ Margaret  │
│ 13.86 │ Madalena  │ Portugal       │ Margaret  │
│ 8.91  │ Madalena  │ Portugal       │ Margaret  │
│ 1.98  │ Hannah    │ Germany        │ Steve     │
│ 13.86 │ Hannah    │ Germany        │ Steve     │
│ 8.91  │ Hannah    │ Germany        │ Steve     │
│ 1.98  │ Hannah    │ Germany        │ Steve     │
│ 3.96  │ Hannah    │ Germany        │ Steve     │
│ 5.94  │ Hannah    │ Germany        │ Steve     │
│ 0.99  │ Hannah    │ Germany        │ Steve     │
│ 0.99  │ Fynn      │ Germany        │ Jane      │
│ 1.98  │ Fynn      │ Germany        │ Jane      │
│ 13.86 │ Fynn      │ Germany        │ Jane      │
│ 14.91 │ Fynn      │ Germany        │ Jane      │
│ 1.98  │ Fynn      │ Germany        │ Jane      │
│ 3.96  │ Fynn      │ Germany        │ Jane      │
│ 5.94  │ Fynn      │ Germany        │ Jane      │
│ 1.98  │ Niklas    │ Germany        │ Jane      │
│ 3.96  │ Niklas    │ Germany        │ Jane      │
│ 5.94  │ Niklas    │ Germany        │ Jane      │
│ 0.99  │ Niklas    │ Germany        │ Jane      │
│ 1.98  │ Niklas    │ Germany        │ Jane      │
│ 13.86 │ Niklas    │ Germany        │ Jane      │
│ 8.91  │ Niklas    │ Germany        │ Jane      │
│ 1.98  │ Camille   │ France         │ Margaret  │
│ 3.96  │ Camille   │ France         │ Margaret  │
│ 5.94  │ Camille   │ France         │ Margaret  │
│ 1.99  │ Camille   │ France         │ Margaret  │
│ 1.98  │ Camille   │ France         │ Margaret  │
│ 13.86 │ Camille   │ France         │ Margaret  │
│ 8.91  │ Camille   │ France         │ Margaret  │
│ 1.98  │ Dominique │ France         │ Margaret  │
│ 13.86 │ Dominique │ France         │ Margaret  │
│ 8.91  │ Dominique │ France         │ Margaret  │
│ 2.98  │ Dominique │ France         │ Margaret  │
│ 3.96  │ Dominique │ France         │ Margaret  │
│ 5.94  │ Dominique │ France         │ Margaret  │
│ 0.99  │ Dominique │ France         │ Margaret  │
│ 1.98  │ Marc      │ France         │ Steve     │
│ 13.86 │ Marc      │ France         │ Steve     │
│ 8.91  │ Marc      │ France         │ Steve     │
│ 1.98  │ Marc      │ France         │ Steve     │
│ 3.96  │ Marc      │ France         │ Steve     │
│ 5.94  │ Marc      │ France         │ Steve     │
│ 0.99  │ Marc      │ France         │ Steve     │
│ 3.96  │ Wyatt     │ France         │ Jane      │
│ 5.94  │ Wyatt     │ France         │ Jane      │
│ 0.99  │ Wyatt     │ France         │ Jane      │
│ 3.98  │ Wyatt     │ France         │ Jane      │
│ 13.86 │ Wyatt     │ France         │ Jane      │
│ 8.91  │ Wyatt     │ France         │ Jane      │
│ 1.98  │ Wyatt     │ France         │ Jane      │
│ 1.98  │ Isabelle  │ France         │ Jane      │
│ 3.96  │ Isabelle  │ France         │ Jane      │
│ 5.94  │ Isabelle  │ France         │ Jane      │
│ 0.99  │ Isabelle  │ France         │ Jane      │
│ 1.98  │ Isabelle  │ France         │ Jane      │
│ 16.86 │ Isabelle  │ France         │ Jane      │
│ 8.91  │ Isabelle  │ France         │ Jane      │
│ 8.91  │ Terhi     │ Finland        │ Jane      │
│ 1.98  │ Terhi     │ Finland        │ Jane      │
│ 7.96  │ Terhi     │ Finland        │ Jane      │
│ 5.94  │ Terhi     │ Finland        │ Jane      │
│ 0.99  │ Terhi     │ Finland        │ Jane      │
│ 1.98  │ Terhi     │ Finland        │ Jane      │
│ 13.86 │ Terhi     │ Finland        │ Jane      │
│ 1.98  │ Ladislav  │ Hungary        │ Jane      │
│ 21.86 │ Ladislav  │ Hungary        │ Jane      │
│ 8.91  │ Ladislav  │ Hungary        │ Jane      │
│ 1.98  │ Ladislav  │ Hungary        │ Jane      │
│ 3.96  │ Ladislav  │ Hungary        │ Jane      │
│ 5.94  │ Ladislav  │ Hungary        │ Jane      │
│ 0.99  │ Ladislav  │ Hungary        │ Jane      │
│ 5.94  │ Hugh      │ Ireland        │ Jane      │
│ 0.99  │ Hugh      │ Ireland        │ Jane      │
│ 1.98  │ Hugh      │ Ireland        │ Jane      │
│ 21.86 │ Hugh      │ Ireland        │ Jane      │
│ 8.91  │ Hugh      │ Ireland        │ Jane      │
│ 1.98  │ Hugh      │ Ireland        │ Jane      │
│ 3.96  │ Hugh      │ Ireland        │ Jane      │
│ 1.98  │ Lucas     │ Italy          │ Steve     │
│ 3.96  │ Lucas     │ Italy          │ Steve     │
│ 5.94  │ Lucas     │ Italy          │ Steve     │
│ 0.99  │ Lucas     │ Italy          │ Steve     │
│ 1.98  │ Lucas     │ Italy          │ Steve     │
│ 13.86 │ Lucas     │ Italy          │ Steve     │
│ 8.91  │ Lucas     │ Italy          │ Steve     │
│ 8.91  │ Johannes  │ Netherlands    │ Steve     │
│ 1.98  │ Johannes  │ Netherlands    │ Steve     │
│ 3.96  │ Johannes  │ Netherlands    │ Steve     │
│ 8.94  │ Johannes  │ Netherlands    │ Steve     │
│ 0.99  │ Johannes  │ Netherlands    │ Steve     │
│ 1.98  │ Johannes  │ Netherlands    │ Steve     │
│ 13.86 │ Johannes  │ Netherlands    │ Steve     │
│ 1.98  │ Stanisław │ Poland         │ Margaret  │
│ 13.86 │ Stanisław │ Poland         │ Margaret  │
│ 8.91  │ Stanisław │ Poland         │ Margaret  │
│ 1.98  │ Stanisław │ Poland         │ Margaret  │
│ 3.96  │ Stanisław │ Poland         │ Margaret  │
│ 5.94  │ Stanisław │ Poland         │ Margaret  │
│ 0.99  │ Stanisław │ Poland         │ Margaret  │
│ 0.99  │ Enrique   │ Spain          │ Steve     │
│ 1.98  │ Enrique   │ Spain          │ Steve     │
│ 13.86 │ Enrique   │ Spain          │ Steve     │
│ 8.91  │ Enrique   │ Spain          │ Steve     │
│ 1.98  │ Enrique   │ Spain          │ Steve     │
│ 3.96  │ Enrique   │ Spain          │ Steve     │
│ 5.94  │ Enrique   │ Spain          │ Steve     │
│ 1.98  │ Joakim    │ Sweden         │ Steve     │
│ 3.96  │ Joakim    │ Sweden         │ Steve     │
│ 6.94  │ Joakim    │ Sweden         │ Steve     │
│ 0.99  │ Joakim    │ Sweden         │ Steve     │
│ 1.98  │ Joakim    │ Sweden         │ Steve     │
│ 13.86 │ Joakim    │ Sweden         │ Steve     │
│ 8.91  │ Joakim    │ Sweden         │ Steve     │
│ 8.91  │ Emma      │ United Kingdom │ Jane      │
│ 1.98  │ Emma      │ United Kingdom │ Jane      │
│ 3.96  │ Emma      │ United Kingdom │ Jane      │
│ 5.94  │ Emma      │ United Kingdom │ Jane      │
│ 0.99  │ Emma      │ United Kingdom │ Jane      │
│ 1.98  │ Emma      │ United Kingdom │ Jane      │
│ 13.86 │ Emma      │ United Kingdom │ Jane      │
│ 1.98  │ Phil      │ United Kingdom │ Jane      │
│ 13.86 │ Phil      │ United Kingdom │ Jane      │
│ 8.91  │ Phil      │ United Kingdom │ Jane      │
│ 1.98  │ Phil      │ United Kingdom │ Jane      │
│ 3.96  │ Phil      │ United Kingdom │ Jane      │
│ 5.94  │ Phil      │ United Kingdom │ Jane      │
│ 0.99  │ Phil      │ United Kingdom │ Jane      │
│ 0.99  │ Steve     │ United Kingdom │ Steve     │
│ 1.98  │ Steve     │ United Kingdom │ Steve     │
│ 13.86 │ Steve     │ United Kingdom │ Steve     │
│ 8.91  │ Steve     │ United Kingdom │ Steve     │
│ 1.98  │ Steve     │ United Kingdom │ Steve     │
│ 3.96  │ Steve     │ United Kingdom │ Steve     │
│ 5.94  │ Steve     │ United Kingdom │ Steve     │
│ 1.98  │ Mark      │ Australia      │ Margaret  │
│ 3.96  │ Mark      │ Australia      │ Margaret  │
│ 5.94  │ Mark      │ Australia      │ Margaret  │
│ 0.99  │ Mark      │ Australia      │ Margaret  │
│ 1.98  │ Mark      │ Australia      │ Margaret  │
│ 13.86 │ Mark      │ Australia      │ Margaret  │
│ 8.91  │ Mark      │ Australia      │ Margaret  │
│ 1.98  │ Diego     │ Argentina      │ Margaret  │
│ 3.96  │ Diego     │ Argentina      │ Margaret  │
│ 5.94  │ Diego     │ Argentina      │ Margaret  │
│ 0.99  │ Diego     │ Argentina      │ Margaret  │
│ 1.98  │ Diego     │ Argentina      │ Margaret  │
│ 13.86 │ Diego     │ Argentina      │ Margaret  │
│ 8.91  │ Diego     │ Argentina      │ Margaret  │
│ 1.98  │ Luis      │ Chile          │ Steve     │
│ 13.86 │ Luis      │ Chile          │ Steve     │
│ 17.91 │ Luis      │ Chile          │ Steve     │
│ 1.98  │ Luis      │ Chile          │ Steve     │
│ 3.96  │ Luis      │ Chile          │ Steve     │
│ 5.94  │ Luis      │ Chile          │ Steve     │
│ 0.99  │ Luis      │ Chile          │ Steve     │
│ 1.98  │ Manoj     │ India          │ Jane      │
│ 13.86 │ Manoj     │ India          │ Jane      │
│ 8.91  │ Manoj     │ India          │ Jane      │
│ 1.98  │ Manoj     │ India          │ Jane      │
│ 3.96  │ Manoj     │ India          │ Jane      │
│ 5.94  │ Manoj     │ India          │ Jane      │
│ 1.99  │ Manoj     │ India          │ Jane      │
│ 3.96  │ Puja      │ India          │ Jane      │
│ 5.94  │ Puja      │ India          │ Jane      │
│ 1.99  │ Puja      │ India          │ Jane      │
│ 1.98  │ Puja      │ India          │ Jane      │
│ 13.86 │ Puja      │ India          │ Jane      │
│ 8.91  │ Puja      │ India          │ Jane      │
└───────┴───────────┴────────────────┴───────────┘
**/

--¿Cuántas facturas hubo en 2009 y 2011? ¿Cuáles son las ventas totales respectivas para cada uno de esos años?

/**

**/

--

/**

**/

--

/**

**/

--

/**

**/

--

/**

**/

--

/**

**/

--

/**

**/

--

/**

**/

--

/**

**/

--

/**

**/

--

/**

**/

--

/**

**/
