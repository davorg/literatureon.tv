-- MySQL dump 10.15  Distrib 10.0.21-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: literature
-- ------------------------------------------------------
-- Server version	10.0.21-MariaDB

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
-- Table structure for table `actor`
--

DROP TABLE IF EXISTS `actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `born` datetime DEFAULT NULL,
  `died` datetime DEFAULT NULL,
  `imdb` char(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `actor_role`
--

DROP TABLE IF EXISTS `actor_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actor_role` (
  `actor` int(11) NOT NULL,
  `production` int(11) NOT NULL,
  `fictional_character` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`actor`,`production`,`fictional_character`),
  KEY `production` (`production`),
  KEY `fictional_character` (`fictional_character`),
  CONSTRAINT `actor_role_ibfk_1` FOREIGN KEY (`actor`) REFERENCES `actor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `actor_role_ibfk_2` FOREIGN KEY (`production`) REFERENCES `production` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `actor_role_ibfk_3` FOREIGN KEY (`fictional_character`) REFERENCES `fictional_character` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `born` datetime DEFAULT NULL,
  `died` datetime DEFAULT NULL,
  `imdb` char(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `author_work`
--

DROP TABLE IF EXISTS `author_work`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author_work` (
  `author` int(11) NOT NULL,
  `work` int(11) NOT NULL,
  PRIMARY KEY (`author`,`work`),
  KEY `work` (`work`),
  CONSTRAINT `author_work_ibfk_1` FOREIGN KEY (`author`) REFERENCES `author` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `author_work_ibfk_2` FOREIGN KEY (`work`) REFERENCES `work` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fictional_character`
--

DROP TABLE IF EXISTS `fictional_character`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fictional_character` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fictional_character_appearance`
--

DROP TABLE IF EXISTS `fictional_character_appearance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fictional_character_appearance` (
  `fictional_character` int(11) NOT NULL,
  `work` int(11) NOT NULL,
  PRIMARY KEY (`fictional_character`,`work`),
  KEY `work` (`work`),
  CONSTRAINT `fictional_character_appearance_ibfk_1` FOREIGN KEY (`fictional_character`) REFERENCES `fictional_character` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fictional_character_appearance_ibfk_2` FOREIGN KEY (`work`) REFERENCES `work` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `production`
--

DROP TABLE IF EXISTS `production`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `production` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `work` int(11) NOT NULL,
  `year` year(4) DEFAULT NULL,
  `made_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `work` (`work`),
  CONSTRAINT `production_ibfk_1` FOREIGN KEY (`work`) REFERENCES `work` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `production_product`
--

DROP TABLE IF EXISTS `production_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `production_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `production_id` int(11) NOT NULL,
  `asin` char(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `production_id` (`production_id`),
  CONSTRAINT `production_product_ibfk_1` FOREIGN KEY (`production_id`) REFERENCES `production` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `work`
--

DROP TABLE IF EXISTS `work`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `published` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `work_product`
--

DROP TABLE IF EXISTS `work_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `work_id` int(11) NOT NULL,
  `asin` char(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `work_id` (`work_id`),
  CONSTRAINT `work_product_ibfk_1` FOREIGN KEY (`work_id`) REFERENCES `work` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-02 13:27:31
