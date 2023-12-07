USE sakila_dw;

DROP TABLE `dim_customers`;
CREATE TABLE `dim_customers` (
  `customer_key` int NOT NULL AUTO_INCREMENT,
  `customer_id` smallint unsigned NOT NULL,
  `store_id` tinyint unsigned NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address_id` smallint unsigned NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `create_date` datetime NOT NULL,
  `last_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_key`),
  KEY `store_id` (`store_id`),
  KEY `address_id` (`address_id`),
  KEY `last_name` (`last_name`)
) ENGINE=InnoDB AUTO_INCREMENT=600 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

TRUNCATE TABLE dim_customers;

INSERT INTO `sakila_dw`.`dim_customers`
(`customer_id`,
`store_id`,
`first_name`,
`last_name`,
`email`, 
`address_id`,
`active`,
`create_date`,
`last_update`)
SELECT `customer_id`,
`store_id`,
`first_name`,
`last_name`,
`email`, 
`address_id`,
`active`,
`create_date`,
`last_update`
FROM sakila.customer;

SELECT * FROM sakila_dw.dim_customers LIMIT 5;
