-- MySQL dump 10.13  Distrib 5.1.47, for redhat-linux-gnu (i386)
--
-- Host: mag-sol.com    Database: literature
-- ------------------------------------------------------
-- Server version	5.0.77

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
-- Not dumping tablespaces as no INFORMATION_SCHEMA.FILES table on this server
--

--
-- Table structure for table `actor`
--

DROP TABLE IF EXISTS `actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actor` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `born` date default NULL,
  `died` date default NULL,
  `imdb` char(15) default NULL,
  PRIMARY KEY  (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor`
--

LOCK TABLES `actor` WRITE;
/*!40000 ALTER TABLE `actor` DISABLE KEYS */;
INSERT INTO `actor` VALUES (1,'Jennifer Ehle','1969-12-29','0000-00-00','nm0000383'),(2,'Colin Firth','1960-09-10','0000-00-00','nm0000147');
/*!40000 ALTER TABLE `actor` ENABLE KEYS */;
UNLOCK TABLES;

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
  PRIMARY KEY  (`actor`,`production`,`fictional_character`),
  KEY `production` (`production`),
  KEY `fictional_character` (`fictional_character`),
  CONSTRAINT `actor_role_ibfk_1` FOREIGN KEY (`actor`) REFERENCES `actor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `actor_role_ibfk_2` FOREIGN KEY (`production`) REFERENCES `production` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `actor_role_ibfk_3` FOREIGN KEY (`fictional_character`) REFERENCES `fictional_character` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor_role`
--

LOCK TABLES `actor_role` WRITE;
/*!40000 ALTER TABLE `actor_role` DISABLE KEYS */;
INSERT INTO `actor_role` VALUES (1,1,1),(2,1,2);
/*!40000 ALTER TABLE `actor_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `born` date default NULL,
  `died` date default NULL,
  `imdb` char(15) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'Charles Dickens','1812-02-07','1870-06-09','nm0002042'),(2,'Jane Austen','1775-12-16','1817-07-18','nm0000807'),(3,'William Shakespeare','1564-04-26','1616-04-23','nm0000636');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author_work`
--

DROP TABLE IF EXISTS `author_work`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author_work` (
  `author` int(11) NOT NULL,
  `work` int(11) NOT NULL,
  PRIMARY KEY  (`author`,`work`),
  KEY `work` (`work`),
  CONSTRAINT `author_work_ibfk_1` FOREIGN KEY (`author`) REFERENCES `author` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `author_work_ibfk_2` FOREIGN KEY (`work`) REFERENCES `work` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_work`
--

LOCK TABLES `author_work` WRITE;
/*!40000 ALTER TABLE `author_work` DISABLE KEYS */;
INSERT INTO `author_work` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,20),(2,21),(2,22),(2,23),(2,24),(2,25),(2,26),(3,27),(3,28),(3,29),(3,30),(3,31),(3,32),(3,33),(3,34),(3,35),(3,36),(3,37),(3,38),(3,39),(3,40),(3,41),(3,42),(3,43),(3,44),(3,45),(3,46),(3,47),(3,48),(3,49),(3,50),(3,51),(3,52),(3,53),(3,54),(3,55),(3,56),(3,57),(3,58),(3,59),(3,60),(3,61),(3,62);
/*!40000 ALTER TABLE `author_work` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character`
--

DROP TABLE IF EXISTS `character`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character`
--

LOCK TABLES `character` WRITE;
/*!40000 ALTER TABLE `character` DISABLE KEYS */;
/*!40000 ALTER TABLE `character` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_appearance`
--

DROP TABLE IF EXISTS `character_appearance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_appearance` (
  `character` int(11) NOT NULL,
  `work` int(11) NOT NULL,
  PRIMARY KEY  (`character`,`work`),
  KEY `work` (`work`),
  CONSTRAINT `character_appearance_ibfk_1` FOREIGN KEY (`character`) REFERENCES `character` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `character_appearance_ibfk_2` FOREIGN KEY (`work`) REFERENCES `work` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_appearance`
--

LOCK TABLES `character_appearance` WRITE;
/*!40000 ALTER TABLE `character_appearance` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_appearance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fictional_character`
--

DROP TABLE IF EXISTS `fictional_character`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fictional_character` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fictional_character`
--

LOCK TABLES `fictional_character` WRITE;
/*!40000 ALTER TABLE `fictional_character` DISABLE KEYS */;
INSERT INTO `fictional_character` VALUES (1,'Elizabeth Bennet'),(2,'FitzWilliam D\'Arcy');
/*!40000 ALTER TABLE `fictional_character` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fictional_character_appearance`
--

DROP TABLE IF EXISTS `fictional_character_appearance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fictional_character_appearance` (
  `fictional_character` int(11) NOT NULL,
  `work` int(11) NOT NULL,
  PRIMARY KEY  (`fictional_character`,`work`),
  KEY `work` (`work`),
  CONSTRAINT `fictional_character_appearance_ibfk_1` FOREIGN KEY (`fictional_character`) REFERENCES `fictional_character` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fictional_character_appearance_ibfk_2` FOREIGN KEY (`work`) REFERENCES `work` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fictional_character_appearance`
--

LOCK TABLES `fictional_character_appearance` WRITE;
/*!40000 ALTER TABLE `fictional_character_appearance` DISABLE KEYS */;
INSERT INTO `fictional_character_appearance` VALUES (1,22),(2,22);
/*!40000 ALTER TABLE `fictional_character_appearance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `production`
--

DROP TABLE IF EXISTS `production`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `production` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `work` int(11) NOT NULL,
  `year` year(4) default NULL,
  `made_by` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `work` (`work`),
  CONSTRAINT `production_ibfk_1` FOREIGN KEY (`work`) REFERENCES `work` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `production`
--

LOCK TABLES `production` WRITE;
/*!40000 ALTER TABLE `production` DISABLE KEYS */;
INSERT INTO `production` VALUES (1,'Pride and Prejudice',22,1995,'BBC');
/*!40000 ALTER TABLE `production` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work`
--

DROP TABLE IF EXISTS `work`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) NOT NULL,
  `published` date default NULL,
  PRIMARY KEY  (`id`),
  KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work`
--

LOCK TABLES `work` WRITE;
/*!40000 ALTER TABLE `work` DISABLE KEYS */;
INSERT INTO `work` VALUES (1,'The Pickwick Papers','1836-03-31'),(2,'The Adventures of Oliver Twist','1837-02-28'),(3,'The Life and Adventures of Nicholas Nickleby','1838-04-30'),(4,'The Old Curiosity Shop','1840-04-25'),(5,'Barnaby Rudge','1841-02-13'),(6,'A Christmas Carol','1843-12-19'),(7,'The Chimes','1844-12-01'),(8,'The Cricket on the Hearth','1845-12-20'),(9,'The Battle of Life','1846-12-01'),(10,'The Haunted Man and the Ghost\'s Bargain','1848-12-19'),(11,'The Life and Adventures of Martin Chuzzlewit','1843-01-01'),(12,'Dombey and Son','1846-10-01'),(13,'David Copperfield','1849-05-01'),(14,'Bleak House','1852-03-01'),(15,'Hard Times','1854-04-01'),(16,'Little Dorrit','1855-12-01'),(17,'A Tale of Two Cities','1859-04-30'),(18,'Great Expectations','1860-12-01'),(19,'Our Mutual Friend','1864-05-01'),(20,'The Mystery of Edwin Drood','1870-04-01'),(21,'Sense and Sensibility','1811-01-01'),(22,'Pride and Prejudice','1813-01-28'),(23,'Mansfield Park','1814-07-01'),(24,'Emma','1815-12-01'),(25,'Northanger Abbey','1817-12-01'),(26,'Persuasion','1818-01-01'),(27,'Henry VI Part I',NULL),(28,'Henry VI Part II',NULL),(29,'Henry VI Part III',NULL),(30,'Richard III',NULL),(31,'The Comedy of Errors',NULL),(32,'Titus Andronicus',NULL),(33,'The Taming of the Shrew',NULL),(34,'The Two Gentlemen of Verona',NULL),(35,'Love\'s Labour\'s Lost',NULL),(36,'Romeo and Juliet',NULL),(37,'Richard II',NULL),(38,'A Midsummers Night\'s Dream',NULL),(39,'King John',NULL),(40,'The Merchant of Venice',NULL),(41,'Henry IV Part I',NULL),(42,'Henry IV Part II',NULL),(43,'Henry V',NULL),(44,'Julius Caesar',NULL),(45,'Much Ado About Nothing',NULL),(46,'As You Like It',NULL),(47,'The  Merry Wives of Windsor',NULL),(48,'Hamlet',NULL),(49,'Twelfth Night',NULL),(50,'Troilus and Cressida',NULL),(51,'All\'s Well That Ends Well',NULL),(52,'Othello',NULL),(53,'King Lear',NULL),(54,'Macbeth',NULL),(55,'Measure for Measure',NULL),(56,'Antony and Cleopatra',NULL),(57,'Coriolanus',NULL),(58,'Timon of Athens',NULL),(59,'Pericles Prince of Tyre',NULL),(60,'Cymberline',NULL),(61,'The Winter\'s Tales',NULL),(62,'The Tempest',NULL);
/*!40000 ALTER TABLE `work` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-09-10 20:22:54
