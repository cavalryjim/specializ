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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users`
--

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` VALUES (1,'admin@example.com','$2a$10$bQIv4BRx4vDHWXjCWJ2TKOEtWbHHA.z9N3iD6qNMMhkGOnuntqQ5C',NULL,NULL,NULL,4,'2011-11-16 14:49:08','2011-10-07 18:23:57','127.0.0.1','127.0.0.1','2011-09-21 19:39:24','2011-11-16 14:52:09');
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
  `manager` tinyint(1) DEFAULT NULL,
  `participating` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignments`
--

LOCK TABLES `assignments` WRITE;
/*!40000 ALTER TABLE `assignments` DISABLE KEYS */;
INSERT INTO `assignments` VALUES (1,1,15,1,1,'2011-09-08 18:52:39','2011-11-07 16:58:03'),(2,1,9,0,1,'2011-10-03 20:18:42','2011-10-25 15:05:05'),(19,4,15,1,1,'2011-10-27 20:50:45','2011-10-28 20:00:58'),(20,1,21,1,1,'2011-11-08 15:49:49','2011-11-08 15:49:49'),(21,4,21,0,1,'2011-11-08 15:49:59','2011-11-08 15:49:59'),(22,1,23,1,1,'2011-11-08 19:23:09','2011-11-08 19:23:09'),(23,22,24,0,1,'2011-11-16 15:30:08','2011-11-16 15:30:08'),(24,19,24,0,1,'2011-11-16 15:30:08','2011-11-16 15:30:08'),(25,21,24,0,1,'2011-11-16 15:30:08','2011-11-16 15:30:08'),(26,18,24,1,1,'2011-11-16 15:30:08','2011-11-16 15:30:50'),(27,20,24,0,1,'2011-11-16 15:30:08','2011-11-16 15:30:08'),(28,1,16,0,1,'2011-11-30 19:49:12','2011-11-30 19:49:12'),(36,1,8,1,1,'2011-12-05 20:52:53','2011-12-05 20:52:53'),(44,1,25,0,1,'2011-12-05 21:38:33','2011-12-05 21:38:33'),(45,7,8,0,1,'2011-12-06 17:00:50','2011-12-06 17:00:50'),(46,1,26,0,1,'2011-12-06 21:10:46','2011-12-06 21:10:46'),(47,4,26,0,1,'2011-12-06 21:10:50','2011-12-06 21:10:50'),(48,4,16,1,1,'2011-12-09 17:32:59','2011-12-09 17:32:59');
/*!40000 ALTER TABLE `assignments` ENABLE KEYS */;
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
  `active` tinyint(1) DEFAULT NULL,
  `never_expires` tinyint(1) DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'Peoplenetz',1,1,NULL,'2011-09-21 20:25:57','2011-09-21 20:25:57'),(2,'Test Company',1,NULL,NULL,'2011-10-03 20:18:42','2011-10-03 20:18:42');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
INSERT INTO `elements` VALUES (1,'Ability to make a GANNT chart',1,1,NULL,'2011-09-13 16:06:43','2011-09-13 16:06:43'),(2,'Staff projects by skill',1,1,NULL,'2011-09-27 19:10:41','2011-09-27 19:10:41'),(22,'JD test element 3',1,1,NULL,'2011-09-30 17:14:06','2011-09-30 17:14:06'),(24,'Generate weekly status report',1,1,NULL,'2011-09-30 19:08:25','2011-09-30 19:08:25'),(25,'Update individual work schedule',1,1,NULL,'2011-09-30 19:11:38','2011-09-30 19:11:38'),(26,'Share resources between projects',1,1,NULL,'2011-09-30 19:12:08','2011-09-30 19:12:08'),(28,'Respond to manager comments',1,1,NULL,'2011-09-30 19:13:40','2011-09-30 19:13:40'),(29,'Request additional resources',1,1,NULL,'2011-09-30 19:14:19','2011-09-30 19:14:19'),(30,'Flash updates to users only once',1,1,NULL,'2011-09-30 19:17:29','2011-09-30 19:17:29'),(31,'Another element',1,1,NULL,'2011-10-28 19:45:49','2011-10-28 19:45:49'),(39,'Tasks lists for people, and allocation schedules for resources.',1,1,NULL,'2011-11-09 18:05:57','2011-11-09 18:05:57'),(40,'Overview information on how long tasks will take to complete.',1,1,NULL,'2011-11-09 18:05:57','2011-11-09 18:05:57'),(41,'Early warning of any risks to the project.',1,1,NULL,'2011-11-09 18:05:57','2011-11-09 18:05:57'),(42,'Information on workload, for planning holidays.',1,1,NULL,'2011-11-09 18:05:57','2011-11-09 18:05:57'),(43,'Optimum utilization of available resource.',1,1,NULL,'2011-11-09 18:05:57','2011-11-09 18:05:57'),(44,'Cost Maintenance.',1,1,NULL,'2011-11-09 18:05:57','2011-11-09 18:05:57'),(45,'Tasks lists for people, and allocation schedules for resources.',1,1,NULL,'2011-11-11 14:33:21','2011-11-11 14:33:21'),(46,'Overview information on how long tasks will take to complete.',1,1,NULL,'2011-11-11 14:33:21','2011-11-11 14:33:21'),(47,'Early warning of any risks to the project.',1,1,NULL,'2011-11-11 14:33:21','2011-11-11 14:33:21'),(48,'Information on workload, for planning holidays.',1,1,NULL,'2011-11-11 14:33:21','2011-11-11 14:33:21'),(49,'Optimum utilization of available resource.',1,1,NULL,'2011-11-11 14:33:21','2011-11-11 14:33:21'),(50,'Cost Maintenance.',1,1,NULL,'2011-11-11 14:33:21','2011-11-11 14:33:21'),(56,'element 1',1,18,NULL,'2011-11-16 16:02:26','2011-11-16 16:02:26'),(65,'element 1',1,18,NULL,'2011-11-16 22:53:48','2011-11-16 22:53:48'),(66,'element 2',1,18,NULL,'2011-11-16 22:53:48','2011-11-16 22:53:48'),(67,'element 3',1,18,NULL,'2011-11-16 22:53:48','2011-11-16 22:53:48'),(68,'element 4',1,18,NULL,'2011-11-16 22:53:48','2011-11-16 22:53:48'),(69,'element 5',1,18,NULL,'2011-11-16 22:53:48','2011-11-16 22:53:48'),(70,'element 6',1,18,NULL,'2011-11-16 22:53:49','2011-11-16 22:53:49'),(71,'element 7',1,18,NULL,'2011-11-16 22:53:49','2011-11-16 22:53:49'),(72,'element 8',1,18,NULL,'2011-11-16 22:53:49','2011-11-16 22:53:49'),(73,'Tasks lists for people, and allocation schedules for resources.',1,1,NULL,'2011-12-06 22:37:45','2011-12-06 22:37:45'),(74,'Overview information on how long tasks will take to complete.',1,1,NULL,'2011-12-06 22:37:46','2011-12-06 22:37:46'),(75,'Early warning of any risks to the project.',1,1,NULL,'2011-12-06 22:37:46','2011-12-06 22:37:46'),(76,'Information on workload, for planning holidays.',1,1,NULL,'2011-12-06 22:37:46','2011-12-06 22:37:46'),(77,'Optimum utilization of available resource.',1,1,NULL,'2011-12-06 22:37:46','2011-12-06 22:37:46'),(78,'Cost Maintenance.',1,1,NULL,'2011-12-06 22:37:46','2011-12-06 22:37:46');
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
  `description` varchar(255) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupings`
--

LOCK TABLES `groupings` WRITE;
/*!40000 ALTER TABLE `groupings` DISABLE KEYS */;
INSERT INTO `groupings` VALUES (2,'Software Developers','This a a group of all our software developers',1,NULL,'2011-09-06 19:05:39','2011-11-03 21:09:22',1,6),(3,'Java Developers','This is our java developers',1,2,'2011-09-06 19:07:24','2011-09-06 19:07:24',2,5),(4,'Accountants','This a a group of all our accountants',1,NULL,'2011-09-06 19:40:15','2011-09-06 19:40:15',7,8),(5,'Test Group',NULL,2,NULL,'2011-10-03 20:18:42','2011-10-03 20:18:42',9,10),(6,'Java J2EE Developers','This a our J2EE dev group.',1,3,'2011-11-03 16:15:57','2011-11-03 16:15:57',3,4),(7,'Calculation Test','Group created for testing the consensus calculation',2,NULL,'2011-11-16 15:27:34','2011-11-16 15:27:34',11,12);
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
INSERT INTO `groupings_users` VALUES (2,1),(2,4),(7,18),(7,19),(7,20),(7,21),(7,22);
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
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iteration_lists`
--

LOCK TABLES `iteration_lists` WRITE;
/*!40000 ALTER TABLE `iteration_lists` DISABLE KEYS */;
INSERT INTO `iteration_lists` VALUES (1,1,1,NULL,NULL,NULL,NULL,NULL),(2,1,2,NULL,'2011-09-29 20:18:52','2011-09-29 20:18:52',NULL,NULL),(5,1,22,NULL,'2011-09-30 17:14:06','2011-09-30 17:14:06',NULL,NULL),(7,1,24,NULL,'2011-09-30 19:08:25','2011-09-30 19:08:25',NULL,NULL),(8,1,25,NULL,'2011-09-30 19:11:38','2011-09-30 19:11:38',NULL,NULL),(9,1,26,NULL,'2011-09-30 19:12:08','2011-09-30 19:12:08',NULL,NULL),(11,1,28,NULL,'2011-09-30 19:13:40','2011-09-30 19:13:40',NULL,NULL),(12,1,29,NULL,'2011-09-30 19:14:19','2011-09-30 19:14:19',NULL,NULL),(13,1,30,NULL,'2011-09-30 19:17:29','2011-09-30 19:17:29',NULL,NULL),(14,2,2,40,'2011-10-20 14:15:38','2011-11-15 23:11:44',1,0),(15,2,1,20,'2011-10-28 19:40:18','2011-11-15 19:57:57',0,0),(16,2,22,60,'2011-10-28 19:40:49','2011-11-15 19:57:57',0,0),(17,2,24,80,'2011-10-28 19:42:36','2011-11-15 19:57:57',0,0),(18,2,25,100,'2011-10-28 19:42:57','2011-11-15 19:57:57',0,0),(19,2,26,70,'2011-10-28 19:43:21','2011-11-15 23:11:44',1,0),(20,2,28,50,'2011-10-28 19:44:21','2011-11-15 23:11:44',1,0),(21,2,29,50,'2011-10-28 19:44:42','2011-11-15 23:11:44',1,0),(22,2,30,40,'2011-10-28 19:45:03','2011-11-15 19:57:58',0,0),(23,2,31,0,'2011-10-28 19:45:49','2011-11-15 19:57:58',0,0),(25,2,39,0,'2011-11-09 18:05:57','2011-11-15 19:57:58',0,0),(26,2,40,0,'2011-11-09 18:05:57','2011-11-15 19:57:58',0,0),(27,2,41,0,'2011-11-09 18:05:57','2011-11-15 19:57:58',0,0),(28,2,42,0,'2011-11-09 18:05:57','2011-11-15 19:57:58',0,0),(29,2,43,0,'2011-11-09 18:05:57','2011-11-15 19:57:58',0,0),(30,2,44,0,'2011-11-09 18:05:57','2011-11-15 19:57:58',0,0),(31,3,45,100,'2011-11-11 14:33:21','2011-11-30 20:10:15',0,0),(32,3,46,100,'2011-11-11 14:33:21','2011-11-30 20:10:15',0,0),(33,3,47,100,'2011-11-11 14:33:21','2011-11-30 20:10:16',0,0),(34,3,48,100,'2011-11-11 14:33:21','2011-11-30 20:10:16',0,0),(35,3,49,100,'2011-11-11 14:33:21','2011-11-30 20:10:16',0,0),(36,3,50,100,'2011-11-11 14:33:21','2011-11-30 20:10:16',0,0),(37,9,2,100,'2011-11-16 14:40:03','2011-11-28 22:13:03',0,0),(38,9,26,100,'2011-11-16 14:40:03','2011-11-28 22:13:03',0,0),(39,9,28,100,'2011-11-16 14:40:03','2011-11-28 22:13:03',0,0),(40,9,29,100,'2011-11-16 14:40:03','2011-11-28 22:13:04',0,0),(49,10,65,100,'2011-11-16 22:53:48','2011-11-16 23:52:19',1,0),(50,10,66,100,'2011-11-16 22:53:48','2011-11-16 23:52:19',0,0),(51,10,67,52,'2011-11-16 22:53:48','2011-11-17 17:34:24',1,0),(52,10,68,64,'2011-11-16 22:53:48','2011-11-17 17:42:36',0,0),(53,10,69,72,'2011-11-16 22:53:49','2011-11-17 17:34:25',1,0),(54,10,70,92,'2011-11-16 22:53:49','2011-11-17 00:04:32',1,0),(55,10,71,56,'2011-11-16 22:53:49','2011-11-17 17:34:25',1,0),(56,10,72,80,'2011-11-16 22:53:49','2011-11-16 23:52:19',1,0),(57,12,73,NULL,'2011-12-06 22:37:45','2011-12-06 22:37:45',1,0),(58,12,74,NULL,'2011-12-06 22:37:46','2011-12-06 22:37:46',1,0),(59,12,75,NULL,'2011-12-06 22:37:46','2011-12-06 22:37:46',1,0),(60,12,76,NULL,'2011-12-06 22:37:46','2011-12-06 22:37:46',1,0),(61,12,77,NULL,'2011-12-06 22:37:46','2011-12-06 22:37:46',1,0),(62,12,78,NULL,'2011-12-06 22:37:46','2011-12-06 22:37:46',1,0),(63,18,73,NULL,'2011-12-06 22:38:07','2011-12-06 22:38:07',1,0),(64,18,74,NULL,'2011-12-06 22:38:07','2011-12-06 22:38:07',1,0),(65,18,75,NULL,'2011-12-06 22:38:07','2011-12-06 22:38:07',1,0),(66,18,76,NULL,'2011-12-06 22:38:07','2011-12-06 22:38:07',1,0),(67,18,77,NULL,'2011-12-06 22:38:07','2011-12-06 22:38:07',1,0),(68,18,78,NULL,'2011-12-06 22:38:07','2011-12-06 22:38:07',1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iterations`
--

LOCK TABLES `iterations` WRITE;
/*!40000 ALTER TABLE `iterations` DISABLE KEYS */;
INSERT INTO `iterations` VALUES (1,1,65,0,8,'2011-09-13 15:48:17','2011-11-08 15:53:33'),(2,2,31.875,0,8,'2011-10-03 20:18:42','2011-11-15 23:11:45'),(3,1,45,0,21,'2011-11-08 14:40:06','2011-12-01 17:55:39'),(4,1,NULL,1,22,'2011-11-08 14:40:06','2011-11-08 14:40:06'),(5,1,NULL,1,23,'2011-11-08 14:40:06','2011-11-08 14:40:06'),(6,3,NULL,1,2,'2011-11-15 20:51:31','2011-11-15 20:51:31'),(7,3,NULL,1,2,'2011-11-15 22:55:04','2011-11-15 22:55:04'),(8,3,NULL,1,2,'2011-11-15 22:57:31','2011-11-15 22:57:31'),(9,3,0,0,8,'2011-11-16 14:40:02','2011-12-06 17:48:05'),(10,1,69.3333,0,24,'2011-11-16 15:27:55','2011-11-17 17:42:36'),(11,1,NULL,1,25,'2011-11-30 17:45:12','2011-11-30 17:45:12'),(12,2,60,0,21,'2011-11-30 20:10:24','2011-12-08 14:36:06'),(13,1,0,1,16,'2011-12-01 15:57:06','2011-12-01 15:57:42'),(14,1,0,1,20,'2011-12-01 16:00:39','2011-12-01 16:00:39'),(15,4,0,1,8,'2011-12-06 17:48:12','2011-12-07 17:03:46'),(16,1,NULL,1,26,'2011-12-06 21:09:09','2011-12-06 21:09:09'),(17,1,NULL,1,27,'2011-12-06 21:09:09','2011-12-06 21:09:09'),(18,3,80,1,21,'2011-12-06 22:38:07','2011-12-08 14:36:42');
/*!40000 ALTER TABLE `iterations` ENABLE KEYS */;
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
INSERT INTO `roles_users` VALUES (1,1),(1,4),(1,23),(2,1),(2,4),(2,23),(3,1),(3,4),(3,23),(4,1),(4,4),(4,23),(5,1);
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
INSERT INTO `schema_migrations` VALUES ('20110903172921'),('20110903175140'),('20110904212111'),('20110904235548'),('20110905004200'),('20110905170413'),('20110905173337'),('20110906184013'),('20110907160106'),('20110908041448'),('20110908162715'),('20110913154428'),('20110913160511'),('20110913163738'),('20110913164831'),('20110920193356'),('20110920193357'),('20110920204131'),('20110921003347'),('20111001155058'),('20111028215930'),('20111031135013'),('20111102034659'),('20111109223356'),('20111110160943'),('20111114233158'),('20111116220552'),('20111212163415');
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
  `active` tinyint(1) DEFAULT NULL,
  `update_frequency` int(11) DEFAULT NULL,
  `topic_id` int(11) DEFAULT NULL,
  `grouping_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `elements_spreadsheet` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic_groups`
--

LOCK TABLES `topic_groups` WRITE;
/*!40000 ALTER TABLE `topic_groups` DISABLE KEYS */;
INSERT INTO `topic_groups` VALUES (8,'Tablet Purchase: Developers- Java Developers',90,1,5,4,3,'2011-09-08 15:12:28','2011-12-01 21:56:43',NULL),(16,'PM software requirements: Software Developers- Java Developers',66,1,NULL,1,3,'2011-10-24 19:44:35','2011-12-12 17:50:01',NULL),(20,'PM software requirements: Test Group',66,1,NULL,1,5,'2011-10-24 19:58:38','2011-12-12 17:50:01',NULL),(21,'JD Test Topic 8 Nov 2011: Software Developers',60,1,60,8,2,'2011-11-08 14:40:06','2011-12-06 22:37:45','spz_test_upload.xls'),(22,'JD Test Topic 8 Nov 2011: Software Developers- Java Developers',90,1,NULL,8,3,'2011-11-08 14:40:06','2011-11-08 14:40:06',NULL),(23,'JD Test Topic 8 Nov 2011: Software Developers- Java Developers- Java J2EE Developers',90,1,NULL,8,6,'2011-11-08 14:40:06','2011-11-08 14:40:06',NULL),(24,'Calculation Test: Calculation Test',90,1,NULL,9,7,'2011-11-16 15:27:55','2011-11-16 22:53:48','spz_calculation_test_elements.xls'),(25,'Accounting skills: Software Developers- Java Developers',85,1,50,3,3,'2011-11-30 17:45:12','2011-12-01 18:57:13',NULL),(26,'JD Test Topic: Software Developers',90,1,NULL,6,2,'2011-12-06 21:09:09','2011-12-06 21:09:09',NULL),(27,'JD Test Topic: Accountants',90,1,NULL,6,4,'2011-12-06 21:09:09','2011-12-06 21:09:09',NULL);
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
  `description` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `update_frequency` int(11) DEFAULT NULL,
  `due_days` int(11) DEFAULT NULL,
  `opt_out` tinyint(1) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `goal` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topics`
--

LOCK TABLES `topics` WRITE;
/*!40000 ALTER TABLE `topics` DISABLE KEYS */;
INSERT INTO `topics` VALUES (1,'PM software requirements','This topic is to identify the software requirements for a new project management application.',1,5,5,0,1,'2011-09-05 17:47:05','2011-12-12 18:03:16',66),(3,'Accounting skills','Here are some skills',1,10,7,1,1,'2011-09-07 20:38:52','2011-10-25 16:53:15',NULL),(4,'Tablet Purchase','We need tablet pcs for the sales department.',1,50,5,0,1,'2011-09-08 14:52:57','2011-09-08 14:52:57',NULL),(5,'Test Topic','This is a test topic',NULL,NULL,NULL,NULL,2,'2011-10-03 20:18:42','2011-10-03 20:18:42',NULL),(6,'JD Test Topic','This is a test topic on 25Oct2011.',1,90,5,0,1,'2011-10-25 18:58:32','2011-10-25 18:58:32',NULL),(7,'28 Oct Test','this is a test on 28 Oct 2011.',1,90,7,0,1,'2011-10-28 15:12:11','2011-10-28 15:12:11',NULL),(8,'JD Test Topic 8 Nov 2011','This is a test topic created on 8 Nov 2011.',1,60,7,0,1,'2011-11-08 14:39:52','2011-11-08 14:39:52',NULL),(9,'Calculation Test','Topic created to test the consensus calculation.',1,90,7,0,2,'2011-11-16 15:24:51','2011-11-16 15:24:51',NULL);
/*!40000 ALTER TABLE `topics` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_lists`
--

LOCK TABLES `user_lists` WRITE;
/*!40000 ALTER TABLE `user_lists` DISABLE KEYS */;
INSERT INTO `user_lists` VALUES (1,1,30,3,1,'2011-10-05 16:46:54','2011-10-05 16:46:54'),(11,1,1,1,1,'2011-10-06 21:25:05','2011-10-06 21:25:05'),(12,1,2,2,1,'2011-10-06 21:25:05','2011-10-06 21:25:05'),(13,1,22,3,1,'2011-10-06 21:25:05','2011-10-06 21:25:05'),(14,1,24,4,1,'2011-10-06 21:25:05','2011-10-06 21:25:05'),(15,1,25,5,1,'2011-10-06 21:25:05','2011-10-06 21:25:05'),(16,1,26,4,1,'2011-10-06 21:25:05','2011-10-06 21:25:05'),(17,1,28,3,1,'2011-10-06 21:25:05','2011-10-06 21:25:05'),(18,1,29,2,1,'2011-10-06 21:25:05','2011-10-06 21:25:05'),(19,1,30,1,1,'2011-10-06 21:25:05','2011-10-06 21:25:05'),(20,1,29,3,2,'2011-11-15 16:04:17','2011-11-15 16:04:17'),(21,1,28,2,2,'2011-11-15 16:04:17','2011-11-15 16:04:17'),(22,1,26,3,2,'2011-11-15 16:04:17','2011-11-15 16:04:17'),(23,1,2,2,2,'2011-11-15 16:04:17','2011-11-15 16:04:17'),(52,18,65,5,10,'2011-11-16 23:03:24','2011-11-16 23:03:24'),(53,18,67,3,10,'2011-11-16 23:03:24','2011-11-16 23:03:24'),(54,18,68,4,10,'2011-11-16 23:03:24','2011-11-16 23:03:24'),(55,18,69,4,10,'2011-11-16 23:03:24','2011-11-16 23:03:24'),(56,18,70,5,10,'2011-11-16 23:03:24','2011-11-16 23:03:24'),(57,18,71,5,10,'2011-11-16 23:03:24','2011-11-16 23:03:24'),(58,18,72,4,10,'2011-11-16 23:03:25','2011-11-16 23:03:25'),(59,19,65,5,10,'2011-11-16 23:21:04','2011-11-16 23:21:04'),(60,19,67,3,10,'2011-11-16 23:21:04','2011-11-16 23:21:04'),(61,19,68,5,10,'2011-11-16 23:21:05','2011-11-16 23:21:05'),(62,19,69,5,10,'2011-11-16 23:21:05','2011-11-16 23:21:05'),(63,19,70,4,10,'2011-11-16 23:21:05','2011-11-16 23:21:05'),(64,19,72,4,10,'2011-11-16 23:21:05','2011-11-16 23:21:05'),(65,20,65,5,10,'2011-11-16 23:23:28','2011-11-16 23:23:28'),(66,20,67,3,10,'2011-11-16 23:23:28','2011-11-16 23:23:28'),(67,20,69,4,10,'2011-11-16 23:23:29','2011-11-16 23:23:29'),(68,20,70,5,10,'2011-11-16 23:23:29','2011-11-16 23:23:29'),(69,20,71,5,10,'2011-11-16 23:23:29','2011-11-16 23:23:29'),(70,20,72,4,10,'2011-11-16 23:23:29','2011-11-16 23:23:29'),(71,21,65,5,10,'2011-11-16 23:24:38','2011-11-16 23:24:38'),(72,21,67,3,10,'2011-11-16 23:24:38','2011-11-16 23:24:38'),(73,21,70,5,10,'2011-11-16 23:24:38','2011-11-16 23:24:38'),(74,21,72,4,10,'2011-11-16 23:24:38','2011-11-16 23:24:38'),(75,22,65,5,10,'2011-11-16 23:25:59','2011-11-16 23:25:59'),(76,22,69,5,10,'2011-11-16 23:26:00','2011-11-16 23:26:00'),(77,22,70,4,10,'2011-11-16 23:26:00','2011-11-16 23:26:00'),(78,22,71,4,10,'2011-11-16 23:26:00','2011-11-16 23:26:00'),(79,22,72,4,10,'2011-11-16 23:26:00','2011-11-16 23:26:00');
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'James','Davis','jdavis@peoplenetz.com',1,'2011-09-05 17:44:44','2011-12-07 15:30:11',1,'$2a$10$7UssOWNiwZ6abM7b.V5OmuKqjw1IA/SSsavqLjrncgyJQUSQOBEd6',NULL,NULL,NULL,'2011-12-07 15:30:11',22,'2011-12-07 15:30:11','2011-11-17 21:20:00','127.0.0.1','127.0.0.1',NULL,NULL,'http://www.linkedin.com/profile?viewProfile=kzzBqUSc-q','0f88f01.jpg'),(2,'Michael','Harrison','mharrison@peoplenetz.com',1,'2011-09-22 20:10:11','2011-09-22 20:10:11',1,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'John','Lowe','jlowe@peoplenetz.com',1,'2011-09-22 20:10:53','2011-09-22 20:10:53',1,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'Sarah','Davis','sdavis@peoplenetz.com',1,'2011-09-22 20:11:21','2011-09-22 20:11:21',1,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'Brittany','Harrison','bharrison@peoplenetz.com',1,'2011-09-22 20:11:50','2011-09-22 20:11:50',1,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'Joe','Smith','jsmith@peoplenetz.com',1,'2011-09-22 20:12:22','2011-09-22 20:12:22',1,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'Johnny','Test','jtest@test.com',1,'2011-10-03 20:18:42','2011-10-03 20:18:42',2,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,'Test','Test','james.davisphd@gmail.com',1,'2011-11-02 17:33:30','2011-11-02 17:33:31',1,'$2a$10$WPHKOST318h3tizyySBod.GMWzWsnSd4VzoIQOdWkvlV.bT75ejOC',NULL,NULL,NULL,NULL,1,'2011-11-02 17:33:31','2011-11-02 17:33:31','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL),(18,'Employee','One','one@example.com',1,'2011-11-16 14:54:58','2011-11-17 00:04:19',2,'$2a$10$enXDZq.oxf7Ko/5XPCnOGuGKOSaaHddVHoEWAVjxCLPr2rZkWdBTS',NULL,NULL,NULL,NULL,6,'2011-11-17 00:04:19','2011-11-16 23:26:22','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL),(19,'Employee','Two','two@example.com',1,'2011-11-16 14:57:08','2011-11-16 23:20:23',2,'$2a$10$hL74CcBDY2nawyze.kWk2OacAlhAwM465PgLPXhgCs7R6eLx..v6m',NULL,NULL,NULL,NULL,4,'2011-11-16 23:20:23','2011-11-16 23:04:24','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL),(20,'Employee','Three','three@example.com',1,'2011-11-16 14:58:17','2011-11-16 23:22:01',2,'$2a$10$cKuzJjxXcBF3OfRzgPfeOepKmRQsTSLCx.yWacDmSXS/InbBGNK76',NULL,NULL,NULL,NULL,3,'2011-11-16 23:22:01','2011-11-16 16:14:51','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL),(21,'Employee','Four','four@example.com',1,'2011-11-16 14:59:11','2011-11-16 23:23:58',2,'$2a$10$X3BCQE4Z5WevgUZQobE/XejtBEyk6mmCDB/wsL8g/e2Fi7QZ0bMo2',NULL,NULL,NULL,NULL,3,'2011-11-16 23:23:58','2011-11-16 16:16:59','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL),(22,'Employee','Five','five@example.com',1,'2011-11-16 14:59:57','2011-11-16 23:25:24',2,'$2a$10$0z3TL8JPPPfCAOEtA2eZf.AIZXHC0eerbMxKpfgDBNQvYcIENSSbC',NULL,NULL,NULL,NULL,3,'2011-11-16 23:25:24','2011-11-16 16:18:53','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL),(23,'Employee','Admin','admin@company.com',1,'2011-11-16 15:01:24','2011-11-16 15:07:00',2,'$2a$10$zrKyYOfzULksG/ELJzhWyeimDS6iDTr9gweDbUSjyAJco4u4fPnc.',NULL,NULL,NULL,NULL,1,'2011-11-16 15:01:24','2011-11-16 15:01:24','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL);
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

-- Dump completed on 2011-12-13  8:58:52
