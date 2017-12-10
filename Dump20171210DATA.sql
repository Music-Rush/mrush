CREATE DATABASE  IF NOT EXISTS `mrush` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mrush`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: lara.com    Database: mrush
-- ------------------------------------------------------
-- Server version	5.7.11

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
-- Table structure for table `account_type`
--

DROP TABLE IF EXISTS `account_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_type`
--

LOCK TABLES `account_type` WRITE;
/*!40000 ALTER TABLE `account_type` DISABLE KEYS */;
INSERT INTO `account_type` VALUES (1,'regular'),(2,'premium');
/*!40000 ALTER TABLE `account_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `album_types`
--

DROP TABLE IF EXISTS `album_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `album_types` (
  `album_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL,
  PRIMARY KEY (`album_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album_types`
--

LOCK TABLES `album_types` WRITE;
/*!40000 ALTER TABLE `album_types` DISABLE KEYS */;
INSERT INTO `album_types` VALUES (1,'studio'),(2,'concert');
/*!40000 ALTER TABLE `album_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS `albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `albums` (
  `album_id` int(11) NOT NULL AUTO_INCREMENT,
  `album_name` varchar(128) NOT NULL,
  `album_photo` varchar(128) DEFAULT 'album-nophoto.png',
  `album_year` int(5) DEFAULT '2017',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL,
  `album_type` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`album_id`),
  KEY `album_name` (`album_name`),
  KEY `album_type_inx` (`album_type`),
  CONSTRAINT `fk_album_type` FOREIGN KEY (`album_type`) REFERENCES `album_types` (`album_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums`
--

LOCK TABLES `albums` WRITE;
/*!40000 ALTER TABLE `albums` DISABLE KEYS */;
INSERT INTO `albums` VALUES (6,'Лимб','5a2d176b36e2e.jpg',2015,'2017-12-10 08:18:46','2017-12-10 11:45:45',1),(7,'Почтальон снов','97276991.jpg',2017,'2017-12-10 08:44:53','2017-12-10 08:44:53',1);
/*!40000 ALTER TABLE `albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `albums_in_artists`
--

DROP TABLE IF EXISTS `albums_in_artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `albums_in_artists` (
  `album_in_artist_id` int(11) NOT NULL AUTO_INCREMENT,
  `album_id` int(11) NOT NULL,
  `artist_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`album_in_artist_id`),
  KEY `album_id` (`album_id`),
  KEY `artist_id` (`artist_id`),
  CONSTRAINT `fk_album_id_artists` FOREIGN KEY (`album_id`) REFERENCES `albums` (`album_id`),
  CONSTRAINT `fk_artist_id_albums` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`artist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums_in_artists`
--

LOCK TABLES `albums_in_artists` WRITE;
/*!40000 ALTER TABLE `albums_in_artists` DISABLE KEYS */;
INSERT INTO `albums_in_artists` VALUES (3,6,10,'2017-12-10 08:18:46','2017-12-10 08:18:46'),(4,7,23,'2017-12-10 08:44:53','2017-12-10 08:44:53');
/*!40000 ALTER TABLE `albums_in_artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `albums_in_users`
--

DROP TABLE IF EXISTS `albums_in_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `albums_in_users` (
  `album_in_user_id` int(11) NOT NULL AUTO_INCREMENT,
  `album_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`album_in_user_id`),
  KEY `album_id_indx` (`album_id`) USING BTREE,
  KEY `user_id_indx` (`user_id`),
  CONSTRAINT `fk_aiu_album_id` FOREIGN KEY (`album_id`) REFERENCES `albums` (`album_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_aiu_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums_in_users`
--

LOCK TABLES `albums_in_users` WRITE;
/*!40000 ALTER TABLE `albums_in_users` DISABLE KEYS */;
INSERT INTO `albums_in_users` VALUES (3,6,1,'2017-12-10 08:18:46','2017-12-10 08:18:46'),(4,7,2,'2017-12-10 08:44:53','2017-12-10 08:44:53'),(11,7,1,'2017-12-10 13:12:48','2017-12-10 13:12:48');
/*!40000 ALTER TABLE `albums_in_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artist_types`
--

DROP TABLE IF EXISTS `artist_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artist_types` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist_types`
--

LOCK TABLES `artist_types` WRITE;
/*!40000 ALTER TABLE `artist_types` DISABLE KEYS */;
INSERT INTO `artist_types` VALUES (1,'singer'),(2,'band');
/*!40000 ALTER TABLE `artist_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artists`
--

DROP TABLE IF EXISTS `artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artists` (
  `artist_id` int(11) NOT NULL AUTO_INCREMENT,
  `artist_name` varchar(128) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL,
  `country` int(11) DEFAULT NULL,
  `artist_type` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`artist_id`),
  KEY `artist_name` (`artist_name`),
  KEY `country_indx` (`country`),
  KEY `artist_type_indx` (`artist_type`),
  CONSTRAINT `fk_art_country` FOREIGN KEY (`country`) REFERENCES `countries` (`country_id`),
  CONSTRAINT `fk_artist_type` FOREIGN KEY (`artist_type`) REFERENCES `artist_types` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists`
--

LOCK TABLES `artists` WRITE;
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
INSERT INTO `artists` VALUES (1,'L\'One','2017-11-07 20:45:57','2017-12-10 13:25:22',1,1),(2,'George Michael','2017-11-07 20:45:57','2017-12-03 15:51:00',NULL,1),(3,'Fall Out Boy','2017-11-07 20:45:57','2017-12-10 13:25:52',6,2),(4,'Звери','2017-11-07 20:45:57','2017-12-10 13:26:00',1,2),(5,'Любэ','2017-11-07 20:45:57','2017-12-10 13:26:06',1,2),(6,'Jamiroquai','2017-11-07 20:45:57','2017-12-10 13:26:27',4,2),(7,'Пицца','2017-11-07 20:45:57','2017-12-10 13:27:13',1,2),(8,'Imagine Dragons','2017-11-07 20:45:57','2017-12-10 13:27:13',2,2),(9,'5\'nizza','2017-11-07 20:45:57','2017-12-10 13:27:13',7,2),(10,'ATL','2017-11-07 17:46:10','2017-12-10 13:27:13',1,1),(11,'Bumble Beezy & The Motrix','2017-11-08 17:01:50','2017-11-08 17:01:50',NULL,1),(12,'Unknown artist','2017-11-08 17:01:56','2017-11-08 17:01:56',NULL,1),(13,'Arctic Monkeys','2017-11-08 17:29:09','2017-12-10 13:27:13',2,1),(14,'Sleeping With Sirens','2017-11-08 17:29:09','2017-12-10 13:27:13',6,1),(15,'THE32ND','2017-11-08 17:29:09','2017-11-08 17:29:09',NULL,1),(16,'EFE','2017-11-10 16:10:17','2017-11-10 16:10:17',NULL,1),(17,'12','2017-11-21 15:02:12','2017-11-21 15:02:12',NULL,1),(18,'Artist','2017-11-25 11:03:40','2017-11-25 11:03:40',NULL,1),(19,'Unknoddddd','2017-11-25 11:06:16','2017-11-25 11:06:16',NULL,1),(20,'DEwd','2017-11-25 11:27:02','2017-11-25 11:27:02',NULL,1),(21,'AT1L','2017-11-25 11:29:30','2017-11-25 11:29:30',NULL,1),(22,'ATL2','2017-11-25 12:13:45','2017-11-25 12:13:45',NULL,1),(23,'Мэйти','2017-12-10 08:41:47','2017-12-10 13:27:13',1,1);
/*!40000 ALTER TABLE `artists` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER checkArtistName BEFORE INSERT ON `artists` FOR EACH ROW
BEGIN
	DECLARE artistId INT;
    set artistId = 0;
    
    SELECT `artist_id` INTO artistId FROM `mrush`.`artists` WHERE `artist_name` = NEW.`artist_name`;
    
    IF artistId != 0 THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Artist is exist';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `audit_logging`
--

DROP TABLE IF EXISTS `audit_logging`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit_logging` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `button_name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_logging`
--

LOCK TABLES `audit_logging` WRITE;
/*!40000 ALTER TABLE `audit_logging` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_logging` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_text` text NOT NULL,
  `created_at_user` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `create_at_user_indx` (`created_at_user`),
  CONSTRAINT `fk_created_at_user_id` FOREIGN KEY (`created_at_user`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (4,'HELLO!!!',1,'2017-12-10 08:32:48','2017-12-10 08:32:48'),(5,'hi',2,'2017-12-10 08:40:57','2017-12-10 08:40:57'),(6,'Type your comments',2,'2017-12-10 08:48:01','2017-12-10 08:48:01');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments_in_communities`
--

DROP TABLE IF EXISTS `comments_in_communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments_in_communities` (
  `comment_in_community_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) NOT NULL,
  `community_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`comment_in_community_id`),
  KEY `comment_id` (`comment_id`),
  KEY `community_id` (`community_id`),
  CONSTRAINT `fk_comment_id` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`comment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_community_comm_id` FOREIGN KEY (`community_id`) REFERENCES `communities` (`community_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments_in_communities`
--

LOCK TABLES `comments_in_communities` WRITE;
/*!40000 ALTER TABLE `comments_in_communities` DISABLE KEYS */;
INSERT INTO `comments_in_communities` VALUES (4,4,10,'2017-12-10 08:32:48','2017-12-10 08:32:48'),(5,5,10,'2017-12-10 08:40:57','2017-12-10 08:40:57'),(6,6,11,'2017-12-10 08:48:01','2017-12-10 08:48:01');
/*!40000 ALTER TABLE `comments_in_communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communities`
--

DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communities` (
  `community_id` int(11) NOT NULL AUTO_INCREMENT,
  `community_name` varchar(128) NOT NULL,
  `community_photo` varchar(128) DEFAULT 'communityPhoto.jpg',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at_user` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`community_id`),
  KEY `fk_communities_created_user_id` (`created_at_user`),
  KEY `fk_communities_genre_id` (`genre_id`),
  KEY `community_name` (`community_name`),
  CONSTRAINT `fk_communities_created_user_id` FOREIGN KEY (`created_at_user`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_communities_genre_id` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genre_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
INSERT INTO `communities` VALUES (10,'New Community','community_nophoto.jpg','2017-12-10 08:32:16',1,1,'2017-12-10 08:32:16'),(11,'Community 2','97276991.jpg','2017-12-10 08:47:39',2,6,'2017-12-10 08:47:39');
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(255) NOT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'Russia'),(2,'USA'),(3,'Belarus'),(4,'China'),(5,'Japan'),(6,'UK'),(7,'Ukraine');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_locations`
--

DROP TABLE IF EXISTS `event_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_locations` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `location_name` varchar(1024) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_locations`
--

LOCK TABLES `event_locations` WRITE;
/*!40000 ALTER TABLE `event_locations` DISABLE KEYS */;
INSERT INTO `event_locations` VALUES (1,'Re:Public','2017-12-10 10:10:59','2017-12-10 10:10:59'),(2,'Друзья','2017-12-10 10:11:38','2017-12-10 10:11:38'),(3,'КЗ Минск','2017-12-10 10:11:38','2017-12-10 10:11:38'),(4,'Шерлок кофе холл','2017-12-10 10:11:38','2017-12-10 10:11:38'),(5,'Coyote','2017-12-10 10:11:38','2017-12-10 10:11:38'),(6,'Белорусская государственная филармония','2017-12-10 10:11:38','2017-12-10 10:11:38'),(7,'Дворец культуры города Молодечно','2017-12-10 10:11:38','2017-12-10 10:11:38'),(8,'Doodah King','2017-12-10 10:11:38','2017-12-10 10:11:38'),(9,'Молодость','2017-12-10 10:11:38','2017-12-10 10:11:38'),(10,'Верхний город','2017-12-10 10:11:38','2017-12-10 10:11:38'),(11,'Национальный художественный музей','2017-12-10 10:11:38','2017-12-10 10:11:38'),(12,'Граффити','2017-12-10 10:11:38','2017-12-10 10:11:38'),(13,'Дворец профсоюзов','2017-12-10 10:21:10','2017-12-10 10:21:10'),(14,'Молодежный театр эстрады','2017-12-10 10:21:10','2017-12-10 10:21:10'),(15,'Клуб Брюгге','2017-12-10 10:21:10','2017-12-10 10:21:10'),(16,'Macho','2017-12-10 10:22:28','2017-12-10 10:22:28');
/*!40000 ALTER TABLE `event_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_name` varchar(1024) NOT NULL,
  `event_photo` varchar(512) NOT NULL,
  `event_time` varchar(255) NOT NULL,
  `event_location` int(11) NOT NULL,
  `event_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `event_url` varchar(512) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`event_id`),
  KEY `event_location_indx` (`event_location`),
  CONSTRAINT `fk_event_location` FOREIGN KEY (`event_location`) REFERENCES `event_locations` (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'Слава КПСС','https://img.afisha.tut.by/img/176x0ec/cover/0d/e/slava-kpss-93268-830046.jpg','в 20:00',1,'2017-12-10 13:11:38','https://afisha.tut.by/concert/slava-kpss/','2017-12-10 10:11:38','2017-12-10 10:11:38'),(2,'Живая музыка','https://img.afisha.tut.by/img/176x0ec/cover/01/3/zhivaya-muzyka-784540.jpg','в 22:00',2,'2017-12-10 13:11:38','https://afisha.tut.by/concert/zhivaya_muzyka_1404913086/','2017-12-10 10:11:38','2017-12-10 10:11:38'),(3,'Финал Международной лиги КВН','https://img.afisha.tut.by/img/176x0ec/cover/07/0/final-mezhdunarodnoy-ligi-kvn-784608.jpg','в 19:00',3,'2017-12-10 13:11:38','https://afisha.tut.by/concert/final_mezhdunarodnoy_ligi_kvn/','2017-12-10 10:11:38','2017-12-10 10:11:38'),(4,'Mgzavrebi ','https://img.afisha.tut.by/img/176x0ec/cover/10/7/mgzavrebi-230791.jpg','в 20:00',2,'2017-12-10 13:11:38','https://afisha.tut.by/concert/mgzavrebi/','2017-12-10 10:11:38','2017-12-10 10:11:38'),(5,'Живая музыка на красном рояле','https://img.afisha.tut.by/img/176x0ec/cover/08/0/zhivaya-muzyka-na-krasnom-royale-1490789.jpg','в 19:30',4,'2017-12-10 13:11:38','https://afisha.tut.by/concert/zhivaya_muzyka_na_krasnom_royale/','2017-12-10 10:11:38','2017-12-10 10:11:38'),(6,'Большой Белорусский Стендап','https://img.afisha.tut.by/img/176x0ec/cover/03/d/bolshoy-belorusskiy-stendap-2858776-5388498.jpg','в 20:00',5,'2017-12-10 13:11:38','https://afisha.tut.by/concert/bolshoybelorusskiystendap/','2017-12-10 10:11:38','2017-12-10 10:11:38'),(7,'Пусть будет добрым зимний вечер','https://img.afisha.tut.by/img/176x0ec/cover/05/c/pust-budet-dobrym-zimniy-vecher-667653.jpg','в 16:00',6,'2017-12-10 13:11:38','https://afisha.tut.by/concert/pust-budet-dobrym-zimniy-vecher/','2017-12-10 10:11:38','2017-12-10 10:11:38'),(8,'Слава','https://img.afisha.tut.by/img/176x0ec/cover/06/b/slava-9006218.jpg','в 18:00',7,'2017-12-10 13:11:38','https://afisha.tut.by/concert/slava/','2017-12-10 10:11:38','2017-12-10 10:11:38'),(9,'Новая Беларуская Цёмная Хваля','https://img.afisha.tut.by/img/176x0ec/cover/00/b/novaya-belaruskaya-cemnaya-khvalya-392743.jpg','в 19:00',8,'2017-12-10 13:11:38','https://afisha.tut.by/concert/novaya-belaruskaya-cemnaya-khvalya-2/','2017-12-10 10:11:38','2017-12-10 10:11:38'),(10,'Ко дню рождения Максима Богдановича: премьера цикла песен В.Мулявина \"Венок\"','https://img.afisha.tut.by/img/176x0ec/cover/0e/f/ko-dnyu-rozhdeniya-maksima-bogdanovicha-premera-cikla-pesen-v-mulyavina-venok-357708-753872.jpg','в 19:00',6,'2017-12-10 13:11:38','https://afisha.tut.by/concert/ko-dnyu-rozhdeniya-maksima-bogdanovicha-premera-cikla-pesen-v-mulyavina-venok/','2017-12-10 10:11:38','2017-12-10 10:11:38'),(11,'Спасибо','https://img.afisha.tut.by/img/176x0ec/cover/08/8/spasibo-30796.jpg','в 20:00',9,'2017-12-10 13:11:38','https://afisha.tut.by/concert/spasibo/','2017-12-10 10:11:38','2017-12-10 10:11:38'),(12,'Фортепианный вечер Екатерины Фабишевской','https://img.afisha.tut.by/img/176x0ec/cover/08/6/ekaterina-fabishevskaya-015915.jpg','в 18:00',10,'2017-12-10 13:11:38','https://afisha.tut.by/concert/ekaterina-fabishevskaya/','2017-12-10 10:11:38','2017-12-10 10:11:38'),(13,'Музыкальный проект \"Bon Voyage\" с программой Зимняя рапсодия','https://img.afisha.tut.by/img/176x0ec/cover/09/7/bon-voyage-434566.jpg','в 19:00',11,'2017-12-10 13:11:38','https://afisha.tut.by/concert/muzykalnyy-proekt-bon-voyage-s-programmoy-zimnyaya-rapsodiya/','2017-12-10 10:11:38','2017-12-10 10:11:38'),(14,'Тимофей Яровиков','https://img.afisha.tut.by/img/176x0ec/cover/0a/a/timofey-yarovikov-6911356.jpg','в 19:00',12,'2017-12-10 13:11:38','https://afisha.tut.by/concert/timofey_yarovikov/','2017-12-10 10:11:38','2017-12-10 10:11:38'),(15,'Ах Астахова ','https://img.afisha.tut.by/img/176x0ec/cover/05/c/akh-astakhova-344836.jpg','в 19:00',13,'2017-12-11 10:21:10','https://afisha.tut.by/concert/akh_astakhova/','2017-12-10 10:21:10','2017-12-10 10:21:10'),(16,'Благотворительный марафон \"Все краски жизни для тебя\"','https://img.afisha.tut.by/img/176x0ec/cover/00/b/blagotvoritelnyy-marafon-vse-kraski-zhizni-dlya-tebya-474884.jpg','в 19:00',14,'2017-12-11 10:21:10','https://afisha.tut.by/concert/blagotvoritelnyy_marafon_vse_kraski_zhizni_dlya_tebya/','2017-12-10 10:21:10','2017-12-10 10:21:10'),(17,'Flatfoot 56','https://img.afisha.tut.by/img/176x0ec/cover/04/1/flatfoot-56-4975895.jpg','в 19:00',15,'2017-12-11 10:21:10','https://afisha.tut.by/concert/flatfoot-56/','2017-12-10 10:21:10','2017-12-10 10:21:10'),(18,'Струнный оркестр “Метаморфоза” ','https://img.afisha.tut.by/img/176x0ec/cover/0e/5/strunnyy-orkestr-metamorfoza-947171.jpg','в 19:00',13,'2017-12-12 10:22:27','https://afisha.tut.by/concert/strunnyy_orkestr_metamorfoza/','2017-12-10 10:22:27','2017-12-10 10:22:27'),(19,'Табе, Беларусь, песня наша','https://img.afisha.tut.by/img/176x0ec/cover/08/1/tabe-belarus-pesnya-nasha-081650.jpg','в 19:00',6,'2017-12-12 10:22:27','https://afisha.tut.by/concert/tabe-belarus-pesnya-nasha/','2017-12-10 10:22:28','2017-12-10 10:22:28'),(20,'Прэмія \"Героі году-2017\"','https://img.afisha.tut.by/img/176x0ec/cover/01/e/premiya-geroi-godu-2017-9615331-828250.jpg','в 19:00',16,'2017-12-12 10:22:27','https://afisha.tut.by/concert/premiya_geroi_godu/','2017-12-10 10:22:28','2017-12-10 10:22:28'),(21,'Мне снятся сны о Беларуси: поэтический моноспектакль по произведениям Янки Купалы','https://img.afisha.tut.by/img/176x0ec/cover/0d/d/mne-snyatsya-sny-o-belarusi-poeticheskiy-monospektakl-po-proizvedeniyam-yanki-kupaly-perenos-452601.jpg','в 19:00',6,'2017-12-12 10:22:27','https://afisha.tut.by/concert/mne-snyatsya-sny-o-belarusi-poeticheskiy-monospektakl-po-proizvedeniyam-yanki-kupaly/','2017-12-10 10:22:28','2017-12-10 10:22:28'),(22,'Дрымон','https://img.afisha.tut.by/img/176x0ec/cover/00/9/drymon-706667-896235.jpg','в 20:00',8,'2017-12-12 10:22:27','https://afisha.tut.by/concert/drymon_i_rok_karaoke/','2017-12-10 10:22:28','2017-12-10 10:22:28'),(23,'Блюзовый вечер с Eightandout','https://img.afisha.tut.by/img/176x0ec/cover/00/6/blyuzovyy-vecher-s-eightandout-365682.jpg','в 22:00',8,'2017-12-12 10:22:27','https://afisha.tut.by/concert/eightandout/','2017-12-10 10:22:28','2017-12-10 10:22:28');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genres` (
  `genre_id` int(11) NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(128) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`genre_id`),
  KEY `genre_name` (`genre_name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'Rock','2017-11-07 14:14:18','0000-00-00 00:00:00'),(2,'Pop','2017-11-07 14:14:18','0000-00-00 00:00:00'),(5,'Hip-Hop','2017-11-07 17:59:09','2017-11-07 17:59:09'),(6,'Other','2017-11-08 16:59:27','2017-11-08 16:59:27'),(7,'Rap','2017-11-08 17:01:50','2017-11-08 17:01:50'),(8,'Witch House','2017-11-08 17:29:09','2017-11-08 17:29:09'),(11,'Rusrap','2017-12-10 08:41:48','2017-12-10 08:41:48');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER checkGenreName BEFORE INSERT ON `genres` FOR EACH ROW
BEGIN
	DECLARE genreId INT;
    set genreId = 0;
    
    SELECT `genre_id` INTO genreId FROM `mrush`.`genres` WHERE `genre_name` = NEW.`genre_name`;
    
    IF genreId != 0 THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Genre is exist';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `like_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `track_id` int(11) NOT NULL,
  PRIMARY KEY (`like_id`),
  KEY `user_id_indx` (`user_id`),
  KEY `track_id_indx` (`track_id`),
  CONSTRAINT `fk_like_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `fk_lise_track_id` FOREIGN KEY (`track_id`) REFERENCES `tracks` (`track_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,1,31),(2,1,33),(3,2,29),(4,2,27),(5,1,40),(6,1,43),(7,2,40),(8,2,34),(9,2,52),(10,1,47);
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `music_news`
--

DROP TABLE IF EXISTS `music_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `music_news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `news_photo` varchar(255) NOT NULL,
  `news_url` varchar(255) NOT NULL,
  `news_title` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `news_creator` int(11) NOT NULL,
  PRIMARY KEY (`news_id`),
  KEY `news_creator_indx` (`news_creator`),
  CONSTRAINT `fk_news_creator` FOREIGN KEY (`news_creator`) REFERENCES `news_creators` (`creator_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `music_news`
--

LOCK TABLES `music_news` WRITE;
/*!40000 ALTER TABLE `music_news` DISABLE KEYS */;
INSERT INTO `music_news` VALUES (1,'5a2d11d11b81c.jpg','https://news.yandex.by/yandsearch?lr=157&cl4url=https%3A%2F%2Fgrodno24.com%2Fworld%2Fv-velikobritanii-pevca-krisa-ri-pryamo-s-koncerta-zabrali-v-bolnicu.html&lang=ru&stid=cwrLb5-MPg88fQiY9ekm&rubric=music&from=rubric','В Великобритании певца Криса Ри прямо с концерта забрали в больницу','2017-12-10 13:38:06',1),(2,'5a2d11d11b81c.jpg','http://www.mtv.com/news/3052121/camila-cabello-taylor-swift-jingle-ball/','CAMILA CABELLO TOTALLY LOST IT OVER TAYLOR SWIFT SINGING \'END GAME\'','2017-12-10 13:38:06',5),(3,'5a2d11d11b81c.jpg','http://www.nme.com/news/music/morrissey-cancels-gig-2170159','Morrissey has pulled out of another gig','2017-12-10 13:39:24',4),(4,'5a2d11d11b81c.jpg','http://www.music-news.com/news/UK/109743/Ed-Sheeran-is-Spotify-s-most-streamed-artist-of-2017','Ed Sheeran is Spotify\'s most streamed artist of 2017','2017-12-10 13:39:24',3);
/*!40000 ALTER TABLE `music_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_creators`
--

DROP TABLE IF EXISTS `news_creators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news_creators` (
  `creator_id` int(11) NOT NULL AUTO_INCREMENT,
  `creator_name` varchar(255) NOT NULL,
  PRIMARY KEY (`creator_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_creators`
--

LOCK TABLES `news_creators` WRITE;
/*!40000 ALTER TABLE `news_creators` DISABLE KEYS */;
INSERT INTO `news_creators` VALUES (1,'Yandex.ru'),(2,'NewsMuz.com'),(3,'music-news.com'),(4,'nme.com'),(5,'mtv.com');
/*!40000 ALTER TABLE `news_creators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlists`
--

DROP TABLE IF EXISTS `playlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playlists` (
  `playlist_id` int(11) NOT NULL AUTO_INCREMENT,
  `playlist_name` varchar(128) NOT NULL,
  `playlist_photo` varchar(128) DEFAULT 'playlistPhoto.jpg',
  `created_at_user` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`playlist_id`),
  KEY `fk_playlists_created_user_id` (`created_at_user`),
  CONSTRAINT `fk_playlists_created_user_id` FOREIGN KEY (`created_at_user`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlists`
--

LOCK TABLES `playlists` WRITE;
/*!40000 ALTER TABLE `playlists` DISABLE KEYS */;
INSERT INTO `playlists` VALUES (6,'New Community','community_nophoto.jpg',1,'2017-12-10 08:32:16','2017-12-10 08:32:16'),(7,'Community 2','97276991.jpg',2,'2017-12-10 08:47:39','2017-12-10 08:47:39'),(8,'Test playlist','playlistPhoto.jpg',1,'2017-12-10 13:43:59','2017-12-10 13:43:59'),(9,'Playlist 2','playlistPhoto.jpg',2,'2017-12-10 13:43:59','2017-12-10 13:43:59');
/*!40000 ALTER TABLE `playlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlists_in_communities`
--

DROP TABLE IF EXISTS `playlists_in_communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playlists_in_communities` (
  `playlist_in_community_id` int(11) NOT NULL AUTO_INCREMENT,
  `playlist_id` int(11) NOT NULL,
  `community_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`playlist_in_community_id`),
  KEY `playlist_id` (`playlist_id`),
  KEY `community_id` (`community_id`),
  CONSTRAINT `fk_community_id` FOREIGN KEY (`community_id`) REFERENCES `communities` (`community_id`),
  CONSTRAINT `fk_playlist_id` FOREIGN KEY (`playlist_id`) REFERENCES `playlists` (`playlist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlists_in_communities`
--

LOCK TABLES `playlists_in_communities` WRITE;
/*!40000 ALTER TABLE `playlists_in_communities` DISABLE KEYS */;
INSERT INTO `playlists_in_communities` VALUES (3,6,10,'2017-12-10 08:32:16','2017-12-10 08:32:16'),(4,7,11,'2017-12-10 08:47:39','2017-12-10 08:47:39');
/*!40000 ALTER TABLE `playlists_in_communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlists_in_users`
--

DROP TABLE IF EXISTS `playlists_in_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playlists_in_users` (
  `playlist_in_user_id` int(11) NOT NULL AUTO_INCREMENT,
  `playlist_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`playlist_in_user_id`),
  KEY `playlist_id_indx` (`playlist_id`),
  KEY `user_id_indx` (`user_id`),
  CONSTRAINT `fk_pl_user_pl` FOREIGN KEY (`playlist_id`) REFERENCES `playlists` (`playlist_id`),
  CONSTRAINT `fk_pl_user_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlists_in_users`
--

LOCK TABLES `playlists_in_users` WRITE;
/*!40000 ALTER TABLE `playlists_in_users` DISABLE KEYS */;
INSERT INTO `playlists_in_users` VALUES (1,8,1),(2,9,2),(3,6,2),(4,7,2);
/*!40000 ALTER TABLE `playlists_in_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracks`
--

DROP TABLE IF EXISTS `tracks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tracks` (
  `track_id` int(11) NOT NULL AUTO_INCREMENT,
  `track_name` varchar(128) NOT NULL,
  `track_photo` varchar(128) DEFAULT 'nophoto.jpg',
  `duration` varchar(10) NOT NULL,
  `is_copy` int(11) NOT NULL,
  `track_download_name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL,
  `created_at_user` int(11) NOT NULL,
  PRIMARY KEY (`track_id`),
  KEY `track_name` (`track_name`),
  KEY `created_at_user` (`created_at_user`),
  CONSTRAINT `fk_created_at_user` FOREIGN KEY (`created_at_user`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracks`
--

LOCK TABLES `tracks` WRITE;
/*!40000 ALTER TABLE `tracks` DISABLE KEYS */;
INSERT INTO `tracks` VALUES (27,'Священный Рэйв','5a2d172f6df99.jpg','3:19',0,'5a2d172f5cfad.mp3','2017-12-10 08:14:55','2017-12-10 08:14:55',1),(28,'Шаман','5a2d172fa2b4a.jpg','2:35',0,'5a2d172f9126b.mp3','2017-12-10 08:14:55','2017-12-10 08:14:55',1),(29,'В Унисон','5a2d172fb20e9.jpg','2:20',0,'5a2d172fa548f.mp3','2017-12-10 08:14:55','2017-12-10 08:14:55',1),(30,'Майк','5a2d172fc1287.jpg','2:26',0,'5a2d172fb468f.mp3','2017-12-10 08:14:55','2017-12-10 08:14:55',1),(31,'Архитектор','5a2d176b0130c.jpg','2:26',0,'5a2d176ae4df2.mp3','2017-12-10 08:15:55','2017-12-10 08:15:55',1),(32,'Вороний Грай','5a2d176b17066.jpg','3:00',0,'5a2d176b0b04d.mp3','2017-12-10 08:15:55','2017-12-10 08:15:55',1),(33,'Гори Ясно','5a2d176b36e2e.jpg','3:13',0,'5a2d176b29a75.mp3','2017-12-10 08:15:55','2017-12-10 08:15:55',1),(34,'1000','5a2d176b4e58d.jpg','3:36',0,'5a2d176b4060b.mp3','2017-12-10 08:15:55','2017-12-10 08:15:55',1),(35,'Обратно (Feat. Eecii McFly)','5a2d177553f35.jpg','3:43',0,'5a2d17753652f.mp3','2017-12-10 08:16:05','2017-12-10 08:16:05',1),(36,'Танцуйте','5a2d1775aa7a3.jpg','3:41',0,'5a2d177595277.mp3','2017-12-10 08:16:05','2017-12-10 08:16:05',1),(37,'Астронавт','5a2d1775b92ac.jpg','2:57',0,'5a2d1775acff6.mp3','2017-12-10 08:16:05','2017-12-10 08:17:03',1),(38,'Письмо','nophoto.jpg','2:46',0,'5a2d1d7b7af8e.mp3','2017-12-10 08:41:47','2017-12-10 08:41:47',2),(39,'Дарья Васильевна','nophoto.jpg','3:14',0,'5a2d1d7c27ff6.mp3','2017-12-10 08:41:48','2017-12-10 08:41:48',2),(40,'Остывший чай','nophoto.jpg','2:36',0,'5a2d1d7c38928.mp3','2017-12-10 08:41:48','2017-12-10 08:41:48',2),(41,'К роду отцов своих','nophoto.jpg','3:48',0,'5a2d1d7c7b7bc.mp3','2017-12-10 08:41:48','2017-12-10 08:41:48',2),(42,'Коллекционер','nophoto.jpg','2:12',0,'5a2d1d8bdcb39.mp3','2017-12-10 08:42:03','2017-12-10 08:42:03',2),(43,'Потому что нет','nophoto.jpg','4:15',0,'5a2d1d8c08fa2.mp3','2017-12-10 08:42:04','2017-12-10 08:42:04',2),(44,'Палата №22','nophoto.jpg','2:41',0,'5a2d1d8c0dcac.mp3','2017-12-10 08:42:04','2017-12-10 08:42:04',2),(45,'По следам Бунина','nophoto.jpg','2:51',0,'5a2d1d8c1332c.mp3','2017-12-10 08:42:04','2017-12-10 08:42:04',2),(46,'Запястья','nophoto.jpg','5:46',0,'5a2d1d96e620c.mp3','2017-12-10 08:42:14','2017-12-10 08:42:14',2),(47,'День из детства','nophoto.jpg','3:31',0,'5a2d1d96f04c4.mp3','2017-12-10 08:42:14','2017-12-10 08:42:14',2),(52,'Священный Рэйв','5a2d172f6df99.jpg','3:19',1,'5a2d172f5cfad.mp3','2017-12-10 09:20:57','2017-12-10 09:20:57',1),(54,'Письмо','nophoto.jpg','2:46',1,'5a2d1d7b7af8e.mp3','2017-12-10 12:33:10','2017-12-10 12:33:10',2),(55,'Письмо12','nophoto.jpg','2:46',1,'5a2d1d7b7af8e.mp3','2017-12-10 12:35:23','2017-12-10 12:35:46',2);
/*!40000 ALTER TABLE `tracks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracks_in_albums`
--

DROP TABLE IF EXISTS `tracks_in_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tracks_in_albums` (
  `track_in_album_id` int(11) NOT NULL AUTO_INCREMENT,
  `track_id` int(11) DEFAULT NULL,
  `album_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`track_in_album_id`),
  KEY `fk_track_in_albums_track_id` (`track_id`),
  KEY `fk_track_in_albums_album_id` (`album_id`),
  CONSTRAINT `fk_track_in_albums_album_id` FOREIGN KEY (`album_id`) REFERENCES `albums` (`album_id`),
  CONSTRAINT `fk_track_in_albums_track_id` FOREIGN KEY (`track_id`) REFERENCES `tracks` (`track_id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracks_in_albums`
--

LOCK TABLES `tracks_in_albums` WRITE;
/*!40000 ALTER TABLE `tracks_in_albums` DISABLE KEYS */;
INSERT INTO `tracks_in_albums` VALUES (18,46,7,'2017-12-10 08:44:53','2017-12-10 08:44:53'),(19,47,7,'2017-12-10 08:44:53','2017-12-10 08:44:53'),(20,42,7,'2017-12-10 08:44:53','2017-12-10 08:44:53'),(21,43,7,'2017-12-10 08:44:53','2017-12-10 08:44:53'),(22,44,7,'2017-12-10 08:44:53','2017-12-10 08:44:53'),(23,45,7,'2017-12-10 08:44:53','2017-12-10 08:44:53'),(24,38,7,'2017-12-10 08:44:53','2017-12-10 08:44:53'),(25,39,7,'2017-12-10 08:44:53','2017-12-10 08:44:53'),(26,40,7,'2017-12-10 08:44:53','2017-12-10 08:44:53'),(27,41,7,'2017-12-10 08:44:53','2017-12-10 08:44:53'),(106,27,6,'2017-12-10 11:45:45','2017-12-10 11:45:45'),(107,28,6,'2017-12-10 11:45:45','2017-12-10 11:45:45'),(108,29,6,'2017-12-10 11:45:45','2017-12-10 11:45:45'),(109,30,6,'2017-12-10 11:45:45','2017-12-10 11:45:45'),(110,31,6,'2017-12-10 11:45:45','2017-12-10 11:45:45'),(111,32,6,'2017-12-10 11:45:45','2017-12-10 11:45:45'),(112,33,6,'2017-12-10 11:45:45','2017-12-10 11:45:45'),(113,34,6,'2017-12-10 11:45:45','2017-12-10 11:45:45'),(114,35,6,'2017-12-10 11:45:45','2017-12-10 11:45:45'),(115,36,6,'2017-12-10 11:45:45','2017-12-10 11:45:45'),(116,37,6,'2017-12-10 11:45:45','2017-12-10 11:45:45');
/*!40000 ALTER TABLE `tracks_in_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracks_in_artists`
--

DROP TABLE IF EXISTS `tracks_in_artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tracks_in_artists` (
  `track_in_artist_id` int(11) NOT NULL AUTO_INCREMENT,
  `track_id` int(11) NOT NULL,
  `artist_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`track_in_artist_id`),
  KEY `track_id` (`track_id`),
  KEY `artist_id` (`artist_id`),
  CONSTRAINT `fk_artist_id` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`artist_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_track_id` FOREIGN KEY (`track_id`) REFERENCES `tracks` (`track_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracks_in_artists`
--

LOCK TABLES `tracks_in_artists` WRITE;
/*!40000 ALTER TABLE `tracks_in_artists` DISABLE KEYS */;
INSERT INTO `tracks_in_artists` VALUES (31,27,10,'2017-12-10 08:14:55','2017-12-10 08:14:55'),(32,28,10,'2017-12-10 08:14:55','2017-12-10 08:14:55'),(33,29,10,'2017-12-10 08:14:55','2017-12-10 08:14:55'),(34,30,10,'2017-12-10 08:14:55','2017-12-10 08:14:55'),(35,31,10,'2017-12-10 08:15:55','2017-12-10 08:15:55'),(36,32,10,'2017-12-10 08:15:55','2017-12-10 08:15:55'),(37,33,10,'2017-12-10 08:15:55','2017-12-10 08:15:55'),(38,34,10,'2017-12-10 08:15:55','2017-12-10 08:15:55'),(39,35,10,'2017-12-10 08:16:05','2017-12-10 08:16:05'),(40,36,10,'2017-12-10 08:16:05','2017-12-10 08:16:05'),(43,37,10,'2017-12-10 08:17:03','2017-12-10 08:17:03'),(44,38,23,'2017-12-10 08:41:48','2017-12-10 08:41:48'),(45,39,23,'2017-12-10 08:41:48','2017-12-10 08:41:48'),(46,40,23,'2017-12-10 08:41:48','2017-12-10 08:41:48'),(47,41,23,'2017-12-10 08:41:48','2017-12-10 08:41:48'),(48,42,23,'2017-12-10 08:42:03','2017-12-10 08:42:03'),(49,43,23,'2017-12-10 08:42:04','2017-12-10 08:42:04'),(50,44,23,'2017-12-10 08:42:04','2017-12-10 08:42:04'),(51,45,23,'2017-12-10 08:42:04','2017-12-10 08:42:04'),(52,46,23,'2017-12-10 08:42:14','2017-12-10 08:42:14'),(53,47,23,'2017-12-10 08:42:14','2017-12-10 08:42:14'),(55,52,10,'2017-12-10 09:20:57','2017-12-10 09:20:57'),(57,54,23,'2017-12-10 12:33:10','2017-12-10 12:33:10'),(59,55,23,'2017-12-10 12:35:46','2017-12-10 12:35:46');
/*!40000 ALTER TABLE `tracks_in_artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracks_in_genres`
--

DROP TABLE IF EXISTS `tracks_in_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tracks_in_genres` (
  `track_in_genre_id` int(11) NOT NULL AUTO_INCREMENT,
  `track_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`track_in_genre_id`),
  KEY `track_id_indx` (`track_id`),
  KEY `genre_id_indx` (`genre_id`),
  CONSTRAINT `fk_tig_genre_id` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genre_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tig_track_id` FOREIGN KEY (`track_id`) REFERENCES `tracks` (`track_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracks_in_genres`
--

LOCK TABLES `tracks_in_genres` WRITE;
/*!40000 ALTER TABLE `tracks_in_genres` DISABLE KEYS */;
INSERT INTO `tracks_in_genres` VALUES (20,27,5,'2017-12-10 08:14:55','2017-12-10 08:14:55'),(21,28,5,'2017-12-10 08:14:55','2017-12-10 08:14:55'),(22,29,5,'2017-12-10 08:14:55','2017-12-10 08:14:55'),(23,30,5,'2017-12-10 08:14:55','2017-12-10 08:14:55'),(24,31,5,'2017-12-10 08:15:55','2017-12-10 08:15:55'),(25,32,5,'2017-12-10 08:15:55','2017-12-10 08:15:55'),(26,33,5,'2017-12-10 08:15:55','2017-12-10 08:15:55'),(27,34,5,'2017-12-10 08:15:55','2017-12-10 08:15:55'),(28,35,5,'2017-12-10 08:16:05','2017-12-10 08:16:05'),(29,36,5,'2017-12-10 08:16:05','2017-12-10 08:16:05'),(30,37,5,'2017-12-10 08:16:05','2017-12-10 08:16:05'),(31,38,11,'2017-12-10 08:41:48','2017-12-10 08:41:48'),(32,39,11,'2017-12-10 08:41:48','2017-12-10 08:41:48'),(33,40,11,'2017-12-10 08:41:48','2017-12-10 08:41:48'),(34,41,11,'2017-12-10 08:41:48','2017-12-10 08:41:48'),(35,42,11,'2017-12-10 08:42:04','2017-12-10 08:42:04'),(36,43,11,'2017-12-10 08:42:04','2017-12-10 08:42:04'),(37,44,11,'2017-12-10 08:42:04','2017-12-10 08:42:04'),(38,45,11,'2017-12-10 08:42:04','2017-12-10 08:42:04'),(39,46,11,'2017-12-10 08:42:14','2017-12-10 08:42:14'),(40,47,11,'2017-12-10 08:42:14','2017-12-10 08:42:14'),(42,52,5,'2017-12-10 09:20:57','2017-12-10 09:20:57'),(44,55,11,'2017-12-10 12:35:23','2017-12-10 12:35:23');
/*!40000 ALTER TABLE `tracks_in_genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracks_in_playlists`
--

DROP TABLE IF EXISTS `tracks_in_playlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tracks_in_playlists` (
  `track_in_playlist_id` int(11) NOT NULL AUTO_INCREMENT,
  `track_id` int(11) NOT NULL,
  `playlist_id` int(11) NOT NULL,
  PRIMARY KEY (`track_in_playlist_id`),
  KEY `fk_tracks_in_playlists_playlist_id` (`playlist_id`),
  KEY `fk_tracks_in_playlists_track_id` (`track_id`) USING BTREE,
  CONSTRAINT `fk_tracks_in_playlists_playlist_id` FOREIGN KEY (`playlist_id`) REFERENCES `playlists` (`playlist_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tracks_in_playlists_track_id` FOREIGN KEY (`track_id`) REFERENCES `tracks` (`track_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracks_in_playlists`
--

LOCK TABLES `tracks_in_playlists` WRITE;
/*!40000 ALTER TABLE `tracks_in_playlists` DISABLE KEYS */;
INSERT INTO `tracks_in_playlists` VALUES (1,27,6),(2,28,6),(3,29,6),(4,30,6),(5,31,6),(6,37,7),(7,35,7),(8,44,7),(9,38,7),(10,31,7),(11,31,8),(12,31,9),(13,37,8),(14,45,8),(15,28,9);
/*!40000 ALTER TABLE `tracks_in_playlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracks_in_users`
--

DROP TABLE IF EXISTS `tracks_in_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tracks_in_users` (
  `track_in_user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `track_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`track_in_user_id`),
  KEY `track_id_indx` (`track_id`),
  KEY `user_id_indx` (`user_id`),
  CONSTRAINT `fk_tiu_track_id` FOREIGN KEY (`track_id`) REFERENCES `tracks` (`track_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tiu_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracks_in_users`
--

LOCK TABLES `tracks_in_users` WRITE;
/*!40000 ALTER TABLE `tracks_in_users` DISABLE KEYS */;
INSERT INTO `tracks_in_users` VALUES (27,1,28,'2017-12-10 08:14:55','2017-12-10 08:14:55'),(28,1,29,'2017-12-10 08:14:55','2017-12-10 08:14:55'),(29,1,30,'2017-12-10 08:14:55','2017-12-10 08:14:55'),(30,1,31,'2017-12-10 08:15:55','2017-12-10 08:15:55'),(31,1,32,'2017-12-10 08:15:55','2017-12-10 08:15:55'),(32,1,33,'2017-12-10 08:15:55','2017-12-10 08:15:55'),(33,1,34,'2017-12-10 08:15:55','2017-12-10 08:15:55'),(34,1,35,'2017-12-10 08:16:05','2017-12-10 08:16:05'),(35,1,36,'2017-12-10 08:16:05','2017-12-10 08:16:05'),(36,1,37,'2017-12-10 08:16:05','2017-12-10 08:16:05'),(37,2,38,'2017-12-10 08:41:48','2017-12-10 08:41:48'),(38,2,39,'2017-12-10 08:41:48','2017-12-10 08:41:48'),(39,2,40,'2017-12-10 08:41:48','2017-12-10 08:41:48'),(40,2,41,'2017-12-10 08:41:48','2017-12-10 08:41:48'),(41,2,42,'2017-12-10 08:42:03','2017-12-10 08:42:03'),(42,2,43,'2017-12-10 08:42:04','2017-12-10 08:42:04'),(43,2,44,'2017-12-10 08:42:04','2017-12-10 08:42:04'),(44,2,45,'2017-12-10 08:42:04','2017-12-10 08:42:04'),(45,2,46,'2017-12-10 08:42:14','2017-12-10 08:42:14'),(46,2,47,'2017-12-10 08:42:14','2017-12-10 08:42:14'),(50,2,52,'2017-12-10 09:20:57','2017-12-10 09:20:57'),(52,1,55,'2017-12-10 12:35:23','2017-12-10 12:35:23');
/*!40000 ALTER TABLE `tracks_in_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL,
  `user_type` int(11) NOT NULL DEFAULT '1',
  `remember_token` varchar(512) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_email` (`email`),
  UNIQUE KEY `user_name` (`name`),
  KEY `user_type_indx` (`user_type`),
  CONSTRAINT `fk_user_type` FOREIGN KEY (`user_type`) REFERENCES `account_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'AlexChuiko','alex.chuyko9@gmail.com','$2y$10$tWlpV26.cZ/GOPx0PR0c9.xbwQm2UaiiwfL8U6JopJZG5fQjxUz0C','2017-11-07 07:13:16','2017-12-10 12:15:43',1,'HbiJwhy1C50mKicZL2YdLTd2cwGirOzPDlDUcis8ZnY3HCqWOuldIqhQlxyX'),(2,'ADMIN','admin@test.com','$2y$10$FW6fOBerbr0qSfbwU7ZnveVzHF5uCjYCBFO4NqJGj61oxgr8K.2x.','2017-11-21 14:19:43','2017-11-21 14:19:43',1,'');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_genres`
--

DROP TABLE IF EXISTS `users_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_genres` (
  `user_genre_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  PRIMARY KEY (`user_genre_id`),
  KEY `g_user_id_indx` (`user_id`),
  KEY `g_genre_id_indx` (`genre_id`),
  CONSTRAINT `f_g_genre_id` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genre_id`),
  CONSTRAINT `fk_g_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_genres`
--

LOCK TABLES `users_genres` WRITE;
/*!40000 ALTER TABLE `users_genres` DISABLE KEYS */;
INSERT INTO `users_genres` VALUES (1,1,2),(2,2,6);
/*!40000 ALTER TABLE `users_genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_in_communities`
--

DROP TABLE IF EXISTS `users_in_communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_in_communities` (
  `user_in_community_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `community_id` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_in_community_id`),
  KEY `user_id_indx` (`user_id`),
  KEY `community_id_indx` (`community_id`),
  CONSTRAINT `fk_uic_community_id` FOREIGN KEY (`community_id`) REFERENCES `communities` (`community_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_uic_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_in_communities`
--

LOCK TABLES `users_in_communities` WRITE;
/*!40000 ALTER TABLE `users_in_communities` DISABLE KEYS */;
INSERT INTO `users_in_communities` VALUES (6,1,10,'2017-12-10 08:32:16','2017-12-10 08:32:16'),(7,2,10,'2017-12-10 08:40:50','2017-12-10 08:40:50'),(8,2,11,'2017-12-10 08:47:39','2017-12-10 08:47:39');
/*!40000 ALTER TABLE `users_in_communities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-10 19:53:10
