DROP DATABASE IF EXISTS pizzeria_margarita;
CREATE DATABASE pizzeria_margarita CHARACTER SET utf8mb4;
USE pizzeria_margarita;

CREATE TABLE `order` (
  `order_id` int PRIMARY KEY AUTO_INCREMENT,
  `order_date` datetime,
  `tota_price` decimal,
  `customer_id` int,
  `store_id` int
);

CREATE TABLE `products_ordered` (
  `products_ordered_id` int PRIMARY KEY AUTO_INCREMENT,
  `order_id` int,
  `product_id` int,
  `quantity` int
);

CREATE TABLE `delivering` (
  `deliver_id` int PRIMARY KEY AUTO_INCREMENT,
  `deliver_date` datetime,
  `employee_id` int,
  `order_id` int,
  `deliver_service` int
);

CREATE TABLE `deliver_service` (
  `deliver_service_id` int PRIMARY KEY AUTO_INCREMENT,
  `service_name` varchar(255)
);

CREATE TABLE `products` (
  `product_id` int PRIMARY KEY AUTO_INCREMENT,
  `product_name` varchar(255),
  `description` text,
  `images` blob,
  `price` decimal,
  `category_id` int
);

CREATE TABLE `product_category` (
  `category_id` int PRIMARY KEY AUTO_INCREMENT,
  `category` varchar(255)
);

CREATE TABLE `customers` (
  `customer_id` int PRIMARY KEY AUTO_INCREMENT,
  `firstname` varchar(255),
  `lastname` varchar(255),
  `phone` int,
  `street` varchar(255),
  `number` int,
  `floot` int,
  `door` varchar(255),
  `city_id` int,
  `zip` int
);

CREATE TABLE `store` (
  `store_id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `street` varchar(255),
  `number` int,
  `floot` int,
  `door` varchar(255),
  `city_id` int,
  `zip` int
);

CREATE TABLE `employee` (
  `employee_id` int PRIMARY KEY AUTO_INCREMENT,
  `firstname` varchar(255),
  `lastname` varchar(255),
  `store_id` int,
  `job_id` int,
  `nif` int COMMENT 'unique',
  `phone_number` int
);

CREATE TABLE `job` (
  `job_id` int PRIMARY KEY AUTO_INCREMENT,
  `job` varchar(255)
);

CREATE TABLE `city` (
  `city_id` int PRIMARY KEY AUTO_INCREMENT,
  `city_name` varchar(255),
  `state_id` int
);

CREATE TABLE `state` (
  `state_id` int PRIMARY KEY AUTO_INCREMENT,
  `state_name` varchar(255),
  `city_id` int
);

ALTER TABLE `products_ordered` ADD FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`);

ALTER TABLE `products_ordered` ADD FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

ALTER TABLE `delivering` ADD FOREIGN KEY (`deliver_service`) REFERENCES `deliver_service` (`deliver_service_id`);

ALTER TABLE `order` ADD FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

ALTER TABLE `products` ADD FOREIGN KEY (`category_id`) REFERENCES `product_category` (`category_id`);

ALTER TABLE `delivering` ADD FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`);

ALTER TABLE `delivering` ADD FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`);

ALTER TABLE `employee` ADD FOREIGN KEY (`job_id`) REFERENCES `job` (`job_id`);

ALTER TABLE `employee` ADD FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`);

ALTER TABLE `order` ADD FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`);

ALTER TABLE `city` ADD FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`);

ALTER TABLE `store` ADD FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`);
