-- MySQL dump 10.13  Distrib 5.1.49, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: specializ_development
-- ------------------------------------------------------
-- Server version	5.1.49-1ubuntu8.1

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
-- Table structure for table `active_admin_comments`
--

DROP TABLE IF EXISTS `active_admin_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `active_admin_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) NOT NULL,
  `resource_type` varchar(255) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `author_type` varchar(255) DEFAULT NULL,
  `body` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `namespace` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_admin_notes_on_resource_type_and_resource_id` (`resource_type`,`resource_id`),
  KEY `index_active_admin_comments_on_namespace` (`namespace`),
  KEY `index_active_admin_comments_on_author_type_and_author_id` (`author_type`,`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_admin_comments`
--

LOCK TABLES `active_admin_comments` WRITE;
/*!40000 ALTER TABLE `active_admin_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `active_admin_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(128) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_admin_users_on_email` (`email`),
  UNIQUE KEY `index_admin_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users`
--

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` VALUES (1,'admin@example.com','$2a$10$bQIv4BRx4vDHWXjCWJ2TKOEtWbHHA.z9N3iD6qNMMhkGOnuntqQ5C',NULL,NULL,NULL,5,'2012-03-12 19:45:49','2011-11-16 14:49:08','127.0.0.1','127.0.0.1','2011-09-21 19:39:24','2012-03-12 19:45:49'),(2,'jdavis@peoplenetz.com','$2a$10$VmaEgdT/YbwjXaEn1sk9VehCyR1Q1L2NE24.YOMdcI0/AnPya.QQG',NULL,NULL,NULL,6,'2012-03-20 14:30:38','2012-03-15 17:49:25','127.0.0.1','127.0.0.1','2012-01-23 17:27:47','2012-03-20 14:30:38'),(3,'bharrison@peoplenetz.com','$2a$10$M2gKcbqPZdbVMolenrh3f.GrMf64BYczKRzVwWBWDTzF4Sdj81sfq',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2012-03-12 21:07:38','2012-03-13 15:31:45');
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignments`
--

DROP TABLE IF EXISTS `assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `topic_group_id` int(11) DEFAULT NULL,
  `manager` tinyint(1) DEFAULT '0',
  `participating` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignments`
--

LOCK TABLES `assignments` WRITE;
/*!40000 ALTER TABLE `assignments` DISABLE KEYS */;
INSERT INTO `assignments` VALUES (1,1,15,1,1,'2011-09-08 18:52:39','2011-11-07 16:58:03'),(2,1,9,0,1,'2011-10-03 20:18:42','2011-10-25 15:05:05'),(19,4,15,1,1,'2011-10-27 20:50:45','2011-10-28 20:00:58'),(20,1,21,1,1,'2011-11-08 15:49:49','2011-11-08 15:49:49'),(21,4,21,0,1,'2011-11-08 15:49:59','2011-11-08 15:49:59'),(22,1,23,1,1,'2011-11-08 19:23:09','2012-03-08 20:34:12'),(23,22,24,0,1,'2011-11-16 15:30:08','2011-11-16 15:30:08'),(24,19,24,0,1,'2011-11-16 15:30:08','2011-11-16 15:30:08'),(25,21,24,0,1,'2011-11-16 15:30:08','2011-11-16 15:30:08'),(26,18,24,1,1,'2011-11-16 15:30:08','2011-11-16 15:30:50'),(27,20,24,0,1,'2011-11-16 15:30:08','2011-11-16 15:30:08'),(36,1,8,1,1,'2011-12-05 20:52:53','2011-12-05 20:52:53'),(44,1,25,1,1,'2011-12-05 21:38:33','2011-12-27 21:17:31'),(45,7,8,0,1,'2011-12-06 17:00:50','2011-12-06 17:00:50'),(46,1,26,0,1,'2011-12-06 21:10:46','2011-12-06 21:10:46'),(47,4,26,0,1,'2011-12-06 21:10:50','2011-12-06 21:10:50'),(48,4,16,1,1,'2011-12-09 17:32:59','2011-12-09 17:32:59'),(49,1,42,1,1,'2012-01-16 19:42:06','2012-01-17 15:44:02'),(50,31,25,0,1,'2012-01-17 00:44:01','2012-01-17 00:44:01'),(52,4,43,1,1,'2012-01-17 17:46:27','2012-01-17 17:47:46'),(53,1,43,1,1,'2012-01-17 17:46:27','2012-01-17 17:47:14'),(54,1,44,1,1,'2012-01-17 17:46:27','2012-01-17 17:47:21'),(55,1,45,1,1,'2012-01-17 17:46:27','2012-01-17 17:47:29'),(56,1,46,1,1,'2012-01-17 17:46:27','2012-01-17 17:47:38'),(57,4,48,0,1,'2012-01-19 18:07:49','2012-01-19 18:07:49'),(58,1,48,0,1,'2012-01-19 18:07:49','2012-01-19 18:07:49'),(59,1,49,0,1,'2012-01-19 18:07:49','2012-01-19 18:07:49'),(60,1,50,0,1,'2012-01-19 18:07:49','2012-01-19 18:07:49'),(61,1,51,0,1,'2012-01-19 18:07:49','2012-01-19 18:07:49'),(67,31,59,0,1,'2012-01-25 20:10:49','2012-01-25 20:10:49'),(68,56,60,0,1,'2012-01-26 17:56:25','2012-01-26 17:56:25'),(69,55,60,0,1,'2012-01-26 17:56:25','2012-01-26 17:56:25'),(71,54,60,0,1,'2012-01-26 17:56:25','2012-01-26 17:56:25'),(72,57,60,0,1,'2012-01-26 17:56:25','2012-01-26 17:56:25'),(73,31,23,0,1,'2012-02-16 20:40:16','2012-02-16 20:40:16'),(74,25,64,0,1,'2012-02-17 19:05:11','2012-02-17 19:05:11'),(75,1,64,0,1,'2012-02-17 19:05:11','2012-02-17 19:05:11'),(76,4,64,0,1,'2012-02-17 19:05:11','2012-02-17 19:05:11'),(77,1,16,1,1,'2012-02-22 16:07:14','2012-03-21 18:23:23'),(78,4,25,0,1,'2012-02-22 23:24:25','2012-02-22 23:24:25'),(84,4,70,1,1,'2012-03-09 20:32:01','2012-03-09 20:33:09'),(85,1,70,0,1,'2012-03-09 20:32:01','2012-03-09 20:32:01'),(86,25,70,1,1,'2012-03-09 20:32:01','2012-03-09 20:33:01'),(87,1,71,1,1,'2012-03-09 20:32:02','2012-03-09 20:33:18'),(88,31,71,1,1,'2012-03-09 20:34:11','2012-03-09 20:34:11'),(124,25,78,0,1,'2012-03-19 17:33:24','2012-03-19 17:33:24'),(125,4,78,0,1,'2012-03-19 17:33:24','2012-03-19 17:33:24'),(126,1,78,1,1,'2012-03-19 17:33:24','2012-03-19 17:33:33'),(127,55,78,0,1,'2012-03-19 17:33:24','2012-03-19 17:33:24'),(128,54,78,0,1,'2012-03-19 17:33:24','2012-03-19 17:33:24'),(129,57,78,0,1,'2012-03-19 17:33:25','2012-03-19 17:33:25'),(130,61,78,0,1,'2012-03-19 17:33:25','2012-03-19 17:33:25'),(131,56,78,0,1,'2012-03-19 17:33:25','2012-03-19 17:33:25'),(132,1,79,1,1,'2012-03-21 18:46:48','2012-03-21 18:46:48'),(133,4,40,0,1,'2012-03-21 18:50:45','2012-03-21 18:50:45'),(134,1,40,0,1,'2012-03-21 18:50:45','2012-03-21 18:50:45'),(135,25,40,0,1,'2012-03-21 18:50:45','2012-03-21 18:50:45'),(136,56,40,0,1,'2012-03-21 18:50:45','2012-03-21 18:50:45'),(137,57,40,0,1,'2012-03-21 18:50:45','2012-03-21 18:50:45'),(138,54,40,0,1,'2012-03-21 18:50:45','2012-03-21 18:50:45'),(139,55,40,0,1,'2012-03-21 18:50:45','2012-03-21 18:50:45'),(140,61,40,0,1,'2012-03-21 18:50:45','2012-03-21 18:50:45'),(141,54,41,0,1,'2012-03-21 18:50:45','2012-03-21 18:50:45'),(142,56,41,0,1,'2012-03-21 18:50:45','2012-03-21 18:50:45'),(143,61,41,0,1,'2012-03-21 18:50:45','2012-03-21 18:50:45'),(144,55,41,0,1,'2012-03-21 18:50:45','2012-03-21 18:50:45'),(145,57,41,0,1,'2012-03-21 18:50:45','2012-03-21 18:50:45'),(146,1,41,0,1,'2012-03-21 18:50:45','2012-03-21 18:50:45');
/*!40000 ALTER TABLE `assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authentications`
--

DROP TABLE IF EXISTS `authentications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authentications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authentications`
--

LOCK TABLES `authentications` WRITE;
/*!40000 ALTER TABLE `authentications` DISABLE KEYS */;
INSERT INTO `authentications` VALUES (6,1,'linked_in','kzzBqUSc-q','2012-01-17 15:42:39','2012-01-17 15:42:39'),(7,1,'twitter','149187610','2012-01-17 15:42:48','2012-01-17 15:42:48');
/*!40000 ALTER TABLE `authentications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `never_expires` tinyint(1) DEFAULT '0',
  `expiration_date` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'Peoplenetz',1,1,NULL,'2011-09-21 20:25:57','2012-01-23 17:23:13','http://www.enspherelabs.com/images/logo_header.png'),(2,'Test Company',1,NULL,NULL,'2011-10-03 20:18:42','2011-10-03 20:18:42',NULL),(4,'Acme5',1,0,'2013-01-31','2012-01-13 21:14:37','2012-01-13 21:14:37',NULL),(5,'Pnetz_Test',1,0,'2013-01-31','2012-01-17 17:58:09','2012-01-17 17:58:09',NULL),(6,'LA Tech Park',1,0,'2013-01-31','2012-01-23 17:30:35','2012-01-23 17:30:35','');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delayed_jobs`
--

DROP TABLE IF EXISTS `delayed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delayed_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `priority` int(11) DEFAULT '0',
  `attempts` int(11) DEFAULT '0',
  `handler` text,
  `last_error` text,
  `run_at` datetime DEFAULT NULL,
  `locked_at` datetime DEFAULT NULL,
  `failed_at` datetime DEFAULT NULL,
  `locked_by` varchar(255) DEFAULT NULL,
  `queue` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `delayed_jobs_priority` (`priority`,`run_at`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delayed_jobs`
--

LOCK TABLES `delayed_jobs` WRITE;
/*!40000 ALTER TABLE `delayed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `delayed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `element_attribute_options`
--

DROP TABLE IF EXISTS `element_attribute_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `element_attribute_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `element_attribute_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `element_attribute_options`
--

LOCK TABLES `element_attribute_options` WRITE;
/*!40000 ALTER TABLE `element_attribute_options` DISABLE KEYS */;
INSERT INTO `element_attribute_options` VALUES (1,'high',24,'2012-03-06 20:00:29','2012-03-06 20:00:29'),(2,'medium',24,'2012-03-06 20:00:29','2012-03-06 20:00:29'),(3,'low',24,'2012-03-06 20:00:29','2012-03-06 20:00:29'),(4,'keep',27,'2012-03-06 21:31:38','2012-03-06 21:31:38'),(5,'keep2',27,'2012-03-06 21:32:05','2012-03-06 21:32:05'),(6,'keep3',27,'2012-03-06 21:34:17','2012-03-06 21:34:17'),(10,'high',32,'2012-03-06 22:44:32','2012-03-06 22:44:32'),(11,'medium',32,'2012-03-06 22:44:32','2012-03-06 22:44:32'),(12,'low',32,'2012-03-06 22:44:32','2012-03-06 22:44:32'),(13,'high',23,'2012-03-07 16:29:20','2012-03-07 16:29:20'),(14,'medium',23,'2012-03-07 16:29:20','2012-03-07 16:29:20'),(15,'low',23,'2012-03-07 16:29:20','2012-03-07 16:29:20'),(16,'yes',33,'2012-03-08 16:01:52','2012-03-08 16:01:52'),(17,'no',33,'2012-03-08 16:01:52','2012-03-08 16:01:52'),(18,'opt1',34,'2012-03-19 17:23:11','2012-03-19 17:23:11'),(19,'opt2',34,'2012-03-19 17:23:11','2012-03-19 17:23:11');
/*!40000 ALTER TABLE `element_attribute_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `element_attribute_types`
--

DROP TABLE IF EXISTS `element_attribute_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `element_attribute_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `symbol` varchar(255) DEFAULT NULL,
  `validation` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `element_attribute_types`
--

LOCK TABLES `element_attribute_types` WRITE;
/*!40000 ALTER TABLE `element_attribute_types` DISABLE KEYS */;
INSERT INTO `element_attribute_types` VALUES (1,'Text','Feel free to answer as you wish','txt',NULL,'2012-02-17 22:26:32','2012-02-17 22:26:32'),(2,'Percentage','Enter a numberic percentage','%','numeric','2012-02-17 22:28:10','2012-02-17 22:28:10'),(3,'Numeric','Enter a number.','num','numeric','2012-02-17 22:30:06','2012-02-17 22:30:06'),(4,'Currency','Enter a dollar amount.','$','currency','2012-02-17 22:31:16','2012-02-17 22:31:16'),(5,'Select','This allows the user to choose from a list of sections',NULL,NULL,'2012-03-05 20:33:11','2012-03-06 14:33:53');
/*!40000 ALTER TABLE `element_attribute_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `element_attributes`
--

DROP TABLE IF EXISTS `element_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `element_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `element_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `element_attribute_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `element_attributes`
--

LOCK TABLES `element_attributes` WRITE;
/*!40000 ALTER TABLE `element_attributes` DISABLE KEYS */;
INSERT INTO `element_attributes` VALUES (10,'attr1',140,'2012-02-16 16:28:31','2012-02-17 22:35:02',1),(16,'attr1',148,'2012-02-17 17:05:25','2012-02-17 23:27:21',1),(17,'attr2',148,'2012-02-17 17:05:25','2012-02-17 23:27:21',2),(18,'attr3',148,'2012-02-17 17:05:25','2012-02-17 23:27:21',3),(22,'attr5',148,'2012-02-17 18:37:02','2012-02-17 23:27:21',4),(23,'Savings',86,'2012-02-17 19:06:41','2012-03-07 16:29:20',5),(24,'Percent improvement',82,'2012-02-17 23:26:38','2012-03-06 18:59:45',5),(27,'attr 1',156,'2012-03-05 17:05:08','2012-03-06 14:29:48',5),(29,'attr1',158,'2012-03-06 21:14:05','2012-03-06 21:14:05',1),(32,'atribute 1',159,'2012-03-06 22:44:32','2012-03-06 22:44:32',5),(33,'More is better',160,'2012-03-08 16:01:52','2012-03-08 16:01:52',5),(34,'attr1',185,'2012-03-19 17:23:11','2012-03-19 17:23:11',5),(35,'attr1',188,'2012-03-19 17:53:12','2012-03-19 17:53:12',4);
/*!40000 ALTER TABLE `element_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `current` tinyint(1) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `edited_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
INSERT INTO `elements` VALUES (1,'Ability to make a GANNT chart',1,1,NULL,'2011-09-13 16:06:43','2011-09-13 16:06:43'),(2,'Staff projects by skill',1,1,NULL,'2011-09-27 19:10:41','2011-09-27 19:10:41'),(22,'JD test element 3',1,1,NULL,'2011-09-30 17:14:06','2011-09-30 17:14:06'),(24,'Generate weekly status report',1,1,NULL,'2011-09-30 19:08:25','2011-09-30 19:08:25'),(25,'Update individual work schedule',1,1,NULL,'2011-09-30 19:11:38','2011-09-30 19:11:38'),(26,'Share resources between projects',1,1,NULL,'2011-09-30 19:12:08','2011-09-30 19:12:08'),(28,'Respond to manager comments',1,1,NULL,'2011-09-30 19:13:40','2011-09-30 19:13:40'),(29,'Request additional resources',1,1,NULL,'2011-09-30 19:14:19','2011-09-30 19:14:19'),(30,'Flash updates to users only once',1,1,NULL,'2011-09-30 19:17:29','2011-09-30 19:17:29'),(31,'Another element',1,1,NULL,'2011-10-28 19:45:49','2011-10-28 19:45:49'),(39,'Tasks lists for people, and allocation schedules for resources.',1,1,NULL,'2011-11-09 18:05:57','2011-11-09 18:05:57'),(40,'Overview information on how long tasks will take to complete.',1,1,NULL,'2011-11-09 18:05:57','2011-11-09 18:05:57'),(41,'Early warning of any risks to the project.',1,1,NULL,'2011-11-09 18:05:57','2011-11-09 18:05:57'),(42,'Information on workload, for planning holidays.',1,1,NULL,'2011-11-09 18:05:57','2011-11-09 18:05:57'),(43,'Optimum utilization of available resource.',1,1,NULL,'2011-11-09 18:05:57','2011-11-09 18:05:57'),(44,'Cost Maintenance.',1,1,NULL,'2011-11-09 18:05:57','2011-11-09 18:05:57'),(45,'Tasks lists for people, and allocation schedules for resources.',1,1,NULL,'2011-11-11 14:33:21','2011-11-11 14:33:21'),(46,'Overview information on how long tasks will take to complete.',1,1,NULL,'2011-11-11 14:33:21','2011-11-11 14:33:21'),(47,'Early warning of any risks to the project.',1,1,NULL,'2011-11-11 14:33:21','2011-11-11 14:33:21'),(48,'Information on workload, for planning holidays.',1,1,NULL,'2011-11-11 14:33:21','2011-11-11 14:33:21'),(49,'Optimum utilization of available resource.',1,1,NULL,'2011-11-11 14:33:21','2011-11-11 14:33:21'),(50,'Cost Maintenance.',1,1,NULL,'2011-11-11 14:33:21','2011-11-11 14:33:21'),(56,'element 1',1,18,NULL,'2011-11-16 16:02:26','2011-11-16 16:02:26'),(65,'element 1',1,18,NULL,'2011-11-16 22:53:48','2011-11-16 22:53:48'),(66,'element 2',1,18,NULL,'2011-11-16 22:53:48','2011-11-16 22:53:48'),(67,'element 3',1,18,NULL,'2011-11-16 22:53:48','2011-11-16 22:53:48'),(68,'element 4',1,18,NULL,'2011-11-16 22:53:48','2011-11-16 22:53:48'),(69,'element 5',1,18,NULL,'2011-11-16 22:53:48','2011-11-16 22:53:48'),(70,'element 6',1,18,NULL,'2011-11-16 22:53:49','2011-11-16 22:53:49'),(71,'element 7',1,18,NULL,'2011-11-16 22:53:49','2011-11-16 22:53:49'),(72,'element 8',1,18,NULL,'2011-11-16 22:53:49','2011-11-16 22:53:49'),(73,'Tasks lists for people, and allocation schedules for resources.',1,1,NULL,'2011-12-06 22:37:45','2011-12-06 22:37:45'),(74,'Overview information on how long tasks will take to complete.',1,1,NULL,'2011-12-06 22:37:46','2011-12-06 22:37:46'),(75,'Early warning of any risks to the project.',1,1,NULL,'2011-12-06 22:37:46','2011-12-06 22:37:46'),(76,'Information on workload, for planning holidays.',1,1,1,'2011-12-06 22:37:46','2012-03-06 22:15:14'),(77,'Optimum utilization of available resource.',1,1,NULL,'2011-12-06 22:37:46','2011-12-06 22:37:46'),(78,'Cost Maintenance - update.',1,1,1,'2011-12-06 22:37:46','2011-12-28 18:13:11'),(80,'Manage scheduling risk',1,1,NULL,'2011-12-16 22:12:34','2011-12-16 22:12:34'),(81,'Tasks lists for people, and allocation schedules for resources.',1,1,NULL,'2011-12-19 20:32:41','2011-12-19 20:32:41'),(82,'Overview information on how long tasks will take to complete.',1,1,1,'2011-12-19 20:32:42','2012-02-17 23:26:38'),(83,'Early warning of any risks to the project.',1,1,NULL,'2011-12-19 20:32:42','2011-12-19 20:32:42'),(84,'Information on workload, for planning holidays.',1,1,NULL,'2011-12-19 20:32:42','2011-12-19 20:32:42'),(85,'Optimum utilization of available resource.',1,1,1,'2011-12-19 20:32:42','2012-02-17 17:33:41'),(86,'Cost Maintenance.',1,1,1,'2011-12-19 20:32:42','2012-02-17 18:38:19'),(87,'JD Test element',1,1,NULL,'2011-12-27 20:02:50','2011-12-27 20:02:50'),(88,'Tasks lists for people, and allocation schedules for resources.',1,1,NULL,'2011-12-27 21:24:53','2011-12-27 21:24:53'),(89,'Overview information on how long tasks will take to complete.',1,1,NULL,'2011-12-27 21:24:53','2011-12-27 21:24:53'),(90,'Early warning of any risks to the project.',1,1,NULL,'2011-12-27 21:24:53','2011-12-27 21:24:53'),(91,'Information on workload, for planning holidays.',1,1,NULL,'2011-12-27 21:24:54','2011-12-27 21:24:54'),(92,'Optimum utilization of available resource.',1,1,NULL,'2011-12-27 21:24:54','2011-12-27 21:24:54'),(93,'Cost Maintenance.',1,1,NULL,'2011-12-27 21:24:54','2011-12-27 21:24:54'),(94,'Here is another new item.',1,1,1,'2011-12-27 22:17:14','2012-03-05 15:06:32'),(96,'Last element added.',1,1,NULL,'2011-12-28 21:13:55','2011-12-28 21:13:55'),(97,'new test element',1,1,NULL,'2012-01-12 20:51:43','2012-01-12 20:51:43'),(99,'test element',1,1,NULL,'2012-01-12 21:03:46','2012-01-12 21:03:46'),(100,'another test element',1,1,NULL,'2012-01-12 21:16:30','2012-01-12 21:16:30'),(102,'Overview information on how long tasks will take to complete.',1,1,NULL,'2012-01-17 15:44:39','2012-01-17 15:44:39'),(103,'Early warning of any risks to the project.',1,1,NULL,'2012-01-17 15:44:39','2012-01-17 15:44:39'),(104,'Information on workload, for planning holidays.',1,1,NULL,'2012-01-17 15:44:40','2012-01-17 15:44:40'),(105,'Optimum utilization of available resource.',1,1,NULL,'2012-01-17 15:44:40','2012-01-17 15:44:40'),(106,'Cost Maintenance.',1,1,NULL,'2012-01-17 15:44:40','2012-01-17 15:44:40'),(109,'Calculation test element 1',1,53,NULL,'2012-01-26 17:59:21','2012-01-26 17:59:21'),(110,'Calculation test element 2',1,53,NULL,'2012-01-26 17:59:21','2012-01-26 17:59:21'),(111,'Calculation test element 3',1,53,NULL,'2012-01-26 17:59:21','2012-01-26 17:59:21'),(112,'Calculation test element 4',1,53,NULL,'2012-01-26 17:59:21','2012-01-26 17:59:21'),(113,'Calculation test element 5',1,53,NULL,'2012-01-26 17:59:21','2012-01-26 17:59:21'),(114,'Calculation test element 6',1,53,NULL,'2012-01-26 17:59:22','2012-01-26 17:59:22'),(115,'Calculation test element 7',1,53,NULL,'2012-01-26 17:59:22','2012-01-26 17:59:22'),(116,'Calculation test element 8',1,53,NULL,'2012-01-26 17:59:22','2012-01-26 17:59:22'),(117,'Tasks lists for people and allocation schedules for resources.',1,1,NULL,'2012-02-09 16:50:44','2012-02-09 16:50:44'),(118,'Overview information on how long tasks will take to complete.',1,1,NULL,'2012-02-09 16:50:44','2012-02-09 16:50:44'),(119,'Early warning of any risks to the project.',1,1,1,'2012-02-09 16:50:44','2012-02-16 17:30:43'),(120,'Information on workload, for planning holidays.',1,1,NULL,'2012-02-09 16:50:44','2012-02-09 16:50:44'),(121,'Optimum utilization of available resource.',1,1,NULL,'2012-02-09 16:50:44','2012-02-09 16:50:44'),(122,'Cost Maintenance.',1,1,NULL,'2012-02-09 16:50:44','2012-02-09 16:50:44'),(123,'Tasks lists for people and allocation schedules for resources.',1,1,NULL,'2012-02-09 21:05:42','2012-02-09 21:05:42'),(140,'New Element',1,1,NULL,'2012-02-16 16:28:31','2012-02-16 16:28:31'),(148,'Ability to create sub groups.',1,1,1,'2012-02-17 17:05:25','2012-03-07 16:28:44'),(150,'JD Test Element',1,1,NULL,'2012-02-28 15:10:26','2012-02-28 15:10:26'),(151,'JD Test Element',1,1,NULL,'2012-02-28 15:11:10','2012-02-28 15:11:10'),(152,'JD Test Element',1,1,NULL,'2012-02-28 15:22:53','2012-02-28 15:22:53'),(153,'JD Test Element',1,1,NULL,'2012-02-28 16:05:57','2012-02-28 16:05:57'),(154,'Remote access to the application.',1,1,1,'2012-02-28 18:21:22','2012-03-07 16:26:09'),(156,'test element',1,1,1,'2012-03-05 17:05:08','2012-03-05 17:05:59'),(158,'New Element',1,1,1,'2012-03-05 20:52:10','2012-03-05 20:52:26'),(159,'Partial pay periods',1,1,NULL,'2012-03-06 22:44:32','2012-03-06 22:44:32'),(160,'Partial pay periods',1,1,NULL,'2012-03-08 16:01:52','2012-03-08 16:01:52'),(161,'Partial pay periods.',1,1,NULL,'2012-03-08 20:58:22','2012-03-08 20:58:22'),(162,'Contact counterpart at client organization.',1,1,NULL,'2012-03-08 20:59:11','2012-03-08 20:59:11'),(163,'Tasks lists for people, and allocation schedules for resources.',1,1,NULL,'2012-03-09 22:14:26','2012-03-09 22:14:26'),(164,'Overview information on how long tasks will take to complete.',1,1,NULL,'2012-03-09 22:14:26','2012-03-09 22:14:26'),(165,'Early warning of any risks to the project.',1,1,NULL,'2012-03-09 22:14:26','2012-03-09 22:14:26'),(166,'Information on workload, for planning holidays.',1,1,NULL,'2012-03-09 22:14:26','2012-03-09 22:14:26'),(167,'Optimum utilization of available resource.',1,1,NULL,'2012-03-09 22:14:26','2012-03-09 22:14:26'),(168,'Cost Maintenance.',1,1,NULL,'2012-03-09 22:14:26','2012-03-09 22:14:26'),(169,'Tasks lists for people, and allocation schedules for resources.',1,1,NULL,'2012-03-09 22:29:35','2012-03-09 22:29:35'),(170,'Overview information on how long tasks will take to complete.',1,1,NULL,'2012-03-09 22:29:36','2012-03-09 22:29:36'),(171,'Early warning of any risks to the project.',1,1,NULL,'2012-03-09 22:29:36','2012-03-09 22:29:36'),(172,'Information on workload, for planning holidays.',1,1,NULL,'2012-03-09 22:29:36','2012-03-09 22:29:36'),(173,'Optimum utilization of available resource.',1,1,NULL,'2012-03-09 22:29:36','2012-03-09 22:29:36'),(174,'Cost Maintenance.',1,1,NULL,'2012-03-09 22:29:36','2012-03-09 22:29:36'),(175,'added in the manage elements tab',1,1,NULL,'2012-03-19 15:51:01','2012-03-19 15:51:01'),(176,'added in the manage elements tab',1,1,NULL,'2012-03-19 16:04:11','2012-03-19 16:04:11'),(177,'added in the manage elements tab 2',1,1,NULL,'2012-03-19 16:04:24','2012-03-19 16:04:24'),(179,'added in the manage elements tab',1,1,NULL,'2012-03-19 16:47:10','2012-03-19 16:47:10'),(180,'added in the manage elements tab 2',1,1,NULL,'2012-03-19 16:47:32','2012-03-19 16:47:32'),(181,'added in the manage elements tab',1,1,NULL,'2012-03-19 16:56:01','2012-03-19 16:56:01'),(182,'added in the manage elements tab 2',1,1,NULL,'2012-03-19 16:56:26','2012-03-19 16:56:26'),(183,'added in the manage elements tab',1,1,NULL,'2012-03-19 17:16:44','2012-03-19 17:16:44'),(184,'added in the manage elements tab 2',1,1,NULL,'2012-03-19 17:16:53','2012-03-19 17:16:53'),(185,'JD Test Element',1,56,NULL,'2012-03-19 17:23:11','2012-03-19 17:23:11'),(188,'added in the manage elements tab',1,1,1,'2012-03-19 17:51:17','2012-03-19 17:52:10'),(189,'Tasks lists for people and allocation schedules for resources.',1,1,NULL,'2012-03-21 18:15:10','2012-03-21 18:15:10'),(190,'Overview information on how long tasks will take to complete.',1,1,NULL,'2012-03-21 18:15:10','2012-03-21 18:15:10'),(191,'Early warning of any risks to the project.',1,1,NULL,'2012-03-21 18:15:10','2012-03-21 18:15:10'),(192,'Information on workload, for planning holidays.',1,1,NULL,'2012-03-21 18:15:10','2012-03-21 18:15:10'),(193,'Optimum utilization of available resource.',1,1,NULL,'2012-03-21 18:15:10','2012-03-21 18:15:10'),(194,'Cost Maintenance.',1,1,NULL,'2012-03-21 18:15:10','2012-03-21 18:15:10');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupings`
--

DROP TABLE IF EXISTS `groupings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groupings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `company_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupings`
--

LOCK TABLES `groupings` WRITE;
/*!40000 ALTER TABLE `groupings` DISABLE KEYS */;
INSERT INTO `groupings` VALUES (2,'Software Developers','This a a group of all our software developers',1,8,'2011-09-06 19:05:39','2011-12-26 20:17:41',6,11),(3,'Java Developers','This is our java developers',1,2,'2011-09-06 19:07:24','2011-09-06 19:07:24',7,10),(4,'Accountants','This a a group of all our accountants',1,8,'2011-09-06 19:40:15','2011-12-26 20:17:58',12,13),(5,'Test Group',NULL,2,NULL,'2011-10-03 20:18:42','2011-10-03 20:18:42',1,2),(6,'Java J2EE Developers','This a our J2EE dev group.',1,3,'2011-11-03 16:15:57','2011-11-03 16:15:57',8,9),(7,'Calculation Test','Group created for testing the consensus calculation',2,NULL,'2011-11-16 15:27:34','2011-11-16 15:27:34',3,4),(8,'Peoplenetz','This group is for the entire Peoplenetz company',1,NULL,'2011-12-26 20:17:24','2011-12-26 20:17:24',5,32),(10,'Acme5',NULL,4,NULL,'2012-01-13 21:14:37','2012-01-13 21:14:37',33,34),(11,'Integration Testers','This is a group of integration testers',1,8,'2012-01-17 15:18:45','2012-03-12 18:19:23',14,15),(12,'Pnetz_Test',NULL,5,NULL,'2012-01-17 17:58:09','2012-01-17 17:58:09',35,36),(13,'Pnetz_Test',NULL,6,NULL,'2012-01-17 22:25:14','2012-01-17 22:25:14',37,38),(16,'United States',NULL,1,8,'2012-01-18 21:37:04','2012-01-18 21:37:04',16,29),(17,'Automotive',NULL,1,16,'2012-01-18 21:37:04','2012-01-18 21:37:04',17,18),(18,'Retail',NULL,1,16,'2012-01-18 21:37:04','2012-01-18 21:37:04',19,26),(19,'Programmers',NULL,1,18,'2012-01-18 21:37:04','2012-01-18 21:37:04',20,21),(20,'Accountants',NULL,1,18,'2012-01-18 21:37:04','2012-01-18 21:37:04',22,23),(22,'Canada',NULL,1,8,'2012-01-18 23:38:05','2012-01-18 23:38:05',30,31),(23,'LA Tech Park',NULL,6,NULL,'2012-01-23 17:30:35','2012-01-23 17:30:35',39,40),(24,'Software Developers','',1,16,'2012-01-25 19:24:17','2012-01-25 19:24:17',27,28),(25,'Retail consultants','',1,18,'2012-02-17 19:03:41','2012-02-17 19:03:41',24,25);
/*!40000 ALTER TABLE `groupings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupings_users`
--

DROP TABLE IF EXISTS `groupings_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groupings_users` (
  `grouping_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  UNIQUE KEY `index_groupings_users_on_grouping_id_and_user_id` (`grouping_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupings_users`
--

LOCK TABLES `groupings_users` WRITE;
/*!40000 ALTER TABLE `groupings_users` DISABLE KEYS */;
INSERT INTO `groupings_users` VALUES (2,1),(2,4),(2,25),(3,54),(3,55),(3,56),(3,57),(3,61),(4,1),(6,1),(7,18),(7,19),(7,20),(7,21),(7,22),(8,1),(8,3),(8,4),(8,5),(8,25),(8,26),(8,27),(8,28),(8,31),(8,34),(8,52),(8,54),(8,55),(8,56),(8,57),(8,60),(8,61),(8,70),(11,54),(11,55),(11,56),(11,57),(11,61);
/*!40000 ALTER TABLE `groupings_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iteration_lists`
--

DROP TABLE IF EXISTS `iteration_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iteration_lists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iteration_id` int(11) DEFAULT NULL,
  `element_id` int(11) DEFAULT NULL,
  `agreement` float DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `include` tinyint(1) DEFAULT NULL,
  `new_element` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=298 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iteration_lists`
--

LOCK TABLES `iteration_lists` WRITE;
/*!40000 ALTER TABLE `iteration_lists` DISABLE KEYS */;
INSERT INTO `iteration_lists` VALUES (1,1,1,NULL,NULL,NULL,NULL,NULL),(2,1,2,NULL,'2011-09-29 20:18:52','2011-09-29 20:18:52',NULL,NULL),(5,1,22,NULL,'2011-09-30 17:14:06','2011-09-30 17:14:06',NULL,NULL),(7,1,24,NULL,'2011-09-30 19:08:25','2011-09-30 19:08:25',NULL,NULL),(8,1,25,NULL,'2011-09-30 19:11:38','2011-09-30 19:11:38',NULL,NULL),(9,1,26,NULL,'2011-09-30 19:12:08','2011-09-30 19:12:08',NULL,NULL),(11,1,28,NULL,'2011-09-30 19:13:40','2011-09-30 19:13:40',NULL,NULL),(12,1,29,NULL,'2011-09-30 19:14:19','2011-09-30 19:14:19',NULL,NULL),(13,1,30,NULL,'2011-09-30 19:17:29','2011-09-30 19:17:29',NULL,NULL),(14,2,2,40,'2011-10-20 14:15:38','2011-11-15 23:11:44',1,0),(15,2,1,20,'2011-10-28 19:40:18','2011-11-15 19:57:57',0,0),(16,2,22,60,'2011-10-28 19:40:49','2011-11-15 19:57:57',0,0),(17,2,24,80,'2011-10-28 19:42:36','2011-11-15 19:57:57',0,0),(18,2,25,100,'2011-10-28 19:42:57','2011-11-15 19:57:57',0,0),(19,2,26,70,'2011-10-28 19:43:21','2011-11-15 23:11:44',1,0),(20,2,28,50,'2011-10-28 19:44:21','2011-11-15 23:11:44',1,0),(21,2,29,50,'2011-10-28 19:44:42','2011-11-15 23:11:44',1,0),(22,2,30,40,'2011-10-28 19:45:03','2011-11-15 19:57:58',0,0),(23,2,31,0,'2011-10-28 19:45:49','2011-11-15 19:57:58',0,0),(25,2,39,0,'2011-11-09 18:05:57','2011-11-15 19:57:58',0,0),(26,2,40,0,'2011-11-09 18:05:57','2011-11-15 19:57:58',0,0),(27,2,41,0,'2011-11-09 18:05:57','2011-11-15 19:57:58',0,0),(28,2,42,0,'2011-11-09 18:05:57','2011-11-15 19:57:58',0,0),(29,2,43,0,'2011-11-09 18:05:57','2011-11-15 19:57:58',0,0),(30,2,44,0,'2011-11-09 18:05:57','2011-11-15 19:57:58',0,0),(31,3,45,100,'2011-11-11 14:33:21','2011-11-30 20:10:15',0,0),(32,3,46,100,'2011-11-11 14:33:21','2011-11-30 20:10:15',0,0),(33,3,47,100,'2011-11-11 14:33:21','2011-11-30 20:10:16',0,0),(34,3,48,100,'2011-11-11 14:33:21','2011-11-30 20:10:16',0,0),(35,3,49,100,'2011-11-11 14:33:21','2011-11-30 20:10:16',0,0),(36,3,50,100,'2011-11-11 14:33:21','2011-11-30 20:10:16',0,0),(37,9,2,100,'2011-11-16 14:40:03','2011-11-28 22:13:03',0,0),(38,9,26,100,'2011-11-16 14:40:03','2011-11-28 22:13:03',0,0),(39,9,28,100,'2011-11-16 14:40:03','2011-11-28 22:13:03',0,0),(40,9,29,100,'2011-11-16 14:40:03','2011-11-28 22:13:04',0,0),(49,10,65,100,'2011-11-16 22:53:48','2011-11-16 23:52:19',1,0),(50,10,66,100,'2011-11-16 22:53:48','2011-11-16 23:52:19',0,0),(51,10,67,52,'2011-11-16 22:53:48','2011-11-17 17:34:24',1,0),(52,10,68,64,'2011-11-16 22:53:48','2011-11-17 17:42:36',0,0),(53,10,69,72,'2011-11-16 22:53:49','2011-11-17 17:34:25',1,0),(54,10,70,92,'2011-11-16 22:53:49','2011-11-17 00:04:32',1,0),(55,10,71,56,'2011-11-16 22:53:49','2011-11-17 17:34:25',1,0),(56,10,72,80,'2011-11-16 22:53:49','2011-11-16 23:52:19',1,0),(57,12,73,NULL,'2011-12-06 22:37:45','2011-12-06 22:37:45',1,0),(58,12,74,NULL,'2011-12-06 22:37:46','2011-12-06 22:37:46',1,0),(59,12,75,NULL,'2011-12-06 22:37:46','2011-12-06 22:37:46',1,0),(60,12,76,NULL,'2011-12-06 22:37:46','2011-12-06 22:37:46',1,0),(61,12,77,NULL,'2011-12-06 22:37:46','2011-12-06 22:37:46',1,0),(62,12,78,NULL,'2011-12-06 22:37:46','2011-12-06 22:37:46',1,0),(63,18,73,60,'2011-12-06 22:38:07','2011-12-27 19:23:34',1,0),(64,18,74,60,'2011-12-06 22:38:07','2011-12-27 19:23:34',1,0),(65,18,75,80,'2011-12-06 22:38:07','2011-12-27 19:23:34',1,0),(66,18,76,100,'2011-12-06 22:38:07','2011-12-27 19:23:34',1,0),(67,18,77,80,'2011-12-06 22:38:07','2011-12-27 19:23:34',1,0),(68,18,78,60,'2011-12-06 22:38:07','2011-12-27 19:23:34',1,0),(70,18,80,NULL,'2011-12-16 22:12:34','2011-12-16 22:12:34',1,1),(71,5,81,60,'2011-12-19 20:32:41','2011-12-30 17:32:38',1,0),(72,5,82,80,'2011-12-19 20:32:42','2011-12-30 17:33:32',1,0),(73,5,83,60,'2011-12-19 20:32:42','2011-12-30 17:32:39',1,0),(74,5,84,60,'2011-12-19 20:32:42','2011-12-30 17:33:32',1,0),(75,5,85,80,'2011-12-19 20:32:42','2011-12-30 17:32:39',1,0),(76,5,86,60,'2011-12-19 20:32:42','2011-12-30 17:32:39',1,0),(77,19,73,160,'2011-12-27 19:23:43','2011-12-30 17:29:26',1,0),(78,19,74,120,'2011-12-27 19:23:43','2011-12-30 17:29:26',1,0),(79,19,75,160,'2011-12-27 19:23:43','2011-12-30 17:29:26',1,0),(80,19,76,180,'2011-12-27 19:23:43','2011-12-30 17:29:26',1,0),(81,19,77,160,'2011-12-27 19:23:43','2011-12-30 17:29:26',1,0),(82,19,78,160,'2011-12-27 19:23:43','2011-12-30 17:29:26',1,0),(83,19,80,80,'2011-12-27 19:23:43','2011-12-30 17:29:26',1,0),(84,19,87,NULL,'2011-12-27 20:02:50','2011-12-28 22:31:41',0,1),(85,11,88,80,'2011-12-27 21:24:53','2012-01-12 20:48:52',1,0),(86,11,89,60,'2011-12-27 21:24:53','2012-01-12 20:48:52',1,0),(87,11,90,60,'2011-12-27 21:24:53','2012-01-12 20:48:52',1,0),(88,11,91,80,'2011-12-27 21:24:54','2012-01-12 20:48:52',1,0),(89,11,92,100,'2011-12-27 21:24:54','2012-01-12 20:48:52',1,0),(90,11,93,60,'2011-12-27 21:24:54','2012-01-12 20:48:52',1,0),(91,19,94,NULL,'2011-12-27 22:17:14','2011-12-29 15:55:14',1,1),(93,19,96,NULL,'2011-12-28 21:13:55','2011-12-29 15:55:14',1,1),(94,20,81,120,'2011-12-30 17:36:03','2011-12-30 17:36:21',1,0),(95,20,82,160,'2011-12-30 17:36:03','2011-12-30 17:36:21',1,0),(96,20,83,120,'2011-12-30 17:36:03','2011-12-30 17:36:21',1,0),(97,20,84,120,'2011-12-30 17:36:03','2011-12-30 17:36:21',1,0),(98,20,85,160,'2011-12-30 17:36:03','2011-12-30 17:36:21',1,0),(99,20,86,100,'2011-12-30 17:36:04','2011-12-30 17:36:22',1,0),(100,35,73,120,'2012-01-11 17:38:05','2012-01-11 17:49:22',1,0),(101,35,74,120,'2012-01-11 17:38:05','2012-01-11 17:49:22',1,0),(102,35,75,140,'2012-01-11 17:38:05','2012-01-11 17:49:22',1,0),(103,35,76,170,'2012-01-11 17:38:05','2012-01-11 17:49:22',1,0),(104,35,77,150,'2012-01-11 17:38:05','2012-01-11 17:49:22',1,0),(105,35,78,140,'2012-01-11 17:38:05','2012-01-11 17:49:22',1,0),(106,35,80,60,'2012-01-11 17:38:06','2012-01-11 17:49:23',1,0),(107,35,94,60,'2012-01-11 17:38:06','2012-01-11 17:49:23',1,0),(108,35,96,70,'2012-01-11 17:38:06','2012-01-11 17:49:23',1,0),(109,36,88,140,'2012-01-12 20:51:21','2012-01-12 20:52:39',1,0),(110,36,89,120,'2012-01-12 20:51:21','2012-01-12 20:52:39',1,0),(111,36,90,140,'2012-01-12 20:51:21','2012-01-12 20:52:39',1,0),(112,36,91,140,'2012-01-12 20:51:21','2012-01-12 20:52:39',1,0),(113,36,92,160,'2012-01-12 20:51:21','2012-01-12 20:52:39',1,0),(114,36,93,120,'2012-01-12 20:51:21','2012-01-12 20:52:39',1,0),(116,15,99,NULL,'2012-01-12 21:03:46','2012-01-19 23:13:15',1,1),(117,15,100,NULL,'2012-01-12 21:16:30','2012-01-19 23:13:15',1,1),(118,38,73,92,'2012-01-17 00:00:26','2012-01-26 17:21:36',0,0),(119,38,74,92,'2012-01-17 00:00:26','2012-01-26 17:21:36',0,0),(120,38,75,94,'2012-01-17 00:00:27','2012-01-26 17:21:36',0,0),(121,38,76,92,'2012-01-17 00:00:27','2012-01-26 17:21:36',0,0),(122,38,77,94,'2012-01-17 00:00:27','2012-01-26 17:21:36',0,0),(123,38,78,96,'2012-01-17 00:00:27','2012-01-26 17:21:36',0,0),(124,38,80,94,'2012-01-17 00:00:27','2012-01-26 17:21:36',0,0),(125,38,94,92,'2012-01-17 00:00:27','2012-01-26 17:21:36',0,0),(126,38,96,94,'2012-01-17 00:00:27','2012-01-26 17:21:36',0,0),(127,39,88,NULL,'2012-01-17 00:01:38','2012-01-17 00:01:38',1,0),(128,39,89,NULL,'2012-01-17 00:01:38','2012-01-17 00:01:38',1,0),(129,39,90,NULL,'2012-01-17 00:01:38','2012-01-17 00:01:38',1,0),(130,39,91,NULL,'2012-01-17 00:01:38','2012-01-17 00:01:38',1,0),(131,39,92,NULL,'2012-01-17 00:01:38','2012-01-17 00:01:38',1,0),(132,39,93,NULL,'2012-01-17 00:01:38','2012-01-17 00:01:38',1,0),(133,40,73,60,'2012-01-17 00:07:56','2012-02-01 16:18:01',1,0),(134,40,74,60,'2012-01-17 00:07:56','2012-02-01 16:18:01',1,0),(135,40,75,60,'2012-01-17 00:07:56','2012-02-01 16:18:01',1,0),(136,40,76,60,'2012-01-17 00:07:56','2012-02-01 16:18:01',1,0),(137,40,77,100,'2012-01-17 00:07:56','2012-01-26 16:58:56',0,0),(138,40,78,70,'2012-01-17 00:07:56','2012-02-01 16:18:01',1,0),(139,40,80,70,'2012-01-17 00:07:56','2012-02-01 16:18:01',1,0),(140,40,94,60,'2012-01-17 00:07:56','2012-02-01 16:18:01',1,0),(141,40,96,70,'2012-01-17 00:07:56','2012-02-01 16:18:01',1,0),(143,37,102,NULL,'2012-01-17 15:44:39','2012-01-17 15:44:39',1,0),(144,37,103,NULL,'2012-01-17 15:44:40','2012-01-17 15:44:40',1,0),(145,37,104,NULL,'2012-01-17 15:44:40','2012-01-17 15:44:40',1,0),(146,37,105,NULL,'2012-01-17 15:44:40','2012-01-17 15:44:40',1,0),(147,37,106,NULL,'2012-01-17 15:44:40','2012-01-17 15:44:40',1,0),(148,46,81,60,'2012-01-17 21:49:54','2012-03-08 21:03:07',1,0),(149,46,82,60,'2012-01-17 21:49:54','2012-03-08 21:03:07',1,0),(150,46,83,70,'2012-01-17 21:49:54','2012-03-08 21:03:07',1,0),(151,46,84,60,'2012-01-17 21:49:54','2012-03-08 21:03:07',1,0),(152,46,85,60,'2012-01-17 21:49:54','2012-03-08 21:03:07',1,0),(153,46,86,70,'2012-01-17 21:49:54','2012-03-08 21:03:07',1,0),(162,60,109,100,'2012-01-26 17:59:21','2012-01-26 19:36:16',1,0),(163,60,110,100,'2012-01-26 17:59:21','2012-01-26 18:05:58',0,0),(164,60,111,52,'2012-01-26 17:59:21','2012-01-26 19:45:36',1,0),(165,60,112,64,'2012-01-26 17:59:21','2012-01-26 19:51:42',0,0),(166,60,113,72,'2012-01-26 17:59:22','2012-01-26 19:51:42',1,0),(167,60,114,92,'2012-01-26 17:59:22','2012-01-26 19:51:43',1,0),(168,60,115,56,'2012-01-26 17:59:22','2012-01-26 19:51:43',1,0),(169,60,116,80,'2012-01-26 17:59:22','2012-01-26 19:51:43',1,0),(170,61,73,60,'2012-02-01 16:20:59','2012-02-01 16:22:38',1,0),(171,61,74,90,'2012-02-01 16:20:59','2012-02-01 16:22:38',1,0),(172,61,75,90,'2012-02-01 16:20:59','2012-02-01 16:22:38',1,0),(173,61,76,90,'2012-02-01 16:20:59','2012-02-01 16:22:38',1,0),(174,61,78,70,'2012-02-01 16:20:59','2012-02-01 16:22:38',1,0),(175,61,80,90,'2012-02-01 16:20:59','2012-02-01 16:22:38',1,0),(176,61,94,90,'2012-02-01 16:20:59','2012-02-01 16:22:38',1,0),(177,61,96,60,'2012-02-01 16:20:59','2012-02-01 16:22:39',1,0),(178,62,73,NULL,'2012-02-01 16:26:08','2012-02-01 16:26:08',1,0),(179,62,74,NULL,'2012-02-01 16:26:08','2012-02-01 16:26:08',1,0),(180,62,75,NULL,'2012-02-01 16:26:08','2012-02-01 16:26:08',1,0),(181,62,76,NULL,'2012-02-01 16:26:08','2012-02-01 16:26:08',1,0),(182,62,78,NULL,'2012-02-01 16:26:08','2012-02-01 16:26:08',1,0),(183,62,80,NULL,'2012-02-01 16:26:08','2012-02-01 16:26:08',1,0),(184,62,94,NULL,'2012-02-01 16:26:08','2012-02-01 16:26:08',1,0),(185,62,96,NULL,'2012-02-01 16:26:08','2012-02-01 16:26:08',1,0),(186,65,99,NULL,'2012-02-07 15:30:24','2012-02-07 15:30:24',1,0),(187,65,100,NULL,'2012-02-07 15:30:24','2012-02-07 15:30:24',1,0),(188,63,117,60,'2012-02-09 16:50:44','2012-02-16 16:31:25',1,0),(189,63,118,60,'2012-02-09 16:50:44','2012-02-16 16:31:25',1,0),(190,63,119,60,'2012-02-09 16:50:44','2012-02-16 16:31:25',1,0),(191,63,120,80,'2012-02-09 16:50:44','2012-02-16 16:31:26',1,0),(192,63,121,80,'2012-02-09 16:50:44','2012-02-16 16:31:26',1,0),(193,63,122,60,'2012-02-09 16:50:44','2012-02-16 16:31:26',1,0),(194,37,123,NULL,'2012-02-09 21:05:42','2012-02-09 21:05:42',1,0),(211,63,140,NULL,'2012-02-16 16:28:31','2012-02-16 16:28:31',1,1),(212,67,117,80,'2012-02-16 16:40:39','2012-02-16 17:30:11',1,0),(213,67,118,60,'2012-02-16 16:40:39','2012-02-16 17:30:11',1,0),(214,67,119,60,'2012-02-16 16:40:39','2012-02-16 17:30:11',1,0),(215,67,120,60,'2012-02-16 16:40:39','2012-02-16 17:30:11',1,0),(216,67,121,60,'2012-02-16 16:40:39','2012-02-16 17:30:11',1,0),(217,67,122,60,'2012-02-16 16:40:39','2012-02-16 17:30:11',1,0),(218,67,140,60,'2012-02-16 16:40:40','2012-02-16 17:30:11',1,0),(228,44,153,NULL,'2012-02-28 16:05:57','2012-02-28 16:05:57',1,1),(231,62,156,NULL,'2012-03-05 17:05:08','2012-03-05 17:05:08',1,1),(233,62,158,NULL,'2012-03-05 20:52:10','2012-03-05 20:52:10',1,1),(244,62,159,NULL,'2012-03-06 22:44:32','2012-03-06 22:44:32',1,1),(255,46,161,NULL,'2012-03-08 20:58:23','2012-03-08 21:02:48',1,1),(256,46,162,NULL,'2012-03-08 20:59:11','2012-03-08 21:02:48',1,1),(257,73,81,NULL,'2012-03-08 21:03:24','2012-03-08 21:03:24',1,0),(258,73,82,NULL,'2012-03-08 21:03:24','2012-03-08 21:03:24',1,0),(259,73,83,NULL,'2012-03-08 21:03:24','2012-03-08 21:03:24',1,0),(260,73,84,NULL,'2012-03-08 21:03:24','2012-03-08 21:03:24',1,0),(261,73,85,NULL,'2012-03-08 21:03:24','2012-03-08 21:03:24',1,0),(262,73,86,NULL,'2012-03-08 21:03:24','2012-03-08 21:03:24',1,0),(263,73,161,NULL,'2012-03-08 21:03:24','2012-03-08 21:03:24',1,0),(264,73,162,NULL,'2012-03-08 21:03:24','2012-03-08 21:03:24',1,0),(265,77,163,NULL,'2012-03-09 22:14:26','2012-03-09 22:14:26',1,0),(266,77,164,NULL,'2012-03-09 22:14:26','2012-03-09 22:14:26',1,0),(267,77,165,NULL,'2012-03-09 22:14:26','2012-03-09 22:14:26',1,0),(268,77,166,NULL,'2012-03-09 22:14:26','2012-03-09 22:14:26',1,0),(269,77,167,NULL,'2012-03-09 22:14:26','2012-03-09 22:14:26',1,0),(270,77,168,NULL,'2012-03-09 22:14:26','2012-03-09 22:14:26',1,0),(271,41,169,NULL,'2012-03-09 22:29:36','2012-03-09 22:29:36',1,0),(272,41,170,NULL,'2012-03-09 22:29:36','2012-03-09 22:29:36',1,0),(273,41,171,NULL,'2012-03-09 22:29:36','2012-03-09 22:29:36',1,0),(274,41,172,NULL,'2012-03-09 22:29:36','2012-03-09 22:29:36',1,0),(275,41,173,NULL,'2012-03-09 22:29:36','2012-03-09 22:29:36',1,0),(276,41,174,NULL,'2012-03-09 22:29:36','2012-03-09 22:29:36',1,0),(291,85,188,NULL,'2012-03-19 17:51:17','2012-03-20 13:39:50',1,0),(292,13,189,NULL,'2012-03-21 18:15:10','2012-03-21 18:15:10',1,0),(293,13,190,NULL,'2012-03-21 18:15:10','2012-03-21 18:15:10',1,0),(294,13,191,NULL,'2012-03-21 18:15:10','2012-03-21 18:15:10',1,0),(295,13,192,NULL,'2012-03-21 18:15:10','2012-03-21 18:15:10',1,0),(296,13,193,NULL,'2012-03-21 18:15:10','2012-03-21 18:15:10',1,0),(297,13,194,NULL,'2012-03-21 18:15:10','2012-03-21 18:15:10',1,0);
/*!40000 ALTER TABLE `iteration_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iterations`
--

DROP TABLE IF EXISTS `iterations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iterations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` int(11) DEFAULT NULL,
  `consensus` float DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `topic_group_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iterations`
--

LOCK TABLES `iterations` WRITE;
/*!40000 ALTER TABLE `iterations` DISABLE KEYS */;
INSERT INTO `iterations` VALUES (1,1,65,0,8,'2011-09-13 15:48:17','2011-11-08 15:53:33'),(2,2,31.875,0,8,'2011-10-03 20:18:42','2011-11-15 23:11:45'),(3,1,45,0,21,'2011-11-08 14:40:06','2011-12-01 17:55:39'),(4,1,NULL,1,22,'2011-11-08 14:40:06','2011-11-08 14:40:06'),(5,1,66.6667,0,23,'2011-11-08 14:40:06','2011-12-30 17:33:35'),(6,3,NULL,1,2,'2011-11-15 20:51:31','2011-11-15 20:51:31'),(7,3,NULL,1,2,'2011-11-15 22:55:04','2011-11-15 22:55:04'),(8,3,NULL,1,2,'2011-11-15 22:57:31','2011-11-15 22:57:31'),(9,3,0,0,8,'2011-11-16 14:40:02','2011-12-06 17:48:05'),(10,1,69.3333,0,24,'2011-11-16 15:27:55','2011-11-17 17:42:36'),(11,1,73.3333,0,25,'2011-11-30 17:45:12','2012-01-12 20:48:55'),(12,2,60,0,21,'2011-11-30 20:10:24','2011-12-08 14:36:06'),(13,1,0,1,16,'2011-12-01 15:57:06','2011-12-01 15:57:42'),(15,4,0,0,8,'2011-12-06 17:48:12','2012-02-07 15:29:54'),(16,1,NULL,1,26,'2011-12-06 21:09:09','2011-12-06 21:09:09'),(17,1,NULL,1,27,'2011-12-06 21:09:09','2011-12-06 21:09:09'),(18,3,62.8571,0,21,'2011-12-06 22:38:07','2011-12-27 19:23:34'),(19,4,85,0,21,'2011-12-27 19:23:43','2012-03-14 18:59:52'),(20,2,75,0,23,'2011-12-30 17:36:03','2012-03-07 16:20:05'),(27,1,NULL,0,34,'2012-01-09 22:31:23','2012-01-09 22:31:23'),(33,1,NULL,0,40,'2012-01-09 22:55:31','2012-01-09 22:55:31'),(34,1,NULL,0,41,'2012-01-09 22:55:31','2012-01-09 22:55:31'),(35,5,84,0,21,'2012-01-11 17:38:05','2012-03-14 19:00:07'),(36,2,86,0,25,'2012-01-12 20:51:21','2012-03-14 19:00:19'),(37,1,NULL,1,42,'2012-01-16 19:41:52','2012-01-17 15:44:56'),(38,6,0,0,21,'2012-01-17 00:00:26','2012-01-26 17:35:01'),(39,3,0,1,25,'2012-01-17 00:01:38','2012-01-17 00:01:38'),(40,7,63.75,0,21,'2012-01-17 00:07:56','2012-02-01 16:18:02'),(41,1,NULL,1,43,'2012-01-17 17:46:17','2012-03-09 22:30:34'),(42,1,NULL,0,44,'2012-01-17 17:46:17','2012-01-17 17:46:17'),(43,1,NULL,0,45,'2012-01-17 17:46:17','2012-01-17 17:46:17'),(44,1,NULL,1,46,'2012-01-17 17:46:18','2012-02-28 15:00:28'),(45,1,NULL,0,47,'2012-01-17 17:46:18','2012-01-17 17:46:18'),(46,3,63.3333,0,23,'2012-01-17 21:49:54','2012-03-08 21:03:07'),(48,1,NULL,0,48,'2012-01-19 18:07:38','2012-01-19 18:07:38'),(49,1,NULL,0,49,'2012-01-19 18:07:38','2012-01-19 18:07:38'),(50,1,NULL,0,50,'2012-01-19 18:07:38','2012-01-19 18:07:38'),(51,1,NULL,0,51,'2012-01-19 18:07:38','2012-01-19 18:07:38'),(52,1,NULL,0,52,'2012-01-19 18:07:38','2012-01-19 18:07:38'),(53,1,NULL,0,53,'2012-01-19 18:07:38','2012-01-19 18:07:38'),(54,1,NULL,0,54,'2012-01-19 18:07:38','2012-01-19 18:07:38'),(55,1,NULL,0,55,'2012-01-19 18:07:38','2012-01-19 18:07:38'),(56,1,NULL,0,56,'2012-01-19 18:07:38','2012-01-19 18:07:38'),(57,1,NULL,0,57,'2012-01-19 18:07:38','2012-01-19 18:07:38'),(58,1,NULL,0,58,'2012-01-19 18:07:39','2012-01-19 18:07:39'),(59,1,NULL,0,59,'2012-01-25 20:09:31','2012-01-25 20:09:31'),(60,1,69.3333,0,60,'2012-01-26 17:56:16','2012-01-26 20:06:13'),(61,8,80,0,21,'2012-02-01 16:20:59','2012-02-01 16:22:39'),(62,9,0,1,21,'2012-02-01 16:26:08','2012-02-01 16:26:08'),(63,1,66.6667,0,61,'2012-02-06 16:46:54','2012-02-16 16:31:26'),(64,1,NULL,0,62,'2012-02-06 19:32:01','2012-02-06 19:32:01'),(65,5,0,1,8,'2012-02-07 15:30:24','2012-02-07 15:30:24'),(66,1,NULL,0,63,'2012-02-09 16:45:20','2012-02-09 16:45:20'),(67,2,62.8571,0,61,'2012-02-16 16:40:39','2012-02-16 17:30:12'),(68,1,NULL,0,64,'2012-02-17 19:05:00','2012-02-17 19:05:00'),(69,1,NULL,0,65,'2012-02-17 19:05:00','2012-02-17 19:05:00'),(70,1,NULL,0,66,'2012-02-17 19:05:00','2012-02-17 19:05:00'),(71,1,NULL,0,67,'2012-02-29 15:14:45','2012-02-29 15:14:45'),(73,4,0,1,23,'2012-03-08 21:03:24','2012-03-08 21:03:24'),(76,1,NULL,0,70,'2012-03-09 20:31:14','2012-03-09 20:31:14'),(77,1,NULL,1,71,'2012-03-09 20:31:14','2012-03-09 22:15:12'),(85,1,NULL,0,78,'2012-03-19 17:33:04','2012-03-19 17:33:04'),(86,1,NULL,0,79,'2012-03-21 18:46:21','2012-03-21 18:46:21');
/*!40000 ALTER TABLE `iterations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ldap_settings`
--

DROP TABLE IF EXISTS `ldap_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ldap_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `server_address` varchar(255) DEFAULT NULL,
  `port_number` int(11) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `encrypted_password` varchar(255) DEFAULT NULL,
  `root_node` varchar(255) DEFAULT NULL,
  `account_attribute_name` varchar(255) DEFAULT NULL,
  `group_attribute_name` varchar(255) DEFAULT NULL,
  `group_member_attribute` varchar(255) DEFAULT NULL,
  `group_names` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ldap_settings`
--

LOCK TABLES `ldap_settings` WRITE;
/*!40000 ALTER TABLE `ldap_settings` DISABLE KEYS */;
INSERT INTO `ldap_settings` VALUES (1,1,'192.168.1.125',500,'guest','IQ1Sh1a21WyC5GNVsIQlM/+2d0NVu1tFC/ut5vsXnn4=--TdFrCUz2DItTJIlMh294cw==','/q','account','cn','memberOf','Finance','2012-02-23 18:44:09','2012-02-23 18:44:09');
/*!40000 ALTER TABLE `ldap_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'employee','This is the basic role that all users have.','2011-09-05 17:40:26','2011-10-31 20:07:47'),(2,'manager','This role is for user that will manage topics.','2011-09-05 17:41:11','2011-10-31 20:08:37'),(3,'hr','This role is for users that will manage users.','2011-09-05 17:41:51','2011-10-31 20:08:59'),(4,'admin','This role is for users that will manage the application.','2011-09-05 17:42:28','2011-10-31 20:09:16'),(5,'pnetz_admin','This is a super user role for Peoplenetz.','2011-09-05 17:43:12','2011-10-31 20:10:08');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_users`
--

DROP TABLE IF EXISTS `roles_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  UNIQUE KEY `index_roles_users_on_role_id_and_user_id` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_users`
--

LOCK TABLES `roles_users` WRITE;
/*!40000 ALTER TABLE `roles_users` DISABLE KEYS */;
INSERT INTO `roles_users` VALUES (1,1),(1,3),(1,4),(1,5),(1,6),(1,23),(1,24),(1,25),(1,26),(1,28),(1,30),(1,31),(1,34),(1,36),(1,38),(1,49),(1,50),(1,52),(1,54),(1,55),(1,56),(1,57),(1,60),(1,61),(1,70),(2,1),(2,3),(2,4),(2,5),(2,23),(2,25),(2,26),(2,30),(2,31),(2,50),(2,61),(2,70),(3,1),(3,3),(3,4),(3,5),(3,23),(3,25),(3,30),(3,31),(3,38),(3,50),(4,1),(4,4),(4,23),(4,25),(4,30),(4,50),(5,50);
/*!40000 ALTER TABLE `roles_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20110903172921'),('20110903175140'),('20110904212111'),('20110904235548'),('20110905004200'),('20110905170413'),('20110905173337'),('20110906184013'),('20110907160106'),('20110908041448'),('20110908162715'),('20110913154428'),('20110913160511'),('20110913163738'),('20110913164831'),('20110920193356'),('20110920193357'),('20110920204131'),('20110921003347'),('20111001155058'),('20111028215930'),('20111031135013'),('20111102034659'),('20111109223356'),('20111110160943'),('20111114233158'),('20111116220552'),('20111212163415'),('20111220202552'),('20120110052750'),('20120112193027'),('20120112215759'),('20120112220702'),('20120112222903'),('20120112223155'),('20120123165400'),('20120202182300'),('20120207192737'),('20120213151748'),('20120213170319'),('20120214155845'),('20120217185640'),('20120217215131'),('20120217220033'),('20120218212124'),('20120219032839'),('20120221013911'),('20120305151600');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic_groups`
--

DROP TABLE IF EXISTS `topic_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topic_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `goal` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `update_frequency` int(11) DEFAULT NULL,
  `topic_id` int(11) DEFAULT NULL,
  `grouping_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `elements_spreadsheet` varchar(255) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `due_days` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic_groups`
--

LOCK TABLES `topic_groups` WRITE;
/*!40000 ALTER TABLE `topic_groups` DISABLE KEYS */;
INSERT INTO `topic_groups` VALUES (8,'Tablet Purchase: Peoplenetz- Software Developers- Java Developers',80,1,5,4,3,'2011-09-08 15:12:28','2011-12-27 15:35:27',NULL,NULL,NULL),(16,'PM software requirements: Peoplenetz- Software Developers- Java Developers',66,1,NULL,1,3,'2011-10-24 19:44:35','2012-03-06 22:56:38',NULL,'2012-03-23',NULL),(21,'JD Enterprise Consulting May 2012 : Peoplenetz- Software Developers',90,1,60,8,2,'2011-11-08 14:40:06','2012-03-07 16:35:20','spz_test_upload.xls','2012-02-11',4),(22,'JD Enterprise Consulting May 2012 : Peoplenetz- Software Developers- Java Developers',90,1,NULL,8,3,'2011-11-08 14:40:06','2012-03-07 16:35:20',NULL,NULL,NULL),(23,'JD Enterprise Consulting May 2012 : Peoplenetz- Software Developers- Java Developers- Java J2EE Developers',90,1,NULL,8,6,'2011-11-08 14:40:06','2012-03-07 16:35:20','spz_test_upload.xls',NULL,NULL),(24,'Calculation Test: Calculation Test',90,1,NULL,9,7,'2011-11-16 15:27:55','2011-11-16 22:53:48','spz_calculation_test_elements.xls',NULL,NULL),(25,'Accounting skills: Peoplenetz- Software Developers- Java Developers',50,1,50,3,3,'2011-11-30 17:45:12','2012-01-25 16:07:26','spz_test_upload.xls',NULL,NULL),(26,'JD Test Topic: Peoplenetz- Software Developers',95,1,NULL,6,2,'2011-12-06 21:09:09','2012-01-17 15:37:19',NULL,NULL,NULL),(27,'JD Test Topic: Peoplenetz- Accountants',95,1,NULL,6,4,'2011-12-06 21:09:09','2012-01-17 15:37:19',NULL,NULL,NULL),(34,'Tablet Purchase: Peoplenetz- Accountants',80,1,NULL,4,4,'2012-01-09 22:31:23','2012-01-09 22:31:23',NULL,NULL,NULL),(40,'Error catching test2: Peoplenetz- Software Developers',90,1,NULL,24,2,'2012-01-09 22:55:31','2012-02-06 19:29:48',NULL,NULL,NULL),(41,'Error catching test2: Peoplenetz- Software Developers- Java Developers',90,1,NULL,24,3,'2012-01-09 22:55:31','2012-02-06 19:29:48',NULL,NULL,NULL),(42,'JD Internal Topic 16 Jan 2012: Peoplenetz- Software Developers- Java Developers- Java J2EE Developers',50,1,NULL,25,6,'2012-01-16 19:41:52','2012-03-07 16:11:56','spz_test_upload.xls',NULL,NULL),(43,'Game Development: Peoplenetz- Software Developers',90,1,NULL,27,2,'2012-01-17 17:46:17','2012-01-17 17:46:17',NULL,NULL,NULL),(44,'Game Development: Peoplenetz- Software Developers- Java Developers',90,1,NULL,27,3,'2012-01-17 17:46:17','2012-01-17 17:46:17',NULL,NULL,NULL),(45,'Game Development: Peoplenetz- Software Developers- Java Developers- Java J2EE Developers',90,1,NULL,27,6,'2012-01-17 17:46:17','2012-01-17 17:46:17',NULL,NULL,NULL),(46,'Game Development: Peoplenetz- Accountants',90,1,NULL,27,4,'2012-01-17 17:46:17','2012-01-17 17:46:17',NULL,NULL,NULL),(47,'Game Development: Peoplenetz- test group',90,1,NULL,27,11,'2012-01-17 17:46:18','2012-01-17 17:46:18',NULL,NULL,NULL),(48,'Facebook Marketing: Peoplenetz- Software Developers',90,1,NULL,29,2,'2012-01-19 18:07:38','2012-01-19 18:07:38',NULL,NULL,NULL),(49,'Facebook Marketing: Peoplenetz- Software Developers- Java Developers',90,1,NULL,29,3,'2012-01-19 18:07:38','2012-01-19 18:07:38',NULL,NULL,NULL),(50,'Facebook Marketing: Peoplenetz- Software Developers- Java Developers- Java J2EE Developers',90,1,NULL,29,6,'2012-01-19 18:07:38','2012-01-19 18:07:38',NULL,NULL,NULL),(51,'Facebook Marketing: Peoplenetz- Accountants',90,1,NULL,29,4,'2012-01-19 18:07:38','2012-02-03 16:23:59',NULL,'2012-02-03',NULL),(52,'Facebook Marketing: Peoplenetz- test group',90,1,NULL,29,11,'2012-01-19 18:07:38','2012-01-19 18:07:38',NULL,NULL,NULL),(53,'Facebook Marketing: Peoplenetz- United States',90,1,NULL,29,16,'2012-01-19 18:07:38','2012-01-19 18:07:38',NULL,NULL,NULL),(54,'Facebook Marketing: Peoplenetz- United States- Automotive',90,1,NULL,29,17,'2012-01-19 18:07:38','2012-01-19 18:07:38',NULL,NULL,NULL),(55,'Facebook Marketing: Peoplenetz- United States- Retail',90,1,NULL,29,18,'2012-01-19 18:07:38','2012-01-19 18:07:38',NULL,NULL,NULL),(56,'Facebook Marketing: Peoplenetz- United States- Retail- Programmers',90,1,NULL,29,19,'2012-01-19 18:07:38','2012-01-19 18:07:38',NULL,NULL,NULL),(57,'Facebook Marketing: Peoplenetz- United States- Retail- Accountants',90,1,NULL,29,20,'2012-01-19 18:07:38','2012-01-19 18:07:38',NULL,NULL,NULL),(58,'Facebook Marketing: Peoplenetz- Canada',90,1,NULL,29,22,'2012-01-19 18:07:39','2012-01-19 18:07:39',NULL,NULL,NULL),(59,'JD Test Topic 25 Jan 2012: Peoplenetz- test group',85,1,NULL,30,11,'2012-01-25 20:09:31','2012-01-25 20:09:31',NULL,NULL,NULL),(60,'Calculation Test: Peoplenetz- test group',85,1,NULL,31,11,'2012-01-26 17:56:16','2012-01-26 17:56:16',NULL,NULL,NULL),(61,'PM software requirements: Peoplenetz',66,1,NULL,1,8,'2012-02-06 16:46:54','2012-02-07 22:08:18',NULL,'2012-02-23',7),(62,'test: Peoplenetz',55,1,NULL,32,8,'2012-02-06 19:32:01','2012-02-06 19:32:01',NULL,NULL,NULL),(63,'JD Enterprise Consulting Requirements: Peoplenetz- Software Developers',80,1,NULL,33,2,'2012-02-09 16:45:20','2012-03-07 16:32:22',NULL,NULL,NULL),(64,'JD Enterprise Consultation: Peoplenetz- Software Developers',85,1,NULL,34,2,'2012-02-17 19:05:00','2012-03-07 16:11:29',NULL,NULL,NULL),(65,'JD Enterprise Consultation: Peoplenetz- United States- Retail- Programmers',85,1,NULL,34,19,'2012-02-17 19:05:00','2012-03-07 16:11:29',NULL,NULL,NULL),(66,'JD Enterprise Consultation: Peoplenetz- Canada',85,1,NULL,34,22,'2012-02-17 19:05:00','2012-03-07 16:11:29',NULL,NULL,NULL),(67,'Wow: Peoplenetz- United States- Automotive',60,1,NULL,26,17,'2012-02-29 15:14:45','2012-02-29 17:38:03',NULL,NULL,NULL),(70,'Project Management Software Requirements: Peoplenetz- Software Developers',85,1,NULL,37,2,'2012-03-09 20:31:14','2012-03-09 20:31:14',NULL,NULL,NULL),(71,'Project Management Software Requirements: Peoplenetz- Accountants',85,1,NULL,37,4,'2012-03-09 20:31:14','2012-03-09 20:36:29',NULL,'2012-03-23',NULL),(78,'Dinner Party: Peoplenetz- Software Developers',85,1,90,43,2,'2012-03-19 17:33:04','2012-03-21 18:46:21',NULL,'2012-03-21',3),(79,'Dinner Party: Peoplenetz- Software Developers- Java Developers- Java J2EE Developers',85,1,90,43,6,'2012-03-21 18:46:21','2012-03-21 18:46:21',NULL,'2012-03-21',3);
/*!40000 ALTER TABLE `topic_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topics`
--

DROP TABLE IF EXISTS `topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `status` int(11) DEFAULT '1',
  `update_frequency` int(11) DEFAULT NULL,
  `due_days` int(11) DEFAULT NULL,
  `opt_out` tinyint(1) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `goal` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topics`
--

LOCK TABLES `topics` WRITE;
/*!40000 ALTER TABLE `topics` DISABLE KEYS */;
INSERT INTO `topics` VALUES (1,'PM software requirements','This topic is to identify the software requirements for a new project management application.',1,90,5,0,1,'2011-09-05 17:47:05','2012-03-06 22:57:07',66),(3,'Accounting skills','Here are some skills',1,90,7,1,1,'2011-09-07 20:38:52','2012-02-06 16:50:23',50),(4,'Tablet Purchase','We need tablet pcs for the sales department.',2,50,5,0,1,'2011-09-08 14:52:57','2012-01-19 22:17:05',80),(5,'Test Topic','This is a test topic',NULL,NULL,NULL,NULL,2,'2011-10-03 20:18:42','2011-10-03 20:18:42',NULL),(6,'JD Test Topic','This is a test topic on 25Oct2011.',1,90,5,0,1,'2011-10-25 18:58:32','2012-01-17 15:37:19',95),(7,'28 Oct Test','this is a test on 28 Oct 2011.',1,90,7,0,1,'2011-10-28 15:12:11','2011-10-28 15:12:11',NULL),(8,'JD Enterprise Consulting May 2012 ','The purpose of this topic is to gather requirements for the JD Enterprise consulting engagement.',1,60,7,0,1,'2011-11-08 14:39:52','2012-03-07 16:35:20',90),(9,'Calculation Test','Topic created to test the consensus calculation.',1,90,7,0,2,'2011-11-16 15:24:51','2011-11-16 15:24:51',NULL),(24,'Error catching test2','',1,NULL,NULL,0,1,'2012-01-09 22:48:43','2012-02-06 19:29:48',90),(25,'JD Internal Topic 16 Jan 2012','This is a topic created 16 Jan 2012.',1,90,7,1,1,'2012-01-16 19:41:52','2012-03-07 16:11:56',50),(26,'Wow','This is a description.',1,NULL,NULL,0,1,'2012-01-17 15:37:52','2012-02-29 17:37:48',60),(27,'Game Development','We want to develop a Facebook game for marketing a new product.',1,90,9,1,1,'2012-01-17 17:46:17','2012-01-17 17:46:17',90),(28,'Joe','',1,NULL,NULL,0,1,'2012-01-19 16:27:36','2012-01-19 16:27:36',90),(29,'Facebook Marketing','',1,NULL,NULL,0,1,'2012-01-19 18:07:38','2012-01-19 18:07:38',90),(30,'JD Test Topic 25 Jan 2012','',1,NULL,NULL,0,1,'2012-01-25 20:09:31','2012-01-25 20:09:31',85),(31,'Calculation Test','',1,NULL,NULL,0,1,'2012-01-26 17:56:16','2012-01-26 17:56:16',85),(32,'test','',2,NULL,NULL,0,1,'2012-02-06 19:31:18','2012-02-06 19:32:35',55),(33,'JD Enterprise Consulting Requirements','The purpose of this topic is to gather requirements associated with our consulting engagement with JD Enterprise.',1,NULL,NULL,0,1,'2012-02-09 16:45:20','2012-03-07 16:32:22',80),(34,'JD Enterprise Consultation','',1,NULL,NULL,0,1,'2012-02-17 19:05:00','2012-03-07 16:11:29',85),(35,'new2','',1,1,1,0,1,'2012-02-29 18:00:40','2012-02-29 18:00:40',100),(37,'Project Management Software Requirements','The purpose of this topic is to collect the requirements for selecting our new project management software.',1,NULL,7,0,1,'2012-03-09 20:31:14','2012-03-09 20:31:14',85),(43,'Dinner Party','',1,90,3,0,1,'2012-03-19 17:33:03','2012-03-21 18:45:43',85);
/*!40000 ALTER TABLE `topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_element_attribute_lists`
--

DROP TABLE IF EXISTS `user_element_attribute_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_element_attribute_lists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `element_attribute_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `encoded_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_element_attribute_lists`
--

LOCK TABLES `user_element_attribute_lists` WRITE;
/*!40000 ALTER TABLE `user_element_attribute_lists` DISABLE KEYS */;
INSERT INTO `user_element_attribute_lists` VALUES (4,1,23,'2012-02-17 23:33:12','2012-03-08 16:01:01','--- \"14\"\n'),(5,1,24,'2012-02-17 23:33:12','2012-03-06 20:00:44','--- \"2\"\n'),(6,1,16,'2012-02-17 23:33:12','2012-02-17 23:33:59','--- I feel good\n'),(7,1,17,'2012-02-17 23:33:12','2012-02-17 23:33:59','--- \"75\"\n'),(8,1,18,'2012-02-17 23:33:12','2012-02-17 23:33:59','--- \"30\"\n'),(9,1,22,'2012-02-17 23:33:12','2012-02-17 23:33:59','--- \"20.95\"\n'),(12,1,27,'2012-03-06 18:53:12','2012-03-06 18:53:12','--- \"2\"\n'),(13,1,33,'2012-03-08 16:03:25','2012-03-08 20:41:32','--- \"16\"\n');
/*!40000 ALTER TABLE `user_element_attribute_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_lists`
--

DROP TABLE IF EXISTS `user_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_lists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `element_id` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `iteration_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=270 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_lists`
--

LOCK TABLES `user_lists` WRITE;
/*!40000 ALTER TABLE `user_lists` DISABLE KEYS */;
INSERT INTO `user_lists` VALUES (1,1,30,3,1,'2011-10-05 16:46:54','2011-10-05 16:46:54'),(11,1,1,1,1,'2011-10-06 21:25:05','2011-10-06 21:25:05'),(12,1,2,2,1,'2011-10-06 21:25:05','2011-10-06 21:25:05'),(13,1,22,3,1,'2011-10-06 21:25:05','2011-10-06 21:25:05'),(14,1,24,4,1,'2011-10-06 21:25:05','2011-10-06 21:25:05'),(15,1,25,5,1,'2011-10-06 21:25:05','2011-10-06 21:25:05'),(16,1,26,4,1,'2011-10-06 21:25:05','2011-10-06 21:25:05'),(17,1,28,3,1,'2011-10-06 21:25:05','2011-10-06 21:25:05'),(18,1,29,2,1,'2011-10-06 21:25:05','2011-10-06 21:25:05'),(19,1,30,1,1,'2011-10-06 21:25:05','2011-10-06 21:25:05'),(20,1,29,3,2,'2011-11-15 16:04:17','2011-11-15 16:04:17'),(21,1,28,2,2,'2011-11-15 16:04:17','2011-11-15 16:04:17'),(22,1,26,3,2,'2011-11-15 16:04:17','2011-11-15 16:04:17'),(23,1,2,2,2,'2011-11-15 16:04:17','2011-11-15 16:04:17'),(52,18,65,5,10,'2011-11-16 23:03:24','2011-11-16 23:03:24'),(53,18,67,3,10,'2011-11-16 23:03:24','2011-11-16 23:03:24'),(54,18,68,4,10,'2011-11-16 23:03:24','2011-11-16 23:03:24'),(55,18,69,4,10,'2011-11-16 23:03:24','2011-11-16 23:03:24'),(56,18,70,5,10,'2011-11-16 23:03:24','2011-11-16 23:03:24'),(57,18,71,5,10,'2011-11-16 23:03:24','2011-11-16 23:03:24'),(58,18,72,4,10,'2011-11-16 23:03:25','2011-11-16 23:03:25'),(59,19,65,5,10,'2011-11-16 23:21:04','2011-11-16 23:21:04'),(60,19,67,3,10,'2011-11-16 23:21:04','2011-11-16 23:21:04'),(61,19,68,5,10,'2011-11-16 23:21:05','2011-11-16 23:21:05'),(62,19,69,5,10,'2011-11-16 23:21:05','2011-11-16 23:21:05'),(63,19,70,4,10,'2011-11-16 23:21:05','2011-11-16 23:21:05'),(64,19,72,4,10,'2011-11-16 23:21:05','2011-11-16 23:21:05'),(65,20,65,5,10,'2011-11-16 23:23:28','2011-11-16 23:23:28'),(66,20,67,3,10,'2011-11-16 23:23:28','2011-11-16 23:23:28'),(67,20,69,4,10,'2011-11-16 23:23:29','2011-11-16 23:23:29'),(68,20,70,5,10,'2011-11-16 23:23:29','2011-11-16 23:23:29'),(69,20,71,5,10,'2011-11-16 23:23:29','2011-11-16 23:23:29'),(70,20,72,4,10,'2011-11-16 23:23:29','2011-11-16 23:23:29'),(71,21,65,5,10,'2011-11-16 23:24:38','2011-11-16 23:24:38'),(72,21,67,3,10,'2011-11-16 23:24:38','2011-11-16 23:24:38'),(73,21,70,5,10,'2011-11-16 23:24:38','2011-11-16 23:24:38'),(74,21,72,4,10,'2011-11-16 23:24:38','2011-11-16 23:24:38'),(75,22,65,5,10,'2011-11-16 23:25:59','2011-11-16 23:25:59'),(76,22,69,5,10,'2011-11-16 23:26:00','2011-11-16 23:26:00'),(77,22,70,4,10,'2011-11-16 23:26:00','2011-11-16 23:26:00'),(78,22,71,4,10,'2011-11-16 23:26:00','2011-11-16 23:26:00'),(79,22,72,4,10,'2011-11-16 23:26:00','2011-11-16 23:26:00'),(90,1,78,3,18,'2011-12-16 22:12:34','2011-12-16 22:12:34'),(91,1,75,4,18,'2011-12-16 22:12:34','2011-12-16 22:12:34'),(92,1,76,5,18,'2011-12-16 22:12:34','2011-12-16 22:12:34'),(93,1,77,4,18,'2011-12-16 22:12:35','2011-12-16 22:12:35'),(94,1,74,3,18,'2011-12-16 22:12:35','2011-12-16 22:12:35'),(95,1,73,3,18,'2011-12-16 22:12:35','2011-12-16 22:12:35'),(96,1,78,5,19,'2011-12-27 20:02:50','2011-12-29 18:44:44'),(97,1,75,4,19,'2011-12-27 20:02:50','2011-12-29 18:44:44'),(98,1,76,4,19,'2011-12-27 20:02:50','2011-12-29 18:44:44'),(99,1,80,4,19,'2011-12-27 20:02:50','2011-12-29 18:44:44'),(100,1,77,4,19,'2011-12-27 20:02:50','2011-12-29 18:44:44'),(101,1,74,3,19,'2011-12-27 20:02:50','2011-12-29 18:44:44'),(102,1,73,5,19,'2011-12-29 18:44:44','2011-12-29 18:44:44'),(103,1,86,3,5,'2011-12-30 17:32:38','2011-12-30 17:33:32'),(104,1,83,3,5,'2011-12-30 17:32:38','2011-12-30 17:33:32'),(105,1,84,3,5,'2011-12-30 17:32:38','2011-12-30 17:33:32'),(106,1,85,4,5,'2011-12-30 17:32:38','2011-12-30 17:33:32'),(107,1,82,4,5,'2011-12-30 17:32:38','2011-12-30 17:33:32'),(108,1,81,3,5,'2011-12-30 17:32:38','2011-12-30 17:33:32'),(109,1,86,2,20,'2011-12-30 17:36:21','2011-12-30 17:36:21'),(110,1,83,3,20,'2011-12-30 17:36:21','2011-12-30 17:36:21'),(111,1,84,3,20,'2011-12-30 17:36:21','2011-12-30 17:36:21'),(112,1,85,4,20,'2011-12-30 17:36:21','2011-12-30 17:36:21'),(113,1,82,4,20,'2011-12-30 17:36:21','2011-12-30 17:36:21'),(114,1,81,3,20,'2011-12-30 17:36:21','2011-12-30 17:36:21'),(115,1,78,3,35,'2012-01-11 17:38:33','2012-01-11 17:38:33'),(116,1,75,3,35,'2012-01-11 17:38:33','2012-01-11 17:38:33'),(117,1,94,3,35,'2012-01-11 17:38:33','2012-01-11 17:38:33'),(118,1,76,4,35,'2012-01-11 17:38:33','2012-01-11 17:38:33'),(119,1,80,2,35,'2012-01-11 17:38:33','2012-01-11 17:38:33'),(120,1,77,3,35,'2012-01-11 17:38:33','2012-01-11 17:38:33'),(121,1,74,3,35,'2012-01-11 17:38:33','2012-01-11 17:38:33'),(122,1,73,2,35,'2012-01-11 17:38:33','2012-01-11 17:38:33'),(123,4,78,3,35,'2012-01-11 17:49:22','2012-01-11 17:49:22'),(124,4,75,3,35,'2012-01-11 17:49:22','2012-01-11 17:49:22'),(125,4,94,3,35,'2012-01-11 17:49:22','2012-01-11 17:49:22'),(126,4,76,4,35,'2012-01-11 17:49:22','2012-01-11 17:49:22'),(127,4,96,3,35,'2012-01-11 17:49:22','2012-01-11 17:49:22'),(128,4,77,4,35,'2012-01-11 17:49:22','2012-01-11 17:49:22'),(129,4,74,3,35,'2012-01-11 17:49:22','2012-01-11 17:49:22'),(130,4,73,2,35,'2012-01-11 17:49:22','2012-01-11 17:49:22'),(131,1,93,3,11,'2012-01-12 20:48:51','2012-01-12 20:48:51'),(132,1,90,3,11,'2012-01-12 20:48:51','2012-01-12 20:48:51'),(133,1,91,4,11,'2012-01-12 20:48:51','2012-01-12 20:48:51'),(134,1,92,5,11,'2012-01-12 20:48:51','2012-01-12 20:48:51'),(135,1,89,3,11,'2012-01-12 20:48:51','2012-01-12 20:48:51'),(136,1,88,4,11,'2012-01-12 20:48:51','2012-01-12 20:48:51'),(137,1,93,3,36,'2012-01-12 20:52:38','2012-01-12 20:52:38'),(138,1,90,4,36,'2012-01-12 20:52:38','2012-01-12 20:52:38'),(139,1,91,3,36,'2012-01-12 20:52:38','2012-01-12 20:52:38'),(140,1,92,3,36,'2012-01-12 20:52:38','2012-01-12 20:52:38'),(141,1,89,3,36,'2012-01-12 20:52:38','2012-01-12 20:52:38'),(142,1,88,3,36,'2012-01-12 20:52:38','2012-01-12 20:52:38'),(143,1,100,0,15,'2012-01-12 21:16:30','2012-01-12 21:16:30'),(144,1,78,2,38,'2012-01-17 00:00:52','2012-01-17 00:00:52'),(145,1,75,3,38,'2012-01-17 00:00:52','2012-01-17 00:00:52'),(146,1,94,4,38,'2012-01-17 00:00:52','2012-01-17 00:00:52'),(147,1,76,4,38,'2012-01-17 00:00:52','2012-01-17 00:00:52'),(148,1,96,3,38,'2012-01-17 00:00:52','2012-01-17 00:00:52'),(149,1,80,3,38,'2012-01-17 00:00:52','2012-01-17 00:00:52'),(150,1,77,3,38,'2012-01-17 00:00:52','2012-01-17 00:00:52'),(151,1,74,4,38,'2012-01-17 00:00:52','2012-01-17 00:00:52'),(152,1,73,4,38,'2012-01-17 00:00:52','2012-01-17 00:00:52'),(153,1,86,3,46,'2012-01-17 21:55:56','2012-03-08 20:59:25'),(154,1,83,3,46,'2012-01-17 21:55:56','2012-03-08 20:59:25'),(155,1,85,4,46,'2012-01-17 21:55:57','2012-03-08 20:59:25'),(156,1,82,4,46,'2012-01-17 21:55:57','2012-03-08 20:59:25'),(157,1,81,4,46,'2012-01-17 21:55:57','2012-03-08 20:59:25'),(165,54,109,5,60,'2012-01-26 18:02:38','2012-01-26 18:02:38'),(166,54,111,3,60,'2012-01-26 18:02:38','2012-01-26 18:02:38'),(167,54,112,5,60,'2012-01-26 18:02:38','2012-01-26 18:02:38'),(168,54,113,5,60,'2012-01-26 18:02:38','2012-01-26 18:02:38'),(169,54,114,4,60,'2012-01-26 18:02:38','2012-01-26 18:02:38'),(170,54,116,4,60,'2012-01-26 18:02:38','2012-01-26 18:02:38'),(171,55,109,5,60,'2012-01-26 18:03:36','2012-01-26 18:03:36'),(172,55,111,3,60,'2012-01-26 18:03:36','2012-01-26 18:03:36'),(173,55,113,4,60,'2012-01-26 18:03:36','2012-01-26 18:03:36'),(174,55,114,5,60,'2012-01-26 18:03:36','2012-01-26 18:03:36'),(175,55,115,5,60,'2012-01-26 18:03:36','2012-01-26 18:03:36'),(176,55,116,4,60,'2012-01-26 18:03:36','2012-01-26 18:03:36'),(177,56,109,5,60,'2012-01-26 18:04:31','2012-01-26 18:04:31'),(178,56,111,3,60,'2012-01-26 18:04:31','2012-01-26 18:04:31'),(179,56,114,5,60,'2012-01-26 18:04:31','2012-01-26 18:04:31'),(180,56,116,4,60,'2012-01-26 18:04:31','2012-01-26 18:04:31'),(181,57,109,5,60,'2012-01-26 18:05:58','2012-01-26 20:06:10'),(182,57,113,5,60,'2012-01-26 18:05:58','2012-01-26 20:06:10'),(183,57,114,4,60,'2012-01-26 18:05:58','2012-01-26 20:06:10'),(184,57,115,4,60,'2012-01-26 18:05:58','2012-01-26 20:06:10'),(185,57,116,4,60,'2012-01-26 18:05:58','2012-01-26 20:06:10'),(186,1,78,3,40,'2012-02-01 16:17:10','2012-02-01 16:17:10'),(187,1,75,3,40,'2012-02-01 16:17:10','2012-02-01 16:17:10'),(188,1,94,4,40,'2012-02-01 16:17:10','2012-02-01 16:17:10'),(189,1,76,4,40,'2012-02-01 16:17:10','2012-02-01 16:17:10'),(190,1,96,3,40,'2012-02-01 16:17:10','2012-02-01 16:17:10'),(191,1,80,3,40,'2012-02-01 16:17:10','2012-02-01 16:17:10'),(192,1,74,4,40,'2012-02-01 16:17:10','2012-02-01 16:17:10'),(193,1,73,4,40,'2012-02-01 16:17:10','2012-02-01 16:17:10'),(194,4,78,4,40,'2012-02-01 16:17:58','2012-02-01 16:17:58'),(195,4,75,3,40,'2012-02-01 16:17:58','2012-02-01 16:17:58'),(196,1,78,2,61,'2012-02-01 16:21:52','2012-02-01 16:21:52'),(197,1,96,3,61,'2012-02-01 16:21:52','2012-02-01 16:21:52'),(198,1,73,5,61,'2012-02-01 16:21:52','2012-02-01 16:21:52'),(199,4,78,1,61,'2012-02-01 16:22:36','2012-02-01 16:22:36'),(200,4,75,1,61,'2012-02-01 16:22:36','2012-02-01 16:22:36'),(201,4,94,1,61,'2012-02-01 16:22:36','2012-02-01 16:22:36'),(202,4,76,1,61,'2012-02-01 16:22:36','2012-02-01 16:22:36'),(203,4,96,1,61,'2012-02-01 16:22:36','2012-02-01 16:22:36'),(204,4,80,1,61,'2012-02-01 16:22:36','2012-02-01 16:22:36'),(205,4,74,1,61,'2012-02-01 16:22:36','2012-02-01 16:22:36'),(206,4,73,1,61,'2012-02-01 16:22:36','2012-02-01 16:22:36'),(213,1,122,3,63,'2012-02-16 16:31:25','2012-02-16 16:31:25'),(214,1,119,3,63,'2012-02-16 16:31:25','2012-02-16 16:31:25'),(215,1,120,4,63,'2012-02-16 16:31:25','2012-02-16 16:31:25'),(216,1,121,4,63,'2012-02-16 16:31:25','2012-02-16 16:31:25'),(217,1,118,3,63,'2012-02-16 16:31:25','2012-02-16 16:31:25'),(218,1,117,3,63,'2012-02-16 16:31:25','2012-02-16 16:31:25'),(219,1,140,3,67,'2012-02-16 17:30:11','2012-02-16 17:30:11'),(220,1,122,3,67,'2012-02-16 17:30:11','2012-02-16 17:30:11'),(221,1,119,3,67,'2012-02-16 17:30:11','2012-02-16 17:30:11'),(222,1,120,2,67,'2012-02-16 17:30:11','2012-02-16 17:30:11'),(223,1,121,2,67,'2012-02-16 17:30:11','2012-02-16 17:30:11'),(224,1,118,2,67,'2012-02-16 17:30:11','2012-02-16 17:30:11'),(225,1,117,4,67,'2012-02-16 17:30:11','2012-02-16 17:30:11'),(235,1,84,4,46,'2012-03-08 20:59:25','2012-03-08 20:59:25'),(236,1,86,4,73,'2012-03-08 21:04:56','2012-03-15 16:25:55'),(237,1,82,4,73,'2012-03-08 21:04:56','2012-03-15 16:25:56'),(238,1,162,5,73,'2012-03-08 21:04:56','2012-03-15 16:25:56'),(239,1,83,4,73,'2012-03-08 21:04:56','2012-03-15 16:25:56'),(240,1,84,3,73,'2012-03-08 21:04:56','2012-03-15 16:25:56'),(241,1,85,4,73,'2012-03-08 21:04:56','2012-03-15 16:25:56'),(242,1,161,3,73,'2012-03-08 21:04:56','2012-03-15 16:25:56'),(243,1,81,4,73,'2012-03-08 21:04:56','2012-03-15 16:25:56'),(244,1,168,4,77,'2012-03-09 22:15:37','2012-03-09 22:15:37'),(245,1,165,3,77,'2012-03-09 22:15:37','2012-03-09 22:15:37'),(246,1,166,3,77,'2012-03-09 22:15:37','2012-03-09 22:15:37'),(247,1,167,3,77,'2012-03-09 22:15:37','2012-03-09 22:15:37'),(248,1,164,4,77,'2012-03-09 22:15:37','2012-03-09 22:15:37'),(249,1,163,2,77,'2012-03-09 22:15:37','2012-03-09 22:15:37'),(250,1,174,4,41,'2012-03-09 22:31:02','2012-03-09 22:31:02'),(251,1,171,3,41,'2012-03-09 22:31:02','2012-03-09 22:31:02'),(252,1,172,3,41,'2012-03-09 22:31:02','2012-03-09 22:31:02'),(253,1,173,4,41,'2012-03-09 22:31:02','2012-03-09 22:31:02'),(254,1,170,3,41,'2012-03-09 22:31:02','2012-03-09 22:31:02'),(255,1,169,4,41,'2012-03-09 22:31:02','2012-03-09 22:31:02'),(269,1,188,0,85,'2012-03-19 17:51:17','2012-03-19 17:51:17');
/*!40000 ALTER TABLE `user_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `encrypted_password` varchar(255) DEFAULT NULL,
  `password_salt` varchar(255) DEFAULT NULL,
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `encryptor` varchar(255) DEFAULT NULL,
  `pepper` varchar(255) DEFAULT NULL,
  `rpx_identifier` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'James','Davis','jdavis@peoplenetz.com',1,'2011-09-05 17:44:44','2012-03-21 17:38:18',1,'$2a$10$dbdxYHbq6Sxu98vq79He0uUeVni1M4XGlfSmPO9T1abdpVFQc3.Z2',NULL,NULL,NULL,NULL,201,'2012-03-19 17:23:37','2012-03-19 14:03:02','127.0.0.1','127.0.0.1',NULL,NULL,'http://www.linkedin.com/profile?viewProfile=kzzBqUSc-q','specializ.png'),(2,'Michael','Harrison','mharrison@peoplenetz.com',1,'2011-09-22 20:10:11','2011-09-22 20:10:11',1,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'John','Lowe, III','jlowe@peoplenetz.com',1,'2011-09-22 20:10:53','2011-12-21 21:02:31',1,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'Sarah','Davis','sdavis@peoplenetz.com',1,'2011-09-22 20:11:21','2012-02-09 16:34:22',1,'$2a$10$x/1GB/fWWr5p5gK3tu6eXuSo3A9EdJgg6ww94wQlrirXy2KVCEqEu',NULL,'Dlrnpv32vsodBLK0kzMc','2012-02-09 16:34:22',NULL,4,'2012-02-01 16:22:15','2012-02-01 16:17:36','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL),(5,'Brittany','Harrison','bharrison@peoplenetz.com',1,'2011-09-22 20:11:50','2011-09-22 20:11:50',1,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'Joe','Smith, Jr','jsmith@peoplenetz.com',1,'2011-09-22 20:12:22','2011-12-21 21:02:15',1,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'Johnny','Test','jtest@test.com',1,'2011-10-03 20:18:42','2011-10-03 20:18:42',2,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,'Employee','One','one@example.com',1,'2011-11-16 14:54:58','2011-11-17 00:04:19',2,'$2a$10$enXDZq.oxf7Ko/5XPCnOGuGKOSaaHddVHoEWAVjxCLPr2rZkWdBTS',NULL,NULL,NULL,NULL,6,'2011-11-17 00:04:19','2011-11-16 23:26:22','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL),(19,'Employee','Two','two@example.com',1,'2011-11-16 14:57:08','2011-11-16 23:20:23',2,'$2a$10$hL74CcBDY2nawyze.kWk2OacAlhAwM465PgLPXhgCs7R6eLx..v6m',NULL,NULL,NULL,NULL,4,'2011-11-16 23:20:23','2011-11-16 23:04:24','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL),(20,'Employee','Three','three@example.com',1,'2011-11-16 14:58:17','2011-11-16 23:22:01',2,'$2a$10$cKuzJjxXcBF3OfRzgPfeOepKmRQsTSLCx.yWacDmSXS/InbBGNK76',NULL,NULL,NULL,NULL,3,'2011-11-16 23:22:01','2011-11-16 16:14:51','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL),(21,'Employee','Four','four@example.com',1,'2011-11-16 14:59:11','2011-11-16 23:23:58',2,'$2a$10$X3BCQE4Z5WevgUZQobE/XejtBEyk6mmCDB/wsL8g/e2Fi7QZ0bMo2',NULL,NULL,NULL,NULL,3,'2011-11-16 23:23:58','2011-11-16 16:16:59','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL),(22,'Employee','Five','five@example.com',1,'2011-11-16 14:59:57','2011-11-16 23:25:24',2,'$2a$10$0z3TL8JPPPfCAOEtA2eZf.AIZXHC0eerbMxKpfgDBNQvYcIENSSbC',NULL,NULL,NULL,NULL,3,'2011-11-16 23:25:24','2011-11-16 16:18:53','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL),(23,'Employee','Admin','admin@company.com',1,'2011-11-16 15:01:24','2011-11-16 15:07:00',2,'$2a$10$zrKyYOfzULksG/ELJzhWyeimDS6iDTr9gweDbUSjyAJco4u4fPnc.',NULL,NULL,NULL,NULL,1,'2011-11-16 15:01:24','2011-11-16 15:01:24','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL),(24,'Richard','McHenry','hmchenry@peoplenetz.com',1,'2011-12-21 21:10:16','2012-01-17 23:19:16',1,'$2a$10$7Spyq/8gJ5VTbxbm0MU3Q.MLvpS7fBSUiDwj4gWzJPTJ/pVFWoWZm',NULL,NULL,NULL,NULL,2,'2012-01-13 19:28:19','2011-12-21 21:10:16','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL),(25,'Carlos','Thomas','cthomas@peoplenetz.com',1,'2011-12-21 21:45:04','2011-12-21 21:45:04',1,'$2a$10$nbvTVKS1fb2gUbr5reoTQ.Ila3AmAvYtZFZ74ZN8oxWfIaWLHMOzK',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,'John ','Denman','jdenman@peoplenetz.com',1,'2011-12-21 21:49:15','2012-03-01 21:31:14',1,'$2a$10$FRZtomuI9Z5/1AM5yQVp8uy.FlpusPWxQeDf6kX004w3WZql5NAVi',NULL,NULL,NULL,NULL,2,'2012-03-01 21:31:14','2011-12-21 21:50:28','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL),(27,'Rob','Cole','rcole@peoplenetz.com',0,'2011-12-21 21:51:12','2011-12-21 21:51:12',1,'$2a$10$kJe7784SxDqgTZCnev7RWuszyixYfzcSI7gEFwO1iRNZ5cKQ/JQG6',NULL,NULL,NULL,NULL,1,'2011-12-21 21:51:12','2011-12-21 21:51:12','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL),(28,'James','Bourbon','jbourbon@peoplenetz.com',1,'2011-12-21 22:14:39','2012-03-01 20:47:13',1,'$2a$10$Ee8XdajHM5qMyfodGNEsxuskpMC8BO4289riIt5u0moFfvCCo.J4y',NULL,NULL,NULL,NULL,6,'2011-12-21 22:17:48','2011-12-21 22:16:57','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL),(30,'Adam','Jones','ajones@peoplenetz.com',1,'2012-01-04 15:25:43','2012-01-23 17:20:57',1,'$2a$10$L3pwIRXYjqKZonayF14pV.8l1FwRU7PnDKsxV.AOE3KjgMH7uaPWS',NULL,NULL,NULL,NULL,2,'2012-01-23 17:20:57','2012-01-23 17:20:04','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL),(31,'Adam','Davies','adavies@peoplenetz.com',1,'2012-01-04 15:36:25','2012-02-21 16:37:30',1,'$2a$10$4JYp29o3aXmo9EjK4BD09ODjC5iIC9WT8X/ixePE4wzHK5Ep3mb/i',NULL,NULL,NULL,NULL,2,'2012-02-21 16:37:30','2012-02-16 20:41:17','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL),(34,'Steven','Loy','sloy@peoplenetz.com',1,'2012-01-04 16:50:03','2012-01-04 16:50:03',1,'$2a$10$w/p8qp6jzD0BoI9axe/vP.ceDWDaXQKLApryJ7Cl33Qa6JawZNade',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(35,'Joe','Smith','jsmith2@peoplenetz.com',0,'2012-01-04 18:42:28','2012-01-04 18:42:28',1,'$2a$10$Lh5tZNhEjITi3lN9VwsHZe4oe5kcak1lkInRrzQimY3bEFFTZdya6',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(36,'Joe','Smith, III','jsmith3@peoplenetz.com',1,'2012-01-04 18:43:44','2012-01-04 18:43:44',1,'$2a$10$QL5427WoJ8R1qCHbn6QvgebNMSbS5o8detniP8IzVIQJqKjhBC1fW',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(38,'Toby','Tucker','ttucker@peoplenetz.com',1,'2012-01-12 15:12:43','2012-01-12 15:12:43',1,'$2a$10$3UKy4CLdabxkHODLS6HsfeHpxSzh.h62/Sz5vQBPUyLv8mPPnm7hC',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(39,'Zola','Smith','zsmith@peoplentz.com',0,'2012-01-12 15:14:24','2012-01-12 15:14:24',1,'$2a$10$AMWGbfieDYGzs/DKstd74eAc4B5O0MSh3Q8hF3ziAOQ6iRA0g1.T6',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(40,'Frank','Hollifield','fhollifield@peoplenetz.com',1,'2012-01-12 15:19:31','2012-01-13 17:23:49',1,'$2a$10$qUGo0GSPm8/VN7la..71Q.z5mVhH535d9gS3OH4KiwViFUhQ3iMP6',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(49,'Joe','Joe','joe@joe.com',1,'2012-01-17 15:10:50','2012-01-17 15:10:50',1,'$2a$10$j.q6XMhpETvUk8bX85Gar.RwUKKViOWJraJLXBphI322r5tPJPwBu',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(50,'Admin','User','admin@peoplenetz.com',1,'2012-01-17 17:58:10','2012-01-17 17:59:34',5,'$2a$10$eCCPCyaGDEXmsU9KFXup6elVOhJ0Tk2nwfI0eutnCYqv5Yo4oz41S',NULL,NULL,NULL,NULL,1,'2012-01-17 17:59:34','2012-01-17 17:59:34','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL),(51,'George','Florence','gflorence@peoplenetz.com',0,'2012-01-17 23:30:36','2012-03-01 21:06:54',1,'$2a$10$OWcAPN52kh2OOpK52r.ok.atmLwUm67HyGZfT0pi2IOhx1FcE1IBq',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(52,'Frances','Crowe','fcrowe@peoplenetz.com',1,'2012-01-17 23:32:45','2012-03-01 20:58:21',1,'$2a$10$ytFDWXissDxI2jw2ILaRbO.GXw84GbvMMJN1sm0b8sdmEC4cZwMLa',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(54,'Brandy','Test','btest@peoplenetz.com',1,'2012-01-26 17:53:20','2012-03-12 16:34:44',1,'$2a$10$8jk75BFhCNt.5hBFfu3eDeNxZag5QRwCnYnhxBDF00fV2D0CeG9q.',NULL,NULL,NULL,NULL,1,'2012-01-26 18:01:39','2012-01-26 18:01:39','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL),(55,'Charles','Test','ctest@peoplenetz.com',1,'2012-01-26 17:53:20','2012-03-12 16:34:44',1,'$2a$10$qm5mwd3fJfDAsRns1o31le.Qx7odCsfThOWyg84hJDZlBWq7cGj2u',NULL,NULL,NULL,NULL,1,'2012-01-26 18:03:05','2012-01-26 18:03:05','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL),(56,'Daniel','Test','dtest@peoplenetz.com',1,'2012-01-26 17:53:21','2012-03-19 17:18:55',1,'$2a$10$Ik.Jnz2un9VeJjw0PKmhA.dXk9WfUz8qcFWUxErdzhAQsyTIPr/S2',NULL,NULL,NULL,NULL,2,'2012-03-19 17:18:32','2012-01-26 18:04:03','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL),(57,'Edith','Test','etest@peoplenetz.com',1,'2012-01-26 17:53:21','2012-03-12 16:34:44',1,'$2a$10$yHVvncMDXQThtSclf0jVb.qw/2IQ6CsPlXllrrNT.a///pjPOHXne',NULL,NULL,NULL,NULL,1,'2012-01-26 18:05:10','2012-01-26 18:05:10','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL),(58,'Terry','Demo','tdemo@peopelentz.com',0,'2012-02-23 23:26:27','2012-02-23 23:26:27',5,'$2a$10$4su4Vb0wEH2n30WbgyYWPeLG/KI9idK9vfEJ4K2WIGsDtEKod9V4G',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(59,'bob','smithers','bsmithers@peoplenetz.com',1,'2012-03-01 20:42:59','2012-03-01 20:42:59',1,'$2a$10$K7IqrFJ7gT7Q4CfCIo/SiuAgaIcpVu4odiz0sOBFhy9V8VFCXl5Hi',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(60,'Corny','Spear','cspears@peoplenetz.com',1,'2012-03-01 21:08:55','2012-03-01 21:08:55',1,'$2a$10$nNkXdX7lzYIWKheu/bfDGuBWoLZTCGFyIq8zqXa/ThLmPPyG07i/O',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(61,'Albert','Test','atest@peoplenetz.com',1,'2012-03-12 16:59:45','2012-03-12 16:59:45',1,'$2a$10$5bhZWPCDq1kfjEH0qQtgJODgowxKHJLgJIQyPOQHX83GFJNy3TTWC',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(62,'Hugo','Martin','hmartin@peoplenetz.com',1,'2012-03-12 21:16:17','2012-03-12 21:16:17',1,'$2a$10$YvkjmFrgdMTsJfej0ctB2O4x8ikYtkN/p5gnrj6YkZTGu4bifJ8Vm',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(70,'James','Davis, PhD','james.davisphd@gmail.com',1,'2012-03-15 22:08:53','2012-03-15 22:15:11',1,'$2a$10$mWDCQ.836I9Q0r4cp5rOAetZ9yaH4qtp3Ig4ldcaGlb31Eyd/EqNq',NULL,'HsYebTIr8iqzGCpVqTlI','2012-03-15 22:15:11',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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

-- Dump completed on 2012-03-26  9:29:11
