USE sakila_dw;

# DROP TABLE `dim_payment`;
CREATE TABLE `dim_payment` (
  `payment_key` int NOT NULL AUTO_INCREMENT,
  `payment_id` smallint unsigned NOT NULL,
  `customer_id` smallint unsigned NOT NULL,
  `staff_id` tinyint unsigned NOT NULL,
  `rental_id` int DEFAULT NULL,
  `amount` decimal(5,2) NOT NULL,
  `payment_date` datetime NOT NULL,
  `last_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_key`),
  KEY `idx_fk_staff_id` (`staff_id`),
  KEY `idx_fk_customer_id` (`customer_id`),
  KEY `fk_payment_rental` (`rental_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16050 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

TRUNCATE TABLE dim_payment;

INSERT INTO `sakila_dw`.`dim_payment`
(`payment_id`,
`customer_id`,
`staff_id`,
`rental_id`,
`amount`,
`payment_date`,
`last_update`)
SELECT `payment`.`payment_id`,
    `payment`.`customer_id`,
    `payment`.`staff_id`,
    `payment`.`rental_id`,
    `payment`.`amount`,
    `payment`.`payment_date`,
    `payment`.`last_update`
FROM `sakila`.`payment`;
-- ----------------------------------------------
-- Validate that the Data was Inserted ----------
-- ----------------------------------------------
SELECT * FROM sakila_dw.dim_payment;