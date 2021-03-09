# mysql-estructura
## Entrega d'exercici: Estructura de dades - MySQL
### Exercici 1 - Òptica
**Una òptica, anomenada “Cul d'Ampolla”, vol informatitzar la gestió dels clients i vendes d'ulleres.**

A diferenciar dos partes dentro de la estructura. Por un lado, la parte del producto (_glasses_), proveedores (_suppliers_), y marcas (_brands_), así como los pedidos(_orders_) realizados al/los proveedor(es).
Por el otro lado las entidades relacionadas con los clientes (_customers_), y las ventas (_sales-). 

La base de datos se compone de:
1. Entidad: **glasses** (Entidades relacionadas: glass_frame, glass_colors)
2. Entidad: **suppliers** 
3. Entidad: **customers**  (Entidades relacionadas: employees)
4. Entidad: **brands**

He añadido 2 entidades intermedias para evitar las relaciones many-to-many:
1. Entidad: **sales** (Entidad relacionada: items-sales) representa las ventas de gafas a los clientes
2. Entidad: **orders** (Entidad relacionada: items-ordered) representa la compra de gafas a los proveedores

### - Exercici 2 - Pizzeria
** Un client t’ha ha contractat per a dissenyar una web que permeti fer comandes de menjar a domicili per Internet.**

Las tablas _products_ y _address__ actuan como tablas principales. 
Las siguientes tablas forman parte del diagrama
1. Entidad: **products** (Entidad vinculada: product_category)
4. Entidad: **customers**  
5. Entidad: **employee** (Entidad vinculada: job)
6. Entidad: **delivering** (Entidad vinculada: deliver_service)
7. Entidad: **orders** 
8. Entidad: **products_orderes** (tabla intermedia que almacena los pedidos y los productos
