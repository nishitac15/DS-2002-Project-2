USE sakila_dw;

DROP TABLE dim_actors;
CREATE TABLE `dim_actors` (
  `actor_key` int NOT NULL AUTO_INCREMENT,
  `actor_id` smallint unsigned NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`actor_key`),
  KEY `actor_last_name` (`last_name`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

TRUNCATE TABLE dim_actors;

INSERT INTO `sakila_dw`.`dim_actors`
(`actor_id`,
`first_name`,
`last_name`,
`last_update`)
SELECT `actor`.`actor_id`,
    `actor`.`first_name`,
    `actor`.`last_name`,
    `actor`.`last_update`
FROM `sakila`.`actor`;

SELECT * FROM sakila_dw.dim_actors;