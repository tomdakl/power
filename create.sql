CREATE TABLE `genesis_raw` (
  `DH` datetime NOT NULL,
  `usage` double DEFAULT NULL,
  `dollars` double DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`DH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
;
