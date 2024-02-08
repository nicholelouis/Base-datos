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