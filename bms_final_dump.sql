CREATE DATABASE  IF NOT EXISTS `bms` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bms`;
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
INSERT INTO `bus` VALUES ('WBAC0001','JGD Travels Pvt Ltd.',3,20,'11:12:00','AC','YES',1,'2022-02-25 09:56:11','2022-03-19 04:50:49'),('WBAC0002','Bharat Benz',2,50,'12:12:00','NONAC','YES',1,'2022-02-25 09:56:11','2022-03-19 04:50:49'),('WBAC0003','JGD Travels Pvt Ltd.',3,50,'01:12:00','AC','YES',2,'2022-02-25 09:56:11','2022-03-19 04:49:11'),('WBAC0004','Bharat Benz',2,50,'02:12:00','NONAC','YES',2,'2022-02-25 09:56:11','2022-03-19 04:50:49'),('WBAC0005','Royal Travels',3,50,'03:12:00','AC','YES',3,'2022-02-25 09:56:11','2022-03-19 04:54:28'),('WBAC0006','Baba Travels',2,50,'04:12:00','NONAC','YES',3,'2022-02-25 09:56:11','2022-03-19 04:54:28'),('WBAC0007','Royal Travels',3,50,'05:12:00','AC','YES',4,'2022-02-25 09:56:11','2022-03-19 04:54:28'),('WBAC0008','Baba Travels',2,50,'06:12:00','NONAC','YES',4,'2022-02-25 09:56:11','2022-03-19 04:54:28'),('WBAC0009','Raj Travels(EXPRESS)',3,50,'07:12:00','AC','YES',5,'2022-02-25 09:56:11','2022-03-19 04:57:04'),('WBAC0010','Raj Travels',2,50,'08:12:00','NONAC','YES',5,'2022-02-25 09:56:11','2022-03-19 04:57:04'),('WBAC0011','Raj Travels(EXPRESS)',3,50,'09:12:00','AC','YES',6,'2022-02-25 09:56:11','2022-03-19 04:57:04'),('WBAC0012','Raj Travels',2,50,'10:12:00','NONAC','YES',6,'2022-02-25 09:56:11','2022-03-19 04:57:04'),('WBAC0013','Zing Bus',5,20,'17:27:00','AC','YES',7,'2022-03-10 06:24:16','2022-03-19 05:02:08'),('WBAC0014','Intercity Bus',3,20,'09:28:00','NONAC','YES',7,'2022-03-10 06:28:43','2022-03-19 05:02:08'),('WBAC0015','Zing Bus',5,20,'18:23:00','AC','YES',8,'2022-03-10 07:19:48','2022-03-19 05:02:08'),('WBAC0016','Intercity Bus',3,20,'19:18:00','NONAC','YES',8,'2022-03-10 08:14:33','2022-03-19 05:02:08'),('WBAC0017','Jaganath Travels',3,20,'19:21:00','AC','YES',9,'2022-03-10 08:17:01','2022-03-19 05:05:26'),('WBAC0018','Om travels',2,20,'19:29:00','NONAC','YES',9,'2022-03-10 08:25:10','2022-03-19 05:05:26'),('WBAC0019','Jaganath Travels',3,20,'19:23:00','AC','YES',10,'2022-03-10 08:18:56','2022-03-19 05:05:26'),('WBAC0020','Om Travles',2,20,'19:38:00','NONAC','YES',10,'2022-03-10 08:34:33','2022-03-19 05:05:26'),('WBAC0021','Dolphin Travels',2,20,'11:00:00','NONAC','YES',1,'2022-03-16 23:57:19','2022-03-19 05:04:34');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci KEY_BLOCK_SIZE=4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
INSERT INTO `route` VALUES (1,'Kolkata','Delhi',1563,'2022-02-25 09:36:48','2022-03-19 04:42:57'),(2,'Delhi','Kolkata',1563,'2022-02-25 09:36:48','2022-03-19 04:42:57'),(3,'Kolkata','Mumbai',1913,'2022-02-25 09:36:48','2022-03-19 04:42:57'),(4,'Mumbai','Kolkata',1913,'2022-02-25 09:36:48','2022-03-19 04:42:57'),(5,'Mumbai','Delhi',1414,'2022-02-25 09:36:48','2022-03-19 04:42:57'),(6,'Delhi','Mumbai',1414,'2022-02-25 09:36:48','2022-03-19 04:42:57'),(7,'Mumbai','Goa',587,'2022-03-19 04:42:57','2022-03-19 04:42:57'),(8,'Goa','Mumbai',587,'2022-03-19 04:42:57','2022-03-19 04:42:57'),(9,'Kolkata','Puri',497,'2022-03-19 04:42:57','2022-03-19 04:42:57'),(10,'Puri','Kolkata',497,'2022-03-19 04:42:57','2022-03-19 04:42:57');
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
INSERT INTO `ticket` VALUES ('03A15830AC',5,'2022-03-19','2022-03-20',4970,'WBAC0020',20,'2022-03-18 23:46:55','2022-03-18 23:46:55'),('0D4385FDAD',2,'2022-03-19','2022-03-20',6252,'WBAC0004',18,'2022-03-18 23:41:42','2022-03-18 23:41:42'),('2A58F7E5FE',4,'2022-03-19','2022-03-20',5964,'WBAC0017',20,'2022-03-18 23:46:41','2022-03-18 23:46:41'),('6437A8884B',4,'2022-03-19','2022-03-20',11312,'WBAC0012',19,'2022-03-18 23:44:13','2022-03-18 23:44:13'),('8A89C1471D',5,'2022-03-19','2022-03-20',14675,'WBAC0015',19,'2022-03-18 23:44:38','2022-03-18 23:44:38'),('BC3F1D5781',2,'2022-03-19','2022-03-20',8484,'WBAC0009',19,'2022-03-18 23:43:56','2022-03-18 23:43:56'),('C471AED231',3,'2022-03-19','2022-03-20',11478,'WBAC0008',18,'2022-03-18 23:42:57','2022-03-18 23:42:57'),('D9B614BDB2',3,'2022-03-19','2022-03-20',5283,'WBAC0014',19,'2022-03-18 23:45:44','2022-03-18 23:45:44'),('DA4F138F6C',2,'2022-03-19','2022-03-20',11478,'WBAC0005',18,'2022-03-18 23:42:12','2022-03-18 23:42:12'),('DA5B8181E5',3,'2022-03-19','2022-03-20',14067,'WBAC0001',18,'2022-03-18 23:41:11','2022-03-18 23:41:11');
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
  `createdat` datetime DEFAULT NULL,
  `updatedat` datetime DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `phone_no_UNIQUE` (`phone_no`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','admin@admin.com','9191919191','QWRtaW5AMTIzNA==','YES','2022-03-09 06:53:01','2022-03-09 06:53:01'),(18,'Alex','alex@gmail.com','9292929292','QWxleEAxMjM=','NO','2022-03-19 05:08:22','2022-03-19 05:08:22'),(19,'Steve','steve@gmail.com','9393939393','U3RldmVAMTIz','NO','2022-03-19 05:09:24','2022-03-19 05:09:24'),(20,'Arti','arti@gmail.com','9494949494','QXJ0aUAxMjM=','NO','2022-03-19 05:10:03','2022-03-19 05:10:03');
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

-- Dump completed on 2022-03-19 10:50:26
