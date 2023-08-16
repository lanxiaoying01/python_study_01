-- MySQL dump 10.13  Distrib 8.0.33, for macos12.6 (arm64)
--
-- Host: localhost    Database: employee_management_system
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `app01_admin`
--

DROP TABLE IF EXISTS `app01_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_admin` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_admin`
--

LOCK TABLES `app01_admin` WRITE;
/*!40000 ALTER TABLE `app01_admin` DISABLE KEYS */;
INSERT INTO `app01_admin` VALUES (2,'amelia','232a7bcdba8d2380fd3184ba4c303c41'),(3,'流流','232a7bcdba8d2380fd3184ba4c303c41');
/*!40000 ALTER TABLE `app01_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_boss`
--

DROP TABLE IF EXISTS `app01_boss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_boss` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `age` int NOT NULL,
  `img` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_boss`
--

LOCK TABLES `app01_boss` WRITE;
/*!40000 ALTER TABLE `app01_boss` DISABLE KEYS */;
INSERT INTO `app01_boss` VALUES (1,'Eric',36,'app01/static/img/4862CBBC-079D-4C6F-86D8-78F32788DA71.jpeg'),(2,'Ella',32,'media/0E05633B-2B5D-4167-8386-5B7D992A5490.jpeg');
/*!40000 ALTER TABLE `app01_boss` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_city`
--

DROP TABLE IF EXISTS `app01_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_city` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `count` int NOT NULL,
  `img` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_city`
--

LOCK TABLES `app01_city` WRITE;
/*!40000 ALTER TABLE `app01_city` DISABLE KEYS */;
INSERT INTO `app01_city` VALUES (1,'上海',100000,'city/0FAEB1CE-B446-43E4-A75C-F004099AA094.rw2'),(2,'衡阳',12000,'city/07975E7A-6560-4388-B227-D4E05D098620.jpeg');
/*!40000 ALTER TABLE `app01_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_department`
--

DROP TABLE IF EXISTS `app01_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_department` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_department`
--

LOCK TABLES `app01_department` WRITE;
/*!40000 ALTER TABLE `app01_department` DISABLE KEYS */;
INSERT INTO `app01_department` VALUES (1,'IT部门'),(2,'销售部'),(6,'品牌部'),(7,'技术部'),(8,'推广部');
/*!40000 ALTER TABLE `app01_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_order`
--

DROP TABLE IF EXISTS `app01_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `oid` varchar(64) NOT NULL,
  `title` varchar(32) NOT NULL,
  `price` int NOT NULL,
  `status` smallint NOT NULL,
  `admin_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app01_order_admin_id_06590413_fk_app01_admin_id` (`admin_id`),
  CONSTRAINT `app01_order_admin_id_06590413_fk_app01_admin_id` FOREIGN KEY (`admin_id`) REFERENCES `app01_admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_order`
--

LOCK TABLES `app01_order` WRITE;
/*!40000 ALTER TABLE `app01_order` DISABLE KEYS */;
INSERT INTO `app01_order` VALUES (3,'202308110803188954','a',0,1,2),(4,'202308110803245292','b',0,1,2),(6,'202308110944243794','b',220,1,2),(7,'202308110944308087','b',2000,1,2),(8,'202308110945229356','777',0,1,2);
/*!40000 ALTER TABLE `app01_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_prettynum`
--

DROP TABLE IF EXISTS `app01_prettynum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_prettynum` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `mobile` varchar(11) NOT NULL,
  `price` int NOT NULL,
  `lever` smallint NOT NULL,
  `status` smallint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_prettynum`
--

LOCK TABLES `app01_prettynum` WRITE;
/*!40000 ALTER TABLE `app01_prettynum` DISABLE KEYS */;
INSERT INTO `app01_prettynum` VALUES (1,'15721220019',10,1,1),(2,'13816443591',22,4,2),(3,'15500552064',40,4,2);
/*!40000 ALTER TABLE `app01_prettynum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_task`
--

DROP TABLE IF EXISTS `app01_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_task` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `level` smallint NOT NULL,
  `title` varchar(64) NOT NULL,
  `detail` longtext NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app01_task_user_id_93daa16a_fk_app01_admin_id` (`user_id`),
  CONSTRAINT `app01_task_user_id_93daa16a_fk_app01_admin_id` FOREIGN KEY (`user_id`) REFERENCES `app01_admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_task`
--

LOCK TABLES `app01_task` WRITE;
/*!40000 ALTER TABLE `app01_task` DISABLE KEYS */;
INSERT INTO `app01_task` VALUES (1,1,'111','111',3),(2,1,'111','111',3),(3,1,'111','111',3),(4,1,'111','111',3);
/*!40000 ALTER TABLE `app01_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_userinfo`
--

DROP TABLE IF EXISTS `app01_userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_userinfo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  `password` varchar(64) NOT NULL,
  `age` varchar(2) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `gender` smallint NOT NULL,
  `dept_id` bigint DEFAULT NULL,
  `account` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `app01_userinfo_dept_id_e5f1fe82_fk_app01_department_id` (`dept_id`),
  CONSTRAINT `app01_userinfo_dept_id_e5f1fe82_fk_app01_department_id` FOREIGN KEY (`dept_id`) REFERENCES `app01_department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_userinfo`
--

LOCK TABLES `app01_userinfo` WRITE;
/*!40000 ALTER TABLE `app01_userinfo` DISABLE KEYS */;
INSERT INTO `app01_userinfo` VALUES (1,'小红','123','16','2023-08-03 15:32:19.000000',2,1,0.00),(2,'小李','123','23','2023-08-03 15:34:57.000000',1,2,0.00),(6,'涂山璟','123','22','2023-01-01 00:00:00.000000',1,2,0.00),(7,'小夭','123','21','2023-01-01 00:00:00.000000',2,1,0.00);
/*!40000 ALTER TABLE `app01_userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add department',7,'add_department'),(26,'Can change department',7,'change_department'),(27,'Can delete department',7,'delete_department'),(28,'Can view department',7,'view_department'),(29,'Can add user info',8,'add_userinfo'),(30,'Can change user info',8,'change_userinfo'),(31,'Can delete user info',8,'delete_userinfo'),(32,'Can view user info',8,'view_userinfo'),(33,'Can add pretty num',9,'add_prettynum'),(34,'Can change pretty num',9,'change_prettynum'),(35,'Can delete pretty num',9,'delete_prettynum'),(36,'Can view pretty num',9,'view_prettynum'),(37,'Can add admin',10,'add_admin'),(38,'Can change admin',10,'change_admin'),(39,'Can delete admin',10,'delete_admin'),(40,'Can view admin',10,'view_admin'),(41,'Can add task',11,'add_task'),(42,'Can change task',11,'change_task'),(43,'Can delete task',11,'delete_task'),(44,'Can view task',11,'view_task'),(45,'Can add order',12,'add_order'),(46,'Can change order',12,'change_order'),(47,'Can delete order',12,'delete_order'),(48,'Can view order',12,'view_order'),(49,'Can add boss',13,'add_boss'),(50,'Can change boss',13,'change_boss'),(51,'Can delete boss',13,'delete_boss'),(52,'Can view boss',13,'view_boss'),(53,'Can add city',14,'add_city'),(54,'Can change city',14,'change_city'),(55,'Can delete city',14,'delete_city'),(56,'Can view city',14,'view_city');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(10,'app01','admin'),(13,'app01','boss'),(14,'app01','city'),(7,'app01','department'),(12,'app01','order'),(9,'app01','prettynum'),(11,'app01','task'),(8,'app01','userinfo'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-08-02 09:23:30.807723'),(2,'auth','0001_initial','2023-08-02 09:23:30.882921'),(3,'admin','0001_initial','2023-08-02 09:23:30.904304'),(4,'admin','0002_logentry_remove_auto_add','2023-08-02 09:23:30.914541'),(5,'admin','0003_logentry_add_action_flag_choices','2023-08-02 09:23:30.917623'),(6,'app01','0001_initial','2023-08-02 09:23:30.929051'),(7,'contenttypes','0002_remove_content_type_name','2023-08-02 09:23:30.944501'),(8,'auth','0002_alter_permission_name_max_length','2023-08-02 09:23:30.954771'),(9,'auth','0003_alter_user_email_max_length','2023-08-02 09:23:30.992124'),(10,'auth','0004_alter_user_username_opts','2023-08-02 09:23:30.995338'),(11,'auth','0005_alter_user_last_login_null','2023-08-02 09:23:31.005436'),(12,'auth','0006_require_contenttypes_0002','2023-08-02 09:23:31.006235'),(13,'auth','0007_alter_validators_add_error_messages','2023-08-02 09:23:31.009976'),(14,'auth','0008_alter_user_username_max_length','2023-08-02 09:23:31.022572'),(15,'auth','0009_alter_user_last_name_max_length','2023-08-02 09:23:31.033996'),(16,'auth','0010_alter_group_name_max_length','2023-08-02 09:23:31.040641'),(17,'auth','0011_update_proxy_permissions','2023-08-02 09:23:31.044019'),(18,'auth','0012_alter_user_first_name_max_length','2023-08-02 09:23:31.054950'),(19,'sessions','0001_initial','2023-08-02 09:23:31.060534'),(20,'app01','0002_userinfo_account','2023-08-02 09:24:00.141792'),(21,'app01','0003_prettynum_alter_userinfo_dept','2023-08-03 15:36:08.707345'),(22,'app01','0004_admin','2023-08-07 07:35:53.411144'),(23,'app01','0005_task','2023-08-10 07:55:33.133340'),(24,'app01','0006_order','2023-08-11 03:58:04.365319'),(25,'app01','0007_boss','2023-08-14 06:38:23.133705'),(26,'app01','0008_city','2023-08-14 07:18:06.192180');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('2e1m3hu6mqpvs4fk9mbzebb3uh7v5x1a','eyJpbWFnZV9jb2RlIjoiWVJDSSIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9:1qTzdp:98BSmQGCfLGY73kcz46O_S9b3QsTy2XUJ3ioj1ZpGk0','2023-08-10 07:00:29.072003'),('2g05vvszk2sfleb0nonarx653ijbjqso','eyJpbWFnZV9jb2RlIjoiQkdSRCIsIl9zZXNzaW9uX2V4cGlyeSI6NjA0ODAwLCJpbmZvIjp7ImlkIjoyLCJuYW1lIjoiYW1lbGlhIn19:1qTzg8:lXzQUobQiHfH4wCE3ZQZ8O4REWBoQ06s__EMQzI6fk4','2023-08-17 07:01:52.456307'),('hx32mr8w69u9nspagrfefml7gibsgmq5','eyJpbmZvIjp7ImlkIjoyLCJuYW1lIjoiYW1lbGlhIn0sImltYWdlX2NvZGUiOiJKTkdTIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0:1qTdvr:rL_3UtiNXfmXBNBTcR3pHNQ53oB6xQz74wEIqtmvQRs','2023-08-09 07:49:39.507700'),('lg9375s9tdmpz44yd2jj6ky3gxhmcjtd','eyJpbWFnZV9jb2RlIjoiV0FTWSIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9:1qTzai:BJRTu-_y_51q64-AZxi6R4-_B0dQV3yhBaNpq85ckwE','2023-08-10 06:57:16.304081'),('q4bi8hwvmp1zigeke5wyl4oftjtslxdh','eyJpbWFnZV9jb2RlIjoiREtVQiIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9:1qTeCY:0E7pTgePYoT1dwVIUGdUDDQbBQGeY02urmRpZJwovcM','2023-08-09 08:06:54.106102');
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

-- Dump completed on 2023-08-16  9:35:11
