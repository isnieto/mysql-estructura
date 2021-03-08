# mysql-estructura
## Entrega d'exercici: Estructura de dades - MySQL
### Exercici 1 - Òptica
**Una òptica, anomenada “Cul d'Ampolla”, vol informatitzar la gestió dels clients i vendes d'ulleres.**

A diferenciar dos partes dentro de la estructura. Por un lado, la parte del producto (_glasses_), proveedores (_suppliers_), y marcas (_brands_), así como los pedidos(_orders_) realizados al/los proveedor(es).
Por el otro lado las entidades relacionadas con los clientes (_customers_), y las ventas (_sales-). En la entidad direciones(_addres__), se guardan todas las direcciones, ya sean de proveedores, como de 
los clientes.

La base de datos se compone de:
1. Entidad: **glasses** (Entidades relacionadas: glass_frame, glass_colors)
2. Entidad: **suppliers** 
3. Entidad: **address**  (Entidades relacionadas: city, country)
4. Entidad: **customers**  (Entidades relacionadas: employees, recommendations)
5. Entidad: **brands**


He añadido 3 entidades intermedias para evitar las relaciones many-to-many:
1. Entidad: **sales** (Entidad relacionada: items-sales) representa las ventas de gafas a los clientes
2. Entidad: **orders** (Entidad relacionada: items-ordered) representa la compra de gafas a los proveedores
3. Entidad: **brand_supppliers** representa la relación de lso proveedores y las marcas que ofrecen.
