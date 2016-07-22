CREATE DATABASE  IF NOT EXISTS `quotes` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `quotes`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: quotes
-- ------------------------------------------------------
-- Server version	5.7.9

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
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `quote_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_favorites_users1_idx` (`user_id`),
  KEY `fk_favorites_quotes1_idx` (`quote_id`),
  CONSTRAINT `fk_favorites_quotes1` FOREIGN KEY (`quote_id`) REFERENCES `quotes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_favorites_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
INSERT INTO `favorites` VALUES (3,'2016-07-22 12:06:24','2016-07-22 12:06:24',2,3),(4,'2016-07-22 12:06:28','2016-07-22 12:06:28',2,1),(5,'2016-07-22 12:08:05','2016-07-22 12:08:05',3,2),(6,'2016-07-22 12:15:55','2016-07-22 12:15:55',4,4),(7,'2016-07-22 12:16:00','2016-07-22 12:16:00',4,3),(8,'2016-07-22 12:19:18','2016-07-22 12:19:18',5,1),(9,'2016-07-22 12:19:21','2016-07-22 12:19:21',5,4);
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quotes`
--

DROP TABLE IF EXISTS `quotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quote` varchar(255) DEFAULT NULL,
  `author` varchar(45) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_quotes_users_idx` (`user_id`),
  CONSTRAINT `fk_quotes_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quotes`
--

LOCK TABLES `quotes` WRITE;
/*!40000 ALTER TABLE `quotes` DISABLE KEYS */;
INSERT INTO `quotes` VALUES (1,'Do not go where the path may lead, go instead where there is no path and leave a trail.','Ralph Waldo Emerson',1,'2016-07-22 10:31:37','2016-07-22 10:31:37'),(2,'Experience is not what happens to you, it\'s what you do with what happens to you.','Aldous Huxley',1,'2016-07-22 10:42:05','2016-07-22 10:42:05'),(3,'The pessimist complains about the wind; the optimist expects it to change; the realist adjusts the sails.','William Arthur Ward',2,'2016-07-22 12:06:12','2016-07-22 12:06:12'),(4,'If you talk to a man in a language he understands, that goes to his head. If you talk to him in his language, that goes to his heart.','Nelson Mandela',2,'2016-07-22 12:07:07','2016-07-22 12:07:07'),(5,'A man must be big enough to admit his mistakes, smart enough to profit from them, and strong enough to correct them.','John C. Maxwell',4,'2016-07-22 12:15:49','2016-07-22 12:15:49'),(6,'If you don\'t like something, change it. If you can\'t change it, change your attitude.','Maya Angelou',5,'2016-07-22 12:18:33','2016-07-22 12:18:33'),(7,'Do not dwell in the past, do not dream of the future, concentrate the mind on the present moment.','Buddha',6,'2016-07-22 12:22:08','2016-07-22 12:22:08'),(8,'Life isn\'t about finding yourself. Life is about creating yourself.','George Bernard Shaw',6,'2016-07-22 12:22:52','2016-07-22 12:22:52'),(9,'We do not remember days, we remember moments.','Cesare Pavese',7,'2016-07-22 12:24:22','2016-07-22 12:24:22'),(10,'Very little is needed to make a happy life; it is all within yourself, in your way of thinking.','Marcus Aurelius',8,'2016-07-22 12:25:57','2016-07-22 12:25:57'),(11,'In the end, it\'s not the years in your life that count. It\'s the life in your years.','Abraham Lincoln',9,'2016-07-22 12:27:57','2016-07-22 12:27:57'),(12,'The truth is you don\'t know what is going to happen tomorrow. Life is a crazy ride, and nothing is guaranteed.','Eminem',10,'2016-07-22 12:29:25','2016-07-22 12:29:25');
/*!40000 ALTER TABLE `quotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `alias` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `pw_hash` varchar(255) DEFAULT NULL,
  `dob` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Santa Claus','Santa','santa@claus.com','$2b$12$TcCGMYO.8I2bSSqUsYVyXOH9pk5KNRPcNZsI5QhkYSLiqRmzjIV2a','05/14/2008','2016-07-22 10:31:19','2016-07-22 10:31:19'),(2,'Justin Bieber','Justin','justin@bieber.com','$2b$12$LomhjrMXVJlkp7m4yKQtN.tp2tvsAG9dxoK2aqGt5k1jsH2VpHOdm','02/10/1992','2016-07-22 12:05:01','2016-07-22 12:05:01'),(3,'Harry Potter','The Chosen One','harry@potter.com','$2b$12$ZYQl0dV2sBbySzAJUPQ5p.IvfZy7Jwp5vWdfbYGS2V0f02No1XW22','07/31/1990','2016-07-22 12:08:01','2016-07-22 12:08:01'),(4,'Beyonce Knowles','Beyonce','beyonce@knowles.com','$2b$12$QwG.92dBkqY8SU4T2PY4cuMFWONsIrzTJgbZWjS2xIyxl30rAa1bG','10/10/1980','2016-07-22 12:15:12','2016-07-22 12:15:12'),(5,'Maya Angelou','Maya','maya@angelou.com','$2b$12$Ex2PTDIyPq6ZO8/KYjEgUO2KQTEfHRq/q/iug7cVBWmChZ1e1tSYG','03/20/1950','2016-07-22 12:17:29','2016-07-22 12:17:29'),(6,'Robin Williams','Robin','robin@williams.com','$2b$12$UARQsJdpanGZN7GIJ1b66ONljFEsJGlHOYlOyv0LM5G1FfSuzHNaG','07/21/1951','2016-07-22 12:20:31','2016-07-22 12:20:31'),(7,'Barack Obama','The President','barack@obama.com','$2b$12$BgPd4ij8Z4yO.8LN4qFbKu6tmcxQop8KrJMOdZM1TrEOnSVGJ1S1G','08/04/1961','2016-07-22 12:23:57','2016-07-22 12:23:57'),(8,'Elvis Presley','Elvis','elvis@presley.com','$2b$12$Vo1ShQyCDS3EVLY.3f2Ip.OtBmzla6LRw0ypjGzdVxJMK/n2Fxivq','01/08/1935','2016-07-22 12:25:27','2016-07-22 12:25:27'),(9,'Abraham Lincoln','The Vampire Hunter','abraham@lincoln.com','$2b$12$V5jDlDL1uom3jK5avz/qGOVOI9K6a/NgKIrEjj864hFktPpAldXqi','02/12/1809','2016-07-22 12:27:26','2016-07-22 12:27:26'),(10,'Bob Dylan','Bobby','bob@dylan.com','$2b$12$PGYyAxIv3REVjyAq6Gps..hDkYSuUi5ksQidp.1ifiQ6qQOLBlQVe','05/24/1941','2016-07-22 12:28:43','2016-07-22 12:28:43');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-22 12:34:16
