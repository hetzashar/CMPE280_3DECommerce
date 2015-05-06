-- MySQL dump 10.13  Distrib 5.6.23, for Win32 (x86)
--
-- Host: localhost    Database: fashion3d
-- ------------------------------------------------------
-- Server version	5.6.22-log

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
-- Table structure for table `auth`
--

DROP TABLE IF EXISTS `auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `authid` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth`
--

LOCK TABLES `auth` WRITE;
/*!40000 ALTER TABLE `auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `color_master`
--

DROP TABLE IF EXISTS `color_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `color_master` (
  `color_master_id` int(11) NOT NULL AUTO_INCREMENT,
  `Color_Name` varchar(12) DEFAULT NULL,
  `Code` varchar(12) DEFAULT NULL,
  `Red` int(11) NOT NULL,
  `Green` int(11) NOT NULL,
  `Blue` int(11) NOT NULL,
  `Additional_notes` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`color_master_id`),
  KEY `Red_index` (`Red`),
  KEY `Green_index` (`Green`),
  KEY `Blue_index` (`Blue`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color_master`
--

LOCK TABLES `color_master` WRITE;
/*!40000 ALTER TABLE `color_master` DISABLE KEYS */;
INSERT INTO `color_master` VALUES (1,'Black','#000000',0,0,0,'[Black]'),(2,'White','#FFFFFF',255,255,255,'[White]'),(3,'Red','#FF0000',255,0,0,'[Red]'),(4,'Green','#00FF00',0,255,0,'[Green]'),(5,'Blue','#0000FF',0,0,255,'[Blue]'),(6,'Yellow','#FFFF00',255,255,0,'[Yellow]'),(7,'Magenta','#FF00FF',255,0,255,'[Magenta]'),(8,'Cyan','#00FFFF',0,255,255,'[Cyan]'),(9,'[Color 9]','#800000',128,0,0,'[Color 9]'),(10,'[Color 10]','#008000',0,128,0,'[Color 10]'),(11,'[Color 11]','#000080',0,0,128,'[Color 11]'),(12,'[Color 12]','#808000',128,128,0,'[Color 12]'),(13,'[Color 13]','#800080',128,0,128,'[Color 13]'),(14,'[Color 14]','#008080',0,128,128,'[Color 14]'),(15,'[Color 15]','#C0C0C0',192,192,192,'[Color 15]'),(16,'[Color 16]','#808080',128,128,128,'[Color 16]'),(17,'[Color 17]','#9999FF',153,153,255,'[Color 17]'),(18,'[Color 18]','#993366',153,51,102,'[Color 18]'),(19,'[Color 19]','#FFFFCC',255,255,204,'[Color 19]'),(20,'[Color 20]','#CCFFFF',204,255,255,'[Color 20]'),(21,'[Color 21]','#660066',102,0,102,'[Color 21]'),(22,'[Color 22]','#FF8080',255,128,128,'[Color 22]'),(23,'[Color 23]','#0066CC',0,102,204,'[Color 23]'),(24,'[Color 24]','#CCCCFF',204,204,255,'[Color 24]'),(25,'[Color 25]','#000080',0,0,128,'[Color 25]'),(26,'[Color 26]','#FF00FF',255,0,255,'[Color 26]'),(27,'[Color 27]','#FFFF00',255,255,0,'[Color 27]'),(28,'[Color 28]','#00FFFF',0,255,255,'[Color 28]'),(29,'[Color 29]','#800080',128,0,128,'[Color 29]'),(30,'[Color 30]','#800000',128,0,0,'[Color 30]'),(31,'[Color 31]','#008080',0,128,128,'[Color 31]'),(32,'[Color 32]','#0000FF',0,0,255,'[Color 32]'),(33,'[Color 33]','#00CCFF',0,204,255,'[Color 33]'),(34,'[Color 34]','#CCFFFF',204,255,255,'[Color 34]'),(35,'[Color 35]','#CCFFCC',204,255,204,'[Color 35]'),(36,'[Color 36]','#FFFF99',255,255,153,'[Color 36]'),(37,'[Color 37]','#99CCFF',153,204,255,'[Color 37]'),(38,'[Color 38]','#FF99CC',255,153,204,'[Color 38]'),(39,'[Color 39]','#CC99FF',204,153,255,'[Color 39]'),(40,'[Color 40]','#FFCC99',255,204,153,'[Color 40]'),(41,'[Color 41]','#3366FF',51,102,255,'[Color 41]'),(42,'[Color 42]','#33CCCC',51,204,204,'[Color 42]'),(43,'[Color 43]','#99CC00',153,204,0,'[Color 43]'),(44,'[Color 44]','#FFCC00',255,204,0,'[Color 44]'),(45,'[Color 45]','#FF9900',255,153,0,'[Color 45]'),(46,'[Color 46]','#FF6600',255,102,0,'[Color 46]'),(47,'[Color 47]','#666699',102,102,153,'[Color 47]'),(48,'[Color 48]','#969696',150,150,150,'[Color 48]'),(49,'[Color 49]','#003366',0,51,102,'[Color 49]'),(50,'[Color 50]','#339966',51,153,102,'[Color 50]'),(51,'[Color 51]','#003300',0,51,0,'[Color 51]'),(52,'[Color 52]','#333300',51,51,0,'[Color 52]'),(53,'[Color 53]','#993300',153,51,0,'[Color 53]'),(54,'[Color 54]','#993366',153,51,102,'[Color 54]'),(55,'[Color 55]','#333399',51,51,153,'[Color 55]'),(56,'[Color 56]','#333333',51,51,51,'[Color 56]');
/*!40000 ALTER TABLE `color_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `design`
--

DROP TABLE IF EXISTS `design`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `design` (
  `design_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `base_color` varchar(10) DEFAULT NULL,
  `color_applied` varchar(10) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `is_approved` char(1) DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`design_id`),
  KEY `created_by_idx` (`created_by`),
  KEY `product_id_idx` (`product_id`),
  KEY `approved_by_idx` (`approved_by`),
  CONSTRAINT `approved_by` FOREIGN KEY (`approved_by`) REFERENCES `login` (`login_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `created_by` FOREIGN KEY (`created_by`) REFERENCES `login` (`login_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `design`
--

LOCK TABLES `design` WRITE;
/*!40000 ALTER TABLE `design` DISABLE KEYS */;
/*!40000 ALTER TABLE `design` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `login_id` int(11) NOT NULL,
  `userid` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `emailid` varchar(45) DEFAULT NULL,
  `role` varchar(10) NOT NULL DEFAULT 'USER',
  `last_logged_in` datetime DEFAULT NULL,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  PRIMARY KEY (`login_id`),
  UNIQUE KEY `userid_UNIQUE` (`userid`),
  UNIQUE KEY `emailid_UNIQUE` (`emailid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `category` enum('MEN','WOMEN') DEFAULT NULL,
  `product_name` varchar(45) DEFAULT NULL,
  `product_count` int(11) NOT NULL,
  `buyers_count` int(11) NOT NULL DEFAULT '0',
  `tn_image_path` varchar(145) DEFAULT NULL,
  `initial_color` varchar(45) NOT NULL,
  `added_by` int(11) NOT NULL,
  `product_description` varchar(545) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `big_image_path` varchar(145) NOT NULL,
  `title` varchar(45) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'MEN','Angry Birds T-shirt',200,0,'images/men/1_small.jpg','grey',1,'Angry Birds T-Shirt features the face of the King Pig. Get one for a friend and yourself!',18.99,'images/men/1_big.jpg','Fashionista Tshirt'),(2,'MEN','Navy Blue collared T-shirt',200,0,'images/men/2_small.jpg','blue',2,'Polo shirt with short sleeves. Collar, buttons at top, and small embroidered detail on chest',12.99,'images/men/2_big.jpg','Fashionista Tshirt'),(3,'MEN','Multicolor Checks Shirt',500,0,'images/men/3_small.jpg','red',3,'Revive classic style with this modern check dress shirt from Bar III\'s Carnaby Collection.',34.99,'images/men/3_big.jpg','Fashionista Shirt'),(6,'WOMEN','Hello Kitty White Tshirt',800,0,'images/women/1_small.jpg','white',4,' This tween 50% cotton and 50% polyester t-shirt has Hello Kitty ',9.99,'images/women/1_big.jpg','Fashionista Tshirt'),(7,'WOMEN','Sexy Designer Green Top',200,0,'images/women/2_small.jpg','green',5,'Crafted of black neoprene overlaid with green, black and white diamond-pattern jacquard, Marni\'s asymmetric top is artfully cut along the bias for an oversize architectural silhouette.',49.99,'images/women/2_big.jpg','Fashionista Top'),(8,'WOMEN','Calvin Klein Sleeveless Round-Neck Top',300,0,'images/women/3_small.jpg','red',6,'Pair Calvin Klein\'s sleeveless round-neck blouse with black trousers for a timeless look at the office or an evening out!',19.99,'images/women/3_big.jpg','Fashionista Top'),(9,'WOMEN','Smart Casual Work Spring Summer',500,0,'images/women/4_small.jpg','red',7,'Ladies High Low Fishtail Sleeveless Skater Dress Womens Peplum Top',29.99,'images/women/4_big.jpg','Fashionista Top'),(10,'WOMEN','Spell Chic Navy Blue Pencil Skirt',1000,0,'images/women/5_small.jpg','blue',8,'This tailored pencil skirt features a wide waistband with matching removable skinny belt. Concealed zip closure and seam split on reverse make for a comfy fit. Fully lined.',9.99,'images/women/5_big.jpg','Fashionista Skirt');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_cart`
--

DROP TABLE IF EXISTS `shopping_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shopping_cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `totalItems` int(11) NOT NULL DEFAULT '1',
  `user_id` int(11) NOT NULL,
  `is_shipped` varchar(1) DEFAULT 'N',
  `total_price` decimal(7,2) DEFAULT NULL,
  `complete_transaction` varchar(1) NOT NULL DEFAULT 'N',
  `modified_color` varchar(45) DEFAULT NULL,
  `order_date` datetime NOT NULL,
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_cart`
--

LOCK TABLES `shopping_cart` WRITE;
/*!40000 ALTER TABLE `shopping_cart` DISABLE KEYS */;
INSERT INTO `shopping_cart` VALUES (2,8,1,1,'N',19.99,'Y',NULL,'2015-05-05 17:08:14'),(4,2,1,1,'N',12.99,'Y',NULL,'2015-05-05 19:29:28'),(5,1,1,1,'N',18.99,'Y',NULL,'2015-05-05 19:29:28'),(7,7,1,1,'N',49.99,'Y',NULL,'2015-05-05 21:06:04'),(8,1,1,1,'N',18.99,'Y',NULL,'2015-05-05 21:06:05');
/*!40000 ALTER TABLE `shopping_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userlog`
--

DROP TABLE IF EXISTS `userlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userlog` (
  `Id` int(11) NOT NULL DEFAULT '1',
  `username` varchar(45) NOT NULL,
  `fname` varchar(30) NOT NULL DEFAULT '',
  `lname` varchar(30) NOT NULL DEFAULT '',
  `email` varchar(30) NOT NULL DEFAULT '',
  `password` varchar(60) NOT NULL,
  `enabled` char(1) NOT NULL DEFAULT 'Y',
  `lastlogin` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userlog`
--

LOCK TABLES `userlog` WRITE;
/*!40000 ALTER TABLE `userlog` DISABLE KEYS */;
INSERT INTO `userlog` VALUES (1,'hetal','Hetal','Ashar','hetzashar@gmail.com','Hetal1','Y','2015-05-05 20:46:51');
/*!40000 ALTER TABLE `userlog` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-05 22:24:26
