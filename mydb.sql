-- MySQL dump 10.13  Distrib 5.1.61, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	5.1.61

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
-- Table structure for table `multimedia`
--

DROP TABLE IF EXISTS `multimedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `multimedia` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `file_uri` varchar(256) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multimedia`
--

LOCK TABLES `multimedia` WRITE;
/*!40000 ALTER TABLE `multimedia` DISABLE KEYS */;
INSERT INTO `multimedia` VALUES (1,1,'image','/home/dungnt/Workspace/Catalyst/MyForum/root/upload/430337_417081651660841_1551077051_n.jpg','2012-08-06 16:13:00'),(2,1,'image','/upload/179166_487010617977656_1591397692_n.jpg','2012-08-06 16:16:15'),(3,1,'image','/upload/179166_487010617977656_1591397692_n.jpg','2012-08-06 16:29:26'),(4,1,'image','/upload/430337_417081651660841_1551077051_n.jpg','2012-08-06 16:31:20'),(5,1,'image','/upload/430337_417081651660841_1551077051_n.jpg','2012-08-06 16:32:42'),(6,1,'image','/upload/one_piece_banner_by_youko_shirokiba-d32cqw4.jpg','2012-08-06 16:33:07'),(7,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-06 16:35:46'),(8,1,'image','/upload/430337_417081651660841_1551077051_n.jpg','2012-08-06 16:37:33'),(9,1,'image','/upload/179166_487010617977656_1591397692_n.jpg','2012-08-06 16:39:26'),(10,1,'image','/upload/179166_487010617977656_1591397692_n.jpg','2012-08-06 17:01:24'),(11,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-06 17:02:58'),(12,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-06 18:37:53'),(13,1,'image','/upload/179166_487010617977656_1591397692_n.jpg','2012-08-07 11:35:15'),(14,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-07 11:40:48'),(15,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-09 11:56:24'),(16,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-09 12:57:07'),(17,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-09 13:13:07'),(18,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-09 13:14:03'),(19,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-09 13:16:19'),(20,1,'image','/upload/430337_417081651660841_1551077051_n.jpg','2012-08-09 13:17:09'),(21,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-09 13:18:20'),(22,1,'image','/upload/179166_487010617977656_1591397692_n.jpg','2012-08-09 13:19:32'),(23,1,'image','/upload/430337_417081651660841_1551077051_n.jpg','2012-08-09 13:20:41'),(24,1,'image','/upload/179166_487010617977656_1591397692_n.jpg','2012-08-09 13:22:58'),(25,1,'image','/upload/430337_417081651660841_1551077051_n.jpg','2012-08-09 13:24:13'),(26,1,'image','/upload/179166_487010617977656_1591397692_n.jpg','2012-08-09 13:24:41'),(27,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-09 13:25:02'),(28,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-09 13:26:12'),(29,1,'image','/upload/430337_417081651660841_1551077051_n.jpg','2012-08-09 13:36:51'),(30,1,'image','/upload/430337_417081651660841_1551077051_n.jpg','2012-08-09 14:23:22'),(31,1,'image','/upload/179166_487010617977656_1591397692_n.jpg','2012-08-09 14:24:06'),(32,1,'image','/upload/179166_487010617977656_1591397692_n.jpg','2012-08-09 14:25:33'),(33,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-09 15:16:27'),(34,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-09 15:17:43'),(35,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-09 15:33:25'),(36,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-09 15:41:22'),(37,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-09 15:42:53'),(38,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-09 15:45:48'),(39,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-09 15:53:25'),(40,1,'image','/upload/430337_417081651660841_1551077051_n.jpg','2012-08-09 17:08:10'),(41,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-09 17:17:36'),(42,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-09 17:42:15'),(43,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-09 18:48:23'),(44,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-09 18:49:44'),(45,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-10 09:47:14'),(46,1,'image','/upload/179166_487010617977656_1591397692_n.jpg','2012-08-10 10:11:53'),(47,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-10 10:20:08'),(48,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-12 02:52:57'),(49,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-12 03:39:03'),(50,1,'image','/upload/179166_487010617977656_1591397692_n.jpg','2012-08-12 03:40:09'),(51,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-12 03:40:39'),(52,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-12 03:44:58'),(53,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-12 03:46:14'),(54,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-12 03:47:46'),(55,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-12 03:48:58'),(56,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-12 03:50:05'),(57,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-12 03:51:10'),(58,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-12 03:52:16'),(59,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-12 03:53:30'),(60,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-12 03:54:48'),(61,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-12 03:59:02'),(62,1,'image','/upload/179166_487010617977656_1591397692_n.jpg','2012-08-12 04:01:42'),(63,1,'image','/upload/430337_417081651660841_1551077051_n.jpg','2012-08-12 04:01:53'),(64,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-12 04:32:24'),(65,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-12 13:46:04'),(66,1,'image','/upload/430337_417081651660841_1551077051_n.jpg','2012-08-12 13:49:03'),(67,1,'image','/upload/179166_487010617977656_1591397692_n.jpg','2012-08-12 13:51:10'),(68,1,'image','/upload/one_piece_banner_by_youko_shirokiba-d32cqw4.jpg','2012-08-12 13:56:10'),(69,1,'image','/upload/179166_487010617977656_1591397692_n.jpg','2012-08-12 14:08:02'),(70,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-13 05:21:21'),(71,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-13 05:21:37'),(72,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-13 05:22:36'),(73,1,'image','/upload/179166_487010617977656_1591397692_n.jpg','2012-08-13 05:22:41'),(74,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-13 16:19:00'),(75,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-13 16:21:11'),(76,1,'image','/upload/430337_417081651660841_1551077051_n.jpg','2012-08-13 16:58:10'),(77,1,'image','/upload/430337_417081651660841_1551077051_n.jpg','2012-08-13 16:59:42'),(78,1,'image','/upload/179166_487010617977656_1591397692_n.jpg','2012-08-13 17:02:09'),(79,2,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-13 17:03:47'),(80,1,'image','/upload/F-4ãƒ˜ãƒƒãƒ—ã•ã‚“.jpg','2012-08-14 11:08:40'),(81,1,'image','/upload/428762_402292206453475_100000180985064_1858470_1566551727_n.jpg','2012-08-14 11:09:29'),(82,1,'image','/upload/NATURE-YARBYetAnotherRoseBackground_1024x768.jpg','2012-08-14 12:30:58'),(83,3,'image','/upload/ABSTRACT-AnotherBlue_1024x768.png','2012-08-14 15:17:19'),(84,1,'image','/upload/ABSTRACT-AnotherBlue_1024x768.png','2012-08-14 16:40:50'),(85,1,'image','/upload/noeln.jpg','2012-08-15 18:22:15'),(86,1,'image','/upload/dog.gif','2012-08-15 18:36:29'),(87,1,'image','/upload/anh-so-1.jpg','2012-08-15 18:36:33'),(88,1,'image','/upload/gifs_03.gif','2012-08-15 18:36:36'),(89,1,'image','/upload/ilv.jpg','2012-08-15 18:40:12'),(90,1,'image','/upload/ me.JPG','2012-08-15 18:51:10'),(91,1,'image','/upload/hacked_message.jpg','2012-08-16 14:37:25'),(92,1,'image','/upload/ me.JPG','2012-08-16 14:45:45'),(93,1,'image','/upload/ me.JPG','2012-08-16 14:49:09'),(94,1,'image','/upload/477666_3324906516318_1783119218_o.jpg','2012-08-16 14:49:56'),(95,1,'image','/upload/wallpaper.jpg','2012-08-16 15:56:15'),(96,9,'image','/upload/477666_3324906516318_1783119218_o.jpg','2012-08-17 06:09:05'),(97,9,'image','/upload/ me.JPG','2012-08-17 06:13:42'),(98,9,'image','/upload/THREAD.HTML','2012-08-17 06:13:49'),(99,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-17 06:16:05'),(100,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-17 06:17:02'),(101,1,'image','/upload/validationhints.zip','2012-08-17 06:19:13'),(102,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-17 06:26:40'),(103,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-17 06:30:50'),(104,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-17 06:31:08'),(105,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-17 06:31:26'),(106,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-17 08:25:02'),(107,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-17 08:26:10'),(108,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-17 08:57:02'),(109,1,'image','/upload/179166_487010617977656_1591397692_n.jpg','2012-08-17 08:59:18'),(110,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-17 08:59:33'),(111,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-17 09:01:34'),(112,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-17 09:02:11'),(113,9,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-17 09:09:58'),(114,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-17 09:47:53'),(115,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-17 09:52:26'),(116,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-17 09:54:16'),(117,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-17 14:03:31'),(118,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-17 17:17:00'),(119,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-17 17:26:03'),(120,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-17 20:30:40'),(121,1,'image','/upload/Zoro-one-piece-5792972-1024-768.jpg','2012-08-18 04:16:38'),(122,9,'image','/upload/gifs_03.gif','2012-08-18 04:30:47'),(123,6,'image','/upload/noeln.jpg','2012-08-18 07:35:29'),(124,1,'image','/upload/405967_241424279259583_100001760374211_582041_1229275465_n.jpg','2012-08-18 07:39:35'),(125,1,'image','/upload/405967_241424279259583_100001760374211_582041_1229275465_n.jpg','2012-08-18 07:41:40'),(126,1,'image','/upload/anh-so-1.jpg','2012-08-18 07:43:28'),(127,6,'image','/upload/405967_241424279259583_100001760374211_582041_1229275465_n.jpg','2012-08-18 07:46:58'),(128,1,'image','/upload/noeln.jpg','2012-08-18 08:22:56');
/*!40000 ALTER TABLE `multimedia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `thread_id` int(11) DEFAULT NULL,
  `user_id` int(11),
  `content` text CHARACTER SET latin1,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `picture` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_post_user1_idx` (`user_id`),
  KEY `fk_post_thread1_idx` (`thread_id`)
) ENGINE=MyISAM AUTO_INCREMENT=163 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (50,34,1,'ã¯ã˜ã‚ã¾ã—ã¦ã€ã‚ãŸã—ã‚DUNGã§ã™ã€‚\r\nã„ã£ãã«ã€Cï¼‹ï¼‹ã‚’ã¹ã‚“ãã‚‡ã†ã¾ã—ã‚‡ã€‚','2012-08-15 17:34:11',''),(51,35,1,'In C+++ there are many hard part for beginner, let study :D','2012-08-15 17:34:11',''),(143,35,9,'Hey there, we&#39;re just writing to let you know that you&#39;ve been automatically subscribed to a repository on GitHub. <a href=\'https://github.com/dungntnew/MyForum\'>https://github.com/dungntnew/MyForum</a> \r\n\r\nYou&#39;ll receive notifications for all issues, pull requests, and comments that happen inside the repository. <a href=\'https://github.com/dungntnew/MyForum/subscription\'>https://github.com/dungntnew/MyForum/subscription</a> \r\nYou were automatically subscribed because you&#39;ve been given push access to the repository.\r\nThis mail from:  <a href=\"mailto:git@github.com\">git@github.com</a> \r\nYour email is:  <a href=\"mailto:dungntnew@gmail.com\">dungntnew@gmail.com</a>  welcome.\r\n\r\nThanks!','2012-08-17 20:46:08',''),(53,35,1,'ã¯ã„ã€ã‚ã‹ã‚Šã¾ã—ãŸã€‚','2012-08-15 17:34:11',''),(54,37,1,'ç§ã¯ä½•å›žã‚‚Cï¼ƒã§ã¹ã‚“ãã‚‡ã—ãŸã“ã¨ãŒã‚ã‚Šã¾ã—ãŸãŒã€Cï¼‹ï¼‹ã¯ã©ã‚“ãªã”ã§ã™ã‹ï¼Ÿ','2012-08-15 17:34:11',''),(55,35,1,'ãã‚ˆã†ã€ã‚ã‚ãŒãµã£ã¦ã„ã¾ã™ã€‚','2012-08-15 17:34:11',''),(67,35,NULL,'&lt;h1&gt; THis is demo Entities encode &lt;/h1&gt;','2012-08-17 02:18:51',''),(63,34,9,'å…ƒæ°—ã§ã™ã­ã€‚','2012-08-16 13:17:10',''),(161,34,2,'Hello, nice to meet you','2012-08-18 07:49:23',''),(162,37,NULL,'ã¯ã˜ã‚ã¾ã—ã¦ã€‚','2012-08-18 11:28:16',''),(159,35,6,'ã¯ã˜ã‚ã¾ã—ã¦ã€ç§ã¯ã€€sakura ã§ã™ã€‚\r\nEmail:   <a href=\"mailto:sakura@yuki.com\">sakura@yuki.com</a> \r\nWebsite: <a href=\'https://sakura.com.vn\'>https://sakura.com.vn</a> </a> \r\nã‚ã‚ŠãŒã¨ã”ã–ã„ã¾ã—ãŸã€‚\r\n','2012-08-18 07:35:08','http://localhost:3000/upload/noeln.jpg'),(156,34,NULL,'ã¯ã„ã€ã‚ãŸã—ã¾ã—ãŸã€‚','2012-08-18 07:26:46',''),(147,37,NULL,'Ch&Atilde;&nbsp;o c&Atilde;&iexcl;c b&aacute;&ordm;&iexcl;n','2012-08-18 07:12:56',''),(148,37,NULL,'Hello c&Atilde;&iexcl;c b&aacute;&ordm;&iexcl;n ','2012-08-18 07:20:31',''),(145,42,9,' <a href=\'http://google.com\'>http://google.com</a> \r\nmail email is:  <a href=\"mailto:dungntnew@gmail.com\">dungntnew@gmail.com</a> ','2012-08-18 04:32:38',''),(160,42,6,'Hello, Nice to meet you','2012-08-18 07:47:00','http://localhost:3000/upload/405967_241424279259583_100001760374211_582041_1229275465_n.jpg');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'admin'),(2,'user'),(3,'guest');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_table`
--

DROP TABLE IF EXISTS `test_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stamp_created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `stamp_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_table`
--

LOCK TABLES `test_table` WRITE;
/*!40000 ALTER TABLE `test_table` DISABLE KEYS */;
INSERT INTO `test_table` VALUES (1,'2012-08-15 16:40:53','2012-08-15 16:40:53');
/*!40000 ALTER TABLE `test_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thread`
--

DROP TABLE IF EXISTS `thread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thread` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_thread_user1_idx` (`user_id`),
  KEY `fk_thread_topic1_idx` (`topic_id`)
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thread`
--

LOCK TABLES `thread` WRITE;
/*!40000 ALTER TABLE `thread` DISABLE KEYS */;
INSERT INTO `thread` VALUES (34,2,1,'C++ã€€èªžã€€ã‚’ã¹ã‚“ãã‚‡ã†ã¾ã—ã‚‡ã€‚','2012-08-15 17:34:01','2012-08-18 07:49:23'),(35,2,1,'cï¼‹ï¼‹ã€€ã¯ã€€ã‚€ãšã‹ã—ã„ã”ã§ã™ã€‚','2012-08-15 17:34:01','2012-08-18 07:35:08'),(37,2,1,'C++ ã¯ã€€ã©ã‚“ãªã”ã§ã™ã‹ï¼Ÿ','2012-08-15 17:34:01','2012-08-18 11:28:16'),(42,2,9,'C++èªžã¯ã‚€ãšã‹ã—ã„ãŒã€ã¨ã¦ã‚‚ãŠã‚‚ã—ã‚ã„ã§ã™','2012-08-16 13:41:27','2012-08-18 07:47:00');
/*!40000 ALTER TABLE `thread` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic`
--

DROP TABLE IF EXISTS `topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topic` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `description` text CHARACTER SET latin1,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_topic_user1_idx` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
INSERT INTO `topic` VALUES (1,1,'.::ãŠçŸ¥ã‚‰ã›:: ..','ã“ã“ã§ã€é€šçŸ¥ã‚¢ã‚¯ãƒ†ã‚£ãƒ“ãƒ†ã‚£ã¨ãƒ‹ãƒ¥ãƒ¼ã‚¹','2012-07-29 14:20:40',1),(2,1,'æ—¥æœ¬èªžãƒ¬ãƒƒã‚¹ãƒ³ ^_^','ä¸€ç·’ã«æ—¥æœ¬èªžã‚’å‹‰å¼·ã—ã¾ã—ã‚‡ã†ï¼¾ï¼ï¼¾','2012-07-29 14:21:58',1),(3,1,' æ—¥æœ¬ã®ã‚¯ãƒ©ãƒ–ã«è©±ã™ ^_^','ä¸€ç·’ã«ç§ãŸã¡ã¯æ—¥æœ¬èªžã‚’è©±ã™','2012-07-29 14:23:04',1);
/*!40000 ALTER TABLE `topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `first_name` varchar(128) DEFAULT NULL,
  `last_name` varchar(128) DEFAULT NULL,
  `avatar` varchar(128) DEFAULT NULL,
  `status` varchar(32) DEFAULT 'active',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','{SSHA}X0HmCeYcSCm/xNIcXVMt/QPiitPo53CPkb31nvyZoMj1Y2+v8j5xMA==','admin@yuki.com','','Administrator','http://localhost:3000/upload/179166_487010617977656_1591397692_n.jpg','active','2012-08-10 09:40:10'),(4,'anhvt','{SSHA}VPsbjvbZd6pESYkzYGAoz2ptF/+g95OgNOOBh/SqXq8A1FXIZxY7Nw==','anhvt@gmail.com',NULL,NULL,NULL,'active','2012-08-10 18:13:55'),(2,'zozo','{SSHA}VP+BC/ZJlzuU2tp/YsJpr1ZJJPCADm3DCidDFiTktWl7G1Xlgqkk0w==','zozo@yuki.com','Roronoa','Zoro','http://localhost:3000/upload/Zoro-one-piece-5792972-1024-768.jpg','active','2012-08-14 11:56:56'),(3,'dungnt','{SSHA}yT7DwOKIjM44uT7iKDHzKY+PzmYmmRBifAzgJdICVtR4VCigEmG/kw==','dungnt@gmail.com','Dung','Nguyen Tri',NULL,'active','2012-08-10 18:13:33'),(5,'','{SSHA}J5deQ5DiOJFhwsi3VOX/t1A5drgljGihorg0KYCLkQGIp1Jilu42jg==','',NULL,NULL,NULL,'active','2012-08-12 04:01:57'),(6,'vhaforever','{SSHA}oM7eP/eYpkdxcY6dUQuKTvmSIy0LlPjToz14YGtoZHaz+Zv42jxwmg==','vhawildflower@yuki.com','VHA','Forever','http://localhost:3000/static/images/default_avatar.png','active','2012-08-15 18:02:53'),(7,'user','{SSHA}8rusLinm8aRctlsSkxOU8znSD4p5NotqOWiLRXYRqC8FrXxgOJNgbw==','vha@gmail.com','Vu Thi','Hong Anh','http://localhost:3000/static/images/default_avatar.png','active','2012-08-15 18:14:58'),(8,'nhunt','{SSHA}xlmcAZNNSRxYIXN/2Z+uJR/Ib+oloMnBTzzDdNekYhriGx+/PR2hWQ==','nhunt_53@vnu.edu.vn','Nguyá»…n Thá»‹','NhÆ°','http://localhost:3000/upload/ilv.jpg','active','2012-08-15 18:40:42'),(9,'sakura','{SSHA}bfshqXieIKEKIy4XcTdnsUmR0Ox0+L3SXXiVZqKRW8jK2cGcwj1AVg==','sakura@yuki.com','Saku','Ra','http://localhost:3000/static/images/default_avatar.png','active','2012-08-15 18:44:55'),(17,'sakura3','{SSHA}sQlY//T+gmCzJUh3abTktHrsm+XYLneUfNRYEh6sjP3qRUTdGXSIyQ==','sakura@gmail.com.vn','nguuyen','van a','http://localhost:3000/static/images/default_avatar.png','active','2012-08-17 08:55:43'),(16,'avatar','{SSHA}H+CbPTfErB7AnLcIb4hVjzViCVmbg14ZRghEHwhvi0agBlmDO8GQbQ==','avatar@gmail.com','ABC','abc','http://localhost:3000/static/images/default_avatar.png','active','2012-08-17 08:54:15'),(15,'user1','{SSHA}Gc42n3BEHG0n/rz8JdPzPIzXvoT0FRcObDgi/Eb/GBxeQUMDKsDGRw==','user1@gmail.com','Nguyen','user','http://localhost:3000/static/images/default_avatar.png','active','2012-08-17 08:50:22'),(14,'vha','{SSHA}P44380Vhlv23+b8cLuuYUCnd69I4yA5BNdQ5dswuUU16btERG0BYSQ==','sakura@gmail.com','nguyen tri','dung','http://localhost:3000/static/images/default_avatar.png','active','2012-08-17 08:47:07'),(18,'admin2','{SSHA}jSoEWtOFrc/I2pgVve4YxB+Db82IEbfFZSDoEcGO9QBU8S+881Ul3g==','dungntnew@gmail.com','Nguyen','Dung','http://localhost:3000/static/images/default_avatar.png','active','2012-08-17 09:11:52'),(19,'newuser2','{SSHA}Z+BZQDiI87UU7C4tY7IJLm03E+mNI+7ly1LsrxwPZT0KNhPkzlrylw==','newuser@gmail.com','Nuew','Uas','http://localhost:3000/static/images/default_avatar.png','active','2012-08-17 09:13:07'),(20,'sakura4','{SSHA}dVeTSr5HMlB8ZYWKBiUmRHUqfGsu2sQpLghhqNE1uiM7hTSfjNAVVA==','sakuara@gaaa.com','abc12','aaaa','http://localhost:3000/static/images/default_avatar.png','active','2012-08-17 09:18:46'),(21,'abc','{SSHA}DiksDaTaDchyechE3z14StAm1DC5MhWnqr6tQswZZXq0M8rcFrJDxg==','abc@gaa.com','aaa','aaa','http://localhost:3000/upload/Zoro-one-piece-5792972-1024-768.jpg','active','2012-08-17 09:48:25'),(22,'adsadsa','{SSHA}+991HA/tSoYkG9aOaPzXvtkA1oZ51gwN21rcdmBGprHCEpmxm7OPig==','aaa@gma.aa','adsda','dsaadsa','http://localhost:3000/upload/Zoro-one-piece-5792972-1024-768.jpg','active','2012-08-17 09:54:47'),(23,'newuser','{SSHA}zioZB/sgRj4w2fAssAnIHNh6tVbg8is7mG2BLC0theIJEwwYQyNjpA==','mail@gmail.com','Nguyen','TriDung','http://localhost:3000/static/images/default_avatar.png','active','2012-08-17 17:40:16'),(24,'newuser','{SSHA}XdHuE4X1gU6nOpKsfFLVw4wRXbBMkDOblKczHQoTZAPqbvteGwPeGA==','mail@gmail.com','abc','avsasa','http://localhost:3000/static/images/default_avatar.png','active','2012-08-17 17:41:00'),(25,'usernew','{SSHA}yDv2zQI1BO8377b4aUbTXnnuTd4NUVrJ8Q8NyF6NCv9HlabqTGm3kg==','user@gmail.com','Nguyen','Tri DUng','http://localhost:3000/static/images/default_avatar.png','active','2012-08-17 17:43:24'),(26,'user3','{SSHA}NyOQxQT7qbY4MY+oEMNntun6zatxI+O9BFHgDh7A8Bc3+/C1QrBOww==','dungnt@gmail2.com','vhafore','cacscasa','http://localhost:3000/static/images/default_avatar.png','active','2012-08-17 17:48:43'),(27,'newus','{SSHA}79DXtVofZzzzZowMDGhYojNakfCMpru9lRXfYeD56emJxfKG1gTwCQ==','aaa@gmail.com','adsadsadsa','adsdsadsadsa','http://localhost:3000/static/images/default_avatar.png','active','2012-08-17 17:51:32'),(28,'sakura33','{SSHA}IDqhkLLHSBCaYwVjeZUfeZyMy8GVVrKrlt4vm0jDHHpGq+2y94InkQ==','aaaaa@ga.com','adsadsa','dadsadsa','http://localhost:3000/static/images/default_avatar.png','active','2012-08-17 17:52:17'),(29,'mnina','{SSHA}GpI1riuk2F1LLJxO445mYlH1avp6CZOoFacb3mHbzdFEKBgwEKlOSw==','mina@gmail.com','Mimi','Na','http://localhost:3000/static/images/default_avatar.png','active','2012-08-18 07:47:49');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_to_role`
--

DROP TABLE IF EXISTS `user_to_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_to_role` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_to_role`
--

LOCK TABLES `user_to_role` WRITE;
/*!40000 ALTER TABLE `user_to_role` DISABLE KEYS */;
INSERT INTO `user_to_role` VALUES (1,1),(2,2),(3,2),(6,2),(7,2),(8,2),(9,2),(10,2),(11,2),(12,2),(13,2),(14,2),(15,2),(16,2),(17,2),(18,2),(19,2),(20,2),(21,2),(22,2),(23,2),(24,2),(25,2),(26,2),(27,2),(28,2),(29,2);
/*!40000 ALTER TABLE `user_to_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-08-18 23:05:24
