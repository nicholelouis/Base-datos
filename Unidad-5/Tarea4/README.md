# Tarea 4

## Mostrar todos los productos de la categoría "Bebidas".
```sql 
SELECT nombre, categoria FROM productos WHERE categoria = "Bebidas";
```
```sql
┌──────────────────┬───────────┐
│      nombre      │ categoria │
├──────────────────┼───────────┤
│ Café             │ Bebidas   │
│ Botellas de Agua │ Bebidas   │
│ Cerveza          │ Bebidas   │
└──────────────────┴───────────┘
```
