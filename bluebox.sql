-- MySQL dump 10.13  Distrib 5.6.14, for osx10.6 (x86_64)
--
-- Host: localhost    Database: bluebox
-- ------------------------------------------------------
-- Server version	5.6.14

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `bluebox`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `bluebox` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `bluebox`;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'userone'),(2,'usertwo'),(3,'userthree'),(4,'userfour'),(5,'console0'),(6,'userone'),(7,'usertwo'),(8,'userthree'),(9,'userfour'),(10,'console0');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `box`
--

DROP TABLE IF EXISTS `box`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `box` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `box_type_id` int(11) NOT NULL DEFAULT '0',
  `box_status_id` int(11) NOT NULL DEFAULT '0',
  `warehouse_id` int(11) DEFAULT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`),
  KEY `type_id` (`box_type_id`),
  KEY `status_id` (`box_status_id`),
  KEY `warehouse_id` (`warehouse_id`),
  CONSTRAINT `box_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `box_ibfk_2` FOREIGN KEY (`box_type_id`) REFERENCES `box_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `box_ibfk_3` FOREIGN KEY (`box_status_id`) REFERENCES `box_status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `box_ibfk_4` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `box`
--

LOCK TABLES `box` WRITE;
/*!40000 ALTER TABLE `box` DISABLE KEYS */;
INSERT INTO `box` VALUES (1,1,3,1,1,'1-0-userone-large-0793'),(2,1,3,1,1,'1-1-userone-large-5970'),(3,1,3,1,1,'1-2-userone-large-5666'),(4,1,3,1,2,'1-3-userone-large-8353'),(5,1,3,1,1,'1-4-userone-large-7443'),(6,2,3,1,1,'2-0-usertwo-large-4518'),(7,2,3,1,1,'2-1-usertwo-large-1856'),(8,2,3,1,1,'2-2-usertwo-large-5446'),(9,2,3,1,1,'2-3-usertwo-large-1480'),(10,2,3,1,1,'2-4-usertwo-large-5952'),(11,2,3,1,1,'2-5-usertwo-large-5139'),(12,3,3,1,1,'3-0-userthree-large-0199'),(13,3,3,1,1,'3-1-userthree-large-4355'),(14,3,3,1,1,'3-2-userthree-large-6103'),(15,3,3,1,1,'3-3-userthree-large-1681'),(16,4,3,1,1,'4-0-userfour-large-7468'),(17,4,3,1,2,'4-1-userfour-large-0457'),(18,4,3,1,1,'4-2-userfour-large-6212'),(19,4,3,1,1,'4-3-userfour-large-1156'),(20,4,3,1,1,'4-4-userfour-large-7412'),(21,4,3,1,1,'4-5-userfour-large-9373'),(22,4,3,1,1,'4-6-userfour-large-2371'),(23,4,3,1,2,'4-7-userfour-large-8622'),(24,4,3,1,1,'4-8-userfour-large-6054'),(25,5,3,1,1,'5-0-console0-large-3644'),(26,5,3,1,1,'5-1-console0-large-5460'),(27,6,3,1,1,'6-0-userone-large-0541'),(28,6,3,1,1,'6-1-userone-large-3098'),(29,6,3,1,1,'6-2-userone-large-5523'),(30,6,3,1,1,'6-3-userone-large-0821'),(31,6,3,1,1,'6-4-userone-large-0607'),(32,6,3,1,1,'6-5-userone-large-0421'),(33,6,3,1,1,'6-6-userone-large-5238'),(34,6,3,1,1,'6-7-userone-large-5776'),(35,7,3,1,1,'7-0-usertwo-large-2214'),(36,7,3,1,1,'7-1-usertwo-large-2634'),(37,7,3,1,1,'7-2-usertwo-large-8979'),(38,8,3,1,1,'8-0-userthree-large-5789'),(39,8,3,1,1,'8-1-userthree-large-3867'),(40,9,3,1,1,'9-0-userfour-large-3313'),(41,9,3,1,1,'9-1-userfour-large-9824'),(42,9,3,1,1,'9-2-userfour-large-6787'),(43,9,3,1,1,'9-3-userfour-large-6607'),(44,9,3,1,1,'9-4-userfour-large-1442'),(45,9,3,1,1,'9-5-userfour-large-7493'),(46,9,3,1,1,'9-6-userfour-large-5258'),(47,9,3,1,1,'9-7-userfour-large-5638'),(48,10,3,1,1,'10-0-console0-large-4062'),(49,10,3,1,1,'10-1-console0-large-0256');
/*!40000 ALTER TABLE `box` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `box_status`
--

DROP TABLE IF EXISTS `box_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `box_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `box_status`
--

LOCK TABLES `box_status` WRITE;
/*!40000 ALTER TABLE `box_status` DISABLE KEYS */;
INSERT INTO `box_status` VALUES (1,'In Storage'),(2,'Inbound'),(3,'Outbound');
/*!40000 ALTER TABLE `box_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `box_type`
--

DROP TABLE IF EXISTS `box_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `box_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `box_type`
--

LOCK TABLES `box_type` WRITE;
/*!40000 ALTER TABLE `box_type` DISABLE KEYS */;
INSERT INTO `box_type` VALUES (1,'Small'),(2,'Medium'),(3,'Large');
/*!40000 ALTER TABLE `box_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` text,
  `value` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_box_map`
--

DROP TABLE IF EXISTS `item_box_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_box_map` (
  `item_id` int(11) NOT NULL DEFAULT '0',
  `box_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_id`,`box_id`),
  KEY `box_id` (`box_id`),
  CONSTRAINT `item_box_map_ibfk_2` FOREIGN KEY (`box_id`) REFERENCES `box` (`id`),
  CONSTRAINT `item_box_map_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_box_map`
--

LOCK TABLES `item_box_map` WRITE;
/*!40000 ALTER TABLE `item_box_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_box_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `address` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`),
  CONSTRAINT `location_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,1,'Delivery address for userone','8723 Test Rd, Cincinnati, OH 45826'),(2,2,'Delivery address for usertwo','8540 Test Rd, Cincinnati, OH 45858'),(3,3,'Delivery address for userthree','0494 Test Rd, Cincinnati, OH 45487'),(4,4,'Delivery address for userfour','6101 Test Rd, Cincinnati, OH 45021'),(5,5,'Delivery address for console0','0798 Test Rd, Cincinnati, OH 45329'),(6,6,'Delivery address for userone','5964 Test Rd, Cincinnati, OH 45014'),(7,7,'Delivery address for usertwo','9059 Test Rd, Cincinnati, OH 45548'),(8,8,'Delivery address for userthree','4976 Test Rd, Cincinnati, OH 45235'),(9,9,'Delivery address for userfour','8149 Test Rd, Cincinnati, OH 45872'),(10,10,'Delivery address for console0','6900 Test Rd, Cincinnati, OH 45151');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `ordered_on` datetime NOT NULL,
  `deliver_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipment`
--

DROP TABLE IF EXISTS `shipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `box_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `deliver_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `box_id` (`box_id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `shipment_ibfk_1` FOREIGN KEY (`box_id`) REFERENCES `box` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `shipment_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipment`
--

LOCK TABLES `shipment` WRITE;
/*!40000 ALTER TABLE `shipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse`
--

DROP TABLE IF EXISTS `warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warehouse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `address` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse`
--

LOCK TABLES `warehouse` WRITE;
/*!40000 ALTER TABLE `warehouse` DISABLE KEYS */;
INSERT INTO `warehouse` VALUES (1,'Cincinnati','123 Main St., Cincinnati, OH 45202'),(2,'Cincinnati West','345 Elsewhere St, 45247');
/*!40000 ALTER TABLE `warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'bluebox'
--

--
-- Dumping routines for database 'bluebox'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-08-21 15:13:59
