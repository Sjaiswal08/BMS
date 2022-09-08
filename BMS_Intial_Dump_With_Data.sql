-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: bms
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bus`
--

DROP TABLE IF EXISTS `bus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bus` (
  `registration_no` char(8) NOT NULL,
  `busname` varchar(45) NOT NULL,
  `fare_per_km` int NOT NULL,
  `totalseats` int NOT NULL,
  `starttime` time NOT NULL,
  `facilities` varchar(6) NOT NULL,
  `isactive` varchar(5) NOT NULL,
  `routecode` int NOT NULL,
  `createdat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`registration_no`),
  KEY `routecode_fk_idx` (`routecode`),
  CONSTRAINT `routecode_fk` FOREIGN KEY (`routecode`) REFERENCES `route` (`routecode`),
  CONSTRAINT `bus_chk_1` CHECK ((`fare_per_km` >= 1)),
  CONSTRAINT `bus_chk_2` CHECK ((`totalseats` >= 20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus`
--

LOCK TABLES `bus` WRITE;
/*!40000 ALTER TABLE `bus` DISABLE KEYS */;
INSERT INTO `bus` VALUES ('WBAC0001','BUS1',10,50,'11:12:00','AC','YES',1,'2022-02-25 09:56:11','2022-02-25 09:56:11'),('WBAC0002','BUS2',20,50,'12:12:00','NON-AC','YES',1,'2022-02-25 09:56:11','2022-02-25 09:56:11'),('WBAC0003','BUS13',10,50,'01:12:00','AC','YES',2,'2022-02-25 09:56:11','2022-02-25 09:56:11'),('WBAC0004','BUS14',20,50,'02:12:00','NON-AC','YES',2,'2022-02-25 09:56:11','2022-02-25 09:56:11'),('WBAC0005','BUS15',10,50,'03:12:00','AC','YES',3,'2022-02-25 09:56:11','2022-02-25 09:56:11'),('WBAC0006','BUS16',20,50,'04:12:00','NON-AC','YES',3,'2022-02-25 09:56:11','2022-02-25 09:56:11'),('WBAC0007','BUS17',10,50,'05:12:00','AC','YES',4,'2022-02-25 09:56:11','2022-02-25 09:56:11'),('WBAC0008','BUS18',20,50,'06:12:00','NON-AC','YES',4,'2022-02-25 09:56:11','2022-02-25 09:56:11'),('WBAC0009','BUS19',10,50,'07:12:00','AC','YES',5,'2022-02-25 09:56:11','2022-02-25 09:56:11'),('WBAC0010','BUS10',20,50,'08:12:00','NON-AC','YES',5,'2022-02-25 09:56:11','2022-02-25 09:56:11'),('WBAC0011','BUS11',10,50,'09:12:00','AC','YES',6,'2022-02-25 09:56:11','2022-02-25 09:56:11'),('WBAC0012','BUS111',20,50,'10:12:00','NON-AC','NO',6,'2022-02-25 09:56:11','2022-02-25 09:56:11');
/*!40000 ALTER TABLE `bus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `route` (
  `routecode` int NOT NULL AUTO_INCREMENT,
  `startname` varchar(50) NOT NULL,
  `stopname` varchar(50) NOT NULL,
  `distance_km` int NOT NULL,
  `createdat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`routecode`),
  CONSTRAINT `route_chk_1` CHECK ((`distance_km` >= 1))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci KEY_BLOCK_SIZE=4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
INSERT INTO `route` VALUES (1,'Kolkata','Delhi',1200,'2022-02-25 09:36:48','2022-02-25 09:36:48'),(2,'Delhi','Kolkata',1200,'2022-02-25 09:36:48','2022-02-25 09:36:48'),(3,'Kolkata','Mumbai',1500,'2022-02-25 09:36:48','2022-02-25 09:36:48'),(4,'Mumbai','Kolkata',1500,'2022-02-25 09:36:48','2022-02-25 09:36:48'),(5,'Mumbai','Delhi',700,'2022-02-25 09:36:48','2022-02-25 09:36:48'),(6,'Delhi','Mumbai',700,'2022-02-25 09:36:48','2022-02-25 09:36:48');
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `pnr_no` char(10) NOT NULL,
  `seats_booked` int NOT NULL,
  `date_bought` date NOT NULL,
  `date_of_travel` date NOT NULL,
  `total_amount` int NOT NULL,
  `registration_no` char(8) NOT NULL,
  `userid` int NOT NULL,
  `createdat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pnr_no`),
  UNIQUE KEY `pnr_no_UNIQUE` (`pnr_no`),
  KEY `registration_no_fk_idx` (`registration_no`),
  KEY `userid_fk_idx` (`userid`),
  CONSTRAINT `registration_no_fk` FOREIGN KEY (`registration_no`) REFERENCES `bus` (`registration_no`),
  CONSTRAINT `userid_fk` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`),
  CONSTRAINT `ticket_chk_1` CHECK ((`total_amount` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_no` char(10) NOT NULL,
  `password` varchar(200) NOT NULL,
  `isadmin` varchar(3) NOT NULL DEFAULT 'NO',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `phone_no_UNIQUE` (`phone_no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','admin@admin.com','1234123401','1234','YES');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-25 15:28:08
