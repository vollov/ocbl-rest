-- MySQL dump 10.13  Distrib 5.5.53, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: ocbl_rest
-- ------------------------------------------------------
-- Server version	5.5.53-0ubuntu0.14.04.1

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
-- Current Database: `ocbl_rest`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ocbl_rest` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `ocbl_rest`;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add user',6,'add_account'),(17,'Can change user',6,'change_account'),(18,'Can delete user',6,'delete_account'),(19,'Can add Token',7,'add_token'),(20,'Can change Token',7,'change_token'),(21,'Can delete Token',7,'delete_token');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authentication_account`
--

DROP TABLE IF EXISTS `authentication_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authentication_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `email` varchar(254) NOT NULL,
  `username` varchar(40) NOT NULL,
  `first_name` varchar(40) NOT NULL,
  `last_name` varchar(40) NOT NULL,
  `birth_year` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authentication_account`
--

LOCK TABLES `authentication_account` WRITE;
/*!40000 ALTER TABLE `authentication_account` DISABLE KEYS */;
INSERT INTO `authentication_account` VALUES (3,'pbkdf2_sha256$30000$Dt33R5peDZWL$ENyQ2QXQqvtAyHL3srjxU55ycieKAxX4cr+Xqt6VTAc=','2016-12-27 13:43:41',1,'admin@ocbl.ca','admin','','',1988,'2016-12-25 21:06:49','2016-12-25 21:06:49',1,1,'2016-12-25 21:06:49'),(4,'pass','2016-12-26 16:07:37',0,'dustin@ocbl.ca','dustin','dustin','zhang',1988,'2016-12-26 16:08:15','2016-12-26 16:08:15',1,1,'2016-12-26 16:07:34');
/*!40000 ALTER TABLE `authentication_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authentication_account_groups`
--

DROP TABLE IF EXISTS `authentication_account_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authentication_account_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `authentication_account_groups_account_id_7b343099_uniq` (`account_id`,`group_id`),
  KEY `authentication_account_groups_group_id_b50264dd_fk_auth_group_id` (`group_id`),
  CONSTRAINT `authentication_account_groups_group_id_b50264dd_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `authentication__account_id_caf1df9b_fk_authentication_account_id` FOREIGN KEY (`account_id`) REFERENCES `authentication_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authentication_account_groups`
--

LOCK TABLES `authentication_account_groups` WRITE;
/*!40000 ALTER TABLE `authentication_account_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `authentication_account_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authentication_account_user_permissions`
--

DROP TABLE IF EXISTS `authentication_account_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authentication_account_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `authentication_account_user_permissions_account_id_cc8410e2_uniq` (`account_id`,`permission_id`),
  KEY `authentication_acco_permission_id_0cd35b44_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `authentication_acco_permission_id_0cd35b44_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `authentication__account_id_f54c8acd_fk_authentication_account_id` FOREIGN KEY (`account_id`) REFERENCES `authentication_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authentication_account_user_permissions`
--

LOCK TABLES `authentication_account_user_permissions` WRITE;
/*!40000 ALTER TABLE `authentication_account_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `authentication_account_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_authentication_account_id` FOREIGN KEY (`user_id`) REFERENCES `authentication_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_authentication_account_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_authentication_account_id` FOREIGN KEY (`user_id`) REFERENCES `authentication_account` (`id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2016-12-26 16:08:15','4','dustin@ocbl.ca',1,'[{\"added\": {}}]',6,3);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(6,'authentication','account'),(7,'authtoken','token'),(4,'contenttypes','contenttype'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-12-21 12:29:12'),(2,'contenttypes','0002_remove_content_type_name','2016-12-21 12:29:12'),(3,'auth','0001_initial','2016-12-21 12:29:13'),(4,'auth','0002_alter_permission_name_max_length','2016-12-21 12:29:14'),(5,'auth','0003_alter_user_email_max_length','2016-12-21 12:29:14'),(6,'auth','0004_alter_user_username_opts','2016-12-21 12:29:14'),(7,'auth','0005_alter_user_last_login_null','2016-12-21 12:29:14'),(8,'auth','0006_require_contenttypes_0002','2016-12-21 12:29:14'),(9,'auth','0007_alter_validators_add_error_messages','2016-12-21 12:29:14'),(10,'auth','0008_alter_user_username_max_length','2016-12-21 12:29:14'),(11,'authentication','0001_initial','2016-12-21 12:29:16'),(12,'admin','0001_initial','2016-12-21 12:29:17'),(13,'admin','0002_logentry_remove_auto_add','2016-12-21 12:29:17'),(14,'sessions','0001_initial','2016-12-21 12:29:17'),(15,'authentication','0002_auto_20161226_1945','2016-12-26 19:45:36'),(16,'authtoken','0001_initial','2016-12-26 19:45:36'),(17,'authtoken','0002_auto_20160226_1747','2016-12-26 19:45:37');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('4739gyppyfs9w2jegraqs2880ywe59jk','NTFhZjE5ZDc3NDQ2ZTc1NDgyMGFhOTRkMWYxMjYwNTM5ZmVhYmZhMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImE4MGJjMjYyMjg3YzJlNzJmYTljNjYzYWRlNTg2N2QwMjFkMzg0ZTIiLCJfYXV0aF91c2VyX2lkIjoiMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2017-01-09 16:58:08'),('47y4voyeih0vj2dgu0wkrbk1572mbwta','N2RmZTM0NTdkN2NiZmViYjhkMzMyODFhZmYwOTA4Y2YyZTMxYzY0OTp7Il9hdXRoX3VzZXJfaGFzaCI6ImE4MGJjMjYyMjg3YzJlNzJmYTljNjYzYWRlNTg2N2QwMjFkMzg0ZTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2017-01-10 02:19:15'),('dyj4ywti7aooajnnccnomeivjzhwqbue','N2RmZTM0NTdkN2NiZmViYjhkMzMyODFhZmYwOTA4Y2YyZTMxYzY0OTp7Il9hdXRoX3VzZXJfaGFzaCI6ImE4MGJjMjYyMjg3YzJlNzJmYTljNjYzYWRlNTg2N2QwMjFkMzg0ZTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2017-01-09 16:11:28'),('prqnuojzqz2725zgvu4kmmgkvxgxj1n5','N2RmZTM0NTdkN2NiZmViYjhkMzMyODFhZmYwOTA4Y2YyZTMxYzY0OTp7Il9hdXRoX3VzZXJfaGFzaCI6ImE4MGJjMjYyMjg3YzJlNzJmYTljNjYzYWRlNTg2N2QwMjFkMzg0ZTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2017-01-10 03:06:57'),('qaiw0c7i3n78ble6yx85ryeekvkktdfl','N2RmZTM0NTdkN2NiZmViYjhkMzMyODFhZmYwOTA4Y2YyZTMxYzY0OTp7Il9hdXRoX3VzZXJfaGFzaCI6ImE4MGJjMjYyMjg3YzJlNzJmYTljNjYzYWRlNTg2N2QwMjFkMzg0ZTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2017-01-10 03:01:17'),('uf7w6t9wvv05x8xk7rcg6p4er1d467jn','N2U3ZmE5NDIxYWQ4YzI1YzA3NGRkYzliODJmMmM0NDI1MzFhMGJkZjp7Il9hdXRoX3VzZXJfaGFzaCI6ImY0ZTc0NjA3MjBlOWJmZGRhNjdmMzhhZTMyZjBmMmE2NWEzNzMzMGYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-01-08 20:36:04'),('x4116oefx08spwn49co0oau35lveetnz','N2RmZTM0NTdkN2NiZmViYjhkMzMyODFhZmYwOTA4Y2YyZTMxYzY0OTp7Il9hdXRoX3VzZXJfaGFzaCI6ImE4MGJjMjYyMjg3YzJlNzJmYTljNjYzYWRlNTg2N2QwMjFkMzg0ZTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2017-01-10 13:43:41');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-16 21:28:01
