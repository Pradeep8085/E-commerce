-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: grocery
-- ------------------------------------------------------
-- Server version	8.0.29-0ubuntu0.21.10.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `grocery`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `grocery` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `grocery`;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `aid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` int NOT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'himani','himaniaasoda1999@gmail.com',8814);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'grocery',0),(2,'Personal care',0),(3,'home care',0),(4,'Vegetable',0),(5,'masala and spice',1),(6,'oil rice',1),(7,'pluses',1),(8,'Cereal',1);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `fid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `mobile` varchar(12) DEFAULT NULL,
  `msg` text,
  `uid` int DEFAULT NULL,
  PRIMARY KEY (`fid`),
  KEY `feedback_ibfk_1` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,'Barak Obama','9876543210','I am very impressed with this amazing website.',NULL);
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ord`
--

DROP TABLE IF EXISTS `ord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ord` (
  `oid` int NOT NULL AUTO_INCREMENT,
  `uid` int DEFAULT NULL,
  `total` int DEFAULT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`oid`),
  KEY `user_id` (`uid`),
  CONSTRAINT `user_id` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ord`
--

LOCK TABLES `ord` WRITE;
/*!40000 ALTER TABLE `ord` DISABLE KEYS */;
INSERT INTO `ord` VALUES (1,1,240,'2020-10-12 17:31:03'),(2,1,64,'2022-08-22 21:45:31'),(3,1,114,'2022-08-22 21:59:17'),(4,1,114,'2022-08-22 22:00:18'),(5,1,114,'2022-08-22 22:01:04'),(6,7,499,'2022-08-23 00:34:28'),(7,7,499,'2022-08-23 00:53:08'),(8,7,499,'2022-08-23 00:53:56'),(9,7,499,'2022-08-23 00:54:07'),(10,7,499,'2022-08-23 00:54:12');
/*!40000 ALTER TABLE `ord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `oid` int NOT NULL,
  `pid` int NOT NULL,
  `quantity` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `subtotal` int NOT NULL,
  `uid` int DEFAULT '1',
  PRIMARY KEY (`item_id`),
  KEY `order_id` (`oid`),
  KEY `product_id` (`pid`),
  CONSTRAINT `order_id` FOREIGN KEY (`oid`) REFERENCES `ord` (`oid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `product_id` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,1,2,50,100,1),(2,1,2,10,14,140,1),(3,2,1,1,50,50,1),(4,2,2,1,14,14,1),(5,3,1,2,50,100,1),(6,3,2,1,14,14,1),(7,4,1,2,50,100,1),(8,4,2,1,14,14,1),(9,5,1,2,50,100,1),(10,5,2,1,14,14,1),(11,10,7,1,85,85,7);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payid` int NOT NULL AUTO_INCREMENT,
  `oid` int DEFAULT NULL,
  `uid` int DEFAULT NULL,
  `total_amount` int DEFAULT NULL,
  `payment_type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`payid`),
  KEY `uid` (`uid`),
  KEY `oid` (`oid`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`oid`) REFERENCES `ord` (`oid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1,1,240,'COD'),(2,2,1,64,'COD'),(3,3,1,114,'COD'),(4,4,1,114,'COD'),(5,5,1,114,'COD'),(6,10,7,499,'COD');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `discount` int DEFAULT NULL,
  `weight` varchar(20) DEFAULT NULL,
  `pic` varchar(100) DEFAULT NULL,
  `cid` int DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `cid` (`cid`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'diswash vim jell',50,10,NULL,'images/17.png',3),(2,'vim bar',14,10,'200gm','images/18.png',3),(3,'Fortune Sunflower Oil',400,10,' 5 Ltr','images/1.png',6),(4,'meggimasla',2,0,'(2gm)','images/meggi.jpg',5),(5,'Jeggry',50,55,'(1 kg)','images/j2.jpg',6),(6,'rice',500,0,'(5kg)','images/rice2.jpg',6),(7,'mili tea',85,90,'(250gm)','images/m4.jpg',6),(8,'Wagbakri tea',95,10,'(250gm)','images/w.jpg',6),(9,'suger',40,42,'(1kg)','images/s.jpg',6),(10,'sing dana',20,25,'(250gm)','images/so2.jpg',6),(11,'suger',40,0,'(1 kg)','images/s3.jpg',6),(12,'Mungdal',50,55,'(500 gm)','images/mu.jpg',7),(13,'Tuver dal',100,10,'(1kg)','images/tuver.jpg',7),(14,'Mag Mogar dal',50,60,'(500 gm)','images/mungf.jpg',7),(15,'Urad dal',100,12,'(1 kg)','images/urad.jpg',7),(16,'Masur dal',60,65,'(1 kg)','images/masur.jpg',7),(17,'Chana dal',40,50,'(500 gm)','images/chanadal.jpg',7),(18,'Chana',50,55,'(1 kg)','images/chana.jpg',8),(19,'Mug',40,50,'(1 kg)','images/mung.jpg',8),(20,'Urad',100,10,'(1 kg)','images/ur.jpg',8),(21,'clinic plush',50,54,'700 ml','images/1602260557-clinic.jpg',2),(22,'chik',50,54,'700 ml','images/1602266961-chick.jpg',2),(23,'Dettol',40,0,'4 pc','images/1602267040-d3.jpg',2),(24,'Dettol Handwash',30,40,'250ml','images/1602267137-dh.jpg',2),(25,'lifebuoy',50,50,'4 pc','images/1602267355-life.jpg',2),(26,'surf excel',150,160,'1kg','images/1602267705-surf2.jpg',3),(27,'Nirma',40,50,'1 kg','images/1602267875-nirma.jpg',3),(28,'brinjal',40,50,'1kg','images/1602268367-31.png',4);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ratings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int DEFAULT NULL,
  `pid` int DEFAULT NULL,
  `total_rating` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
INSERT INTO `ratings` VALUES (1,1,1,2),(2,1,2,2),(3,1,7,2),(4,7,7,3);
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `uid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `mobile` bigint NOT NULL,
  `address1` varchar(50) NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(10) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'himani',9106682997,'visnager, VILLAGE=ASODA','female','himani','hd6034'),(2,'divya',9979331605,'visnager, VILLAGE=ASODA','female','daxrp','dk7845'),(3,'kishan',9714304713,'visnager','male','kishan rp','kr9856'),(4,'rajubhai',9979331605,'asoda','male','daxrp','rp1236'),(5,'sonali',1236547898,'visnager,','female','sonali','sp1236'),(6,'Asher Franco',9863622239,'Nihil ipsum et ullam','female','gyxibocur',''),(7,'Maris Clements',9863622239,'Aut qui beatae ad et','female','zajuryj','Pa$$w0rd!'),(8,'Kelly Nicholson',9863622239,'Recusandae Eum rem ','female','dicyqu','1326546546');
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

-- Dump completed on 2022-08-23  1:09:28
