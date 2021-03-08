CREATE TABLE `glasses` (
  `glass_id` int PRIMARY KEY AUTO_INCREMENT,
  `glass_name` varchar(255),
  `price` decimal,
  `diopters` float,
  `color_glass_id` int,
  `glass_frame_id` int,
  `color_frame_id` int,
  `brand_id` int
);

CREATE TABLE `brand` (
  `brand_id` int PRIMARY KEY AUTO_INCREMENT,
  `brand_name` varchar(255)
);

CREATE TABLE `supplier` (
  `supplier_id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `address_id` int,
  `phone` int,
  `fax` int,
  `nif` varchar(255)
);

CREATE TABLE `brand_suppliers` (
  `brand_id` int,
  `supplier_id` int
);

CREATE TABLE `glasses_frame` (
  `glass_frame_id` int PRIMARY KEY AUTO_INCREMENT,
  `glass_frame` varchar(255)
);

CREATE TABLE `color_glass` (
  `color_glass_id` int PRIMARY KEY AUTO_INCREMENT,
  `color_glasses` varchar(255)
);

CREATE TABLE `items_ordered` (
  `items_ordered_id` int PRIMARY KEY,
  `order_id` int,
  `glass_id` int,
  `quantity` int
);

CREATE TABLE `order` (
  `order_id` int PRIMARY KEY AUTO_INCREMENT,
  `supplier_id` int,
  `order_date` date
);

CREATE TABLE `customers` (
  `customer_id` int PRIMARY KEY AUTO_INCREMENT,
  `firstname` varchar(255),
  `lastname` varchar(255),
  `address_id` int,
  `phone` int,
  `email` varchar(255),
  `registered_at` date
);

CREATE TABLE `employee` (
  `employee_id` int PRIMARY KEY AUTO_INCREMENT,
  `firstname` varchar(255),
  `lastname` varchar(255)
);

CREATE TABLE `address` (
  `address_id` int PRIMARY KEY AUTO_INCREMENT,
  `street` varchar(255),
  `number` int,
  `floot` int,
  `door` varchar(255),
  `city_id` int,
  `zip` int,
  `country_id` int
);

CREATE TABLE `city` (
  `city_id` int PRIMARY KEY AUTO_INCREMENT,
  `city_name` varchar(255)
);

CREATE TABLE `country` (
  `country_id` int PRIMARY KEY AUTO_INCREMENT,
  `country_name` varchar(255)
);

CREATE TABLE `recommendations` (
  `recommended_id` int,
  `customer_id` int,
  PRIMARY KEY (`recommended_id`, `customer_id`)
);

CREATE TABLE `item_sales` (
  `items_sales_id` int PRIMARY KEY,
  `sale_id` int,
  `glass_id` int,
  `quantity` int,
  `sales_price` decimal,
  `employee_id` int
);

CREATE TABLE `sales` (
  `sale_id` int PRIMARY KEY AUTO_INCREMENT,
  `sale_date` date,
  `customer_id` int,
  `total_price` decimal
);

ALTER TABLE `glasses` ADD FOREIGN KEY (`glass_frame_id`) REFERENCES `glasses_frame` (`glass_frame_id`);

ALTER TABLE `glasses` ADD FOREIGN KEY (`color_glass_id`) REFERENCES `color_glass` (`color_glass_id`);

ALTER TABLE `brand` ADD FOREIGN KEY (`brand_id`) REFERENCES `glasses` (`brand_id`);

ALTER TABLE `brand_suppliers` ADD FOREIGN KEY (`brand_id`) REFERENCES `brand` (`brand_id`);

ALTER TABLE `brand_suppliers` ADD FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`);

ALTER TABLE `items_ordered` ADD FOREIGN KEY (`items_ordered_id`) REFERENCES `order` (`order_id`);

ALTER TABLE `items_ordered` ADD FOREIGN KEY (`glass_id`) REFERENCES `glasses` (`glass_id`);

ALTER TABLE `order` ADD FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`);

ALTER TABLE `address` ADD FOREIGN KEY (`address_id`) REFERENCES `customers` (`address_id`);

ALTER TABLE `address` ADD FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`);

ALTER TABLE `address` ADD FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`);

ALTER TABLE `supplier` ADD FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`);

ALTER TABLE `recommendations` ADD FOREIGN KEY (`recommended_id`) REFERENCES `customers` (`customer_id`);

ALTER TABLE `item_sales` ADD FOREIGN KEY (`sale_id`) REFERENCES `sales` (`sale_id`);

ALTER TABLE `sales` ADD FOREIGN KEY (`sale_id`) REFERENCES `customers` (`customer_id`);

ALTER TABLE `item_sales` ADD FOREIGN KEY (`glass_id`) REFERENCES `glasses` (`glass_id`);

ALTER TABLE `item_sales` ADD FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`);

