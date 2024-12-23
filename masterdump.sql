-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: localhost    Database: 
-- ------------------------------------------------------
-- Server version	8.0.40-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!50606 SET @OLD_INNODB_STATS_AUTO_RECALC=@@INNODB_STATS_AUTO_RECALC */;
/*!50606 SET GLOBAL INNODB_STATS_AUTO_RECALC=OFF */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Position to start replication or point-in-time recovery from
--

CHANGE MASTER TO MASTER_LOG_FILE='mysql-bin.000009', MASTER_LOG_POS=1369;

--
-- Current Database: `mysql`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mysql` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `mysql`;

--
-- Table structure for table `columns_priv`
--

DROP TABLE IF EXISTS `columns_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `columns_priv` (
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `Table_name` char(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `Column_name` char(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Column_priv` set('Select','Insert','Update','References') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`Host`,`User`,`Db`,`Table_name`,`Column_name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Column privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `columns_priv`
--

LOCK TABLES `columns_priv` WRITE;
/*!40000 ALTER TABLE `columns_priv` DISABLE KEYS */;
/*!40000 ALTER TABLE `columns_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `component`
--

DROP TABLE IF EXISTS `component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `component` (
  `component_id` int unsigned NOT NULL AUTO_INCREMENT,
  `component_group_id` int unsigned NOT NULL,
  `component_urn` text NOT NULL,
  PRIMARY KEY (`component_id`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Components';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `component`
--

LOCK TABLES `component` WRITE;
/*!40000 ALTER TABLE `component` DISABLE KEYS */;
/*!40000 ALTER TABLE `component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db`
--

DROP TABLE IF EXISTS `db`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `db` (
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `Select_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Event_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Trigger_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Host`,`User`,`Db`),
  KEY `User` (`User`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Database privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db`
--

LOCK TABLES `db` WRITE;
/*!40000 ALTER TABLE `db` DISABLE KEYS */;
INSERT INTO `db` VALUES ('%','master_user','master_user','Y','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y'),('%','test','master_user','Y','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y'),('%','your_database_name','root','Y','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y'),('localhost','performance_schema','mysql.session','Y','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N'),('localhost','sys','mysql.sys','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','Y');
/*!40000 ALTER TABLE `db` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_roles`
--

DROP TABLE IF EXISTS `default_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `default_roles` (
  `HOST` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `USER` char(32) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `DEFAULT_ROLE_HOST` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '%',
  `DEFAULT_ROLE_USER` char(32) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`HOST`,`USER`,`DEFAULT_ROLE_HOST`,`DEFAULT_ROLE_USER`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Default roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_roles`
--

LOCK TABLES `default_roles` WRITE;
/*!40000 ALTER TABLE `default_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine_cost`
--

DROP TABLE IF EXISTS `engine_cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `engine_cost` (
  `engine_name` varchar(64) NOT NULL,
  `device_type` int NOT NULL,
  `cost_name` varchar(64) NOT NULL,
  `cost_value` float DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comment` varchar(1024) DEFAULT NULL,
  `default_value` float GENERATED ALWAYS AS ((case `cost_name` when _utf8mb3'io_block_read_cost' then 1.0 when _utf8mb3'memory_block_read_cost' then 0.25 else NULL end)) VIRTUAL,
  PRIMARY KEY (`cost_name`,`engine_name`,`device_type`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine_cost`
--

LOCK TABLES `engine_cost` WRITE;
/*!40000 ALTER TABLE `engine_cost` DISABLE KEYS */;
INSERT INTO `engine_cost` (`engine_name`, `device_type`, `cost_name`, `cost_value`, `last_update`, `comment`) VALUES ('default',0,'io_block_read_cost',NULL,'2024-09-01 18:46:17',NULL),('default',0,'memory_block_read_cost',NULL,'2024-09-01 18:46:17',NULL);
/*!40000 ALTER TABLE `engine_cost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `func`
--

DROP TABLE IF EXISTS `func`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `func` (
  `name` char(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `ret` tinyint NOT NULL DEFAULT '0',
  `dl` char(128) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `type` enum('function','aggregate') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='User defined functions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `func`
--

LOCK TABLES `func` WRITE;
/*!40000 ALTER TABLE `func` DISABLE KEYS */;
/*!40000 ALTER TABLE `func` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_grants`
--

DROP TABLE IF EXISTS `global_grants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `global_grants` (
  `USER` char(32) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `HOST` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `PRIV` char(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `WITH_GRANT_OPTION` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`USER`,`HOST`,`PRIV`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Extended global grants';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_grants`
--

LOCK TABLES `global_grants` WRITE;
/*!40000 ALTER TABLE `global_grants` DISABLE KEYS */;
INSERT INTO `global_grants` VALUES ('debian-sys-maint','localhost','APPLICATION_PASSWORD_ADMIN','Y'),('debian-sys-maint','localhost','AUDIT_ADMIN','Y'),('debian-sys-maint','localhost','AUTHENTICATION_POLICY_ADMIN','Y'),('debian-sys-maint','localhost','BACKUP_ADMIN','Y'),('debian-sys-maint','localhost','BINLOG_ADMIN','Y'),('debian-sys-maint','localhost','BINLOG_ENCRYPTION_ADMIN','Y'),('debian-sys-maint','localhost','CLONE_ADMIN','Y'),('debian-sys-maint','localhost','CONNECTION_ADMIN','Y'),('debian-sys-maint','localhost','ENCRYPTION_KEY_ADMIN','Y'),('debian-sys-maint','localhost','FLUSH_OPTIMIZER_COSTS','Y'),('debian-sys-maint','localhost','FLUSH_STATUS','Y'),('debian-sys-maint','localhost','FLUSH_TABLES','Y'),('debian-sys-maint','localhost','FLUSH_USER_RESOURCES','Y'),('debian-sys-maint','localhost','GROUP_REPLICATION_ADMIN','Y'),('debian-sys-maint','localhost','GROUP_REPLICATION_STREAM','Y'),('debian-sys-maint','localhost','INNODB_REDO_LOG_ARCHIVE','Y'),('debian-sys-maint','localhost','INNODB_REDO_LOG_ENABLE','Y'),('debian-sys-maint','localhost','PASSWORDLESS_USER_ADMIN','Y'),('debian-sys-maint','localhost','PERSIST_RO_VARIABLES_ADMIN','Y'),('debian-sys-maint','localhost','REPLICATION_APPLIER','Y'),('debian-sys-maint','localhost','REPLICATION_SLAVE_ADMIN','Y'),('debian-sys-maint','localhost','RESOURCE_GROUP_ADMIN','Y'),('debian-sys-maint','localhost','RESOURCE_GROUP_USER','Y'),('debian-sys-maint','localhost','ROLE_ADMIN','Y'),('debian-sys-maint','localhost','SENSITIVE_VARIABLES_OBSERVER','Y'),('debian-sys-maint','localhost','SERVICE_CONNECTION_ADMIN','Y'),('debian-sys-maint','localhost','SESSION_VARIABLES_ADMIN','Y'),('debian-sys-maint','localhost','SET_USER_ID','Y'),('debian-sys-maint','localhost','SHOW_ROUTINE','Y'),('debian-sys-maint','localhost','SYSTEM_USER','Y'),('debian-sys-maint','localhost','SYSTEM_VARIABLES_ADMIN','Y'),('debian-sys-maint','localhost','TABLE_ENCRYPTION_ADMIN','Y'),('debian-sys-maint','localhost','TELEMETRY_LOG_ADMIN','Y'),('debian-sys-maint','localhost','XA_RECOVER_ADMIN','Y'),('mysql.infoschema','localhost','AUDIT_ABORT_EXEMPT','N'),('mysql.infoschema','localhost','FIREWALL_EXEMPT','N'),('mysql.infoschema','localhost','SYSTEM_USER','N'),('mysql.session','localhost','AUDIT_ABORT_EXEMPT','N'),('mysql.session','localhost','AUTHENTICATION_POLICY_ADMIN','N'),('mysql.session','localhost','BACKUP_ADMIN','N'),('mysql.session','localhost','CLONE_ADMIN','N'),('mysql.session','localhost','CONNECTION_ADMIN','N'),('mysql.session','localhost','FIREWALL_EXEMPT','N'),('mysql.session','localhost','PERSIST_RO_VARIABLES_ADMIN','N'),('mysql.session','localhost','SESSION_VARIABLES_ADMIN','N'),('mysql.session','localhost','SYSTEM_USER','N'),('mysql.session','localhost','SYSTEM_VARIABLES_ADMIN','N'),('mysql.sys','localhost','AUDIT_ABORT_EXEMPT','N'),('mysql.sys','localhost','FIREWALL_EXEMPT','N'),('mysql.sys','localhost','SYSTEM_USER','N'),('root','localhost','APPLICATION_PASSWORD_ADMIN','Y'),('root','localhost','AUDIT_ABORT_EXEMPT','Y'),('root','localhost','AUDIT_ADMIN','Y'),('root','localhost','AUTHENTICATION_POLICY_ADMIN','Y'),('root','localhost','BACKUP_ADMIN','Y'),('root','localhost','BINLOG_ADMIN','Y'),('root','localhost','BINLOG_ENCRYPTION_ADMIN','Y'),('root','localhost','CLONE_ADMIN','Y'),('root','localhost','CONNECTION_ADMIN','Y'),('root','localhost','ENCRYPTION_KEY_ADMIN','Y'),('root','localhost','FIREWALL_EXEMPT','Y'),('root','localhost','FLUSH_OPTIMIZER_COSTS','Y'),('root','localhost','FLUSH_STATUS','Y'),('root','localhost','FLUSH_TABLES','Y'),('root','localhost','FLUSH_USER_RESOURCES','Y'),('root','localhost','GROUP_REPLICATION_ADMIN','Y'),('root','localhost','GROUP_REPLICATION_STREAM','Y'),('root','localhost','INNODB_REDO_LOG_ARCHIVE','Y'),('root','localhost','INNODB_REDO_LOG_ENABLE','Y'),('root','localhost','PASSWORDLESS_USER_ADMIN','Y'),('root','localhost','PERSIST_RO_VARIABLES_ADMIN','Y'),('root','localhost','REPLICATION_APPLIER','Y'),('root','localhost','REPLICATION_SLAVE_ADMIN','Y'),('root','localhost','RESOURCE_GROUP_ADMIN','Y'),('root','localhost','RESOURCE_GROUP_USER','Y'),('root','localhost','ROLE_ADMIN','Y'),('root','localhost','SENSITIVE_VARIABLES_OBSERVER','Y'),('root','localhost','SERVICE_CONNECTION_ADMIN','Y'),('root','localhost','SESSION_VARIABLES_ADMIN','Y'),('root','localhost','SET_USER_ID','Y'),('root','localhost','SHOW_ROUTINE','Y'),('root','localhost','SYSTEM_USER','Y'),('root','localhost','SYSTEM_VARIABLES_ADMIN','Y'),('root','localhost','TABLE_ENCRYPTION_ADMIN','Y'),('root','localhost','TELEMETRY_LOG_ADMIN','Y'),('root','localhost','XA_RECOVER_ADMIN','Y');
/*!40000 ALTER TABLE `global_grants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gtid_executed`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `gtid_executed` (
  `source_uuid` char(36) NOT NULL COMMENT 'uuid of the source where the transaction was originally executed.',
  `interval_start` bigint NOT NULL COMMENT 'First number of interval.',
  `interval_end` bigint NOT NULL COMMENT 'Last number of interval.',
  PRIMARY KEY (`source_uuid`,`interval_start`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `help_category`
--

DROP TABLE IF EXISTS `help_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `help_category` (
  `help_category_id` smallint unsigned NOT NULL,
  `name` char(64) NOT NULL,
  `parent_category_id` smallint unsigned DEFAULT NULL,
  `url` text NOT NULL,
  PRIMARY KEY (`help_category_id`),
  UNIQUE KEY `name` (`name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='help categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_category`
--

LOCK TABLES `help_category` WRITE;
/*!40000 ALTER TABLE `help_category` DISABLE KEYS */;
INSERT INTO `help_category` VALUES (0,'Contents',0,''),(1,'Help Metadata',0,''),(2,'Data Types',0,''),(3,'Administration',0,''),(4,'Functions',0,''),(5,'Enterprise Encryption Functions',4,''),(6,'Language Structure',0,''),(7,'Geographic Features',0,''),(8,'MBR',7,''),(9,'WKT',7,''),(10,'Comparison Operators',4,''),(11,'Logical Operators',4,''),(12,'Flow Control Functions',4,''),(13,'Numeric Functions',4,''),(14,'Date and Time Functions',4,''),(15,'String Functions',4,''),(16,'Cast Functions and Operators',4,''),(17,'XML',4,''),(18,'Bit Functions',4,''),(19,'Encryption Functions',4,''),(20,'Locking Functions',4,''),(21,'Information Functions',4,''),(22,'Spatial Functions',4,''),(23,'WKT Functions',22,''),(24,'WKB Functions',22,''),(25,'Geometry Constructors',22,''),(26,'Geometry Property Functions',22,''),(27,'Point Property Functions',22,''),(28,'LineString Property Functions',22,''),(29,'Polygon Property Functions',22,''),(30,'GeometryCollection Property Functions',22,''),(31,'Geometry Relation Functions',22,''),(32,'MBR Functions',22,''),(33,'GTID',4,''),(34,'Aggregate Functions and Modifiers',4,''),(35,'GROUP BY Functions and Modifiers',4,''),(36,'Window Functions',4,''),(37,'Performance Schema Functions',4,''),(38,'Internal Functions',4,''),(39,'Miscellaneous Functions',4,''),(40,'Data Definition',0,''),(41,'Data Manipulation',0,''),(42,'Transactions',0,''),(43,'Replication Statements',0,''),(44,'Prepared Statements',0,''),(45,'Compound Statements',0,''),(46,'Account Management',0,''),(47,'Table Maintenance',0,''),(48,'Loadable Functions',0,''),(49,'Components',0,''),(50,'Plugins',0,''),(51,'Utility',0,''),(52,'Storage Engines',0,'');
/*!40000 ALTER TABLE `help_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `help_keyword`
--

DROP TABLE IF EXISTS `help_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `help_keyword` (
  `help_keyword_id` int unsigned NOT NULL,
  `name` char(64) NOT NULL,
  PRIMARY KEY (`help_keyword_id`),
  UNIQUE KEY `name` (`name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='help keywords';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_keyword`
--

LOCK TABLES `help_keyword` WRITE;
/*!40000 ALTER TABLE `help_keyword` DISABLE KEYS */;
INSERT INTO `help_keyword` VALUES (109,'%'),(265,'&'),(423,'(JSON'),(87,'*'),(85,'+'),(86,'-'),(424,'->'),(426,'->>'),(88,'/'),(76,':='),(59,'<'),(267,'<<'),(58,'<='),(56,'<=>'),(57,'<>'),(55,'='),(61,'>'),(60,'>='),(268,'>>'),(91,'ABS'),(881,'ACCOUNT'),(92,'ACOS'),(659,'ACTION'),(49,'ADD'),(121,'ADDDATE'),(122,'ADDTIME'),(915,'ADMIN'),(271,'AES_DECRYPT'),(272,'AES_ENCRYPT'),(582,'AFTER'),(248,'AGAINST'),(936,'AGGREGATE'),(583,'ALGORITHM'),(695,'ALL'),(50,'ALTER'),(584,'ANALYZE'),(62,'AND'),(529,'ANY_VALUE'),(660,'ARCHIVE'),(255,'ARRAY'),(724,'AS'),(467,'ASC'),(186,'ASCII'),(93,'ASIN'),(776,'ASSIGN_GTIDS_TO_ANONYMOUS_TRANSACTIONS'),(6,'ASYMMETRIC_DECRYPT'),(13,'ASYMMETRIC_DERIVE'),(7,'ASYMMETRIC_ENCRYPT'),(8,'ASYMMETRIC_SIGN'),(9,'ASYMMETRIC_VERIFY'),(643,'AT'),(94,'ATAN'),(95,'ATAN2'),(882,'ATTRIBUTE'),(913,'AUTHENTICATION'),(745,'AUTOCOMMIT'),(585,'AUTOEXTEND_SIZE'),(586,'AUTO_INCREMENT'),(461,'AVG'),(587,'AVG_ROW_LENGTH'),(757,'BACKUP'),(771,'BEFORE'),(746,'BEGIN'),(289,'BENCHMARK'),(63,'BETWEEN'),(187,'BIN'),(254,'BINARY'),(564,'BINLOG'),(530,'BIN_TO_UUID'),(463,'BIT_AND'),(270,'BIT_COUNT'),(188,'BIT_LENGTH'),(464,'BIT_OR'),(465,'BIT_XOR'),(17,'BOOL'),(18,'BOOLEAN'),(231,'BOTH'),(647,'BTREE'),(468,'BY'),(42,'BYTE'),(971,'CACHE'),(689,'CALL'),(500,'CAN_ACCESS_COLUMN'),(501,'CAN_ACCESS_DATABASE'),(502,'CAN_ACCESS_TABLE'),(503,'CAN_ACCESS_USER'),(504,'CAN_ACCESS_VIEW'),(661,'CASCADE'),(77,'CASE'),(256,'CAST'),(862,'CATALOG_NAME'),(96,'CEIL'),(97,'CEILING'),(747,'CHAIN'),(883,'CHALLENGE_RESPONSE'),(588,'CHANGE'),(565,'CHANNEL'),(43,'CHAR'),(39,'CHARACTER'),(190,'CHARACTER_LENGTH'),(290,'CHARSET'),(189,'CHAR_LENGTH'),(589,'CHECK'),(590,'CHECKSUM'),(884,'CIPHER'),(863,'CLASS_ORIGIN'),(916,'CLIENT'),(944,'CLONE'),(697,'CLOSE'),(65,'COALESCE'),(965,'CODE'),(291,'COERCIBILITY'),(547,'COLLATE'),(292,'COLLATION'),(591,'COLUMN'),(592,'COLUMNS'),(864,'COLUMN_NAME'),(552,'COMMENT'),(748,'COMMIT'),(760,'COMMITTED'),(662,'COMPACT'),(553,'COMPLETION'),(940,'COMPONENT'),(273,'COMPRESS'),(663,'COMPRESSED'),(593,'COMPRESSION'),(191,'CONCAT'),(192,'CONCAT_WS'),(711,'CONCURRENT'),(859,'CONDITION'),(594,'CONNECTION'),(293,'CONNECTION_ID'),(749,'CONSISTENT'),(595,'CONSTRAINT'),(865,'CONSTRAINT_CATALOG'),(866,'CONSTRAINT_NAME'),(867,'CONSTRAINT_SCHEMA'),(860,'CONTINUE'),(98,'CONV'),(261,'CONVERT'),(123,'CONVERT_TZ'),(99,'COS'),(100,'COT'),(466,'COUNT'),(101,'CRC32'),(51,'CREATE'),(10,'CREATE_ASYMMETRIC_PRIV_KEY'),(11,'CREATE_ASYMMETRIC_PUB_KEY'),(14,'CREATE_DH_PARAMETERS'),(12,'CREATE_DIGEST'),(740,'CROSS'),(664,'CSV'),(485,'CUME_DIST'),(124,'CURDATE'),(885,'CURRENT'),(125,'CURRENT_DATE'),(294,'CURRENT_ROLE'),(126,'CURRENT_TIME'),(127,'CURRENT_TIMESTAMP'),(295,'CURRENT_USER'),(857,'CURSOR'),(868,'CURSOR_NAME'),(128,'CURTIME'),(596,'DATA'),(296,'DATABASE'),(949,'DATABASES'),(637,'DATAFILE'),(36,'DATE'),(129,'DATEDIFF'),(257,'DATETIME'),(130,'DATE_ADD'),(145,'DATE_FORMAT'),(131,'DATE_SUB'),(132,'DAY'),(146,'DAYNAME'),(147,'DAYOFMONTH'),(148,'DAYOFWEEK'),(149,'DAYOFYEAR'),(133,'DAY_HOUR'),(134,'DAY_MINUTE'),(135,'DAY_SECOND'),(848,'DEALLOCATE'),(28,'DEC'),(31,'DECIMAL'),(849,'DECLARE'),(2,'DEFAULT'),(839,'DEFAULT_AUTH'),(554,'DEFINER'),(653,'DEFINITION'),(102,'DEGREES'),(703,'DELAYED'),(597,'DELAY_KEY_WRITE'),(665,'DELETE'),(486,'DENSE_RANK'),(469,'DESC'),(982,'DESCRIBE'),(654,'DESCRIPTION'),(869,'DIAGNOSTICS'),(598,'DIRECTORY'),(555,'DISABLE'),(599,'DISCARD'),(462,'DISTINCT'),(725,'DISTINCTROW'),(89,'DIV'),(556,'DO'),(600,'DROP'),(739,'DUAL'),(726,'DUMPFILE'),(704,'DUPLICATE'),(666,'DYNAMIC'),(78,'ELSE'),(850,'ELSEIF'),(193,'ELT'),(557,'ENABLE'),(712,'ENCLOSED'),(548,'ENCRYPTION'),(79,'END'),(644,'ENDS'),(601,'ENGINE'),(950,'ENGINES'),(566,'ERROR'),(951,'ERRORS'),(240,'ESCAPE'),(713,'ESCAPED'),(558,'EVENT'),(963,'EVENTS'),(645,'EVERY'),(696,'EXCEPT'),(602,'EXCHANGE'),(847,'EXECUTE'),(66,'EXISTS'),(861,'EXIT'),(103,'EXP'),(249,'EXPANSION'),(886,'EXPIRE'),(983,'EXPLAIN'),(972,'EXPORT'),(194,'EXPORT_SET'),(934,'EXTENDED'),(682,'EXTENT_SIZE'),(150,'EXTRACT'),(425,'EXTRACTION)'),(262,'EXTRACTVALUE'),(887,'FACTOR'),(888,'FAILED_LOGIN_ATTEMPTS'),(15,'FALSE'),(932,'FAST'),(667,'FEDERATED'),(858,'FETCH'),(195,'FIELD'),(714,'FIELDS'),(917,'FILE'),(683,'FILE_BLOCK_SIZE'),(805,'FILTER'),(196,'FIND_IN_SET'),(889,'FINISH'),(603,'FIRST'),(487,'FIRST_VALUE'),(29,'FIXED'),(32,'FLOAT4'),(33,'FLOAT8'),(104,'FLOOR'),(973,'FLUSH'),(567,'FOR'),(741,'FORCE'),(604,'FOREIGN'),(197,'FORMAT'),(496,'FORMAT_BYTES'),(497,'FORMAT_PICO_TIME'),(297,'FOUND_ROWS'),(232,'FROM'),(198,'FROM_BASE64'),(151,'FROM_DAYS'),(152,'FROM_UNIXTIME'),(668,'FULL'),(605,'FULLTEXT'),(170,'FUNCTION'),(974,'GENERAL'),(337,'GEOMCOLLECTION'),(338,'GEOMETRYCOLLECTION'),(870,'GET'),(505,'GET_DD_COLUMN_PRIVILEGES'),(506,'GET_DD_CREATE_OPTIONS'),(507,'GET_DD_INDEX_SUB_PART_LENGTH'),(153,'GET_FORMAT'),(284,'GET_LOCK'),(761,'GLOBAL'),(918,'GRANT'),(952,'GRANTS'),(67,'GREATEST'),(577,'GROUP'),(531,'GROUPING'),(470,'GROUP_CONCAT'),(455,'GTID_SUBSET'),(456,'GTID_SUBTRACT'),(698,'HANDLER'),(727,'HAVING'),(669,'HEAP'),(5,'HELP'),(0,'HELP_DATE'),(1,'HELP_VERSION'),(199,'HEX'),(705,'HIGH_PRIORITY'),(890,'HISTORY'),(648,'HOST'),(953,'HOSTS'),(136,'HOUR'),(137,'HOUR_MINUTE'),(138,'HOUR_SECOND'),(298,'ICU_VERSION'),(722,'IDENTIFIED'),(82,'IF'),(83,'IFNULL'),(706,'IGNORE'),(777,'IGNORE_SERVER_IDS'),(606,'IMPORT'),(68,'IN'),(52,'INDEX'),(954,'INDEXES'),(534,'INET6_ATON'),(535,'INET6_NTOA'),(532,'INET_ATON'),(533,'INET_NTOA'),(715,'INFILE'),(914,'INITIAL'),(638,'INITIAL_SIZE'),(891,'INITIATE'),(427,'INLINE'),(742,'INNER'),(568,'INNODB'),(200,'INSERT'),(607,'INSERT_METHOD'),(941,'INSTALL'),(569,'INSTANCE'),(201,'INSTR'),(19,'INT1'),(22,'INT2'),(23,'INT3'),(25,'INT4'),(27,'INT8'),(26,'INTEGER'),(508,'INTERNAL_AUTO_INCREMENT'),(509,'INTERNAL_AVG_ROW_LENGTH'),(511,'INTERNAL_CHECKSUM'),(510,'INTERNAL_CHECK_TIME'),(512,'INTERNAL_DATA_FREE'),(513,'INTERNAL_DATA_LENGTH'),(514,'INTERNAL_DD_CHAR_LENGTH'),(515,'INTERNAL_GET_COMMENT_OR_ERROR'),(516,'INTERNAL_GET_ENABLED_ROLE_JSON'),(517,'INTERNAL_GET_HOSTNAME'),(518,'INTERNAL_GET_USERNAME'),(519,'INTERNAL_GET_VIEW_WARNING_OR_ERROR'),(520,'INTERNAL_INDEX_COLUMN_CARDINALITY'),(521,'INTERNAL_INDEX_LENGTH'),(522,'INTERNAL_IS_ENABLED_ROLE'),(523,'INTERNAL_IS_MANDATORY_ROLE'),(524,'INTERNAL_KEYS_DISABLED'),(525,'INTERNAL_MAX_DATA_LENGTH'),(526,'INTERNAL_TABLE_ROWS'),(527,'INTERNAL_UPDATE_TIME'),(710,'INTERSECT'),(69,'INTERVAL'),(707,'INTO'),(608,'INVISIBLE'),(840,'IO_THREAD'),(70,'IS'),(72,'ISNULL'),(762,'ISOLATION'),(892,'ISSUER'),(285,'IS_FREE_LOCK'),(536,'IS_IPV4'),(537,'IS_IPV4_COMPAT'),(538,'IS_IPV4_MAPPED'),(539,'IS_IPV6'),(286,'IS_USED_LOCK'),(540,'IS_UUID'),(528,'IS_VISIBLE_DD_OBJECT'),(851,'ITERATE'),(728,'JOIN'),(258,'JSON'),(417,'JSON_ARRAY'),(473,'JSON_ARRAYAGG'),(435,'JSON_ARRAY_APPEND'),(436,'JSON_ARRAY_INSERT'),(420,'JSON_CONTAINS'),(421,'JSON_CONTAINS_PATH'),(445,'JSON_DEPTH'),(422,'JSON_EXTRACT'),(437,'JSON_INSERT'),(429,'JSON_KEYS'),(446,'JSON_LENGTH'),(438,'JSON_MERGE'),(439,'JSON_MERGE_PATCH'),(440,'JSON_MERGE_PRESERVE'),(418,'JSON_OBJECT'),(474,'JSON_OBJECTAGG'),(430,'JSON_OVERLAPS'),(452,'JSON_PRETTY'),(419,'JSON_QUOTE'),(441,'JSON_REMOVE'),(442,'JSON_REPLACE'),(450,'JSON_SCHEMA_VALID'),(451,'JSON_SCHEMA_VALIDATION_REPORT'),(431,'JSON_SEARCH'),(443,'JSON_SET'),(453,'JSON_STORAGE_FREE'),(454,'JSON_STORAGE_SIZE'),(449,'JSON_TABLE'),(447,'JSON_TYPE'),(444,'JSON_UNQUOTE'),(448,'JSON_VALID'),(432,'JSON_VALUE'),(53,'KEY'),(570,'KEYRING'),(609,'KEYS'),(610,'KEY_BLOCK_SIZE'),(979,'KILL'),(488,'LAG'),(699,'LAST'),(154,'LAST_DAY'),(299,'LAST_INSERT_ID'),(489,'LAST_VALUE'),(202,'LCASE'),(490,'LEAD'),(233,'LEADING'),(73,'LEAST'),(852,'LEAVE'),(980,'LEAVES'),(203,'LEFT'),(204,'LENGTH'),(763,'LEVEL'),(224,'LIKE'),(690,'LIMIT'),(716,'LINES'),(339,'LINESTRING'),(105,'LN'),(717,'LOAD'),(205,'LOAD_FILE'),(718,'LOCAL'),(155,'LOCALTIME'),(156,'LOCALTIMESTAMP'),(206,'LOCATE'),(611,'LOCK'),(106,'LOG'),(108,'LOG10'),(107,'LOG2'),(578,'LOGFILE'),(772,'LOGS'),(47,'LONG'),(48,'LONGBINARY'),(853,'LOOP'),(207,'LOWER'),(691,'LOW_PRIORITY'),(208,'LPAD'),(209,'LTRIM'),(157,'MAKEDATE'),(158,'MAKETIME'),(210,'MAKE_SET'),(571,'MASTER'),(778,'MASTER_AUTO_POSITION'),(779,'MASTER_BIND'),(780,'MASTER_COMPRESSION_ALGORITHMS'),(781,'MASTER_CONNECT_RETRY'),(782,'MASTER_HEARTBEAT_PERIOD'),(783,'MASTER_HOST'),(784,'MASTER_LOG_FILE'),(785,'MASTER_LOG_POS'),(786,'MASTER_PASSWORD'),(787,'MASTER_PORT'),(459,'MASTER_POS_WAIT'),(788,'MASTER_RETRY_COUNT'),(789,'MASTER_SSL'),(790,'MASTER_SSL_CA'),(791,'MASTER_SSL_CERT'),(792,'MASTER_SSL_CIPHER'),(793,'MASTER_SSL_CRL'),(794,'MASTER_SSL_CRLPATH'),(795,'MASTER_SSL_KEY'),(796,'MASTER_SSL_VERIFY_SERVER_CERT'),(797,'MASTER_TLS_CIPHERSUITES'),(798,'MASTER_TLS_VERSION'),(799,'MASTER_USER'),(800,'MASTER_ZSTD_COMPRESSION_LEVEL'),(250,'MATCH'),(475,'MAX'),(893,'MAX_CONNECTIONS_PER_HOUR'),(894,'MAX_QUERIES_PER_HOUR'),(612,'MAX_ROWS'),(684,'MAX_SIZE'),(895,'MAX_UPDATES_PER_HOUR'),(896,'MAX_USER_CONNECTIONS'),(396,'MBRCONTAINS'),(397,'MBRCOVEREDBY'),(398,'MBRCOVERS'),(399,'MBRDISJOINT'),(400,'MBREQUALS'),(401,'MBRINTERSECTS'),(402,'MBROVERLAPS'),(403,'MBRTOUCHES'),(404,'MBRWITHIN'),(274,'MD5'),(933,'MEDIUM'),(433,'MEMBER'),(729,'MEMORY'),(670,'MERGE'),(871,'MESSAGE_TEXT'),(159,'MICROSECOND'),(211,'MID'),(24,'MIDDLEINT'),(476,'MIN'),(139,'MINUTE'),(140,'MINUTE_SECOND'),(613,'MIN_ROWS'),(90,'MOD'),(251,'MODE'),(614,'MODIFY'),(141,'MONTH'),(160,'MONTHNAME'),(671,'MRG_MYISAM'),(340,'MULTILINESTRING'),(341,'MULTIPOINT'),(342,'MULTIPOLYGON'),(955,'MUTEX'),(672,'MYISAM'),(872,'MYSQL_ERRNO'),(655,'NAME'),(948,'NAMES'),(541,'NAME_CONST'),(40,'NATIONAL'),(743,'NATURAL'),(41,'NCHAR'),(673,'NDB'),(674,'NDBCLUSTER'),(801,'NETWORK_NAMESPACE'),(897,'NEVER'),(700,'NEXT'),(572,'NO'),(685,'NODEGROUP'),(898,'NONE'),(64,'NOT'),(161,'NOW'),(931,'NO_WRITE_TO_BINLOG'),(491,'NTH_VALUE'),(492,'NTILE'),(71,'NULL'),(84,'NULLIF'),(873,'NUMBER'),(30,'NUMERIC'),(44,'NVARCHAR'),(212,'OCT'),(213,'OCTET_LENGTH'),(434,'OF'),(730,'OFFSET'),(899,'OLD'),(559,'ON'),(549,'ONLY'),(701,'OPEN'),(615,'OPTIMIZE'),(975,'OPTIMIZER_COSTS'),(919,'OPTION'),(900,'OPTIONAL'),(719,'OPTIONALLY'),(580,'OPTIONS'),(74,'OR'),(214,'ORD'),(471,'ORDER'),(656,'ORGANIZATION'),(744,'OUTER'),(731,'OUTFILE'),(649,'OWNER'),(616,'PACK_KEYS'),(617,'PARSER'),(675,'PARTIAL'),(618,'PARTITION'),(619,'PARTITIONING'),(620,'PASSWORD'),(901,'PASSWORD_LOCK_TIME'),(428,'PATH)'),(493,'PERCENT_RANK'),(162,'PERIOD_ADD'),(163,'PERIOD_DIFF'),(945,'PERSIST'),(946,'PERSIST_ONLY'),(110,'PI'),(942,'PLUGIN'),(966,'PLUGINS'),(841,'PLUGIN_DIR'),(343,'POINT'),(344,'POLYGON'),(650,'PORT'),(215,'POSITION'),(111,'POW'),(112,'POWER'),(34,'PRECISION'),(768,'PREPARE'),(560,'PRESERVE'),(702,'PREV'),(621,'PRIMARY'),(920,'PRIVILEGES'),(802,'PRIVILEGE_CHECKS_USER'),(579,'PROCEDURE'),(921,'PROCESS'),(956,'PROCESSLIST'),(967,'PROFILE'),(968,'PROFILES'),(925,'PROXY'),(498,'PS_CURRENT_THREAD_ID'),(499,'PS_THREAD_ID'),(773,'PURGE'),(164,'QUARTER'),(252,'QUERY'),(692,'QUICK'),(216,'QUOTE'),(113,'RADIANS'),(114,'RAND'),(902,'RANDOM'),(275,'RANDOM_BYTES'),(494,'RANK'),(550,'READ'),(35,'REAL'),(622,'REBUILD'),(769,'RECOVER'),(573,'REDO_LOG'),(676,'REDUNDANT'),(657,'REFERENCE'),(677,'REFERENCES'),(242,'REGEXP'),(244,'REGEXP_INSTR'),(245,'REGEXP_LIKE'),(246,'REGEXP_REPLACE'),(247,'REGEXP_SUBSTR'),(903,'REGISTRATION'),(976,'RELAY'),(969,'RELAYLOG'),(803,'RELAY_LOG_FILE'),(804,'RELAY_LOG_POS'),(750,'RELEASE'),(287,'RELEASE_ALL_LOCKS'),(288,'RELEASE_LOCK'),(574,'RELOAD'),(623,'REMOVE'),(561,'RENAME'),(624,'REORGANIZE'),(625,'REPAIR'),(217,'REPEAT'),(764,'REPEATABLE'),(218,'REPLACE'),(838,'REPLICA'),(970,'REPLICAS'),(806,'REPLICATE_DO_DB'),(807,'REPLICATE_DO_TABLE'),(808,'REPLICATE_IGNORE_DB'),(809,'REPLICATE_IGNORE_TABLE'),(810,'REPLICATE_REWRITE_DB'),(811,'REPLICATE_WILD_DO_TABLE'),(812,'REPLICATE_WILD_IGNORE_TABLE'),(813,'REPLICATION'),(904,'REQUIRE'),(774,'RESET'),(878,'RESIGNAL'),(928,'RESOURCE'),(981,'RESTART'),(680,'RESTRICT'),(905,'RETAIN'),(855,'RETURN'),(874,'RETURNED_SQLSTATE'),(937,'RETURNS'),(906,'REUSE'),(219,'REVERSE'),(926,'REVOKE'),(220,'RIGHT'),(243,'RLIKE'),(907,'ROLE'),(300,'ROLES_GRAPHML'),(575,'ROLLBACK'),(115,'ROUND'),(708,'ROW'),(723,'ROWS'),(301,'ROW_COUNT'),(626,'ROW_FORMAT'),(495,'ROW_NUMBER'),(221,'RPAD'),(222,'RTRIM'),(756,'SAVEPOINT'),(562,'SCHEDULE'),(302,'SCHEMA'),(957,'SCHEMAS'),(875,'SCHEMA_NAME'),(142,'SECOND'),(165,'SEC_TO_TIME'),(709,'SELECT'),(472,'SEPARATOR'),(3,'SERIAL'),(765,'SERIALIZABLE'),(581,'SERVER'),(766,'SESSION'),(303,'SESSION_USER'),(551,'SET'),(276,'SHA'),(277,'SHA1'),(278,'SHA2'),(732,'SHARE'),(958,'SHOW'),(922,'SHUTDOWN'),(116,'SIGN'),(880,'SIGNAL'),(259,'SIGNED'),(117,'SIN'),(563,'SLAVE'),(542,'SLEEP'),(977,'SLOW'),(751,'SNAPSHOT'),(651,'SOCKET'),(938,'SONAME'),(223,'SOUNDEX'),(225,'SOUNDS'),(814,'SOURCE'),(815,'SOURCE_AUTO_POSITION'),(816,'SOURCE_BIND'),(817,'SOURCE_COMPRESSION_ALGORITHMS'),(818,'SOURCE_CONNECT_RETRY'),(819,'SOURCE_HEARTBEAT_PERIOD'),(820,'SOURCE_HOST'),(821,'SOURCE_LOG_FILE'),(822,'SOURCE_LOG_POS'),(823,'SOURCE_PASSWORD'),(824,'SOURCE_PORT'),(460,'SOURCE_POS_WAIT'),(825,'SOURCE_RETRY_COUNT'),(826,'SOURCE_SSL'),(827,'SOURCE_SSL_CA'),(828,'SOURCE_SSL_CERT'),(829,'SOURCE_SSL_CIPHER'),(830,'SOURCE_SSL_CRL'),(831,'SOURCE_SSL_CRLPATH'),(832,'SOURCE_SSL_KEY'),(833,'SOURCE_SSL_VERIFY_SERVER_CERT'),(834,'SOURCE_TLS_CIPHERSUITES'),(835,'SOURCE_TLS_VERSION'),(836,'SOURCE_USER'),(837,'SOURCE_ZSTD_COMPRESSION_LEVEL'),(226,'SPACE'),(627,'SPATIAL'),(879,'SQLSTATE'),(842,'SQL_AFTER_GTIDS'),(843,'SQL_AFTER_MTS_GAPS'),(844,'SQL_BEFORE_GTIDS'),(733,'SQL_BIG_RESULT'),(734,'SQL_BUFFER_RESULT'),(735,'SQL_CALC_FOUND_ROWS'),(775,'SQL_LOG_BIN'),(736,'SQL_NO_CACHE'),(737,'SQL_SMALL_RESULT'),(845,'SQL_THREAD'),(118,'SQRT'),(908,'SSL'),(752,'START'),(720,'STARTING'),(646,'STARTS'),(279,'STATEMENT_DIGEST'),(280,'STATEMENT_DIGEST_TEXT'),(628,'STATS_AUTO_RECALC'),(629,'STATS_PERSISTENT'),(630,'STATS_SAMPLE_PAGES'),(959,'STATUS'),(477,'STD'),(478,'STDDEV'),(479,'STDDEV_POP'),(480,'STDDEV_SAMP'),(846,'STOP'),(964,'STORAGE'),(678,'STORED'),(738,'STRAIGHT_JOIN'),(241,'STRCMP'),(939,'STRING'),(166,'STR_TO_DATE'),(366,'ST_AREA'),(345,'ST_ASBINARY'),(409,'ST_ASGEOJSON'),(347,'ST_ASTEXT'),(346,'ST_ASWKB'),(348,'ST_ASWKT'),(374,'ST_BUFFER'),(375,'ST_BUFFER_STRATEGY'),(367,'ST_CENTROID'),(411,'ST_COLLECT'),(385,'ST_CONTAINS'),(376,'ST_CONVEXHULL'),(386,'ST_CROSSES'),(377,'ST_DIFFERENCE'),(350,'ST_DIMENSION'),(387,'ST_DISJOINT'),(388,'ST_DISTANCE'),(412,'ST_DISTANCE_SPHERE'),(360,'ST_ENDPOINT'),(351,'ST_ENVELOPE'),(389,'ST_EQUALS'),(368,'ST_EXTERIORRING'),(390,'ST_FRECHETDISTANCE'),(405,'ST_GEOHASH'),(307,'ST_GEOMCOLLFROMTEXT'),(322,'ST_GEOMCOLLFROMWKB'),(308,'ST_GEOMETRYCOLLECTIONFROMTEXT'),(323,'ST_GEOMETRYCOLLECTIONFROMWKB'),(309,'ST_GEOMETRYFROMTEXT'),(324,'ST_GEOMETRYFROMWKB'),(372,'ST_GEOMETRYN'),(352,'ST_GEOMETRYTYPE'),(410,'ST_GEOMFROMGEOJSON'),(310,'ST_GEOMFROMTEXT'),(325,'ST_GEOMFROMWKB'),(391,'ST_HAUSDORFFDISTANCE'),(369,'ST_INTERIORRINGN'),(378,'ST_INTERSECTION'),(392,'ST_INTERSECTS'),(361,'ST_ISCLOSED'),(353,'ST_ISEMPTY'),(354,'ST_ISSIMPLE'),(413,'ST_ISVALID'),(406,'ST_LATFROMGEOHASH'),(356,'ST_LATITUDE'),(362,'ST_LENGTH'),(311,'ST_LINEFROMTEXT'),(326,'ST_LINEFROMWKB'),(379,'ST_LINEINTERPOLATEPOINT'),(380,'ST_LINEINTERPOLATEPOINTS'),(312,'ST_LINESTRINGFROMTEXT'),(327,'ST_LINESTRINGFROMWKB'),(407,'ST_LONGFROMGEOHASH'),(357,'ST_LONGITUDE'),(414,'ST_MAKEENVELOPE'),(313,'ST_MLINEFROMTEXT'),(328,'ST_MLINEFROMWKB'),(315,'ST_MPOINTFROMTEXT'),(330,'ST_MPOINTFROMWKB'),(317,'ST_MPOLYFROMTEXT'),(332,'ST_MPOLYFROMWKB'),(314,'ST_MULTILINESTRINGFROMTEXT'),(329,'ST_MULTILINESTRINGFROMWKB'),(316,'ST_MULTIPOINTFROMTEXT'),(331,'ST_MULTIPOINTFROMWKB'),(318,'ST_MULTIPOLYGONFROMTEXT'),(333,'ST_MULTIPOLYGONFROMWKB'),(373,'ST_NUMGEOMETRIES'),(370,'ST_NUMINTERIORRING'),(371,'ST_NUMINTERIORRINGS'),(363,'ST_NUMPOINTS'),(393,'ST_OVERLAPS'),(381,'ST_POINTATDISTANCE'),(408,'ST_POINTFROMGEOHASH'),(319,'ST_POINTFROMTEXT'),(334,'ST_POINTFROMWKB'),(364,'ST_POINTN'),(320,'ST_POLYFROMTEXT'),(335,'ST_POLYFROMWKB'),(321,'ST_POLYGONFROMTEXT'),(336,'ST_POLYGONFROMWKB'),(415,'ST_SIMPLIFY'),(355,'ST_SRID'),(365,'ST_STARTPOINT'),(349,'ST_SWAPXY'),(382,'ST_SYMDIFFERENCE'),(394,'ST_TOUCHES'),(383,'ST_TRANSFORM'),(384,'ST_UNION'),(416,'ST_VALIDATE'),(395,'ST_WITHIN'),(358,'ST_X'),(359,'ST_Y'),(876,'SUBCLASS_ORIGIN'),(167,'SUBDATE'),(909,'SUBJECT'),(227,'SUBSTR'),(228,'SUBSTRING'),(229,'SUBSTRING_INDEX'),(168,'SUBTIME'),(481,'SUM'),(923,'SUPER'),(169,'SYSDATE'),(658,'SYSTEM'),(304,'SYSTEM_USER'),(54,'TABLE'),(759,'TABLES'),(631,'TABLESPACE'),(877,'TABLE_NAME'),(119,'TAN'),(688,'TEMPORARY'),(721,'TERMINATED'),(80,'THEN'),(929,'THREAD_PRIORITY'),(38,'TIME'),(171,'TIMEDIFF'),(37,'TIMESTAMP'),(172,'TIMESTAMPADD'),(173,'TIMESTAMPDIFF'),(260,'TIMEZONE'),(174,'TIME_FORMAT'),(175,'TIME_TO_SEC'),(576,'TLS'),(639,'TO'),(230,'TO_BASE64'),(176,'TO_DAYS'),(177,'TO_SECONDS'),(984,'TRADITIONAL'),(234,'TRAILING'),(753,'TRANSACTION'),(985,'TREE'),(687,'TRIGGER'),(960,'TRIGGERS'),(235,'TRIM'),(16,'TRUE'),(120,'TRUNCATE'),(632,'TYPE'),(236,'UCASE'),(910,'UNBOUNDED'),(767,'UNCOMMITTED'),(281,'UNCOMPRESS'),(282,'UNCOMPRESSED_LENGTH'),(640,'UNDO'),(237,'UNHEX'),(943,'UNINSTALL'),(633,'UNION'),(634,'UNIQUE'),(178,'UNIX_TIMESTAMP'),(927,'UNKNOWN'),(758,'UNLOCK'),(911,'UNREGISTER'),(20,'UNSIGNED'),(854,'UNTIL'),(681,'UPDATE'),(263,'UPDATEXML'),(635,'UPGRADE'),(238,'UPPER'),(924,'USAGE'),(686,'USE'),(305,'USER'),(978,'USER_RESOURCES'),(935,'USE_FRM'),(693,'USING'),(179,'UTC_DATE'),(180,'UTC_TIME'),(181,'UTC_TIMESTAMP'),(543,'UUID'),(544,'UUID_SHORT'),(545,'UUID_TO_BIN'),(283,'VALIDATE_PASSWORD_STRENGTH'),(4,'VALUE'),(546,'VALUES'),(45,'VARCHARACTER'),(947,'VARIABLE'),(961,'VARIABLES'),(484,'VARIANCE'),(46,'VARYING'),(482,'VAR_POP'),(483,'VAR_SAMP'),(930,'VCPU'),(306,'VERSION'),(642,'VIEW'),(679,'VIRTUAL'),(636,'VISIBLE'),(641,'WAIT'),(457,'WAIT_FOR_EXECUTED_GTID_SET'),(458,'WAIT_UNTIL_SQL_THREAD_AFTER_GTIDS'),(962,'WARNINGS'),(182,'WEEK'),(183,'WEEKDAY'),(184,'WEEKOFYEAR'),(239,'WEIGHT_STRING'),(81,'WHEN'),(694,'WHERE'),(856,'WHILE'),(253,'WITH'),(754,'WORK'),(652,'WRAPPER'),(755,'WRITE'),(912,'X509'),(770,'XA'),(75,'XOR'),(143,'YEAR'),(185,'YEARWEEK'),(144,'YEAR_MONTH'),(21,'ZEROFILL'),(266,'^'),(264,'|'),(269,'~');
/*!40000 ALTER TABLE `help_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `help_relation`
--

DROP TABLE IF EXISTS `help_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `help_relation` (
  `help_topic_id` int unsigned NOT NULL,
  `help_keyword_id` int unsigned NOT NULL,
  PRIMARY KEY (`help_keyword_id`,`help_topic_id`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='keyword-topic relation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_relation`
--

LOCK TABLES `help_relation` WRITE;
/*!40000 ALTER TABLE `help_relation` DISABLE KEYS */;
INSERT INTO `help_relation` VALUES (0,0),(1,1),(2,2),(487,2),(504,2),(505,2),(512,2),(515,2),(516,2),(524,2),(525,2),(549,2),(556,2),(594,2),(612,2),(614,2),(620,2),(622,2),(2,3),(524,3),(2,4),(549,4),(556,4),(610,4),(611,4),(3,5),(702,5),(4,6),(5,7),(6,8),(7,9),(8,10),(9,11),(10,12),(11,13),(12,14),(13,15),(14,15),(13,16),(14,16),(16,17),(17,17),(16,18),(242,18),(16,19),(16,20),(20,20),(22,20),(23,20),(25,20),(26,20),(244,20),(16,21),(20,21),(22,21),(23,21),(25,21),(26,21),(18,22),(19,23),(19,24),(20,25),(20,26),(244,26),(632,26),(22,27),(23,28),(23,29),(524,29),(23,30),(24,31),(244,31),(632,31),(25,32),(26,33),(26,34),(26,35),(632,35),(28,36),(131,36),(133,36),(244,36),(30,37),(167,37),(31,38),(165,38),(244,38),(33,39),(35,39),(504,39),(505,39),(512,39),(515,39),(516,39),(524,39),(553,39),(554,39),(557,39),(640,39),(641,39),(643,39),(647,39),(33,40),(35,40),(33,41),(34,42),(34,43),(186,43),(244,43),(35,44),(35,45),(35,46),(44,47),(44,48),(53,49),(512,49),(513,49),(526,49),(612,49),(53,50),(504,50),(505,50),(506,50),(507,50),(508,50),(509,50),(510,50),(511,50),(512,50),(513,50),(514,50),(612,50),(617,50),(623,50),(53,51),(515,51),(516,51),(517,51),(518,51),(519,51),(520,51),(521,51),(522,51),(523,51),(524,51),(526,51),(527,51),(528,51),(613,51),(614,51),(624,51),(632,51),(643,51),(651,51),(652,51),(653,51),(654,51),(655,51),(656,51),(658,51),(53,52),(512,52),(518,52),(524,52),(532,52),(559,52),(643,52),(669,52),(691,52),(694,52),(53,53),(512,53),(524,53),(525,53),(549,53),(53,54),(512,54),(524,54),(537,54),(541,54),(542,54),(548,54),(550,54),(560,54),(627,54),(628,54),(629,54),(630,54),(631,54),(643,54),(656,54),(685,54),(54,55),(81,55),(55,56),(56,57),(57,58),(58,59),(59,60),(60,61),(61,62),(77,62),(61,63),(62,63),(62,64),(65,64),(68,64),(71,64),(73,64),(76,64),(234,64),(236,64),(515,64),(516,64),(517,64),(523,64),(613,64),(614,64),(63,65),(512,65),(64,66),(65,66),(515,66),(516,66),(517,66),(523,66),(529,66),(530,66),(531,66),(535,66),(536,66),(537,66),(540,66),(612,66),(613,66),(614,66),(615,66),(616,66),(619,66),(633,66),(696,66),(66,67),(67,68),(68,68),(242,68),(557,68),(646,68),(649,68),(650,68),(669,68),(679,68),(69,69),(133,69),(517,69),(612,69),(614,69),(70,70),(71,70),(72,70),(73,70),(72,71),(73,71),(525,71),(74,72),(75,73),(78,74),(523,74),(79,75),(80,76),(82,77),(595,77),(82,78),(595,78),(82,79),(574,79),(592,79),(595,79),(596,79),(599,79),(600,79),(602,79),(82,80),(595,80),(596,80),(82,81),(595,81),(83,82),(515,82),(516,82),(517,82),(523,82),(529,82),(530,82),(531,82),(535,82),(536,82),(537,82),(540,82),(596,82),(612,82),(613,82),(614,82),(615,82),(616,82),(619,82),(633,82),(696,82),(84,83),(85,84),(86,85),(87,86),(88,86),(89,87),(90,88),(91,89),(92,90),(111,90),(93,91),(94,92),(95,93),(96,94),(97,95),(98,96),(99,97),(100,98),(101,99),(102,100),(103,101),(104,102),(105,103),(106,104),(107,105),(108,106),(109,107),(110,108),(111,109),(112,110),(113,111),(114,112),(115,113),(116,114),(117,115),(118,116),(119,117),(120,118),(121,119),(122,120),(512,120),(542,120),(123,121),(124,122),(125,123),(126,124),(127,125),(128,126),(129,127),(130,128),(132,129),(133,130),(133,131),(135,131),(133,132),(136,132),(612,132),(614,132),(133,133),(133,134),(133,135),(133,136),(145,136),(133,137),(133,138),(133,139),(152,139),(133,140),(133,141),(153,141),(133,142),(159,142),(133,143),(181,143),(244,143),(133,144),(134,145),(137,146),(138,147),(139,148),(140,149),(141,150),(142,151),(143,152),(144,153),(146,154),(147,155),(148,156),(149,157),(150,158),(151,159),(154,160),(155,161),(156,162),(157,163),(158,164),(160,165),(161,166),(162,167),(163,168),(164,169),(165,170),(167,170),(216,170),(507,170),(520,170),(521,170),(533,170),(534,170),(632,170),(633,170),(643,170),(654,170),(666,170),(667,170),(166,171),(168,172),(169,173),(170,174),(171,175),(172,176),(173,177),(174,178),(175,179),(176,180),(177,181),(178,182),(179,183),(180,184),(182,185),(183,186),(184,187),(185,188),(187,189),(188,190),(189,191),(190,192),(191,193),(192,194),(193,195),(194,196),(195,197),(699,197),(700,197),(701,197),(196,198),(197,199),(198,200),(549,200),(550,200),(551,200),(199,201),(200,202),(201,203),(559,203),(202,204),(203,205),(204,206),(205,207),(206,208),(207,209),(208,210),(209,211),(210,212),(211,213),(212,214),(213,215),(214,216),(215,217),(600,217),(216,218),(523,218),(553,218),(554,218),(556,218),(612,218),(621,218),(217,219),(218,220),(559,220),(219,221),(220,222),(221,223),(222,224),(234,224),(643,224),(649,224),(650,224),(222,225),(223,226),(224,227),(225,228),(226,229),(227,230),(228,231),(228,232),(544,232),(548,232),(557,232),(643,232),(646,232),(649,232),(650,232),(669,232),(679,232),(228,233),(228,234),(228,235),(229,236),(230,237),(231,238),(232,239),(233,240),(235,241),(236,242),(237,243),(238,244),(239,245),(240,246),(241,247),(242,248),(242,249),(242,250),(242,251),(557,251),(242,252),(693,252),(242,253),(512,253),(518,253),(524,253),(612,253),(614,253),(617,253),(692,253),(243,254),(244,254),(575,254),(576,254),(644,254),(645,254),(692,254),(244,255),(244,256),(244,257),(244,258),(699,258),(700,258),(701,258),(244,259),(244,260),(245,261),(246,262),(247,263),(248,264),(249,265),(250,266),(251,267),(252,268),(253,269),(254,270),(255,271),(256,272),(257,273),(258,274),(259,275),(260,276),(260,277),(261,278),(262,279),(263,280),(264,281),(265,282),(266,283),(267,284),(268,285),(269,286),(270,287),(271,288),(272,289),(273,290),(640,290),(641,290),(274,291),(275,292),(643,292),(648,292),(276,293),(277,294),(278,295),(506,295),(517,295),(279,296),(504,296),(505,296),(515,296),(516,296),(522,296),(529,296),(530,296),(643,296),(651,296),(652,296),(280,297),(281,298),(282,299),(283,300),(284,301),(609,301),(285,302),(504,302),(505,302),(515,302),(516,302),(529,302),(530,302),(643,302),(651,302),(652,302),(286,303),(287,304),(288,305),(522,305),(584,305),(585,305),(612,305),(614,305),(616,305),(618,305),(619,305),(624,305),(658,305),(289,306),(290,307),(290,308),(291,309),(291,310),(292,311),(292,312),(293,313),(293,314),(294,315),(294,316),(295,317),(295,318),(296,319),(297,320),(297,321),(298,322),(298,323),(299,324),(299,325),(300,326),(300,327),(301,328),(301,329),(302,330),(302,331),(303,332),(303,333),(304,334),(305,335),(305,336),(306,337),(307,338),(308,339),(309,340),(310,341),(311,342),(312,343),(313,344),(314,345),(314,346),(315,347),(315,348),(316,349),(317,350),(318,351),(319,352),(320,353),(321,354),(322,355),(323,356),(324,357),(325,358),(326,359),(327,360),(328,361),(329,362),(330,363),(331,364),(332,365),(333,366),(334,367),(335,368),(336,369),(337,370),(337,371),(338,372),(339,373),(340,374),(341,375),(342,376),(343,377),(344,378),(345,379),(346,380),(347,381),(348,382),(349,383),(350,384),(351,385),(352,386),(353,387),(354,388),(355,389),(356,390),(357,391),(358,392),(359,393),(360,394),(361,395),(362,396),(363,397),(364,398),(365,399),(366,400),(367,401),(368,402),(369,403),(370,404),(371,405),(372,406),(373,407),(374,408),(375,409),(376,410),(377,411),(378,412),(379,413),(380,414),(381,415),(382,416),(383,417),(384,418),(385,419),(386,420),(387,421),(388,422),(389,423),(390,423),(389,424),(389,425),(390,426),(390,427),(390,428),(391,429),(392,430),(393,431),(394,432),(395,433),(395,434),(396,435),(397,436),(398,437),(399,438),(400,439),(401,440),(402,441),(403,442),(404,443),(405,444),(406,445),(407,446),(408,447),(409,448),(410,449),(411,450),(412,451),(413,452),(414,453),(415,454),(416,455),(417,456),(418,457),(419,458),(420,459),(421,460),(422,461),(422,462),(427,462),(428,462),(431,462),(432,462),(437,462),(546,462),(552,462),(557,462),(562,462),(423,463),(424,464),(425,465),(426,466),(427,466),(664,466),(689,466),(428,467),(557,467),(428,468),(512,468),(524,468),(544,468),(553,468),(554,468),(555,468),(557,468),(561,468),(612,468),(614,468),(428,469),(557,469),(699,469),(700,469),(701,469),(428,470),(428,471),(512,471),(544,471),(555,471),(557,471),(560,471),(561,471),(563,471),(428,472),(429,473),(430,474),(431,475),(432,476),(433,477),(434,478),(435,479),(436,480),(437,481),(438,482),(439,483),(440,484),(441,485),(442,486),(443,487),(444,488),(445,489),(446,490),(447,491),(448,492),(449,493),(450,494),(451,495),(452,496),(453,497),(454,498),(455,499),(456,500),(457,501),(458,502),(459,503),(460,504),(461,505),(462,506),(463,507),(464,508),(465,509),(466,510),(467,511),(468,512),(469,513),(470,514),(471,515),(472,516),(473,517),(474,518),(475,519),(476,520),(477,521),(478,522),(479,523),(480,524),(481,525),(482,526),(483,527),(484,528),(485,529),(486,530),(488,531),(489,532),(490,533),(491,534),(492,535),(493,536),(494,537),(495,538),(496,539),(497,540),(498,541),(499,542),(500,543),(501,544),(502,545),(503,546),(549,546),(556,546),(563,546),(504,547),(505,547),(512,547),(515,547),(516,547),(524,547),(504,548),(505,548),(512,548),(515,548),(516,548),(524,548),(504,549),(505,549),(564,549),(565,549),(566,549),(567,549),(573,549),(574,549),(504,550),(505,550),(547,550),(564,550),(565,550),(566,550),(567,550),(572,550),(573,550),(574,550),(692,550),(504,551),(505,551),(512,551),(515,551),(516,551),(524,551),(525,551),(549,551),(553,551),(554,551),(556,551),(557,551),(561,551),(564,551),(565,551),(566,551),(567,551),(578,551),(610,551),(611,551),(612,551),(620,551),(621,551),(622,551),(626,551),(639,551),(640,551),(641,551),(642,551),(643,551),(647,551),(506,552),(512,552),(517,552),(518,552),(524,552),(526,552),(612,552),(614,552),(506,553),(517,553),(506,554),(517,554),(506,555),(512,555),(517,555),(623,555),(624,555),(506,556),(517,556),(545,556),(602,556),(506,557),(512,557),(517,557),(623,557),(624,557),(506,558),(517,558),(531,558),(653,558),(506,559),(508,559),(517,559),(525,559),(559,559),(506,560),(517,560),(506,561),(512,561),(513,561),(541,561),(618,561),(506,562),(517,562),(506,563),(517,563),(583,563),(585,563),(587,563),(681,563),(683,563),(695,563),(508,564),(646,564),(690,564),(508,565),(579,565),(581,565),(582,565),(583,565),(584,565),(585,565),(586,565),(587,565),(679,565),(682,565),(683,565),(692,565),(508,566),(692,566),(508,567),(557,567),(579,567),(581,567),(582,567),(583,567),(584,567),(585,567),(586,567),(587,567),(604,567),(607,567),(608,567),(621,567),(626,567),(643,567),(679,567),(682,567),(683,567),(692,567),(699,567),(700,567),(701,567),(508,568),(524,568),(643,568),(508,569),(571,569),(508,570),(508,571),(575,571),(576,571),(577,571),(579,571),(644,571),(645,571),(670,571),(695,571),(508,572),(524,572),(525,572),(508,573),(508,574),(617,574),(508,575),(564,575),(565,575),(566,575),(567,575),(568,575),(569,575),(570,575),(574,575),(508,576),(509,577),(519,577),(526,577),(557,577),(623,577),(624,577),(625,577),(626,577),(509,578),(519,578),(526,578),(510,579),(520,579),(521,579),(533,579),(534,579),(643,579),(655,579),(674,579),(675,579),(511,580),(522,580),(511,581),(522,581),(535,581),(512,582),(512,583),(512,584),(627,584),(699,584),(700,584),(701,584),(512,585),(513,585),(524,585),(526,585),(512,586),(512,587),(524,587),(512,588),(579,588),(580,588),(581,588),(512,589),(524,589),(628,589),(512,590),(524,590),(629,590),(512,591),(512,592),(524,592),(553,592),(643,592),(649,592),(650,592),(512,593),(524,593),(512,594),(524,594),(693,594),(699,594),(700,594),(701,594),(512,595),(524,595),(512,596),(522,596),(524,596),(553,596),(512,597),(524,597),(512,598),(524,598),(512,599),(612,599),(512,600),(513,600),(529,600),(530,600),(531,600),(532,600),(533,600),(534,600),(535,600),(536,600),(537,600),(538,600),(539,600),(540,600),(590,600),(591,600),(612,600),(615,600),(616,600),(625,600),(633,600),(512,601),(513,601),(524,601),(526,601),(538,601),(643,601),(662,601),(692,601),(512,602),(512,603),(524,603),(547,603),(512,604),(522,604),(524,604),(525,604),(512,605),(518,605),(524,605),(512,606),(548,606),(553,606),(512,607),(524,607),(512,608),(518,608),(524,608),(512,609),(643,609),(669,609),(512,610),(524,610),(512,611),(557,611),(571,611),(572,611),(612,611),(614,611),(692,611),(512,612),(524,612),(512,613),(524,613),(512,614),(612,614),(512,615),(630,615),(512,616),(524,616),(512,617),(518,617),(524,617),(512,618),(524,618),(544,618),(549,618),(553,618),(556,618),(557,618),(559,618),(691,618),(694,618),(512,619),(512,620),(522,620),(584,620),(585,620),(612,620),(614,620),(621,620),(512,621),(512,622),(512,623),(512,624),(512,625),(631,625),(512,626),(524,626),(512,627),(518,627),(523,627),(536,627),(512,628),(524,628),(512,629),(524,629),(512,630),(524,630),(512,631),(513,631),(526,631),(538,631),(512,632),(624,632),(512,633),(555,633),(562,633),(512,634),(512,635),(628,635),(512,636),(518,636),(524,636),(513,637),(526,637),(513,638),(526,638),(513,639),(568,639),(569,639),(570,639),(575,639),(576,639),(579,639),(581,639),(621,639),(513,640),(526,640),(538,640),(608,640),(513,641),(526,641),(514,642),(528,642),(540,642),(517,643),(517,644),(517,645),(517,646),(518,647),(522,648),(522,649),(522,650),(522,651),(522,652),(523,653),(523,654),(523,655),(523,656),(523,657),(536,657),(523,658),(536,658),(624,658),(524,659),(525,659),(524,660),(524,661),(525,661),(537,661),(540,661),(524,662),(524,663),(524,664),(553,664),(524,665),(525,665),(544,665),(524,666),(524,667),(524,668),(643,668),(649,668),(650,668),(676,668),(686,668),(524,669),(524,670),(524,671),(524,672),(524,673),(524,674),(524,675),(524,676),(524,677),(525,677),(617,677),(524,678),(524,679),(525,680),(537,680),(540,680),(525,681),(549,681),(557,681),(561,681),(526,682),(526,683),(526,684),(526,685),(526,686),(559,686),(703,686),(527,687),(539,687),(643,687),(537,688),(543,689),(544,690),(547,690),(555,690),(557,690),(560,690),(561,690),(563,690),(646,690),(679,690),(544,691),(549,691),(553,691),(554,691),(556,691),(561,691),(572,691),(544,692),(628,692),(631,692),(544,693),(559,693),(589,693),(668,693),(544,694),(547,694),(561,694),(649,694),(650,694),(669,694),(546,695),(552,695),(557,695),(562,695),(582,695),(583,695),(612,695),(617,695),(619,695),(620,695),(622,695),(691,695),(694,695),(546,696),(555,696),(622,696),(547,697),(603,697),(547,698),(608,698),(547,699),(547,700),(547,701),(606,701),(643,701),(671,701),(547,702),(549,703),(551,703),(556,703),(549,704),(549,705),(557,705),(549,706),(553,706),(554,706),(557,706),(559,706),(561,706),(619,706),(694,706),(549,707),(555,707),(556,707),(557,707),(694,707),(549,708),(563,708),(549,709),(550,709),(555,709),(556,709),(557,709),(699,709),(700,709),(701,709),(552,710),(555,710),(553,711),(554,711),(553,712),(553,713),(553,714),(643,714),(649,714),(650,714),(553,715),(554,715),(553,716),(554,716),(553,717),(694,717),(553,718),(554,718),(572,718),(627,718),(630,718),(631,718),(692,718),(553,719),(553,720),(553,721),(554,722),(612,722),(614,722),(554,723),(557,724),(559,724),(572,724),(612,724),(614,724),(617,724),(557,725),(557,726),(557,727),(557,728),(559,728),(557,729),(557,730),(557,731),(557,732),(557,733),(557,734),(557,735),(557,736),(557,737),(557,738),(559,738),(558,739),(559,740),(559,741),(623,741),(625,741),(559,742),(559,743),(559,744),(564,745),(565,745),(566,745),(567,745),(564,746),(565,746),(566,746),(567,746),(574,746),(592,746),(564,747),(565,747),(566,747),(567,747),(564,748),(565,748),(566,748),(567,748),(574,748),(564,749),(565,749),(566,749),(567,749),(574,749),(564,750),(565,750),(566,750),(567,750),(568,750),(569,750),(570,750),(574,750),(564,751),(565,751),(566,751),(567,751),(574,751),(564,752),(565,752),(566,752),(567,752),(574,752),(584,752),(585,752),(564,753),(565,753),(566,753),(567,753),(573,753),(564,754),(565,754),(566,754),(567,754),(564,755),(565,755),(566,755),(567,755),(572,755),(573,755),(574,755),(568,756),(569,756),(570,756),(571,757),(571,758),(572,758),(612,758),(614,758),(572,759),(643,759),(671,759),(686,759),(692,759),(573,760),(573,761),(639,761),(684,761),(688,761),(573,762),(573,763),(573,764),(573,765),(573,766),(639,766),(684,766),(688,766),(573,767),(574,768),(588,768),(590,768),(591,768),(574,769),(574,770),(575,771),(576,771),(575,772),(576,772),(643,772),(644,772),(645,772),(692,772),(575,773),(576,773),(577,774),(582,774),(583,774),(695,774),(696,774),(578,775),(579,776),(581,776),(579,777),(581,777),(579,778),(579,779),(579,780),(579,781),(579,782),(579,783),(579,784),(579,785),(579,786),(579,787),(579,788),(579,789),(579,790),(579,791),(579,792),(579,793),(579,794),(579,795),(579,796),(579,797),(579,798),(579,799),(579,800),(579,801),(581,801),(579,802),(581,802),(579,803),(581,803),(579,804),(581,804),(580,805),(580,806),(580,807),(580,808),(580,809),(580,810),(580,811),(580,812),(580,813),(581,813),(617,813),(581,814),(581,815),(581,816),(581,817),(581,818),(581,819),(581,820),(581,821),(581,822),(581,823),(581,824),(581,825),(581,826),(581,827),(581,828),(581,829),(581,830),(581,831),(581,832),(581,833),(581,834),(581,835),(581,836),(581,837),(582,838),(584,838),(586,838),(682,838),(695,838),(584,839),(585,839),(584,840),(585,840),(586,840),(587,840),(584,841),(585,841),(584,842),(585,842),(584,843),(585,843),(584,844),(585,844),(584,845),(585,845),(586,845),(587,845),(586,846),(587,846),(589,847),(617,847),(590,848),(591,848),(594,849),(604,849),(607,849),(608,849),(596,850),(597,851),(598,852),(599,853),(600,854),(601,855),(602,856),(604,857),(605,858),(607,859),(608,860),(608,861),(609,862),(610,862),(611,862),(609,863),(610,863),(611,863),(609,864),(610,864),(611,864),(609,865),(610,865),(611,865),(609,866),(610,866),(611,866),(609,867),(610,867),(611,867),(609,868),(610,868),(611,868),(609,869),(609,870),(609,871),(610,871),(611,871),(609,872),(610,872),(611,872),(609,873),(609,874),(609,875),(610,875),(611,875),(609,876),(610,876),(611,876),(609,877),(610,877),(611,877),(610,878),(610,879),(611,879),(611,880),(612,881),(614,881),(612,882),(614,882),(612,883),(612,884),(614,884),(612,885),(614,885),(621,885),(612,886),(614,886),(612,887),(612,888),(614,888),(612,889),(612,890),(614,890),(612,891),(612,892),(614,892),(612,893),(614,893),(612,894),(614,894),(612,895),(614,895),(612,896),(614,896),(612,897),(614,897),(612,898),(617,898),(620,898),(622,898),(612,899),(612,900),(614,900),(612,901),(614,901),(612,902),(614,902),(621,902),(612,903),(612,904),(614,904),(612,905),(621,905),(612,906),(614,906),(612,907),(613,907),(614,907),(615,907),(617,907),(620,907),(622,907),(612,908),(614,908),(612,909),(614,909),(612,910),(614,910),(612,911),(612,912),(614,912),(614,913),(614,914),(617,915),(617,916),(617,917),(617,918),(619,918),(617,919),(619,919),(617,920),(619,920),(673,920),(692,920),(617,921),(617,922),(698,922),(617,923),(617,924),(619,925),(619,926),(619,927),(623,928),(624,928),(625,928),(626,928),(623,929),(624,929),(623,930),(624,930),(627,931),(630,931),(631,931),(692,931),(628,932),(628,933),(631,934),(649,934),(650,934),(669,934),(686,934),(631,935),(632,936),(632,937),(632,938),(632,939),(634,940),(636,940),(634,941),(635,941),(635,942),(637,942),(643,942),(636,943),(637,943),(638,944),(639,945),(696,945),(639,946),(639,947),(642,948),(643,949),(660,949),(661,949),(643,950),(663,950),(643,951),(664,951),(643,952),(668,952),(643,953),(681,953),(692,953),(643,954),(643,955),(662,955),(643,956),(676,956),(643,957),(660,957),(661,957),(643,958),(644,958),(645,958),(646,958),(647,958),(648,958),(649,958),(650,958),(651,958),(652,958),(653,958),(654,958),(655,958),(656,958),(658,958),(660,958),(661,958),(662,958),(663,958),(664,958),(665,958),(666,958),(667,958),(668,958),(669,958),(670,958),(671,958),(672,958),(673,958),(674,958),(675,958),(676,958),(677,958),(678,958),(679,958),(680,958),(681,958),(682,958),(683,958),(684,958),(685,958),(686,958),(687,958),(688,958),(689,958),(643,959),(662,959),(667,959),(670,959),(675,959),(682,959),(683,959),(684,959),(685,959),(692,959),(643,960),(687,960),(643,961),(688,961),(643,962),(689,962),(646,963),(665,963),(679,963),(663,964),(666,965),(674,965),(672,966),(677,967),(678,968),(679,969),(680,970),(691,971),(694,971),(692,972),(692,973),(692,974),(692,975),(692,976),(692,977),(692,978),(693,979),(694,980),(697,981),(699,982),(700,982),(701,982),(699,983),(700,983),(701,983),(699,984),(700,984),(701,984),(699,985),(700,985),(701,985);
/*!40000 ALTER TABLE `help_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `help_topic`
--

DROP TABLE IF EXISTS `help_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `help_topic` (
  `help_topic_id` int unsigned NOT NULL,
  `name` char(64) NOT NULL,
  `help_category_id` smallint unsigned NOT NULL,
  `description` text NOT NULL,
  `example` text NOT NULL,
  `url` text NOT NULL,
  PRIMARY KEY (`help_topic_id`),
  UNIQUE KEY `name` (`name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='help topics';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_topic`
--

LOCK TABLES `help_topic` WRITE;
/*!40000 ALTER TABLE `help_topic` DISABLE KEYS */;
INSERT INTO `help_topic` VALUES (631,'REPAIR TABLE',47,'Syntax:\nREPAIR [NO_WRITE_TO_BINLOG | LOCAL]\n    TABLE tbl_name [, tbl_name] ...\n    [QUICK] [EXTENDED] [USE_FRM]\n\nREPAIR TABLE repairs a possibly corrupted table, for certain storage\nengines only.\n\nThis statement requires SELECT and INSERT privileges for the table.\n\nAlthough normally you should never have to run REPAIR TABLE, if\ndisaster strikes, this statement is very likely to get back all your\ndata from a MyISAM table. If your tables become corrupted often, try to\nfind the reason for it, to eliminate the need to use REPAIR TABLE. See\nhttps://dev.mysql.com/doc/refman/8.0/en/crashing.html, and\nhttps://dev.mysql.com/doc/refman/8.0/en/myisam-table-problems.html.\n\nREPAIR TABLE checks the table to see whether an upgrade is required. If\nso, it performs the upgrade, following the same rules as CHECK TABLE\n... FOR UPGRADE. See [HELP CHECK TABLE], for more information.\n\n*Important*:\n\no Make a backup of a table before performing a table repair operation;\n  under some circumstances the operation might cause data loss.\n  Possible causes include but are not limited to file system errors.\n  See https://dev.mysql.com/doc/refman/8.0/en/backup-and-recovery.html.\n\no If the server exits during a REPAIR TABLE operation, it is essential\n  after restarting it that you immediately execute another REPAIR TABLE\n  statement for the table before performing any other operations on it.\n  In the worst case, you might have a new clean index file without\n  information about the data file, and then the next operation you\n  perform could overwrite the data file. This is an unlikely but\n  possible scenario that underscores the value of making a backup\n  first.\n\no In the event that a table on the source becomes corrupted and you run\n  REPAIR TABLE on it, any resulting changes to the original table are\n  not propagated to replicas.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/repair-table.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/repair-table.html'),(632,'CREATE FUNCTION LOADABLE FUNCTION',48,'Syntax:\nCREATE [AGGREGATE] FUNCTION [IF NOT EXISTS] function_name\n    RETURNS {STRING|INTEGER|REAL|DECIMAL}\n    SONAME shared_library_name\n\nThis statement loads the loadable function named function_name. (CREATE\nFUNCTION is also used to created stored functions; see [HELP CREATE\nPROCEDURE].)\n\nA loadable function is a way to extend MySQL with a new function that\nworks like a native (built-in) MySQL function such as ABS() or\nCONCAT(). See Adding a Loadable Function\n(https://dev.mysql.com/doc/extending-mysql/8.0/en/adding-loadable-funct\nion.html).\n\nfunction_name is the name that should be used in SQL statements to\ninvoke the function. The RETURNS clause indicates the type of the\nfunction\'s return value. DECIMAL is a legal value after RETURNS, but\ncurrently DECIMAL functions return string values and should be written\nlike STRING functions.\n\nIF NOT EXISTS prevents an error from occurring if there already exists\na loadable function with the same name. It does not prevent an error\nfrom occurring if there already exists a built-in function having the\nsame name. IF NOT EXISTS is supported for CREATE FUNCTION statements\nbeginning with MySQL 8.0.29. See also\nhttps://dev.mysql.com/doc/refman/8.0/en/function-resolution.html#functi\non-name-resolution.\n\nThe AGGREGATE keyword, if given, signifies that the function is an\naggregate (group) function. An aggregate function works exactly like a\nnative MySQL aggregate function such as SUM() or COUNT().\n\nshared_library_name is the base name of the shared library file\ncontaining the code that implements the function. The file must be\nlocated in the plugin directory. This directory is given by the value\nof the plugin_dir system variable. For more information, see\nhttps://dev.mysql.com/doc/refman/8.0/en/function-loading.html.\n\nCREATE FUNCTION requires the INSERT privilege for the mysql system\nschema because it adds a row to the mysql.func system table to register\nthe function.\n\nCREATE FUNCTION also adds the function to the Performance Schema\nuser_defined_functions table that provides runtime information about\ninstalled loadable functions. See\nhttps://dev.mysql.com/doc/refman/8.0/en/performance-schema-user-defined\n-functions-table.html.\n\n*Note*:\n\nLike the mysql.func system table, the Performance Schema\nuser_defined_functions table lists loadable functions installed using\nCREATE FUNCTION. Unlike the mysql.func table, the\nuser_defined_functions table also lists loadable functions installed\nautomatically by server components or plugins. This difference makes\nuser_defined_functions preferable to mysql.func for checking which\nloadable functions are installed.\n\nDuring the normal startup sequence, the server loads functions\nregistered in the mysql.func table. If the server is started with the\n--skip-grant-tables option, functions registered in the table are not\nloaded and are unavailable.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/create-function-loadable.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/create-function-loadable.html'),(633,'DROP FUNCTION LOADABLE FUNCTION',48,'Syntax:\nDROP FUNCTION [IF EXISTS] function_name\n\nThis statement drops the loadable function named function_name. (DROP\nFUNCTION is also used to drop stored functions; see [HELP DROP\nPROCEDURE].)\n\nDROP FUNCTION is the complement of CREATE FUNCTION. It requires the\nDELETE privilege for the mysql system schema because it removes the row\nfrom the mysql.func system table that registers the function.\n\nDROP FUNCTION also removes the function from the Performance Schema\nuser_defined_functions table that provides runtime information about\ninstalled loadable functions. See\nhttps://dev.mysql.com/doc/refman/8.0/en/performance-schema-user-defined\n-functions-table.html.\n\nDuring the normal startup sequence, the server loads functions\nregistered in the mysql.func table. Because DROP FUNCTION removes the\nmysql.func row for the dropped function, the server does not load the\nfunction during subsequent restarts.\n\nDROP FUNCTION cannot be used to drop a loadable function that is\ninstalled automatically by components or plugins rather than by using\nCREATE FUNCTION. Such a function is also dropped automatically, when\nthe component or plugin that installed it is uninstalled.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/drop-function-loadable.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/drop-function-loadable.html'),(634,'INSTALL COMPONENT',49,'Syntax:\nINSTALL COMPONENT component_name  [, component_name ...\n     [SET variable = expr [, variable = expr] ...] \n  \n  variable: {\n    {GLOBAL | @@GLOBAL.} [component_prefix.]system_var_name\n  | {PERSIST | @@PERSIST.} [component_prefix.]system_var_name\n}\n\nThis statement installs one or more components, which become active\nimmediately. A component provides services that are available to the\nserver and other components; see\nhttps://dev.mysql.com/doc/refman/8.0/en/components.html. INSTALL\nCOMPONENT requires the INSERT privilege for the mysql.component system\ntable because it adds a row to that table to register the component.\n\nExample:\n\nINSTALL COMPONENT \'file://component1\', \'file://component2\';\n\nA component is named using a URN that begins with file:// and indicates\nthe base name of the library file that implements the component,\nlocated in the directory named by the plugin_dir system variable.\nComponent names do not include any platform-dependent file name suffix\nsuch as .so or .dll. (These naming details are subject to change\nbecause component name interpretation is itself performed by a service\nand the component infrastructure makes it possible to replace the\ndefault service implementation with alternative implementations.)\n\nINSTALL COMPONENT (from 8.0.33) permits setting the values of component\nsystem variables when you install one or more components. The SET\nclause enables you to specify variable values precisely when they are\nneeded, without the inconvenience or limitations associated with other\nforms of assignment. Specifically, you can also set component variables\nwith these alternatives:\n\no At server startup using options on the command line or in an option\n  file, but doing so involves a server restart. The values do not take\n  effect until you install the component. You can specify an invalid\n  variable name for a component on the command line without triggering\n  an error.\n\no Dynamically while the server is running by means of the SET\n  statement, which enables you to modify operation of the server\n  without having to stop and restart it. Setting a read-only variable\n  is not permitted.\n\nThe optional SET clause applies a value, or values, only to the\ncomponent specified in the INSTALL COMPONENT statement, rather than to\nall subsequent installations of that component. SET GLOBAL|PERSIST\nworks for all types of variables, including read-only variables,\nwithout having to restart the server. A component system variable that\nyou set using INSTALL COMPONENT takes precedence over any conflicting\nvalue coming from the command line or an option file.\n\nExample:\n\nINSTALL COMPONENT \'file://component1\', \'file://component2\' \n    SET GLOBAL component1.var1 = 12 + 3, PERSIST component2.var2 = \'strings\';\n\nOmitting PERSIST or GLOBAL is equivalent to specifying GLOBAL.\n\nSpecifying PERSIST for any variable in SET silently executes SET\nPERSIST_ONLY immediately after INSTALL COMPONENT loads the components,\nbut before updating the mysql.component table. If SET PERSIST_ONLY\nfails, then the server unloads all of the previously loaded new\ncomponents without persisting anything to mysql.component.\n\nThe SET clause accepts only valid variable names of the component being\ninstalled and emits an error message for all invalid names. Subqueries,\nstored functions, and aggregate functions are not permitted as part of\nthe value expression. If you install a single component, it is not\nnecessary to prefix the variable name with the component name.\n\n*Note*:\n\nWhile specifying a variable value using the SET clause is similar to\nthat of the command line---it is available immediately at variable\nregistration---there is a distinct difference in how the SET clause\nhandles invalid numerical values for boolean variables. For example, if\nyou set a boolean variable to 11 (component1.boolvar = 11), you see the\nfollowing behavior:\n\no SET clause yields true\n\no Command line yields false (11 is neither ON nor 1)\n\nIf any error occurs, the statement fails and has no effect. For\nexample, this happens if a component name is erroneous, a named\ncomponent does not exist or is already installed, or component\ninitialization fails.\n\nA loader service handles component loading, which includes adding\ninstalled components to the mysql.component system table that serves as\na registry. For subsequent server restarts, any components listed in\nmysql.component are loaded by the loader service during the startup\nsequence. This occurs even if the server is started with the\n--skip-grant-tables option.\n\nIf a component depends on services not present in the registry and you\nattempt to install the component without also installing the component\nor components that provide the services on which it depends, an error\noccurs:\n\nERROR 3527 (HY000): Cannot satisfy dependency for service \'component_a\'\nrequired by component \'component_b\'.\n\nTo avoid this problem, either install all components in the same\nstatement, or install the dependent component after installing any\ncomponents on which it depends.\n\n*Note*:\n\nFor keyring components, do not use INSTALL COMPONENT. Instead,\nconfigure keyring component loading using a manifest file. See\nhttps://dev.mysql.com/doc/refman/8.0/en/keyring-component-installation.\nhtml.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/install-component.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/install-component.html'),(635,'INSTALL PLUGIN',50,'Syntax:\nINSTALL PLUGIN plugin_name SONAME \'shared_library_name\'\n\nThis statement installs a server plugin. It requires the INSERT\nprivilege for the mysql.plugin system table because it adds a row to\nthat table to register the plugin.\n\nplugin_name is the name of the plugin as defined in the plugin\ndescriptor structure contained in the library file (see Plugin Data\nStructures\n(https://dev.mysql.com/doc/extending-mysql/8.0/en/plugin-data-structure\ns.html)). Plugin names are not case-sensitive. For maximal\ncompatibility, plugin names should be limited to ASCII letters, digits,\nand underscore because they are used in C source files, shell command\nlines, M4 and Bourne shell scripts, and SQL environments.\n\nshared_library_name is the name of the shared library that contains the\nplugin code. The name includes the file name extension (for example,\nlibmyplugin.so, libmyplugin.dll, or libmyplugin.dylib).\n\nThe shared library must be located in the plugin directory (the\ndirectory named by the plugin_dir system variable). The library must be\nin the plugin directory itself, not in a subdirectory. By default,\nplugin_dir is the plugin directory under the directory named by the\npkglibdir configuration variable, but it can be changed by setting the\nvalue of plugin_dir at server startup. For example, set its value in a\nmy.cnf file:\n\n[mysqld]\nplugin_dir=/path/to/plugin/directory\n\nIf the value of plugin_dir is a relative path name, it is taken to be\nrelative to the MySQL base directory (the value of the basedir system\nvariable).\n\nINSTALL PLUGIN loads and initializes the plugin code to make the plugin\navailable for use. A plugin is initialized by executing its\ninitialization function, which handles any setup that the plugin must\nperform before it can be used. When the server shuts down, it executes\nthe deinitialization function for each plugin that is loaded so that\nthe plugin has a chance to perform any final cleanup.\n\nINSTALL PLUGIN also registers the plugin by adding a line that\nindicates the plugin name and library file name to the mysql.plugin\nsystem table. During the normal startup sequence, the server loads and\ninitializes plugins registered in mysql.plugin. This means that a\nplugin is installed with INSTALL PLUGIN only once, not every time the\nserver starts. If the server is started with the --skip-grant-tables\noption, plugins registered in the mysql.plugin table are not loaded and\nare unavailable.\n\nA plugin library can contain multiple plugins. For each of them to be\ninstalled, use a separate INSTALL PLUGIN statement. Each statement\nnames a different plugin, but all of them specify the same library\nname.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/install-plugin.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/install-plugin.html'),(636,'UNINSTALL COMPONENT',49,'Syntax:\nUNINSTALL COMPONENT component_name [, component_name ] ...\n\nThis statement deactivates and uninstalls one or more components. A\ncomponent provides services that are available to the server and other\ncomponents; see\nhttps://dev.mysql.com/doc/refman/8.0/en/components.html. UNINSTALL\nCOMPONENT is the complement of INSTALL COMPONENT. It requires the\nDELETE privilege for the mysql.component system table because it\nremoves the row from that table that registers the component. UNINSTALL\nCOMPONENT does not undo persisted variables, including the variables\npersisted using INSTALL COMPONENT ... SET PERSIST.\n\nExample:\n\nUNINSTALL COMPONENT \'file://component1\', \'file://component2\';\n\nFor information about component naming, see [HELP INSTALL COMPONENT].\n\nIf any error occurs, the statement fails and has no effect. For\nexample, this happens if a component name is erroneous, a named\ncomponent is not installed, or cannot be uninstalled because other\ninstalled components depend on it.\n\nA loader service handles component unloading, which includes removing\nuninstalled components from the mysql.component system table that\nserves as a registry. As a result, unloaded components are not loaded\nduring the startup sequence for subsequent server restarts.\n\n*Note*:\n\nThis statement has no effect for keyring components, which are loaded\nusing a manifest file and cannot be uninstalled. See\nhttps://dev.mysql.com/doc/refman/8.0/en/keyring-component-installation.\nhtml.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/uninstall-component.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/uninstall-component.html'),(637,'UNINSTALL PLUGIN',49,'Syntax:\nUNINSTALL PLUGIN plugin_name\n\nThis statement removes an installed server plugin. UNINSTALL PLUGIN is\nthe complement of INSTALL PLUGIN. It requires the DELETE privilege for\nthe mysql.plugin system table because it removes the row from that\ntable that registers the plugin.\n\nplugin_name must be the name of some plugin that is listed in the\nmysql.plugin table. The server executes the plugin\'s deinitialization\nfunction and removes the row for the plugin from the mysql.plugin\nsystem table, so that subsequent server restarts do not load and\ninitialize the plugin. UNINSTALL PLUGIN does not remove the plugin\'s\nshared library file.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/uninstall-plugin.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/uninstall-plugin.html'),(638,'CLONE',49,'Syntax:\nCLONE clone_action\n\nclone_action: {\n    LOCAL DATA DIRECTORY [=] \'clone_dir\';\n  | INSTANCE FROM \'user\'@\'host\':port\n    IDENTIFIED BY \'password\'\n    [DATA DIRECTORY [=] \'clone_dir\']\n    [REQUIRE [NO] SSL]\n}\n\nThe CLONE statement is used to clone data locally or from a remote\nMySQL server instance. To use CLONE syntax, the clone plugin must be\ninstalled. See\nhttps://dev.mysql.com/doc/refman/8.0/en/clone-plugin.html.\n\nCLONE LOCAL DATA DIRECTORY syntax clones data from the local MySQL data\ndirectory to a directory on the same server or node where the MySQL\nserver instance runs. The \'clone_dir\' directory is the full path of the\nlocal directory that data is cloned to. An absolute path is required.\nThe specified directory must not exist, but the specified path must be\nan existent path. The MySQL server requires the necessary write access\nto create the specified directory. For more information, see\nhttps://dev.mysql.com/doc/refman/8.0/en/clone-plugin-local.html.\n\nCLONE INSTANCE syntax clones data from a remote MySQL server instance\n(the donor) and transfers it to the MySQL instance where the cloning\noperation was initiated (the recipient).\n\no user is the clone user on the donor MySQL server instance.\n\no host is the hostname address of the donor MySQL server instance.\n  Internet Protocol version 6 (IPv6) address format is not supported.\n  An alias to the IPv6 address can be used instead. An IPv4 address can\n  be used as is.\n\no port is the port number of the donor MySQL server instance. (The X\n  Protocol port specified by mysqlx_port is not supported. Connecting\n  to the donor MySQL server instance through MySQL Router is also not\n  supported.)\n\no IDENTIFIED BY \'password\' specifies the password of the clone user on\n  the donor MySQL server instance.\n\no DATA DIRECTORY [=] \'clone_dir\' is an optional clause used to specify\n  a directory on the recipient for the data you are cloning. Use this\n  option if you do not want to remove existing data in the recipient\n  data directory. An absolute path is required, and the directory must\n  not exist. The MySQL server must have the necessary write access to\n  create the directory.\n\n  When the optional DATA DIRECTORY [=] \'clone_dir\' clause is not used,\n  a cloning operation removes existing data in the recipient data\n  directory, replaces it with the cloned data, and automatically\n  restarts the server afterward.\n\no [REQUIRE [NO] SSL] explicitly specifies whether an encrypted\n  connection is to be used or not when transferring cloned data over\n  the network. An error is returned if the explicit specification\n  cannot be satisfied. If an SSL clause is not specified, clone\n  attempts to establish an encrypted connection by default, falling\n  back to an insecure connection if the secure connection attempt\n  fails. A secure connection is required when cloning encrypted data\n  regardless of whether this clause is specified. For more information,\n  see\n  https://dev.mysql.com/doc/refman/8.0/en/clone-plugin-remote.html#clon\n  e-plugin-remote-ssl.\n\nFor additional information about cloning data from a remote MySQL\nserver instance, see\nhttps://dev.mysql.com/doc/refman/8.0/en/clone-plugin-remote.html.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/clone.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/clone.html'),(639,'SET',3,'Syntax:\nSET variable = expr [, variable = expr] ...\n\nvariable: {\n    user_var_name\n  | param_name\n  | local_var_name\n  | {GLOBAL | @@GLOBAL.} system_var_name\n  | {PERSIST | @@PERSIST.} system_var_name\n  | {PERSIST_ONLY | @@PERSIST_ONLY.} system_var_name\n  | [SESSION | @@SESSION. | @@] system_var_name\n}\n\nSET syntax for variable assignment enables you to assign values to\ndifferent types of variables that affect the operation of the server or\nclients:\n\no User-defined variables. See\n  https://dev.mysql.com/doc/refman/8.0/en/user-variables.html.\n\no Stored procedure and function parameters, and stored program local\n  variables. See\n  https://dev.mysql.com/doc/refman/8.0/en/stored-program-variables.html\n  .\n\no System variables. See\n  https://dev.mysql.com/doc/refman/8.0/en/server-system-variables.html.\n  System variables also can be set at server startup, as described in\n  https://dev.mysql.com/doc/refman/8.0/en/using-system-variables.html.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/set-variable.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/set-variable.html'),(640,'SET CHARACTER SET',3,'Syntax:\nSET {CHARACTER SET | CHARSET}\n    {\'charset_name\' | DEFAULT}\n\nThis statement maps all strings sent between the server and the current\nclient with the given mapping. SET CHARACTER SET sets three session\nsystem variables: character_set_client and character_set_results are\nset to the given character set, and character_set_connection to the\nvalue of character_set_database. See\nhttps://dev.mysql.com/doc/refman/8.0/en/charset-connection.html.\n\ncharset_name may be quoted or unquoted.\n\nThe default character set mapping can be restored by using the value\nDEFAULT. The default depends on the server configuration.\n\nSome character sets cannot be used as the client character set.\nAttempting to use them with SET CHARACTER SET produces an error. See\nhttps://dev.mysql.com/doc/refman/8.0/en/charset-connection.html#charset\n-connection-impermissible-client-charset.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/set-character-set.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/set-character-set.html'),(641,'SET CHARSET',3,'Syntax:\nSET {CHARACTER SET | CHARSET}\n    {\'charset_name\' | DEFAULT}\n\nThis statement maps all strings sent between the server and the current\nclient with the given mapping. SET CHARACTER SET sets three session\nsystem variables: character_set_client and character_set_results are\nset to the given character set, and character_set_connection to the\nvalue of character_set_database. See\nhttps://dev.mysql.com/doc/refman/8.0/en/charset-connection.html.\n\ncharset_name may be quoted or unquoted.\n\nThe default character set mapping can be restored by using the value\nDEFAULT. The default depends on the server configuration.\n\nSome character sets cannot be used as the client character set.\nAttempting to use them with SET CHARACTER SET produces an error. See\nhttps://dev.mysql.com/doc/refman/8.0/en/charset-connection.html#charset\n-connection-impermissible-client-charset.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/set-character-set.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/set-character-set.html'),(642,'SET NAMES',3,'Syntax:\nSET NAMES {\'charset_name\'\n    [COLLATE \'collation_name\'] | DEFAULT}\n\nThis statement sets the three session system variables\ncharacter_set_client, character_set_connection, and\ncharacter_set_results to the given character set. Setting\ncharacter_set_connection to charset_name also sets collation_connection\nto the default collation for charset_name. See\nhttps://dev.mysql.com/doc/refman/8.0/en/charset-connection.html.\n\nThe optional COLLATE clause may be used to specify a collation\nexplicitly. If given, the collation must one of the permitted\ncollations for charset_name.\n\ncharset_name and collation_name may be quoted or unquoted.\n\nThe default mapping can be restored by using a value of DEFAULT. The\ndefault depends on the server configuration.\n\nSome character sets cannot be used as the client character set.\nAttempting to use them with SET NAMES produces an error. See\nhttps://dev.mysql.com/doc/refman/8.0/en/charset-connection.html#charset\n-connection-impermissible-client-charset.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/set-names.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/set-names.html'),(643,'SHOW',3,'SHOW has many forms that provide information about databases, tables,\ncolumns, or status information about the server. This section describes\nthose following:\n\nSHOW {BINARY | MASTER} LOGS\nSHOW BINLOG EVENTS [IN \'log_name\'] [FROM pos] [LIMIT [offset,] row_count]\nSHOW {CHARACTER SET | CHARSET} [like_or_where]\nSHOW COLLATION [like_or_where]\nSHOW [FULL] COLUMNS FROM tbl_name [FROM db_name] [like_or_where]\nSHOW CREATE DATABASE db_name\nSHOW CREATE EVENT event_name\nSHOW CREATE FUNCTION func_name\nSHOW CREATE PROCEDURE proc_name\nSHOW CREATE TABLE tbl_name\nSHOW CREATE TRIGGER trigger_name\nSHOW CREATE VIEW view_name\nSHOW DATABASES [like_or_where]\nSHOW ENGINE engine_name {STATUS | MUTEX}\nSHOW [STORAGE] ENGINES\nSHOW ERRORS [LIMIT [offset,] row_count]\nSHOW EVENTS\nSHOW FUNCTION CODE func_name\nSHOW FUNCTION STATUS [like_or_where]\nSHOW GRANTS FOR user\nSHOW INDEX FROM tbl_name [FROM db_name]\nSHOW MASTER STATUS\nSHOW OPEN TABLES [FROM db_name] [like_or_where]\nSHOW PLUGINS\nSHOW PROCEDURE CODE proc_name\nSHOW PROCEDURE STATUS [like_or_where]\nSHOW PRIVILEGES\nSHOW [FULL] PROCESSLIST\nSHOW PROFILE [types] [FOR QUERY n] [OFFSET n] [LIMIT n]\nSHOW PROFILES\nSHOW RELAYLOG EVENTS [IN \'log_name\'] [FROM pos] [LIMIT [offset,] row_count]\nSHOW {REPLICAS | SLAVE HOSTS}\nSHOW {REPLICA | SLAVE} STATUS [FOR CHANNEL channel]\nSHOW [GLOBAL | SESSION] STATUS [like_or_where]\nSHOW TABLE STATUS [FROM db_name] [like_or_where]\nSHOW [FULL] TABLES [FROM db_name] [like_or_where]\nSHOW TRIGGERS [FROM db_name] [like_or_where]\nSHOW [GLOBAL | SESSION] VARIABLES [like_or_where]\nSHOW WARNINGS [LIMIT [offset,] row_count]\n\nlike_or_where: {\n    LIKE \'pattern\'\n  | WHERE expr\n}\n\nIf the syntax for a given SHOW statement includes a LIKE \'pattern\'\npart, \'pattern\' is a string that can contain the SQL % and _ wildcard\ncharacters. The pattern is useful for restricting statement output to\nmatching values.\n\nSeveral SHOW statements also accept a WHERE clause that provides more\nflexibility in specifying which rows to display. See\nhttps://dev.mysql.com/doc/refman/8.0/en/extended-show.html.\n\nIn SHOW statement results, user names and host names are quoted using\nbackticks (`).\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show.html'),(644,'SHOW BINARY LOGS',3,'Syntax:\nSHOW BINARY LOGS\nSHOW MASTER LOGS\n\nLists the binary log files on the server. This statement is used as\npart of the procedure described in [HELP PURGE BINARY LOGS], that shows\nhow to determine which logs can be purged. SHOW BINARY LOGS requires\nthe REPLICATION CLIENT privilege (or the deprecated SUPER privilege).\n\nEncrypted binary log files have a 512-byte file header that stores\ninformation required for encryption and decryption of the file. This is\nincluded in the file size displayed by SHOW BINARY LOGS. The Encrypted\ncolumn shows whether or not the binary log file is encrypted. Binary\nlog encryption is active if binlog_encryption=ON is set for the server.\nExisting binary log files are not encrypted or decrypted if binary log\nencryption is activated or deactivated while the server is running.\n\nmysql> SHOW BINARY LOGS;\n+---------------+-----------+-----------+\n| Log_name      | File_size | Encrypted |\n+---------------+-----------+-----------+\n| binlog.000015 |    724935 |       Yes |\n| binlog.000016 |    733481 |       Yes |\n+---------------+-----------+-----------+\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-binary-logs.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-binary-logs.html'),(645,'SHOW MASTER LOGS',3,'Syntax:\nSHOW BINARY LOGS\nSHOW MASTER LOGS\n\nLists the binary log files on the server. This statement is used as\npart of the procedure described in [HELP PURGE BINARY LOGS], that shows\nhow to determine which logs can be purged. SHOW BINARY LOGS requires\nthe REPLICATION CLIENT privilege (or the deprecated SUPER privilege).\n\nEncrypted binary log files have a 512-byte file header that stores\ninformation required for encryption and decryption of the file. This is\nincluded in the file size displayed by SHOW BINARY LOGS. The Encrypted\ncolumn shows whether or not the binary log file is encrypted. Binary\nlog encryption is active if binlog_encryption=ON is set for the server.\nExisting binary log files are not encrypted or decrypted if binary log\nencryption is activated or deactivated while the server is running.\n\nmysql> SHOW BINARY LOGS;\n+---------------+-----------+-----------+\n| Log_name      | File_size | Encrypted |\n+---------------+-----------+-----------+\n| binlog.000015 |    724935 |       Yes |\n| binlog.000016 |    733481 |       Yes |\n+---------------+-----------+-----------+\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-binary-logs.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-binary-logs.html'),(646,'SHOW BINLOG EVENTS',3,'Syntax:\nSHOW BINLOG EVENTS\n   [IN \'log_name\']\n   [FROM pos]\n   [LIMIT [offset,] row_count]\n\nShows the events in the binary log. If you do not specify \'log_name\',\nthe first binary log is displayed. SHOW BINLOG EVENTS requires the\nREPLICATION SLAVE privilege.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-binlog-events.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-binlog-events.html'),(647,'SHOW CHARACTER SET',3,'Syntax:\nSHOW {CHARACTER SET | CHARSET}\n    [LIKE \'pattern\' | WHERE expr]\n\nThe SHOW CHARACTER SET statement shows all available character sets.\nThe LIKE clause, if present, indicates which character set names to\nmatch. The WHERE clause can be given to select rows using more general\nconditions, as discussed in\nhttps://dev.mysql.com/doc/refman/8.0/en/extended-show.html. For\nexample:\n\nmysql> SHOW CHARACTER SET LIKE \'latin%\';\n+---------+-----------------------------+-------------------+--------+\n| Charset | Description                 | Default collation | Maxlen |\n+---------+-----------------------------+-------------------+--------+\n| latin1  | cp1252 West European        | latin1_swedish_ci |      1 |\n| latin2  | ISO 8859-2 Central European | latin2_general_ci |      1 |\n| latin5  | ISO 8859-9 Turkish          | latin5_turkish_ci |      1 |\n| latin7  | ISO 8859-13 Baltic          | latin7_general_ci |      1 |\n+---------+-----------------------------+-------------------+--------+\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-character-set.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-character-set.html'),(648,'SHOW COLLATION',3,'Syntax:\nSHOW COLLATION\n    [LIKE \'pattern\' | WHERE expr]\n\nThis statement lists collations supported by the server. By default,\nthe output from SHOW COLLATION includes all available collations. The\nLIKE clause, if present, indicates which collation names to match. The\nWHERE clause can be given to select rows using more general conditions,\nas discussed in\nhttps://dev.mysql.com/doc/refman/8.0/en/extended-show.html. For\nexample:\n\nmysql> SHOW COLLATION WHERE Charset = \'latin1\';\n+-------------------+---------+----+---------+----------+---------+\n| Collation         | Charset | Id | Default | Compiled | Sortlen |\n+-------------------+---------+----+---------+----------+---------+\n| latin1_german1_ci | latin1  |  5 |         | Yes      |       1 |\n| latin1_swedish_ci | latin1  |  8 | Yes     | Yes      |       1 |\n| latin1_danish_ci  | latin1  | 15 |         | Yes      |       1 |\n| latin1_german2_ci | latin1  | 31 |         | Yes      |       2 |\n| latin1_bin        | latin1  | 47 |         | Yes      |       1 |\n| latin1_general_ci | latin1  | 48 |         | Yes      |       1 |\n| latin1_general_cs | latin1  | 49 |         | Yes      |       1 |\n| latin1_spanish_ci | latin1  | 94 |         | Yes      |       1 |\n+-------------------+---------+----+---------+----------+---------+\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-collation.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-collation.html'),(649,'SHOW COLUMNS',3,'Syntax:\nSHOW [EXTENDED] [FULL] {COLUMNS | FIELDS}\n    {FROM | IN} tbl_name\n    [{FROM | IN} db_name]\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW COLUMNS displays information about the columns in a given table.\nIt also works for views. SHOW COLUMNS displays information only for\nthose columns for which you have some privilege.\n\nmysql> SHOW COLUMNS FROM City;\n+-------------+----------+------+-----+---------+----------------+\n| Field       | Type     | Null | Key | Default | Extra          |\n+-------------+----------+------+-----+---------+----------------+\n| ID          | int(11)  | NO   | PRI | NULL    | auto_increment |\n| Name        | char(35) | NO   |     |         |                |\n| CountryCode | char(3)  | NO   | MUL |         |                |\n| District    | char(20) | NO   |     |         |                |\n| Population  | int(11)  | NO   |     | 0       |                |\n+-------------+----------+------+-----+---------+----------------+\n\nAn alternative to tbl_name FROM db_name syntax is db_name.tbl_name.\nThese two statements are equivalent:\n\nSHOW COLUMNS FROM mytable FROM mydb;\nSHOW COLUMNS FROM mydb.mytable;\n\nThe optional EXTENDED keyword causes the output to include information\nabout hidden columns that MySQL uses internally and are not accessible\nby users.\n\nThe optional FULL keyword causes the output to include the column\ncollation and comments, as well as the privileges you have for each\ncolumn.\n\nThe LIKE clause, if present, indicates which column names to match. The\nWHERE clause can be given to select rows using more general conditions,\nas discussed in\nhttps://dev.mysql.com/doc/refman/8.0/en/extended-show.html.\n\nThe data types may differ from what you expect them to be based on a\nCREATE TABLE statement because MySQL sometimes changes data types when\nyou create or alter a table. The conditions under which this occurs are\ndescribed in\nhttps://dev.mysql.com/doc/refman/8.0/en/silent-column-changes.html.\n\nSHOW COLUMNS displays the following values for each table column:\n\no Field\n\n  The name of the column.\n\no Type\n\n  The column data type.\n\no Collation\n\n  The collation for nonbinary string columns, or NULL for other\n  columns. This value is displayed only if you use the FULL keyword.\n\no Null\n\n  The column nullability. The value is YES if NULL values can be stored\n  in the column, NO if not.\n\no Key\n\n  Whether the column is indexed:\n\n  o If Key is empty, the column either is not indexed or is indexed\n    only as a secondary column in a multiple-column, nonunique index.\n\n  o If Key is PRI, the column is a PRIMARY KEY or is one of the columns\n    in a multiple-column PRIMARY KEY.\n\n  o If Key is UNI, the column is the first column of a UNIQUE index. (A\n    UNIQUE index permits multiple NULL values, but you can tell whether\n    the column permits NULL by checking the Null field.)\n\n  o If Key is MUL, the column is the first column of a nonunique index\n    in which multiple occurrences of a given value are permitted within\n    the column.\n\n  If more than one of the Key values applies to a given column of a\n  table, Key displays the one with the highest priority, in the order\n  PRI, UNI, MUL.\n\n  A UNIQUE index may be displayed as PRI if it cannot contain NULL\n  values and there is no PRIMARY KEY in the table. A UNIQUE index may\n  display as MUL if several columns form a composite UNIQUE index;\n  although the combination of the columns is unique, each column can\n  still hold multiple occurrences of a given value.\n\no Default\n\n  The default value for the column. This is NULL if the column has an\n  explicit default of NULL, or if the column definition includes no\n  DEFAULT clause.\n\no Extra\n\n  Any additional information that is available about a given column.\n  The value is nonempty in these cases:\n\n  o auto_increment for columns that have the AUTO_INCREMENT attribute.\n\n  o on update CURRENT_TIMESTAMP for TIMESTAMP or DATETIME columns that\n    have the ON UPDATE CURRENT_TIMESTAMP attribute.\n\n  o VIRTUAL GENERATED or STORED GENERATED for generated columns.\n\n  o DEFAULT_GENERATED for columns that have an expression default\n    value.\n\no Privileges\n\n  The privileges you have for the column. This value is displayed only\n  if you use the FULL keyword.\n\no Comment\n\n  Any comment included in the column definition. This value is\n  displayed only if you use the FULL keyword.\n\nTable column information is also available from the INFORMATION_SCHEMA\nCOLUMNS table. See\nhttps://dev.mysql.com/doc/refman/8.0/en/information-schema-columns-tabl\ne.html. The extended information about hidden columns is available only\nusing SHOW EXTENDED COLUMNS; it cannot be obtained from the COLUMNS\ntable.\n\nYou can list a table\'s columns with the mysqlshow db_name tbl_name\ncommand.\n\nThe DESCRIBE statement provides information similar to SHOW COLUMNS.\nSee https://dev.mysql.com/doc/refman/8.0/en/describe.html.\n\nThe SHOW CREATE TABLE, SHOW TABLE STATUS, and SHOW INDEX statements\nalso provide information about tables. See [HELP SHOW].\n\nIn MySQL 8.0.30 and later, SHOW COLUMNS includes the table\'s generated\ninvisible primary key, if it has one, by default. You can cause this\ninformation to be suppressed in the statement\'s output by setting\nshow_gipk_in_create_table_and_information_schema = OFF. For more\ninformation, see\nhttps://dev.mysql.com/doc/refman/8.0/en/create-table-gipks.html.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-columns.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-columns.html'),(650,'SHOW FIELDS',3,'Syntax:\nSHOW [EXTENDED] [FULL] {COLUMNS | FIELDS}\n    {FROM | IN} tbl_name\n    [{FROM | IN} db_name]\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW COLUMNS displays information about the columns in a given table.\nIt also works for views. SHOW COLUMNS displays information only for\nthose columns for which you have some privilege.\n\nmysql> SHOW COLUMNS FROM City;\n+-------------+----------+------+-----+---------+----------------+\n| Field       | Type     | Null | Key | Default | Extra          |\n+-------------+----------+------+-----+---------+----------------+\n| ID          | int(11)  | NO   | PRI | NULL    | auto_increment |\n| Name        | char(35) | NO   |     |         |                |\n| CountryCode | char(3)  | NO   | MUL |         |                |\n| District    | char(20) | NO   |     |         |                |\n| Population  | int(11)  | NO   |     | 0       |                |\n+-------------+----------+------+-----+---------+----------------+\n\nAn alternative to tbl_name FROM db_name syntax is db_name.tbl_name.\nThese two statements are equivalent:\n\nSHOW COLUMNS FROM mytable FROM mydb;\nSHOW COLUMNS FROM mydb.mytable;\n\nThe optional EXTENDED keyword causes the output to include information\nabout hidden columns that MySQL uses internally and are not accessible\nby users.\n\nThe optional FULL keyword causes the output to include the column\ncollation and comments, as well as the privileges you have for each\ncolumn.\n\nThe LIKE clause, if present, indicates which column names to match. The\nWHERE clause can be given to select rows using more general conditions,\nas discussed in\nhttps://dev.mysql.com/doc/refman/8.0/en/extended-show.html.\n\nThe data types may differ from what you expect them to be based on a\nCREATE TABLE statement because MySQL sometimes changes data types when\nyou create or alter a table. The conditions under which this occurs are\ndescribed in\nhttps://dev.mysql.com/doc/refman/8.0/en/silent-column-changes.html.\n\nSHOW COLUMNS displays the following values for each table column:\n\no Field\n\n  The name of the column.\n\no Type\n\n  The column data type.\n\no Collation\n\n  The collation for nonbinary string columns, or NULL for other\n  columns. This value is displayed only if you use the FULL keyword.\n\no Null\n\n  The column nullability. The value is YES if NULL values can be stored\n  in the column, NO if not.\n\no Key\n\n  Whether the column is indexed:\n\n  o If Key is empty, the column either is not indexed or is indexed\n    only as a secondary column in a multiple-column, nonunique index.\n\n  o If Key is PRI, the column is a PRIMARY KEY or is one of the columns\n    in a multiple-column PRIMARY KEY.\n\n  o If Key is UNI, the column is the first column of a UNIQUE index. (A\n    UNIQUE index permits multiple NULL values, but you can tell whether\n    the column permits NULL by checking the Null field.)\n\n  o If Key is MUL, the column is the first column of a nonunique index\n    in which multiple occurrences of a given value are permitted within\n    the column.\n\n  If more than one of the Key values applies to a given column of a\n  table, Key displays the one with the highest priority, in the order\n  PRI, UNI, MUL.\n\n  A UNIQUE index may be displayed as PRI if it cannot contain NULL\n  values and there is no PRIMARY KEY in the table. A UNIQUE index may\n  display as MUL if several columns form a composite UNIQUE index;\n  although the combination of the columns is unique, each column can\n  still hold multiple occurrences of a given value.\n\no Default\n\n  The default value for the column. This is NULL if the column has an\n  explicit default of NULL, or if the column definition includes no\n  DEFAULT clause.\n\no Extra\n\n  Any additional information that is available about a given column.\n  The value is nonempty in these cases:\n\n  o auto_increment for columns that have the AUTO_INCREMENT attribute.\n\n  o on update CURRENT_TIMESTAMP for TIMESTAMP or DATETIME columns that\n    have the ON UPDATE CURRENT_TIMESTAMP attribute.\n\n  o VIRTUAL GENERATED or STORED GENERATED for generated columns.\n\n  o DEFAULT_GENERATED for columns that have an expression default\n    value.\n\no Privileges\n\n  The privileges you have for the column. This value is displayed only\n  if you use the FULL keyword.\n\no Comment\n\n  Any comment included in the column definition. This value is\n  displayed only if you use the FULL keyword.\n\nTable column information is also available from the INFORMATION_SCHEMA\nCOLUMNS table. See\nhttps://dev.mysql.com/doc/refman/8.0/en/information-schema-columns-tabl\ne.html. The extended information about hidden columns is available only\nusing SHOW EXTENDED COLUMNS; it cannot be obtained from the COLUMNS\ntable.\n\nYou can list a table\'s columns with the mysqlshow db_name tbl_name\ncommand.\n\nThe DESCRIBE statement provides information similar to SHOW COLUMNS.\nSee https://dev.mysql.com/doc/refman/8.0/en/describe.html.\n\nThe SHOW CREATE TABLE, SHOW TABLE STATUS, and SHOW INDEX statements\nalso provide information about tables. See [HELP SHOW].\n\nIn MySQL 8.0.30 and later, SHOW COLUMNS includes the table\'s generated\ninvisible primary key, if it has one, by default. You can cause this\ninformation to be suppressed in the statement\'s output by setting\nshow_gipk_in_create_table_and_information_schema = OFF. For more\ninformation, see\nhttps://dev.mysql.com/doc/refman/8.0/en/create-table-gipks.html.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-columns.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-columns.html'),(651,'SHOW CREATE DATABASE',3,'Syntax:\nSHOW CREATE {DATABASE | SCHEMA} [IF NOT EXISTS] db_name\n\nShows the CREATE DATABASE statement that creates the named database. If\nthe SHOW statement includes an IF NOT EXISTS clause, the output too\nincludes such a clause. SHOW CREATE SCHEMA is a synonym for SHOW CREATE\nDATABASE.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-create-database.html\n\n','mysql> SHOW CREATE DATABASE test\\G\n*************************** 1. row ***************************\n       Database: test\nCreate Database: CREATE DATABASE `test` /*!40100 DEFAULT CHARACTER SET utf8mb4\n                 COLLATE utf8mb4_0900_ai_ci */ /*!80014 DEFAULT ENCRYPTION=\'N\' */\n\nmysql> SHOW CREATE SCHEMA test\\G\n*************************** 1. row ***************************\n       Database: test\nCreate Database: CREATE DATABASE `test` /*!40100 DEFAULT CHARACTER SET utf8mb4\n                 COLLATE utf8mb4_0900_ai_ci */ /*!80014 DEFAULT ENCRYPTION=\'N\' */\n','https://dev.mysql.com/doc/refman/8.0/en/show-create-database.html'),(652,'SHOW CREATE SCHEMA',3,'Syntax:\nSHOW CREATE {DATABASE | SCHEMA} [IF NOT EXISTS] db_name\n\nShows the CREATE DATABASE statement that creates the named database. If\nthe SHOW statement includes an IF NOT EXISTS clause, the output too\nincludes such a clause. SHOW CREATE SCHEMA is a synonym for SHOW CREATE\nDATABASE.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-create-database.html\n\n','mysql> SHOW CREATE DATABASE test\\G\n*************************** 1. row ***************************\n       Database: test\nCreate Database: CREATE DATABASE `test` /*!40100 DEFAULT CHARACTER SET utf8mb4\n                 COLLATE utf8mb4_0900_ai_ci */ /*!80014 DEFAULT ENCRYPTION=\'N\' */\n\nmysql> SHOW CREATE SCHEMA test\\G\n*************************** 1. row ***************************\n       Database: test\nCreate Database: CREATE DATABASE `test` /*!40100 DEFAULT CHARACTER SET utf8mb4\n                 COLLATE utf8mb4_0900_ai_ci */ /*!80014 DEFAULT ENCRYPTION=\'N\' */\n','https://dev.mysql.com/doc/refman/8.0/en/show-create-database.html'),(653,'SHOW CREATE EVENT',3,'Syntax:\nSHOW CREATE EVENT event_name\n\nThis statement displays the CREATE EVENT statement needed to re-create\na given event. It requires the EVENT privilege for the database from\nwhich the event is to be shown. For example (using the same event\ne_daily defined and then altered in [HELP SHOW EVENTS]):\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-create-event.html\n\n','mysql> SHOW CREATE EVENT myschema.e_daily\\G\n*************************** 1. row ***************************\n               Event: e_daily\n            sql_mode: ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,\n                      NO_ZERO_IN_DATE,NO_ZERO_DATE,\n                      ERROR_FOR_DIVISION_BY_ZERO,\n                      NO_ENGINE_SUBSTITUTION\n           time_zone: SYSTEM\n        Create Event: CREATE DEFINER=`jon`@`ghidora` EVENT `e_daily`\n                        ON SCHEDULE EVERY 1 DAY\n                        STARTS CURRENT_TIMESTAMP + INTERVAL 6 HOUR\n                        ON COMPLETION NOT PRESERVE\n                        ENABLE\n                        COMMENT \'Saves total number of sessions then\n                                clears the table each day\'\n                        DO BEGIN\n                          INSERT INTO site_activity.totals (time, total)\n                            SELECT CURRENT_TIMESTAMP, COUNT(*)\n                              FROM site_activity.sessions;\n                          DELETE FROM site_activity.sessions;\n                        END\ncharacter_set_client: utf8mb4\ncollation_connection: utf8mb4_0900_ai_ci\n  Database Collation: utf8mb4_0900_ai_ci\n','https://dev.mysql.com/doc/refman/8.0/en/show-create-event.html'),(654,'SHOW CREATE FUNCTION',3,'Syntax:\nSHOW CREATE FUNCTION func_name\n\nThis statement is similar to SHOW CREATE PROCEDURE but for stored\nfunctions. See [HELP SHOW CREATE PROCEDURE].\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-create-function.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-create-function.html'),(655,'SHOW CREATE PROCEDURE',3,'Syntax:\nSHOW CREATE PROCEDURE proc_name\n\nThis statement is a MySQL extension. It returns the exact string that\ncan be used to re-create the named stored procedure. A similar\nstatement, SHOW CREATE FUNCTION, displays information about stored\nfunctions (see [HELP SHOW CREATE FUNCTION]).\n\nTo use either statement, you must be the user named as the routine\nDEFINER, have the SHOW_ROUTINE privilege, have the SELECT privilege at\nthe global level, or have the CREATE ROUTINE, ALTER ROUTINE, or EXECUTE\nprivilege granted at a scope that includes the routine. The value\ndisplayed for the Create Procedure or Create Function field is NULL if\nyou have only CREATE ROUTINE, ALTER ROUTINE, or EXECUTE.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-create-procedure.html\n\n','mysql> SHOW CREATE PROCEDURE test.citycount\\G\n*************************** 1. row ***************************\n           Procedure: citycount\n            sql_mode: ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,\n                      NO_ZERO_IN_DATE,NO_ZERO_DATE,\n                      ERROR_FOR_DIVISION_BY_ZERO,\n                      NO_ENGINE_SUBSTITUTION\n    Create Procedure: CREATE DEFINER=`me`@`localhost`\n                      PROCEDURE `citycount`(IN country CHAR(3), OUT cities INT)\n                      BEGIN\n                        SELECT COUNT(*) INTO cities FROM world.city\n                        WHERE CountryCode = country;\n                      END\ncharacter_set_client: utf8mb4\ncollation_connection: utf8mb4_0900_ai_ci\n  Database Collation: utf8mb4_0900_ai_ci\n\nmysql> SHOW CREATE FUNCTION test.hello\\G\n*************************** 1. row ***************************\n            Function: hello\n            sql_mode: ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,\n                      NO_ZERO_IN_DATE,NO_ZERO_DATE,\n                      ERROR_FOR_DIVISION_BY_ZERO,\n                      NO_ENGINE_SUBSTITUTION\n     Create Function: CREATE DEFINER=`me`@`localhost`\n                      FUNCTION `hello`(s CHAR(20))\n                      RETURNS char(50) CHARSET utf8mb4\n                      DETERMINISTIC\n                      RETURN CONCAT(\'Hello, \',s,\'!\')\ncharacter_set_client: utf8mb4\ncollation_connection: utf8mb4_0900_ai_ci\n  Database Collation: utf8mb4_0900_ai_ci\n','https://dev.mysql.com/doc/refman/8.0/en/show-create-procedure.html'),(656,'SHOW CREATE TABLE',3,'Syntax:\nSHOW CREATE TABLE tbl_name\n\nShows the CREATE TABLE statement that creates the named table. To use\nthis statement, you must have some privilege for the table. This\nstatement also works with views.\n\nAs of MySQL 8.0.16, MySQL implements CHECK constraints and SHOW CREATE\nTABLE displays them. All CHECK constraints are displayed as table\nconstraints. That is, a CHECK constraint originally specified as part\nof a column definition displays as a separate clause not part of the\ncolumn definition. Example:\n\nmysql> CREATE TABLE t1 (\n         i1 INT CHECK (i1 <> 0),      -- column constraint\n         i2 INT,\n         CHECK (i2 > i1),             -- table constraint\n         CHECK (i2 <> 0) NOT ENFORCED -- table constraint, not enforced\n       );\n\nmysql> SHOW CREATE TABLE t1\\G\n*************************** 1. row ***************************\n       Table: t1\nCreate Table: CREATE TABLE `t1` (\n  `i1` int DEFAULT NULL,\n  `i2` int DEFAULT NULL,\n  CONSTRAINT `t1_chk_1` CHECK ((`i1` <> 0)),\n  CONSTRAINT `t1_chk_2` CHECK ((`i2` > `i1`)),\n  CONSTRAINT `t1_chk_3` CHECK ((`i2` <> 0)) /*!80016 NOT ENFORCED */\n) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci\n\nSHOW CREATE TABLE quotes table and column names according to the value\nof the sql_quote_show_create option. See\nhttps://dev.mysql.com/doc/refman/8.0/en/server-system-variables.html.\n\nWhen altering the storage engine of a table, table options that are not\napplicable to the new storage engine are retained in the table\ndefinition to enable reverting the table with its previously defined\noptions to the original storage engine, if necessary. For example, when\nchanging the storage engine from InnoDB to MyISAM, options specific to\nInnoDB, such as ROW_FORMAT=COMPACT, are retained, as shown here:\n\nmysql> CREATE TABLE t1 (c1 INT PRIMARY KEY) ROW_FORMAT=COMPACT ENGINE=InnoDB;\nmysql> ALTER TABLE t1 ENGINE=MyISAM;\nmysql> SHOW CREATE TABLE t1\\G\n*************************** 1. row ***************************\n       Table: t1\nCreate Table: CREATE TABLE `t1` (\n  `c1` int NOT NULL,\n  PRIMARY KEY (`c1`)\n) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT\n\nWhen creating a table with strict mode disabled, the storage engine\'s\ndefault row format is used if the specified row format is not\nsupported. The actual row format of the table is reported in the\nRow_format column in response to SHOW TABLE STATUS. SHOW CREATE TABLE\nshows the row format that was specified in the CREATE TABLE statement.\n\nIn MySQL 8.0.30 and later, SHOW CREATE TABLE includes the definition of\nthe table\'s generated invisible primary key, if it has such a key, by\ndefault. You can cause this information to be suppressed in the\nstatement\'s output by setting\nshow_gipk_in_create_table_and_information_schema = OFF. For more\ninformation, see\nhttps://dev.mysql.com/doc/refman/8.0/en/create-table-gipks.html.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-create-table.html\n\n','mysql> SHOW CREATE TABLE t\\G\n*************************** 1. row ***************************\n       Table: t\nCreate Table: CREATE TABLE `t` (\n  `id` int NOT NULL AUTO_INCREMENT,\n  `s` char(60) DEFAULT NULL,\n  PRIMARY KEY (`id`)\n) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci\n','https://dev.mysql.com/doc/refman/8.0/en/show-create-table.html'),(657,'SHOW CREATE TRIGGER',3,'Syntax:\nSHOW CREATE TRIGGER trigger_name\n\nThis statement shows the CREATE TRIGGER statement that creates the\nnamed trigger. This statement requires the TRIGGER privilege for the\ntable associated with the trigger.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-create-trigger.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-create-trigger.html'),(658,'SHOW CREATE USER',3,'Syntax:\nSHOW CREATE USER user\n\nThis statement shows the CREATE USER statement that creates the named\nuser. An error occurs if the user does not exist. The statement\nrequires the SELECT privilege for the mysql system schema, except to\nsee information for the current user. For the current user, the SELECT\nprivilege for the mysql.user system table is required for display of\nthe password hash in the IDENTIFIED AS clause; otherwise, the hash\ndisplays as <secret>.\n\nTo name the account, use the format described in\nhttps://dev.mysql.com/doc/refman/8.0/en/account-names.html. The host\nname part of the account name, if omitted, defaults to \'%\'. It is also\npossible to specify CURRENT_USER or CURRENT_USER() to refer to the\naccount associated with the current session.\n\nPassword hash values displayed in the IDENTIFIED WITH clause of output\nfrom SHOW CREATE USER may contain unprintable characters that have\nadverse effects on terminal displays and in other environments.\nEnabling the print_identified_with_as_hex system variable (available as\nof MySQL 8.0.17) causes SHOW CREATE USER to display such hash values as\nhexadecimal strings rather than as regular string literals. Hash values\nthat do not contain unprintable characters still display as regular\nstring literals, even with this variable enabled.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-create-user.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-create-user.html'),(659,'SHOW CREATE VIEW',3,'Syntax:\nSHOW CREATE VIEW view_name\n\nThis statement shows the CREATE VIEW statement that creates the named\nview.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-create-view.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-create-view.html'),(660,'SHOW DATABASES',3,'Syntax:\nSHOW {DATABASES | SCHEMAS}\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW DATABASES lists the databases on the MySQL server host. SHOW\nSCHEMAS is a synonym for SHOW DATABASES. The LIKE clause, if present,\nindicates which database names to match. The WHERE clause can be given\nto select rows using more general conditions, as discussed in\nhttps://dev.mysql.com/doc/refman/8.0/en/extended-show.html.\n\nYou see only those databases for which you have some kind of privilege,\nunless you have the global SHOW DATABASES privilege. You can also get\nthis list using the mysqlshow command.\n\nIf the server was started with the --skip-show-database option, you\ncannot use this statement at all unless you have the SHOW DATABASES\nprivilege.\n\nMySQL implements databases as directories in the data directory, so\nthis statement simply lists directories in that location. However, the\noutput may include names of directories that do not correspond to\nactual databases.\n\nDatabase information is also available from the INFORMATION_SCHEMA\nSCHEMATA table. See\nhttps://dev.mysql.com/doc/refman/8.0/en/information-schema-schemata-tab\nle.html.\n\n*Caution*:\n\nBecause any static global privilege is considered a privilege for all\ndatabases, any static global privilege enables a user to see all\ndatabase names with SHOW DATABASES or by examining the SCHEMATA table\nof INFORMATION_SCHEMA, except databases that have been restricted at\nthe database level by partial revokes.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-databases.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-databases.html'),(661,'SHOW SCHEMAS',3,'Syntax:\nSHOW {DATABASES | SCHEMAS}\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW DATABASES lists the databases on the MySQL server host. SHOW\nSCHEMAS is a synonym for SHOW DATABASES. The LIKE clause, if present,\nindicates which database names to match. The WHERE clause can be given\nto select rows using more general conditions, as discussed in\nhttps://dev.mysql.com/doc/refman/8.0/en/extended-show.html.\n\nYou see only those databases for which you have some kind of privilege,\nunless you have the global SHOW DATABASES privilege. You can also get\nthis list using the mysqlshow command.\n\nIf the server was started with the --skip-show-database option, you\ncannot use this statement at all unless you have the SHOW DATABASES\nprivilege.\n\nMySQL implements databases as directories in the data directory, so\nthis statement simply lists directories in that location. However, the\noutput may include names of directories that do not correspond to\nactual databases.\n\nDatabase information is also available from the INFORMATION_SCHEMA\nSCHEMATA table. See\nhttps://dev.mysql.com/doc/refman/8.0/en/information-schema-schemata-tab\nle.html.\n\n*Caution*:\n\nBecause any static global privilege is considered a privilege for all\ndatabases, any static global privilege enables a user to see all\ndatabase names with SHOW DATABASES or by examining the SCHEMATA table\nof INFORMATION_SCHEMA, except databases that have been restricted at\nthe database level by partial revokes.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-databases.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-databases.html'),(662,'SHOW ENGINE',3,'Syntax:\nSHOW ENGINE engine_name {STATUS | MUTEX}\n\nSHOW ENGINE displays operational information about a storage engine. It\nrequires the PROCESS privilege. The statement has these variants:\n\nSHOW ENGINE INNODB STATUS\nSHOW ENGINE INNODB MUTEX\nSHOW ENGINE PERFORMANCE_SCHEMA STATUS\n\nSHOW ENGINE INNODB STATUS displays extensive information from the\nstandard InnoDB Monitor about the state of the InnoDB storage engine.\nFor information about the standard monitor and other InnoDB Monitors\nthat provide information about InnoDB processing, see\nhttps://dev.mysql.com/doc/refman/8.0/en/innodb-monitors.html.\n\nSHOW ENGINE INNODB MUTEX displays InnoDB mutex and rw-lock statistics.\n\n*Note*:\n\nInnoDB mutexes and rwlocks can also be monitored using Performance\nSchema tables. See\nhttps://dev.mysql.com/doc/refman/8.0/en/monitor-innodb-mutex-waits-perf\normance-schema.html.\n\nMutex statistics collection is configured dynamically using the\nfollowing options:\n\no To enable the collection of mutex statistics, run:\n\nSET GLOBAL innodb_monitor_enable=\'latch\';\n\no To reset mutex statistics, run:\n\nSET GLOBAL innodb_monitor_reset=\'latch\';\n\no To disable the collection of mutex statistics, run:\n\nSET GLOBAL innodb_monitor_disable=\'latch\';\n\nCollection of mutex statistics for SHOW ENGINE INNODB MUTEX can also be\nenabled by setting innodb_monitor_enable=\'all\', or disabled by setting\ninnodb_monitor_disable=\'all\'.\n\nSHOW ENGINE INNODB MUTEX output has these columns:\n\no Type\n\n  Always InnoDB.\n\no Name\n\n  For mutexes, the Name field reports only the mutex name. For rwlocks,\n  the Name field reports the source file where the rwlock is\n  implemented, and the line number in the file where the rwlock is\n  created. The line number is specific to your version of MySQL.\n\no Status\n\n  The mutex status. This field reports the number of spins, waits, and\n  calls. Statistics for low-level operating system mutexes, which are\n  implemented outside of InnoDB, are not reported.\n\n  o spins indicates the number of spins.\n\n  o waits indicates the number of mutex waits.\n\n  o calls indicates how many times the mutex was requested.\n\nSHOW ENGINE INNODB MUTEX does not list mutexes and rw-locks for each\nbuffer pool block, as the amount of output would be overwhelming on\nsystems with a large buffer pool. SHOW ENGINE INNODB MUTEX does,\nhowever, print aggregate BUF_BLOCK_MUTEX spin, wait, and call values\nfor buffer pool block mutexes and rw-locks. SHOW ENGINE INNODB MUTEX\nalso does not list any mutexes or rw-locks that have never been waited\non (os_waits=0). Thus, SHOW ENGINE INNODB MUTEX only displays\ninformation about mutexes and rw-locks outside of the buffer pool that\nhave caused at least one OS-level wait.\n\nUse SHOW ENGINE PERFORMANCE_SCHEMA STATUS to inspect the internal\noperation of the Performance Schema code:\n\nmysql> SHOW ENGINE PERFORMANCE_SCHEMA STATUS\\G\n...\n*************************** 3. row ***************************\n  Type: performance_schema\n  Name: events_waits_history.size\nStatus: 76\n*************************** 4. row ***************************\n  Type: performance_schema\n  Name: events_waits_history.count\nStatus: 10000\n*************************** 5. row ***************************\n  Type: performance_schema\n  Name: events_waits_history.memory\nStatus: 760000\n...\n*************************** 57. row ***************************\n  Type: performance_schema\n  Name: performance_schema.memory\nStatus: 26459600\n...\n\nThis statement is intended to help the DBA understand the effects that\ndifferent Performance Schema options have on memory requirements.\n\nName values consist of two parts, which name an internal buffer and a\nbuffer attribute, respectively. Interpret buffer names as follows:\n\no An internal buffer that is not exposed as a table is named within\n  parentheses. Examples: (pfs_cond_class).size,\n  (pfs_mutex_class).memory.\n\no An internal buffer that is exposed as a table in the\n  performance_schema database is named after the table, without\n  parentheses. Examples: events_waits_history.size,\n  mutex_instances.count.\n\no A value that applies to the Performance Schema as a whole begins with\n  performance_schema. Example: performance_schema.memory.\n\nBuffer attributes have these meanings:\n\no size is the size of the internal record used by the implementation,\n  such as the size of a row in a table. size values cannot be changed.\n\no count is the number of internal records, such as the number of rows\n  in a table. count values can be changed using Performance Schema\n  configuration options.\n\no For a table, tbl_name.memory is the product of size and count. For\n  the Performance Schema as a whole, performance_schema.memory is the\n  sum of all the memory used (the sum of all other memory values).\n\nIn some cases, there is a direct relationship between a Performance\nSchema configuration parameter and a SHOW ENGINE value. For example,\nevents_waits_history_long.count corresponds to\nperformance_schema_events_waits_history_long_size. In other cases, the\nrelationship is more complex. For example, events_waits_history.count\ncorresponds to performance_schema_events_waits_history_size (the number\nof rows per thread) multiplied by\nperformance_schema_max_thread_instances ( the number of threads).\n\nSHOW ENGINE NDB STATUS If the server has the NDB storage engine\nenabled, SHOW ENGINE NDB STATUS displays cluster status information\nsuch as the number of connected data nodes, the cluster connectstring,\nand cluster binary log epochs, as well as counts of various Cluster API\nobjects created by the MySQL Server when connected to the cluster.\nSample output from this statement is shown here:\n\nmysql> SHOW ENGINE NDB STATUS;\n+------------+-----------------------+--------------------------------------------------+\n| Type       | Name                  | Status                                           |\n+------------+-----------------------+--------------------------------------------------+\n| ndbcluster | connection            | cluster_node_id=7,\n  connected_host=198.51.100.103, connected_port=1186, number_of_data_nodes=4,\n  number_of_ready_data_nodes=3, connect_count=0                                         |\n| ndbcluster | NdbTransaction        | created=6, free=0, sizeof=212                    |\n| ndbcluster | NdbOperation          | created=8, free=8, sizeof=660                    |\n| ndbcluster | NdbIndexScanOperation | created=1, free=1, sizeof=744                    |\n| ndbcluster | NdbIndexOperation     | created=0, free=0, sizeof=664                    |\n| ndbcluster | NdbRecAttr            | created=1285, free=1285, sizeof=60               |\n| ndbcluster | NdbApiSignal          | created=16, free=16, sizeof=136                  |\n| ndbcluster | NdbLabel              | created=0, free=0, sizeof=196                    |\n| ndbcluster | NdbBranch             | created=0, free=0, sizeof=24                     |\n| ndbcluster | NdbSubroutine         | created=0, free=0, sizeof=68                     |\n| ndbcluster | NdbCall               | created=0, free=0, sizeof=16                     |\n| ndbcluster | NdbBlob               | created=1, free=1, sizeof=264                    |\n| ndbcluster | NdbReceiver           | created=4, free=0, sizeof=68                     |\n| ndbcluster | binlog                | latest_epoch=155467, latest_trans_epoch=148126,\n  latest_received_binlog_epoch=0, latest_handled_binlog_epoch=0,\n  latest_applied_binlog_epoch=0                                                         |\n+------------+-----------------------+--------------------------------------------------+\n\nThe Status column in each of these rows provides information about the\nMySQL server\'s connection to the cluster and about the cluster binary\nlog\'s status, respectively. The Status information is in the form of\ncomma-delimited set of name/value pairs.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-engine.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-engine.html'),(663,'SHOW ENGINES',3,'Syntax:\nSHOW [STORAGE] ENGINES\n\nSHOW ENGINES displays status information about the server\'s storage\nengines. This is particularly useful for checking whether a storage\nengine is supported, or to see what the default engine is.\n\nFor information about MySQL storage engines, see\nhttps://dev.mysql.com/doc/refman/8.0/en/innodb-storage-engine.html, and\nhttps://dev.mysql.com/doc/refman/8.0/en/storage-engines.html.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-engines.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-engines.html'),(664,'SHOW ERRORS',3,'Syntax:\nSHOW ERRORS [LIMIT [offset,] row_count]\nSHOW COUNT(*) ERRORS\n\nSHOW ERRORS is a diagnostic statement that is similar to SHOW WARNINGS,\nexcept that it displays information only for errors, rather than for\nerrors, warnings, and notes.\n\nThe LIMIT clause has the same syntax as for the SELECT statement. See\nhttps://dev.mysql.com/doc/refman/8.0/en/select.html.\n\nThe SHOW COUNT(*) ERRORS statement displays the number of errors. You\ncan also retrieve this number from the error_count variable:\n\nSHOW COUNT(*) ERRORS;\nSELECT @@error_count;\n\nSHOW ERRORS and error_count apply only to errors, not warnings or\nnotes. In other respects, they are similar to SHOW WARNINGS and\nwarning_count. In particular, SHOW ERRORS cannot display information\nfor more than max_error_count messages, and error_count can exceed the\nvalue of max_error_count if the number of errors exceeds\nmax_error_count.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-errors.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-errors.html'),(665,'SHOW EVENTS',3,'Syntax:\nSHOW EVENTS\n    [{FROM | IN} schema_name]\n    [LIKE \'pattern\' | WHERE expr]\n\nThis statement displays information about Event Manager events, which\nare discussed in\nhttps://dev.mysql.com/doc/refman/8.0/en/event-scheduler.html. It\nrequires the EVENT privilege for the database from which the events are\nto be shown.\n\nIn its simplest form, SHOW EVENTS lists all of the events in the\ncurrent schema:\n\nmysql> SELECT CURRENT_USER(), SCHEMA();\n+----------------+----------+\n| CURRENT_USER() | SCHEMA() |\n+----------------+----------+\n| jon@ghidora    | myschema |\n+----------------+----------+\n1 row in set (0.00 sec)\n\nmysql> SHOW EVENTS\\G\n*************************** 1. row ***************************\n                  Db: myschema\n                Name: e_daily\n             Definer: jon@ghidora\n           Time zone: SYSTEM\n                Type: RECURRING\n          Execute at: NULL\n      Interval value: 1\n      Interval field: DAY\n              Starts: 2018-08-08 11:06:34\n                Ends: NULL\n              Status: ENABLED\n          Originator: 1\ncharacter_set_client: utf8mb4\ncollation_connection: utf8mb4_0900_ai_ci\n  Database Collation: utf8mb4_0900_ai_ci\n\nTo see events for a specific schema, use the FROM clause. For example,\nto see events for the test schema, use the following statement:\n\nSHOW EVENTS FROM test;\n\nThe LIKE clause, if present, indicates which event names to match. The\nWHERE clause can be given to select rows using more general conditions,\nas discussed in\nhttps://dev.mysql.com/doc/refman/8.0/en/extended-show.html.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-events.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-events.html'),(666,'SHOW FUNCTION CODE',3,'Syntax:\nSHOW FUNCTION CODE func_name\n\nThis statement is similar to SHOW PROCEDURE CODE but for stored\nfunctions. See [HELP SHOW PROCEDURE CODE].\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-function-code.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-function-code.html'),(667,'SHOW FUNCTION STATUS',3,'Syntax:\nSHOW FUNCTION STATUS\n    [LIKE \'pattern\' | WHERE expr]\n\nThis statement is similar to SHOW PROCEDURE STATUS but for stored\nfunctions. See [HELP SHOW PROCEDURE STATUS].\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-function-status.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-function-status.html'),(668,'SHOW GRANTS',3,'Syntax:\nSHOW GRANTS\n    [FOR user_or_role\n        [USING role [, role] ...]]\n\nuser_or_role: {\n    user (see )\n  | role (see .\n}\n\nThis statement displays the privileges and roles that are assigned to a\nMySQL user account or role, in the form of GRANT statements that must\nbe executed to duplicate the privilege and role assignments.\n\n*Note*:\n\nTo display nonprivilege information for MySQL accounts, use the SHOW\nCREATE USER statement. See [HELP SHOW CREATE USER].\n\nSHOW GRANTS requires the SELECT privilege for the mysql system schema,\nexcept to display privileges and roles for the current user.\n\nTo name the account or role for SHOW GRANTS, use the same format as for\nthe GRANT statement (for example, \'jeffrey\'@\'localhost\'):\n\nmysql> SHOW GRANTS FOR \'jeffrey\'@\'localhost\';\n+------------------------------------------------------------------+\n| Grants for jeffrey@localhost                                     |\n+------------------------------------------------------------------+\n| GRANT USAGE ON *.* TO `jeffrey`@`localhost`                      |\n| GRANT SELECT, INSERT, UPDATE ON `db1`.* TO `jeffrey`@`localhost` |\n+------------------------------------------------------------------+\n\nThe host part, if omitted, defaults to \'%\'. For additional information\nabout specifying account and role names, see\nhttps://dev.mysql.com/doc/refman/8.0/en/account-names.html, and\nhttps://dev.mysql.com/doc/refman/8.0/en/role-names.html.\n\nTo display the privileges granted to the current user (the account you\nare using to connect to the server), you can use any of the following\nstatements:\n\nSHOW GRANTS;\nSHOW GRANTS FOR CURRENT_USER;\nSHOW GRANTS FOR CURRENT_USER();\n\nIf SHOW GRANTS FOR CURRENT_USER (or any equivalent syntax) is used in\ndefiner context, such as within a stored procedure that executes with\ndefiner rather than invoker privileges, the grants displayed are those\nof the definer and not the invoker.\n\nIn MySQL 8.0 compared to previous series, SHOW GRANTS no longer\ndisplays ALL PRIVILEGES in its global-privileges output because the\nmeaning of ALL PRIVILEGES at the global level varies depending on which\ndynamic privileges are defined. Instead, SHOW GRANTS explicitly lists\neach granted global privilege:\n\nmysql> SHOW GRANTS FOR \'root\'@\'localhost\';\n+---------------------------------------------------------------------+\n| Grants for root@localhost                                           |\n+---------------------------------------------------------------------+\n| GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, RELOAD,         |\n| SHUTDOWN, PROCESS, FILE, REFERENCES, INDEX, ALTER, SHOW DATABASES,  |\n| SUPER, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE, REPLICATION   |\n| SLAVE, REPLICATION CLIENT, CREATE VIEW, SHOW VIEW, CREATE ROUTINE,  |\n| ALTER ROUTINE, CREATE USER, EVENT, TRIGGER, CREATE TABLESPACE,      |\n| CREATE ROLE, DROP ROLE ON *.* TO `root`@`localhost` WITH GRANT      |\n| OPTION                                                              |\n| GRANT PROXY ON \'\'@\'\' TO `root`@`localhost` WITH GRANT OPTION        |\n+---------------------------------------------------------------------+\n\nApplications that process SHOW GRANTS output should be adjusted\naccordingly.\n\nAt the global level, GRANT OPTION applies to all granted static global\nprivileges if granted for any of them, but applies individually to\ngranted dynamic privileges. SHOW GRANTS displays global privileges this\nway:\n\no One line listing all granted static privileges, if there are any,\n  including WITH GRANT OPTION if appropriate.\n\no One line listing all granted dynamic privileges for which GRANT\n  OPTION is granted, if there are any, including WITH GRANT OPTION.\n\no One line listing all granted dynamic privileges for which GRANT\n  OPTION is not granted, if there are any, without WITH GRANT OPTION.\n\nWith the optional USING clause, SHOW GRANTS enables you to examine the\nprivileges associated with roles for the user. Each role named in the\nUSING clause must be granted to the user.\n\nSuppose that user u1 is assigned roles r1 and r2, as follows:\n\nCREATE ROLE \'r1\', \'r2\';\nGRANT SELECT ON db1.* TO \'r1\';\nGRANT INSERT, UPDATE, DELETE ON db1.* TO \'r2\';\nCREATE USER \'u1\'@\'localhost\' IDENTIFIED BY \'u1pass\';\nGRANT \'r1\', \'r2\' TO \'u1\'@\'localhost\';\n\nSHOW GRANTS without USING shows the granted roles:\n\nmysql> SHOW GRANTS FOR \'u1\'@\'localhost\';\n+---------------------------------------------+\n| Grants for u1@localhost                     |\n+---------------------------------------------+\n| GRANT USAGE ON *.* TO `u1`@`localhost`      |\n| GRANT `r1`@`%`,`r2`@`%` TO `u1`@`localhost` |\n+---------------------------------------------+\n\nAdding a USING clause causes the statement to also display the\nprivileges associated with each role named in the clause:\n\nmysql> SHOW GRANTS FOR \'u1\'@\'localhost\' USING \'r1\';\n+---------------------------------------------+\n| Grants for u1@localhost                     |\n+---------------------------------------------+\n| GRANT USAGE ON *.* TO `u1`@`localhost`      |\n| GRANT SELECT ON `db1`.* TO `u1`@`localhost` |\n| GRANT `r1`@`%`,`r2`@`%` TO `u1`@`localhost` |\n+---------------------------------------------+\nmysql> SHOW GRANTS FOR \'u1\'@\'localhost\' USING \'r2\';\n+-------------------------------------------------------------+\n| Grants for u1@localhost                                     |\n+-------------------------------------------------------------+\n| GRANT USAGE ON *.* TO `u1`@`localhost`                      |\n| GRANT INSERT, UPDATE, DELETE ON `db1`.* TO `u1`@`localhost` |\n| GRANT `r1`@`%`,`r2`@`%` TO `u1`@`localhost`                 |\n+-------------------------------------------------------------+\nmysql> SHOW GRANTS FOR \'u1\'@\'localhost\' USING \'r1\', \'r2\';\n+---------------------------------------------------------------------+\n| Grants for u1@localhost                                             |\n+---------------------------------------------------------------------+\n| GRANT USAGE ON *.* TO `u1`@`localhost`                              |\n| GRANT SELECT, INSERT, UPDATE, DELETE ON `db1`.* TO `u1`@`localhost` |\n| GRANT `r1`@`%`,`r2`@`%` TO `u1`@`localhost`                         |\n+---------------------------------------------------------------------+\n\n*Note*:\n\nA privilege granted to an account is always in effect, but a role is\nnot. The active roles for an account can differ across and within\nsessions, depending on the value of the activate_all_roles_on_login\nsystem variable, the account default roles, and whether SET ROLE has\nbeen executed within a session.\n\nMySQL 8.0.16 and higher supports partial revokes of global privileges,\nsuch that a global privilege can be restricted from applying to\nparticular schemas (see\nhttps://dev.mysql.com/doc/refman/8.0/en/partial-revokes.html). To\nindicate which global schema privileges have been revoked for\nparticular schemas, SHOW GRANTS output includes REVOKE statements:\n\nmysql> SET PERSIST partial_revokes = ON;\nmysql> CREATE USER u1;\nmysql> GRANT SELECT, INSERT, DELETE ON *.* TO u1;\nmysql> REVOKE SELECT, INSERT ON mysql.* FROM u1;\nmysql> REVOKE DELETE ON world.* FROM u1;\nmysql> SHOW GRANTS FOR u1;\n+--------------------------------------------------+\n| Grants for u1@%                                  |\n+--------------------------------------------------+\n| GRANT SELECT, INSERT, DELETE ON *.* TO `u1`@`%`  |\n| REVOKE SELECT, INSERT ON `mysql`.* FROM `u1`@`%` |\n| REVOKE DELETE ON `world`.* FROM `u1`@`%`         |\n+--------------------------------------------------+\n\nSHOW GRANTS does not display privileges that are available to the named\naccount but are granted to a different account. For example, if an\nanonymous account exists, the named account might be able to use its\nprivileges, but SHOW GRANTS does not display them.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-grants.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-grants.html'),(669,'SHOW INDEX',3,'Syntax:\nSHOW [EXTENDED] {INDEX | INDEXES | KEYS}\n    {FROM | IN} tbl_name\n    [{FROM | IN} db_name]\n    [WHERE expr]\n\nSHOW INDEX returns table index information. The format resembles that\nof the SQLStatistics call in ODBC. This statement requires some\nprivilege for any column in the table.\n\nmysql> SHOW INDEX FROM City\\G\n*************************** 1. row ***************************\n        Table: city\n   Non_unique: 0\n     Key_name: PRIMARY\n Seq_in_index: 1\n  Column_name: ID\n    Collation: A\n  Cardinality: 4188\n     Sub_part: NULL\n       Packed: NULL\n         Null:\n   Index_type: BTREE\n      Comment:\nIndex_comment:\n      Visible: YES\n   Expression: NULL\n*************************** 2. row ***************************\n        Table: city\n   Non_unique: 1\n     Key_name: CountryCode\n Seq_in_index: 1\n  Column_name: CountryCode\n    Collation: A\n  Cardinality: 232\n     Sub_part: NULL\n       Packed: NULL\n         Null:\n   Index_type: BTREE\n      Comment:\nIndex_comment:\n      Visible: YES\n   Expression: NULL\n\nAn alternative to tbl_name FROM db_name syntax is db_name.tbl_name.\nThese two statements are equivalent:\n\nSHOW INDEX FROM mytable FROM mydb;\nSHOW INDEX FROM mydb.mytable;\n\nThe optional EXTENDED keyword causes the output to include information\nabout hidden indexes that MySQL uses internally and are not accessible\nby users.\n\nThe WHERE clause can be given to select rows using more general\nconditions, as discussed in\nhttps://dev.mysql.com/doc/refman/8.0/en/extended-show.html.\n\nSHOW INDEX returns the following fields:\n\no Table\n\n  The name of the table.\n\no Non_unique\n\n  0 if the index cannot contain duplicates, 1 if it can.\n\no Key_name\n\n  The name of the index. If the index is the primary key, the name is\n  always PRIMARY.\n\no Seq_in_index\n\n  The column sequence number in the index, starting with 1.\n\no Column_name\n\n  The column name. See also the description for the Expression column.\n\no Collation\n\n  How the column is sorted in the index. This can have values A\n  (ascending), D (descending), or NULL (not sorted).\n\no Cardinality\n\n  An estimate of the number of unique values in the index. To update\n  this number, run ANALYZE TABLE or (for MyISAM tables) myisamchk -a.\n\n  Cardinality is counted based on statistics stored as integers, so the\n  value is not necessarily exact even for small tables. The higher the\n  cardinality, the greater the chance that MySQL uses the index when\n  doing joins.\n\no Sub_part\n\n  The index prefix. That is, the number of indexed characters if the\n  column is only partly indexed, NULL if the entire column is indexed.\n\n  *Note*:\n\n  Prefix limits are measured in bytes. However, prefix lengths for\n  index specifications in CREATE TABLE, ALTER TABLE, and CREATE INDEX\n  statements are interpreted as number of characters for nonbinary\n  string types (CHAR, VARCHAR, TEXT) and number of bytes for binary\n  string types (BINARY, VARBINARY, BLOB). Take this into account when\n  specifying a prefix length for a nonbinary string column that uses a\n  multibyte character set.\n\n  For additional information about index prefixes, see\n  https://dev.mysql.com/doc/refman/8.0/en/column-indexes.html, and\n  [HELP CREATE INDEX].\n\no Packed\n\n  Indicates how the key is packed. NULL if it is not.\n\no Null\n\n  Contains YES if the column may contain NULL values and \'\' if not.\n\no Index_type\n\n  The index method used (BTREE, FULLTEXT, HASH, RTREE).\n\no Comment\n\n  Information about the index not described in its own column, such as\n  disabled if the index is disabled.\n\no Index_comment\n\n  Any comment provided for the index with a COMMENT attribute when the\n  index was created.\n\no Visible\n\n  Whether the index is visible to the optimizer. See\n  https://dev.mysql.com/doc/refman/8.0/en/invisible-indexes.html.\n\no Expression\n\n  MySQL 8.0.13 and higher supports functional key parts (see\n  https://dev.mysql.com/doc/refman/8.0/en/create-index.html#create-inde\n  x-functional-key-parts), which affects both the Column_name and\n  Expression columns:\n\n  o For a nonfunctional key part, Column_name indicates the column\n    indexed by the key part and Expression is NULL.\n\n  o For a functional key part, Column_name column is NULL and\n    Expression indicates the expression for the key part.\n\nInformation about table indexes is also available from the\nINFORMATION_SCHEMA STATISTICS table. See\nhttps://dev.mysql.com/doc/refman/8.0/en/information-schema-statistics-t\nable.html. The extended information about hidden indexes is available\nonly using SHOW EXTENDED INDEX; it cannot be obtained from the\nSTATISTICS table.\n\nYou can list a table\'s indexes with the mysqlshow -k db_name tbl_name\ncommand.\n\nIn MySQL 8.0.30 and later, SHOW INDEX includes the table\'s generated\ninvisible key, if it has one, by default. You can cause this\ninformation to be suppressed in the statement\'s output by setting\nshow_gipk_in_create_table_and_information_schema = OFF. For more\ninformation, see\nhttps://dev.mysql.com/doc/refman/8.0/en/create-table-gipks.html.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-index.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-index.html'),(670,'SHOW MASTER STATUS',3,'Syntax:\nSHOW MASTER STATUS\n\nThis statement provides status information about the binary log files\nof the source server. It requires the REPLICATION CLIENT privilege (or\nthe deprecated SUPER privilege).\n\nExample:\n\nmysql> SHOW MASTER STATUS\\G\n*************************** 1. row ***************************\n             File: source-bin.000002\n         Position: 1307\n     Binlog_Do_DB: test\n Binlog_Ignore_DB: manual, mysql\nExecuted_Gtid_Set: 3E11FA47-71CA-11E1-9E33-C80AA9429562:1-5\n1 row in set (0.00 sec)\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-master-status.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-master-status.html'),(671,'SHOW OPEN TABLES',3,'Syntax:\nSHOW OPEN TABLES\n    [{FROM | IN} db_name]\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW OPEN TABLES lists the non-TEMPORARY tables that are currently open\nin the table cache. See\nhttps://dev.mysql.com/doc/refman/8.0/en/table-cache.html. The FROM\nclause, if present, restricts the tables shown to those present in the\ndb_name database. The LIKE clause, if present, indicates which table\nnames to match. The WHERE clause can be given to select rows using more\ngeneral conditions, as discussed in\nhttps://dev.mysql.com/doc/refman/8.0/en/extended-show.html.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-open-tables.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-open-tables.html'),(672,'SHOW PLUGINS',3,'Syntax:\nSHOW PLUGINS\n\nSHOW PLUGINS displays information about server plugins.\n\nExample of SHOW PLUGINS output:\n\nmysql> SHOW PLUGINS\\G\n*************************** 1. row ***************************\n   Name: binlog\n Status: ACTIVE\n   Type: STORAGE ENGINE\nLibrary: NULL\nLicense: GPL\n*************************** 2. row ***************************\n   Name: CSV\n Status: ACTIVE\n   Type: STORAGE ENGINE\nLibrary: NULL\nLicense: GPL\n*************************** 3. row ***************************\n   Name: MEMORY\n Status: ACTIVE\n   Type: STORAGE ENGINE\nLibrary: NULL\nLicense: GPL\n*************************** 4. row ***************************\n   Name: MyISAM\n Status: ACTIVE\n   Type: STORAGE ENGINE\nLibrary: NULL\nLicense: GPL\n...\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-plugins.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-plugins.html'),(673,'SHOW PRIVILEGES',3,'Syntax:\nSHOW PRIVILEGES\n\nSHOW PRIVILEGES shows the list of system privileges that the MySQL\nserver supports. The privileges displayed include all static\nprivileges, and all currently registered dynamic privileges.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-privileges.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-privileges.html'),(674,'SHOW PROCEDURE CODE',3,'Syntax:\nSHOW PROCEDURE CODE proc_name\n\nThis statement is a MySQL extension that is available only for servers\nthat have been built with debugging support. It displays a\nrepresentation of the internal implementation of the named stored\nprocedure. A similar statement, SHOW FUNCTION CODE, displays\ninformation about stored functions (see [HELP SHOW FUNCTION CODE]).\n\nTo use either statement, you must be the user named as the routine\nDEFINER, have the SHOW_ROUTINE privilege, or have the SELECT privilege\nat the global level.\n\nIf the named routine is available, each statement produces a result\nset. Each row in the result set corresponds to one \"instruction\" in the\nroutine. The first column is Pos, which is an ordinal number beginning\nwith 0. The second column is Instruction, which contains an SQL\nstatement (usually changed from the original source), or a directive\nwhich has meaning only to the stored-routine handler.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-procedure-code.html\n\n','mysql> DELIMITER //\nmysql> CREATE PROCEDURE p1 ()\n       BEGIN\n         DECLARE fanta INT DEFAULT 55;\n         DROP TABLE t2;\n         LOOP\n           INSERT INTO t3 VALUES (fanta);\n           END LOOP;\n         END//\nQuery OK, 0 rows affected (0.01 sec)\n\nmysql> SHOW PROCEDURE CODE p1//\n+-----+----------------------------------------+\n| Pos | Instruction                            |\n+-----+----------------------------------------+\n|   0 | set fanta@0 55                         |\n|   1 | stmt 9 \"DROP TABLE t2\"                 |\n|   2 | stmt 5 \"INSERT INTO t3 VALUES (fanta)\" |\n|   3 | jump 2                                 |\n+-----+----------------------------------------+\n4 rows in set (0.00 sec)\n\nmysql> CREATE FUNCTION test.hello (s CHAR(20))\n       RETURNS CHAR(50) DETERMINISTIC\n       RETURN CONCAT(\'Hello, \',s,\'!\');\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> SHOW FUNCTION CODE test.hello;\n+-----+---------------------------------------+\n| Pos | Instruction                           |\n+-----+---------------------------------------+\n|   0 | freturn 254 concat(\'Hello, \',s@0,\'!\') |\n+-----+---------------------------------------+\n1 row in set (0.00 sec)\n','https://dev.mysql.com/doc/refman/8.0/en/show-procedure-code.html'),(675,'SHOW PROCEDURE STATUS',3,'Syntax:\nSHOW PROCEDURE STATUS\n    [LIKE \'pattern\' | WHERE expr]\n\nThis statement is a MySQL extension. It returns characteristics of a\nstored procedure, such as the database, name, type, creator, creation\nand modification dates, and character set information. A similar\nstatement, SHOW FUNCTION STATUS, displays information about stored\nfunctions (see [HELP SHOW FUNCTION STATUS]).\n\nTo use either statement, you must be the user named as the routine\nDEFINER, have the SHOW_ROUTINE privilege, have the SELECT privilege at\nthe global level, or have the CREATE ROUTINE, ALTER ROUTINE, or EXECUTE\nprivilege granted at a scope that includes the routine.\n\nThe LIKE clause, if present, indicates which procedure or function\nnames to match. The WHERE clause can be given to select rows using more\ngeneral conditions, as discussed in\nhttps://dev.mysql.com/doc/refman/8.0/en/extended-show.html.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-procedure-status.html\n\n','mysql> SHOW PROCEDURE STATUS LIKE \'sp1\'\\G\n*************************** 1. row ***************************\n                  Db: test\n                Name: sp1\n                Type: PROCEDURE\n             Definer: testuser@localhost\n            Modified: 2018-08-08 13:54:11\n             Created: 2018-08-08 13:54:11\n       Security_type: DEFINER\n             Comment:\ncharacter_set_client: utf8mb4\ncollation_connection: utf8mb4_0900_ai_ci\n  Database Collation: utf8mb4_0900_ai_ci\n\nmysql> SHOW FUNCTION STATUS LIKE \'hello\'\\G\n*************************** 1. row ***************************\n                  Db: test\n                Name: hello\n                Type: FUNCTION\n             Definer: testuser@localhost\n            Modified: 2020-03-10 11:10:03\n             Created: 2020-03-10 11:10:03\n       Security_type: DEFINER\n             Comment:\ncharacter_set_client: utf8mb4\ncollation_connection: utf8mb4_0900_ai_ci\n  Database Collation: utf8mb4_0900_ai_ci\n','https://dev.mysql.com/doc/refman/8.0/en/show-procedure-status.html'),(676,'SHOW PROCESSLIST',3,'Syntax:\nSHOW [FULL] PROCESSLIST\n\n*Important*:\n\nThe INFORMATION SCHEMA implementation of SHOW PROCESSLIST is deprecated\nand subject to removal in a future MySQL release. It is recommended to\nuse the Performance Schema implementation of SHOW PROCESSLIST instead.\n\nThe MySQL process list indicates the operations currently being\nperformed by the set of threads executing within the server. The SHOW\nPROCESSLIST statement is one source of process information. For a\ncomparison of this statement with other sources, see\nhttps://dev.mysql.com/doc/refman/8.0/en/processlist-access.html#process\nlist-sources.\n\n*Note*:\n\nAs of MySQL 8.0.22, an alternative implementation for SHOW PROCESSLIST\nis available based on the Performance Schema processlist table, which,\nunlike the default SHOW PROCESSLIST implementation, does not require a\nmutex and has better performance characteristics. For details, see\nhttps://dev.mysql.com/doc/refman/8.0/en/performance-schema-processlist-\ntable.html.\n\nIf you have the PROCESS privilege, you can see all threads, even those\nbelonging to other users. Otherwise (without the PROCESS privilege),\nnonanonymous users have access to information about their own threads\nbut not threads for other users, and anonymous users have no access to\nthread information.\n\nWithout the FULL keyword, SHOW PROCESSLIST displays only the first 100\ncharacters of each statement in the Info field.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-processlist.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-processlist.html'),(677,'SHOW PROFILE',3,'Syntax:\nSHOW PROFILE [type [, type] ... ]\n    [FOR QUERY n]\n    [LIMIT row_count [OFFSET offset]]\n\ntype: {\n    ALL\n  | BLOCK IO\n  | CONTEXT SWITCHES\n  | CPU\n  | IPC\n  | MEMORY\n  | PAGE FAULTS\n  | SOURCE\n  | SWAPS\n}\n\nThe SHOW PROFILE and SHOW PROFILES statements display profiling\ninformation that indicates resource usage for statements executed\nduring the course of the current session.\n\n*Note*:\n\nThe SHOW PROFILE and SHOW PROFILES statements are deprecated; expect\nthem to be removed in a future MySQL release. Use the Performance\nSchema instead; see\nhttps://dev.mysql.com/doc/refman/8.0/en/performance-schema-query-profil\ning.html.\n\nTo control profiling, use the profiling session variable, which has a\ndefault value of 0 (OFF). Enable profiling by setting profiling to 1 or\nON:\n\nmysql> SET profiling = 1;\n\nSHOW PROFILES displays a list of the most recent statements sent to the\nserver. The size of the list is controlled by the\nprofiling_history_size session variable, which has a default value of\n15. The maximum value is 100. Setting the value to 0 has the practical\neffect of disabling profiling.\n\nAll statements are profiled except SHOW PROFILE and SHOW PROFILES, so\nneither of those statements appears in the profile list. Malformed\nstatements are profiled. For example, SHOW PROFILING is an illegal\nstatement, and a syntax error occurs if you try to execute it, but it\nshows up in the profiling list.\n\nSHOW PROFILE displays detailed information about a single statement.\nWithout the FOR QUERY n clause, the output pertains to the most\nrecently executed statement. If FOR QUERY n is included, SHOW PROFILE\ndisplays information for statement n. The values of n correspond to the\nQuery_ID values displayed by SHOW PROFILES.\n\nThe LIMIT row_count clause may be given to limit the output to\nrow_count rows. If LIMIT is given, OFFSET offset may be added to begin\nthe output offset rows into the full set of rows.\n\nBy default, SHOW PROFILE displays Status and Duration columns. The\nStatus values are like the State values displayed by SHOW PROCESSLIST,\nalthough there might be some minor differences in interpretation for\nthe two statements for some status values (see\nhttps://dev.mysql.com/doc/refman/8.0/en/thread-information.html).\n\nOptional type values may be specified to display specific additional\ntypes of information:\n\no ALL displays all information\n\no BLOCK IO displays counts for block input and output operations\n\no CONTEXT SWITCHES displays counts for voluntary and involuntary\n  context switches\n\no CPU displays user and system CPU usage times\n\no IPC displays counts for messages sent and received\n\no MEMORY is not currently implemented\n\no PAGE FAULTS displays counts for major and minor page faults\n\no SOURCE displays the names of functions from the source code, together\n  with the name and line number of the file in which the function\n  occurs\n\no SWAPS displays swap counts\n\nProfiling is enabled per session. When a session ends, its profiling\ninformation is lost.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-profile.html\n\n','mysql> SELECT @@profiling;\n+-------------+\n| @@profiling |\n+-------------+\n|           0 |\n+-------------+\n1 row in set (0.00 sec)\n\nmysql> SET profiling = 1;\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> DROP TABLE IF EXISTS t1;\nQuery OK, 0 rows affected, 1 warning (0.00 sec)\n\nmysql> CREATE TABLE T1 (id INT);\nQuery OK, 0 rows affected (0.01 sec)\n\nmysql> SHOW PROFILES;\n+----------+----------+--------------------------+\n| Query_ID | Duration | Query                    |\n+----------+----------+--------------------------+\n|        0 | 0.000088 | SET PROFILING = 1        |\n|        1 | 0.000136 | DROP TABLE IF EXISTS t1  |\n|        2 | 0.011947 | CREATE TABLE t1 (id INT) |\n+----------+----------+--------------------------+\n3 rows in set (0.00 sec)\n\nmysql> SHOW PROFILE;\n+----------------------+----------+\n| Status               | Duration |\n+----------------------+----------+\n| checking permissions | 0.000040 |\n| creating table       | 0.000056 |\n| After create         | 0.011363 |\n| query end            | 0.000375 |\n| freeing items        | 0.000089 |\n| logging slow query   | 0.000019 |\n| cleaning up          | 0.000005 |\n+----------------------+----------+\n7 rows in set (0.00 sec)\n\nmysql> SHOW PROFILE FOR QUERY 1;\n+--------------------+----------+\n| Status             | Duration |\n+--------------------+----------+\n| query end          | 0.000107 |\n| freeing items      | 0.000008 |\n| logging slow query | 0.000015 |\n| cleaning up        | 0.000006 |\n+--------------------+----------+\n4 rows in set (0.00 sec)\n\nmysql> SHOW PROFILE CPU FOR QUERY 2;\n+----------------------+----------+----------+------------+\n| Status               | Duration | CPU_user | CPU_system |\n+----------------------+----------+----------+------------+\n| checking permissions | 0.000040 | 0.000038 |   0.000002 |\n| creating table       | 0.000056 | 0.000028 |   0.000028 |\n| After create         | 0.011363 | 0.000217 |   0.001571 |\n| query end            | 0.000375 | 0.000013 |   0.000028 |\n| freeing items        | 0.000089 | 0.000010 |   0.000014 |\n| logging slow query   | 0.000019 | 0.000009 |   0.000010 |\n| cleaning up          | 0.000005 | 0.000003 |   0.000002 |\n+----------------------+----------+----------+------------+\n7 rows in set (0.00 sec)\n','https://dev.mysql.com/doc/refman/8.0/en/show-profile.html'),(678,'SHOW PROFILES',3,'Syntax:\nSHOW PROFILES\n\nThe SHOW PROFILES statement, together with SHOW PROFILE, displays\nprofiling information that indicates resource usage for statements\nexecuted during the course of the current session. For more\ninformation, see [HELP SHOW PROFILE].\n\n*Note*:\n\nThe SHOW PROFILE and SHOW PROFILES statements are deprecated; expect it\nto be removed in a future MySQL release. Use the Performance Schema\ninstead; see\nhttps://dev.mysql.com/doc/refman/8.0/en/performance-schema-query-profil\ning.html.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-profiles.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-profiles.html'),(679,'SHOW RELAYLOG EVENTS',3,'Syntax:\nSHOW RELAYLOG EVENTS\n    [IN \'log_name\']\n    [FROM pos]\n    [LIMIT [offset,] row_count]\n    [channel_option]\n\nchannel_option:\n    FOR CHANNEL channel\n\nShows the events in the relay log of a replica. If you do not specify\n\'log_name\', the first relay log is displayed. This statement has no\neffect on the source. SHOW RELAYLOG EVENTS requires the REPLICATION\nSLAVE privilege.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-relaylog-events.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-relaylog-events.html'),(680,'SHOW REPLICAS',3,'Syntax:\n{SHOW REPLICAS}\n\nDisplays a list of replicas currently registered with the source. From\nMySQL 8.0.22, use SHOW REPLICAS in place of SHOW SLAVE HOSTS, which is\ndeprecated from that release. In releases before MySQL 8.0.22, use SHOW\nSLAVE HOSTS. SHOW REPLICAS requires the REPLICATION SLAVE privilege.\n\nSHOW REPLICAS should be executed on a server that acts as a replication\nsource. The statement displays information about servers that are or\nhave been connected as replicas, with each row of the result\ncorresponding to one replica server, as shown here:\n\nmysql> SHOW REPLICAS;\n+------------+-----------+------+-----------+--------------------------------------+\n| Server_id  | Host      | Port | Source_id | Replica_UUID                         |\n+------------+-----------+------+-----------+--------------------------------------+\n|         10 | iconnect2 | 3306 |         3 | 14cb6624-7f93-11e0-b2c0-c80aa9429562 |\n|         21 | athena    | 3306 |         3 | 07af4990-f41f-11df-a566-7ac56fdaf645 |\n+------------+-----------+------+-----------+--------------------------------------+\n\no Server_id: The unique server ID of the replica server, as configured\n  in the replica server\'s option file, or on the command line with\n  --server-id=value.\n\no Host: The host name of the replica server, as specified on the\n  replica with the --report-host option. This can differ from the\n  machine name as configured in the operating system.\n\no User: The replica server user name, as specified on the replica with\n  the --report-user option. Statement output includes this column only\n  if the source server is started with the --show-replica-auth-info or\n  --show-slave-auth-info option.\n\no Password: The replica server password, as specified on the replica\n  with the --report-password option. Statement output includes this\n  column only if the source server is started with the\n  --show-replica-auth-info or --show-slave-auth-info option.\n\no Port: The port on the source to which the replica server is\n  listening, as specified on the replica with the --report-port option.\n\n  A zero in this column means that the replica port (--report-port) was\n  not set.\n\no Source_id: The unique server ID of the source server that the replica\n  server is replicating from. This is the server ID of the server on\n  which SHOW REPLICAS is executed, so this same value is listed for\n  each row in the result.\n\no Replica_UUID: The globally unique ID of this replica, as generated on\n  the replica and found in the replica\'s auto.cnf file.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-replicas.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-replicas.html'),(681,'SHOW SLAVE HOSTS',3,'Syntax:\n{SHOW SLAVE HOSTS | SHOW REPLICAS}\n\nDisplays a list of replicas currently registered with the source. From\nMySQL 8.0.22, SHOW SLAVE HOSTS is deprecated and the alias SHOW\nREPLICAS should be used instead. The statement works in the same way as\nbefore, only the terminology used for the statement and its output has\nchanged. Both versions of the statement update the same status\nvariables when used. Please see the documentation for SHOW REPLICAS for\na description of the statement.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-slave-hosts.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-slave-hosts.html'),(682,'SHOW REPLICA STATUS',3,'Syntax:\nSHOW {REPLICA | SLAVE} STATUS [FOR CHANNEL channel]\n\nThis statement provides status information on essential parameters of\nthe replica threads. From MySQL 8.0.22, use SHOW REPLICA STATUS in\nplace of SHOW SLAVE STATUS, which is deprecated from that release. In\nreleases before MySQL 8.0.22, use SHOW SLAVE STATUS. The statement\nrequires the REPLICATION CLIENT privilege (or the deprecated SUPER\nprivilege).\n\nSHOW REPLICA STATUS is nonblocking. When run concurrently with STOP\nREPLICA, SHOW REPLICA STATUS returns without waiting for STOP REPLICA\nto finish shutting down the replication SQL (applier) thread or\nreplication I/O (receiver) thread (or both). This permits use in\nmonitoring and other applications where getting an immediate response\nfrom SHOW REPLICA STATUS is more important than ensuring that it\nreturned the latest data. The SLAVE keyword was replaced with REPLICA\nin MySQL 8.0.22.\n\nIf you issue this statement using the mysql client, you can use a \\G\nstatement terminator rather than a semicolon to obtain a more readable\nvertical layout:\n\nmysql> SHOW REPLICA STATUS\\G\n*************************** 1. row ***************************\n             Replica_IO_State: Waiting for source to send event\n                  Source_Host: 127.0.0.1\n                  Source_User: root\n                  Source_Port: 13000\n                Connect_Retry: 1\n              Source_Log_File: master-bin.000001\n          Read_Source_Log_Pos: 927\n               Relay_Log_File: slave-relay-bin.000002\n                Relay_Log_Pos: 1145\n        Relay_Source_Log_File: master-bin.000001\n           Replica_IO_Running: Yes\n          Replica_SQL_Running: Yes\n              Replicate_Do_DB:\n          Replicate_Ignore_DB:\n           Replicate_Do_Table:\n       Replicate_Ignore_Table:\n      Replicate_Wild_Do_Table:\n  Replicate_Wild_Ignore_Table:\n                   Last_Errno: 0\n                   Last_Error:\n                 Skip_Counter: 0\n          Exec_Source_Log_Pos: 927\n              Relay_Log_Space: 1355\n              Until_Condition: None\n               Until_Log_File:\n                Until_Log_Pos: 0\n           Source_SSL_Allowed: No\n           Source_SSL_CA_File:\n           Source_SSL_CA_Path:\n              Source_SSL_Cert:\n            Source_SSL_Cipher:\n               Source_SSL_Key:\n        Seconds_Behind_Source: 0\nSource_SSL_Verify_Server_Cert: No\n                Last_IO_Errno: 0\n                Last_IO_Error:\n               Last_SQL_Errno: 0\n               Last_SQL_Error:\n  Replicate_Ignore_Server_Ids:\n             Source_Server_Id: 1\n                  Source_UUID: 73f86016-978b-11ee-ade5-8d2a2a562feb\n             Source_Info_File: mysql.slave_master_info\n                    SQL_Delay: 0\n          SQL_Remaining_Delay: NULL\n    Replica_SQL_Running_State: Replica has read all relay log; waiting for more updates\n           Source_Retry_Count: 10\n                  Source_Bind:\n      Last_IO_Error_Timestamp:\n     Last_SQL_Error_Timestamp:\n               Source_SSL_Crl:\n           Source_SSL_Crlpath:\n           Retrieved_Gtid_Set: 73f86016-978b-11ee-ade5-8d2a2a562feb:1-3\n            Executed_Gtid_Set: 73f86016-978b-11ee-ade5-8d2a2a562feb:1-3\n                Auto_Position: 1\n         Replicate_Rewrite_DB:\n                 Channel_Name:\n           Source_TLS_Version:\n       Source_public_key_path:\n        Get_Source_public_key: 0\n            Network_Namespace:\n\nThe Performance Schema provides tables that expose replication\ninformation. This is similar to the information available from the SHOW\nREPLICA STATUS statement, but represented in table form. For details,\nsee\nhttps://dev.mysql.com/doc/refman/8.0/en/performance-schema-replication-\ntables.html.\n\nFrom MySQL 8.0.27, you can set the GTID_ONLY option on the CHANGE\nREPLICATION SOURCE TO statement to stop a replication channel from\npersisting file names and file positions in the replication metadata\nrepositories. With this setting, file positions for the source binary\nlog file and the relay log file are tracked in memory. The SHOW REPLICA\nSTATUS statement still displays file positions in normal use. However,\nbecause the file positions are not being regularly updated in the\nconnection metadata repository and the applier metadata repository\nexcept in a few situations, they are likely to be out of date if the\nserver is restarted.\n\nFor a replication channel with the GTID_ONLY setting after a server\nstart, the read and applied file positions for the source binary log\nfile (Read_Source_Log_Pos and Exec_Source_Log_Pos) are set to zero, and\nthe file names (Source_Log_File and Relay_Source_Log_File) are set to\nINVALID. The relay log file name (Relay_Log_File) is set according to\nthe relay_log_recovery setting, either a new file that was created at\nserver start or the first relay log file present. The file position\n(Relay_Log_Pos) is set to position 4, and GTID auto-skip is used to\nskip any transactions in the file that were already applied.\n\nWhen the receiver thread contacts the source and gets valid position\ninformation, the read position (Read_Source_Log_Pos) and file name\n(Source_Log_File) are updated with the correct data and become valid.\nWhen the applier thread applies a transaction from the source, or skips\nan already executed transaction, the executed position\n(Exec_Source_Log_Pos) and file name (Relay_Source_Log_File) are updated\nwith the correct data and become valid. The relay log file position\n(Relay_Log_Pos) is also updated at that time.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-replica-status.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-replica-status.html'),(683,'SHOW SLAVE STATUS',3,'Syntax:\nSHOW {SLAVE | REPLICA} STATUS [FOR CHANNEL channel]\n\nThis statement provides status information on essential parameters of\nthe replica threads. From MySQL 8.0.22, SHOW SLAVE STATUS is deprecated\nand the alias SHOW REPLICA STATUS should be used instead. The statement\nworks in the same way as before, only the terminology used for the\nstatement and its output has changed. Both versions of the statement\nupdate the same status variables when used. Please see the\ndocumentation for SHOW REPLICA STATUS for a description of the\nstatement.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-slave-status.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-slave-status.html'),(684,'SHOW STATUS',3,'Syntax:\nSHOW [GLOBAL | SESSION] STATUS\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW STATUS provides server status information (see\nhttps://dev.mysql.com/doc/refman/8.0/en/server-status-variables.html).\nThis statement does not require any privilege. It requires only the\nability to connect to the server.\n\nStatus variable information is also available from these sources:\n\no Performance Schema tables. See\n  https://dev.mysql.com/doc/refman/8.0/en/performance-schema-status-var\n  iable-tables.html.\n\no The mysqladmin extended-status command. See\n  https://dev.mysql.com/doc/refman/8.0/en/mysqladmin.html.\n\nFor SHOW STATUS, a LIKE clause, if present, indicates which variable\nnames to match. A WHERE clause can be given to select rows using more\ngeneral conditions, as discussed in\nhttps://dev.mysql.com/doc/refman/8.0/en/extended-show.html.\n\nSHOW STATUS accepts an optional GLOBAL or SESSION variable scope\nmodifier:\n\no With a GLOBAL modifier, the statement displays the global status\n  values. A global status variable may represent status for some aspect\n  of the server itself (for example, Aborted_connects), or the\n  aggregated status over all connections to MySQL (for example,\n  Bytes_received and Bytes_sent). If a variable has no global value,\n  the session value is displayed.\n\no With a SESSION modifier, the statement displays the status variable\n  values for the current connection. If a variable has no session\n  value, the global value is displayed. LOCAL is a synonym for SESSION.\n\no If no modifier is present, the default is SESSION.\n\nThe scope for each status variable is listed at\nhttps://dev.mysql.com/doc/refman/8.0/en/server-status-variables.html.\n\nEach invocation of the SHOW STATUS statement uses an internal temporary\ntable and increments the global Created_tmp_tables value.\n\nWith a LIKE clause, the statement displays only rows for those\nvariables with names that match the pattern:\n\nmysql> SHOW STATUS LIKE \'Key%\';\n+--------------------+----------+\n| Variable_name      | Value    |\n+--------------------+----------+\n| Key_blocks_used    | 14955    |\n| Key_read_requests  | 96854827 |\n| Key_reads          | 162040   |\n| Key_write_requests | 7589728  |\n| Key_writes         | 3813196  |\n+--------------------+----------+\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-status.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-status.html'),(685,'SHOW TABLE STATUS',3,'Syntax:\nSHOW TABLE STATUS\n    [{FROM | IN} db_name]\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW TABLE STATUS works likes SHOW TABLES, but provides a lot of\ninformation about each non-TEMPORARY table. You can also get this list\nusing the mysqlshow --status db_name command. The LIKE clause, if\npresent, indicates which table names to match. The WHERE clause can be\ngiven to select rows using more general conditions, as discussed in\nhttps://dev.mysql.com/doc/refman/8.0/en/extended-show.html.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-table-status.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-table-status.html'),(686,'SHOW TABLES',3,'Syntax:\nSHOW [EXTENDED] [FULL] TABLES\n    [{FROM | IN} db_name]\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW TABLES lists the non-TEMPORARY tables in a given database. You can\nalso get this list using the mysqlshow db_name command. The LIKE\nclause, if present, indicates which table names to match. The WHERE\nclause can be given to select rows using more general conditions, as\ndiscussed in\nhttps://dev.mysql.com/doc/refman/8.0/en/extended-show.html.\n\nMatching performed by the LIKE clause is dependent on the setting of\nthe lower_case_table_names system variable.\n\nThe optional EXTENDED modifier causes SHOW TABLES to list hidden tables\ncreated by failed ALTER TABLE statements. These temporary tables have\nnames beginning with #sql and can be dropped using DROP TABLE.\n\nThis statement also lists any views in the database. The optional FULL\nmodifier causes SHOW TABLES to display a second output column with\nvalues of BASE TABLE for a table, VIEW for a view, or SYSTEM VIEW for\nan INFORMATION_SCHEMA table.\n\nIf you have no privileges for a base table or view, it does not show up\nin the output from SHOW TABLES or mysqlshow db_name.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-tables.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-tables.html'),(687,'SHOW TRIGGERS',3,'Syntax:\nSHOW TRIGGERS\n    [{FROM | IN} db_name]\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW TRIGGERS lists the triggers currently defined for tables in a\ndatabase (the default database unless a FROM clause is given). This\nstatement returns results only for databases and tables for which you\nhave the TRIGGER privilege. The LIKE clause, if present, indicates\nwhich table names (not trigger names) to match and causes the statement\nto display triggers for those tables. The WHERE clause can be given to\nselect rows using more general conditions, as discussed in\nhttps://dev.mysql.com/doc/refman/8.0/en/extended-show.html.\n\nFor the ins_sum trigger defined in\nhttps://dev.mysql.com/doc/refman/8.0/en/triggers.html, the output of\nSHOW TRIGGERS is as shown here:\n\nmysql> SHOW TRIGGERS LIKE \'acc%\'\\G\n*************************** 1. row ***************************\n             Trigger: ins_sum\n               Event: INSERT\n               Table: account\n           Statement: SET @sum = @sum + NEW.amount\n              Timing: BEFORE\n             Created: 2018-08-08 10:10:12.61\n            sql_mode: ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,\n                      NO_ZERO_IN_DATE,NO_ZERO_DATE,\n                      ERROR_FOR_DIVISION_BY_ZERO,\n                      NO_ENGINE_SUBSTITUTION\n             Definer: me@localhost\ncharacter_set_client: utf8mb4\ncollation_connection: utf8mb4_0900_ai_ci\n  Database Collation: utf8mb4_0900_ai_ci\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-triggers.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-triggers.html'),(688,'SHOW VARIABLES',3,'Syntax:\nSHOW [GLOBAL | SESSION] VARIABLES\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW VARIABLES shows the values of MySQL system variables (see\nhttps://dev.mysql.com/doc/refman/8.0/en/server-system-variables.html).\nThis statement does not require any privilege. It requires only the\nability to connect to the server.\n\nSystem variable information is also available from these sources:\n\no Performance Schema tables. See\n  https://dev.mysql.com/doc/refman/8.0/en/performance-schema-system-var\n  iable-tables.html.\n\no The mysqladmin variables command. See\n  https://dev.mysql.com/doc/refman/8.0/en/mysqladmin.html.\n\nFor SHOW VARIABLES, a LIKE clause, if present, indicates which variable\nnames to match. A WHERE clause can be given to select rows using more\ngeneral conditions, as discussed in\nhttps://dev.mysql.com/doc/refman/8.0/en/extended-show.html.\n\nSHOW VARIABLES accepts an optional GLOBAL or SESSION variable scope\nmodifier:\n\no With a GLOBAL modifier, the statement displays global system variable\n  values. These are the values used to initialize the corresponding\n  session variables for new connections to MySQL. If a variable has no\n  global value, no value is displayed.\n\no With a SESSION modifier, the statement displays the system variable\n  values that are in effect for the current connection. If a variable\n  has no session value, the global value is displayed. LOCAL is a\n  synonym for SESSION.\n\no If no modifier is present, the default is SESSION.\n\nThe scope for each system variable is listed at\nhttps://dev.mysql.com/doc/refman/8.0/en/server-system-variables.html.\n\nSHOW VARIABLES is subject to a version-dependent display-width limit.\nFor variables with very long values that are not completely displayed,\nuse SELECT as a workaround. For example:\n\nSELECT @@GLOBAL.innodb_data_file_path;\n\nMost system variables can be set at server startup (read-only variables\nsuch as version_comment are exceptions). Many can be changed at runtime\nwith the SET statement. See\nhttps://dev.mysql.com/doc/refman/8.0/en/using-system-variables.html,\nand [HELP SET].\n\nWith a LIKE clause, the statement displays only rows for those\nvariables with names that match the pattern. To obtain the row for a\nspecific variable, use a LIKE clause as shown:\n\nSHOW VARIABLES LIKE \'max_join_size\';\nSHOW SESSION VARIABLES LIKE \'max_join_size\';\n\nTo get a list of variables whose name match a pattern, use the %\nwildcard character in a LIKE clause:\n\nSHOW VARIABLES LIKE \'%size%\';\nSHOW GLOBAL VARIABLES LIKE \'%size%\';\n\nWildcard characters can be used in any position within the pattern to\nbe matched. Strictly speaking, because _ is a wildcard that matches any\nsingle character, you should escape it as \\_ to match it literally. In\npractice, this is rarely necessary.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-variables.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-variables.html'),(689,'SHOW WARNINGS',3,'Syntax:\nSHOW WARNINGS [LIMIT [offset,] row_count]\nSHOW COUNT(*) WARNINGS\n\nSHOW WARNINGS is a diagnostic statement that displays information about\nthe conditions (errors, warnings, and notes) resulting from executing a\nstatement in the current session. Warnings are generated for DML\nstatements such as INSERT, UPDATE, and LOAD DATA as well as DDL\nstatements such as CREATE TABLE and ALTER TABLE.\n\nThe LIMIT clause has the same syntax as for the SELECT statement. See\nhttps://dev.mysql.com/doc/refman/8.0/en/select.html.\n\nSHOW WARNINGS is also used following EXPLAIN, to display the extended\ninformation generated by EXPLAIN. See\nhttps://dev.mysql.com/doc/refman/8.0/en/explain-extended.html.\n\nSHOW WARNINGS displays information about the conditions resulting from\nexecution of the most recent nondiagnostic statement in the current\nsession. If the most recent statement resulted in an error during\nparsing, SHOW WARNINGS shows the resulting conditions, regardless of\nstatement type (diagnostic or nondiagnostic).\n\nThe SHOW COUNT(*) WARNINGS diagnostic statement displays the total\nnumber of errors, warnings, and notes. You can also retrieve this\nnumber from the warning_count system variable:\n\nSHOW COUNT(*) WARNINGS;\nSELECT @@warning_count;\n\nA difference in these statements is that the first is a diagnostic\nstatement that does not clear the message list. The second, because it\nis a SELECT statement is considered nondiagnostic and does clear the\nmessage list.\n\nA related diagnostic statement, SHOW ERRORS, shows only error\nconditions (it excludes warnings and notes), and SHOW COUNT(*) ERRORS\nstatement displays the total number of errors. See [HELP SHOW ERRORS].\nGET DIAGNOSTICS can be used to examine information for individual\nconditions. See [HELP GET DIAGNOSTICS].\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-warnings.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-warnings.html'),(690,'BINLOG',3,'Syntax:\nBINLOG \'str\'\n\nBINLOG is an internal-use statement. It is generated by the mysqlbinlog\nprogram as the printable representation of certain events in binary log\nfiles. (See https://dev.mysql.com/doc/refman/8.0/en/mysqlbinlog.html.)\nThe \'str\' value is a base 64-encoded string the that server decodes to\ndetermine the data change indicated by the corresponding event.\n\nTo execute BINLOG statements when applying mysqlbinlog output, a user\naccount requires the BINLOG_ADMIN privilege (or the deprecated SUPER\nprivilege), or the REPLICATION_APPLIER privilege plus the appropriate\nprivileges to execute each log event.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/binlog.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/binlog.html'),(691,'CACHE INDEX',3,'Syntax:\nCACHE INDEX {\n      tbl_index_list [, tbl_index_list] ...\n    | tbl_name PARTITION (partition_list)\n  }\n  IN key_cache_name\n\ntbl_index_list:\n  tbl_name [{INDEX|KEY} (index_name[, index_name] ...)]\n\npartition_list: {\n    partition_name[, partition_name] ...\n  | ALL\n}\n\nThe CACHE INDEX statement assigns table indexes to a specific key\ncache. It applies only to MyISAM tables, including partitioned MyISAM\ntables. After the indexes have been assigned, they can be preloaded\ninto the cache if desired with LOAD INDEX INTO CACHE.\n\nThe following statement assigns indexes from the tables t1, t2, and t3\nto the key cache named hot_cache:\n\nmysql> CACHE INDEX t1, t2, t3 IN hot_cache;\n+---------+--------------------+----------+----------+\n| Table   | Op                 | Msg_type | Msg_text |\n+---------+--------------------+----------+----------+\n| test.t1 | assign_to_keycache | status   | OK       |\n| test.t2 | assign_to_keycache | status   | OK       |\n| test.t3 | assign_to_keycache | status   | OK       |\n+---------+--------------------+----------+----------+\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/cache-index.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/cache-index.html'),(692,'FLUSH',3,'Syntax:\nFLUSH [NO_WRITE_TO_BINLOG | LOCAL] {\n    flush_option [, flush_option] ...\n  | tables_option\n}\n\nflush_option: {\n    BINARY LOGS\n  | ENGINE LOGS\n  | ERROR LOGS\n  | GENERAL LOGS\n  | HOSTS\n  | LOGS\n  | PRIVILEGES\n  | OPTIMIZER_COSTS\n  | RELAY LOGS [FOR CHANNEL channel]\n  | SLOW LOGS\n  | STATUS\n  | USER_RESOURCES\n}\n\ntables_option: {\n    table_synonym\n  | table_synonym tbl_name [, tbl_name] ...\n  | table_synonym WITH READ LOCK\n  | table_synonym tbl_name [, tbl_name] ... WITH READ LOCK\n  | table_synonym tbl_name [, tbl_name] ... FOR EXPORT\n}\n\ntable_synonym: {\n    TABLE\n  | TABLES\n}\n\nThe FLUSH statement has several variant forms that clear or reload\nvarious internal caches, flush tables, or acquire locks. Each FLUSH\noperation requires the privileges indicated in its description.\n\n*Note*:\n\nIt is not possible to issue FLUSH statements within stored functions or\ntriggers. However, you may use FLUSH in stored procedures, so long as\nthese are not called from stored functions or triggers. See\nhttps://dev.mysql.com/doc/refman/8.0/en/stored-program-restrictions.html\n.\n\nBy default, the server writes FLUSH statements to the binary log so\nthat they replicate to replicas. To suppress logging, specify the\noptional NO_WRITE_TO_BINLOG keyword or its alias LOCAL.\n\n*Note*:\n\nFLUSH LOGS, FLUSH BINARY LOGS, FLUSH TABLES WITH READ LOCK (with or\nwithout a table list), and FLUSH TABLES tbl_name ... FOR EXPORT are not\nwritten to the binary log in any case because they would cause problems\nif replicated to a replica.\n\nThe FLUSH statement causes an implicit commit. See\nhttps://dev.mysql.com/doc/refman/8.0/en/implicit-commit.html.\n\nThe mysqladmin utility provides a command-line interface to some flush\noperations, using commands such as flush-hosts, flush-logs,\nflush-privileges, flush-status, and flush-tables. See\nhttps://dev.mysql.com/doc/refman/8.0/en/mysqladmin.html.\n\nSending a SIGHUP or SIGUSR1 signal to the server causes several flush\noperations to occur that are similar to various forms of the FLUSH\nstatement. Signals can be sent by the root system account or the system\naccount that owns the server process. This enables the flush operations\nto be performed without having to connect to the server, which requires\na MySQL account that has privileges sufficient for those operations.\nSee https://dev.mysql.com/doc/refman/8.0/en/unix-signal-response.html.\n\nThe RESET statement is similar to FLUSH. See [HELP RESET], for\ninformation about using RESET with replication.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/flush.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/flush.html'),(693,'KILL',3,'Syntax:\nKILL [CONNECTION | QUERY] processlist_id\n\nEach connection to mysqld runs in a separate thread. You can kill a\nthread with the KILL processlist_id statement.\n\nThread processlist identifiers can be determined from the ID column of\nthe INFORMATION_SCHEMA PROCESSLIST table, the Id column of SHOW\nPROCESSLIST output, and the PROCESSLIST_ID column of the Performance\nSchema threads table. The value for the current thread is returned by\nthe CONNECTION_ID() function.\n\nKILL permits an optional CONNECTION or QUERY modifier:\n\no KILL CONNECTION is the same as KILL with no modifier: It terminates\n  the connection associated with the given processlist_id, after\n  terminating any statement the connection is executing.\n\no KILL QUERY terminates the statement the connection is currently\n  executing, but leaves the connection itself intact.\n\nThe ability to see which threads are available to be killed depends on\nthe PROCESS privilege:\n\no Without PROCESS, you can see only your own threads.\n\no With PROCESS, you can see all threads.\n\nThe ability to kill threads and statements depends on the\nCONNECTION_ADMIN privilege and the deprecated SUPER privilege:\n\no Without CONNECTION_ADMIN or SUPER, you can kill only your own threads\n  and statements.\n\no With CONNECTION_ADMIN or SUPER, you can kill all threads and\n  statements, except that to affect a thread or statement that is\n  executing with the SYSTEM_USER privilege, your own session must\n  additionally have the SYSTEM_USER privilege.\n\nYou can also use the mysqladmin processlist and mysqladmin kill\ncommands to examine and kill threads.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/kill.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/kill.html'),(694,'LOAD INDEX',3,'Syntax:\nLOAD INDEX INTO CACHE\n  tbl_index_list [, tbl_index_list] ...\n\ntbl_index_list:\n  tbl_name\n    [PARTITION (partition_list)]\n    [{INDEX|KEY} (index_name[, index_name] ...)]\n    [IGNORE LEAVES]\n\npartition_list: {\n    partition_name[, partition_name] ...\n  | ALL\n}\n\nThe LOAD INDEX INTO CACHE statement preloads a table index into the key\ncache to which it has been assigned by an explicit CACHE INDEX\nstatement, or into the default key cache otherwise.\n\nLOAD INDEX INTO CACHE applies only to MyISAM tables, including\npartitioned MyISAM tables. In addition, indexes on partitioned tables\ncan be preloaded for one, several, or all partitions.\n\nThe IGNORE LEAVES modifier causes only blocks for the nonleaf nodes of\nthe index to be preloaded.\n\nIGNORE LEAVES is also supported for partitioned MyISAM tables.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/load-index.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/load-index.html'),(695,'RESET',3,'Syntax:\nRESET reset_option [, reset_option] ...\n\nreset_option: {\n    MASTER\n  | REPLICA\n  | SLAVE\n}\n\nThe RESET statement is used to clear the state of various server\noperations. You must have the RELOAD privilege to execute RESET.\n\nFor information about the RESET PERSIST statement that removes\npersisted global system variables, see [HELP RESET PERSIST].\n\nRESET acts as a stronger version of the FLUSH statement. See [HELP\nFLUSH].\n\nThe RESET statement causes an implicit commit. See\nhttps://dev.mysql.com/doc/refman/8.0/en/implicit-commit.html.\n\nThe following list describes the permitted RESET statement reset_option\nvalues:\n\no RESET MASTER\n\n  Deletes all binary logs listed in the index file, resets the binary\n  log index file to be empty, and creates a new binary log file.\n\no RESET REPLICA\n\n  Makes the replica forget its replication position in the source\n  binary logs. Also resets the relay log by deleting any existing relay\n  log files and beginning a new one. Use RESET REPLICA in place of\n  RESET SLAVE from MySQL 8.0.22.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/reset.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/reset.html'),(696,'RESET PERSIST',3,'Syntax:\nRESET PERSIST [[IF EXISTS] system_var_name]\n\nRESET PERSIST removes persisted global system variable settings from\nthe mysqld-auto.cnf option file in the data directory. Removing a\npersisted system variable causes the variable no longer to be\ninitialized from mysqld-auto.cnf at server startup. For more\ninformation about persisting system variables and the mysqld-auto.cnf\nfile, see\nhttps://dev.mysql.com/doc/refman/8.0/en/persisted-system-variables.html\n.\n\nPrior to MySQL 8.0.32, this statement did not work with variables whose\nname contained a dot character (.), such as MyISAM multiple key cache\nvariables and variables registered by components. (Bug #33417357)\n\nThe privileges required for RESET PERSIST depend on the type of system\nvariable to be removed:\n\no For dynamic system variables, this statement requires the\n  SYSTEM_VARIABLES_ADMIN privilege (or the deprecated SUPER privilege).\n\no For read-only system variables, this statement requires the\n  SYSTEM_VARIABLES_ADMIN and PERSIST_RO_VARIABLES_ADMIN privileges.\n\nSee\nhttps://dev.mysql.com/doc/refman/8.0/en/system-variable-privileges.html\n.\n\nDepending on whether the variable name and IF EXISTS clauses are\npresent, the RESET PERSIST statement has these forms:\n\no To remove all persisted variables from mysqld-auto.cnf, use RESET\n  PERSIST without naming any system variable:\n\nRESET PERSIST;\n\n  You must have privileges for removing both dynamic and read-only\n  system variables if mysqld-auto.cnf contains both kinds of variables.\n\no To remove a specific persisted variable from mysqld-auto.cnf, name it\n  in the statement:\n\nRESET PERSIST system_var_name;\n\n  This includes plugin system variables, even if the plugin is not\n  currently installed. If the variable is not present in the file, an\n  error occurs.\n\no To remove a specific persisted variable from mysqld-auto.cnf, but\n  produce a warning rather than an error if the variable is not present\n  in the file, add an IF EXISTS clause to the previous syntax:\n\nRESET PERSIST IF EXISTS system_var_name;\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/reset-persist.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/reset-persist.html'),(697,'RESTART',3,'Syntax:\nRESTART\n\nThis statement stops and restarts the MySQL server. It requires the\nSHUTDOWN privilege.\n\nOne use for RESTART is when it is not possible or convenient to gain\ncommand-line access to the MySQL server on the server host to restart\nit. For example, SET PERSIST_ONLY can be used at runtime to make\nconfiguration changes to system variables that can be set only at\nserver startup, but the server must still be restarted for those\nchanges to take effect. The RESTART statement provides a way to do so\nfrom within client sessions, without requiring command-line access on\nthe server host.\n\n*Note*:\n\nAfter executing a RESTART statement, the client can expect the current\nconnection to be lost. If auto-reconnect is enabled, the connection is\nreestablished after the server restarts. Otherwise, the connection must\nbe reestablished manually.\n\nA successful RESTART operation requires mysqld to be running in an\nenvironment that has a monitoring process available to detect a server\nshutdown performed for restart purposes:\n\no In the presence of a monitoring process, RESTART causes mysqld to\n  terminate such that the monitoring process can determine that it\n  should start a new mysqld instance.\n\no If no monitoring process is present, RESTART fails with an error.\n\nThese platforms provide the necessary monitoring support for the\nRESTART statement:\n\no Windows, when mysqld is started as a Windows service or standalone.\n  (mysqld forks, and one process acts as a monitor to the other, which\n  acts as the server.)\n\no Unix and Unix-like systems that use systemd or mysqld_safe to manage\n  mysqld.\n\nTo configure a monitoring environment such that mysqld enables the\nRESTART statement:\n\n1. Set the MYSQLD_PARENT_PID environment variable to the value of the\n   process ID of the process that starts mysqld, before starting\n   mysqld.\n\n2. When mysqld performs a shutdown due to use of the RESTART statement,\n   it returns exit code 16.\n\n3. When the monitoring process detects an exit code of 16, it starts\n   mysqld again. Otherwise, it exits.\n\nHere is a minimal example as implemented in the bash shell:\n\n#!/bin/bash\n\nexport MYSQLD_PARENT_PID=$$\n\nexport MYSQLD_RESTART_EXIT=16\n\nwhile true ; do\n  bin/mysqld mysqld options here\n  if [ $? -ne $MYSQLD_RESTART_EXIT ]; then\n    break\n  fi\ndone\n\nOn Windows, the forking used to implement RESTART makes determining the\nserver process to attach to for debugging more difficult. To alleviate\nthis, starting the server with --gdb suppresses forking, in addition to\nits other actions done to set up a debugging environment. In non-debug\nsettings, --no-monitor may be used for the sole purpose of suppressing\nforking the monitor process. For a server started with either --gdb or\n--no-monitor, executing RESTART causes the server to simply exit\nwithout restarting.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/restart.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/restart.html'),(698,'SHUTDOWN',3,'Syntax:\nSHUTDOWN\n\nThis statement stops the MySQL server. It requires the SHUTDOWN\nprivilege.\n\nSHUTDOWN provides an SQL-level interface to the same functionality\navailable using the mysqladmin shutdown command or the mysql_shutdown()\n(https://dev.mysql.com/doc/c-api/8.0/en/mysql-shutdown.html) C API\nfunction. A successful SHUTDOWN sequence consists of checking the\nprivileges, validating the arguments, and sending an OK packet to the\nclient. Then the server is shut down.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/shutdown.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/shutdown.html'),(699,'EXPLAIN',51,'Syntax:\n{EXPLAIN | DESCRIBE | DESC}\n    tbl_name [col_name | wild]\n\n{EXPLAIN | DESCRIBE | DESC}\n    [explain_type]\n    {explainable_stmt | FOR CONNECTION connection_id}\n\n{EXPLAIN | DESCRIBE | DESC} ANALYZE [FORMAT = TREE] select_statement\n\nexplain_type: {\n    FORMAT = format_name\n}\n\nformat_name: {\n    TRADITIONAL\n  | JSON\n  | TREE\n}\n\nexplainable_stmt: {\n    SELECT statement\n  | TABLE statement\n  | DELETE statement\n  | INSERT statement\n  | REPLACE statement\n  | UPDATE statement\n}\n\nThe DESCRIBE and EXPLAIN statements are synonyms. In practice, the\nDESCRIBE keyword is more often used to obtain information about table\nstructure, whereas EXPLAIN is used to obtain a query execution plan\n(that is, an explanation of how MySQL would execute a query).\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/explain.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/explain.html'),(700,'DESCRIBE',51,'Syntax:\n{EXPLAIN | DESCRIBE | DESC}\n    tbl_name [col_name | wild]\n\n{EXPLAIN | DESCRIBE | DESC}\n    [explain_type]\n    {explainable_stmt | FOR CONNECTION connection_id}\n\n{EXPLAIN | DESCRIBE | DESC} ANALYZE [FORMAT = TREE] select_statement\n\nexplain_type: {\n    FORMAT = format_name\n}\n\nformat_name: {\n    TRADITIONAL\n  | JSON\n  | TREE\n}\n\nexplainable_stmt: {\n    SELECT statement\n  | TABLE statement\n  | DELETE statement\n  | INSERT statement\n  | REPLACE statement\n  | UPDATE statement\n}\n\nThe DESCRIBE and EXPLAIN statements are synonyms. In practice, the\nDESCRIBE keyword is more often used to obtain information about table\nstructure, whereas EXPLAIN is used to obtain a query execution plan\n(that is, an explanation of how MySQL would execute a query).\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/explain.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/explain.html'),(701,'DESC',51,'Syntax:\n{EXPLAIN | DESCRIBE | DESC}\n    tbl_name [col_name | wild]\n\n{EXPLAIN | DESCRIBE | DESC}\n    [explain_type]\n    {explainable_stmt | FOR CONNECTION connection_id}\n\n{EXPLAIN | DESCRIBE | DESC} ANALYZE [FORMAT = TREE] select_statement\n\nexplain_type: {\n    FORMAT = format_name\n}\n\nformat_name: {\n    TRADITIONAL\n  | JSON\n  | TREE\n}\n\nexplainable_stmt: {\n    SELECT statement\n  | TABLE statement\n  | DELETE statement\n  | INSERT statement\n  | REPLACE statement\n  | UPDATE statement\n}\n\nThe DESCRIBE and EXPLAIN statements are synonyms. In practice, the\nDESCRIBE keyword is more often used to obtain information about table\nstructure, whereas EXPLAIN is used to obtain a query execution plan\n(that is, an explanation of how MySQL would execute a query).\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/explain.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/explain.html'),(702,'HELP STATEMENT',51,'Syntax:\nHELP \'search_string\'\n\nThe HELP statement returns online information from the MySQL Reference\nManual. Its proper operation requires that the help tables in the mysql\ndatabase be initialized with help topic information (see\nhttps://dev.mysql.com/doc/refman/8.0/en/server-side-help-support.html).\n\nThe HELP statement searches the help tables for the given search string\nand displays the result of the search. The search string is not\ncase-sensitive.\n\nThe search string can contain the wildcard characters % and _. These\nhave the same meaning as for pattern-matching operations performed with\nthe LIKE operator. For example, HELP \'rep%\' returns a list of topics\nthat begin with rep.\n\nThe HELP statement does not require a terminator such as ; or \\G.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/help.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/help.html'),(703,'USE',51,'Syntax:\nUSE db_name\n\nThe USE statement tells MySQL to use the named database as the default\n(current) database for subsequent statements. This statement requires\nsome privilege for the database or some object within it.\n\nThe named database remains the default until the end of the session or\nanother USE statement is issued:\n\nUSE db1;\nSELECT COUNT(*) FROM mytable;   # selects from db1.mytable\nUSE db2;\nSELECT COUNT(*) FROM mytable;   # selects from db2.mytable\n\nThe database name must be specified on a single line. Newlines in\ndatabase names are not supported.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/use.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/use.html'),(704,'MERGE',52,'The MERGE storage engine, also known as the MRG_MyISAM engine, is a\ncollection of identical MyISAM tables that can be used as one.\n\"Identical\" means that all tables have identical column data types and\nindex information. You cannot merge MyISAM tables in which the columns\nare listed in a different order, do not have exactly the same data\ntypes in corresponding columns, or have the indexes in different order.\nHowever, any or all of the MyISAM tables can be compressed with\nmyisampack. See\nhttps://dev.mysql.com/doc/refman/8.0/en/myisampack.html. Differences\nbetween tables such as these do not matter:\n\no Names of corresponding columns and indexes can differ.\n\no Comments for tables, columns, and indexes can differ.\n\no Table options such as AVG_ROW_LENGTH, MAX_ROWS, or PACK_KEYS can\n  differ.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/merge-storage-engine.html\n\n','mysql> CREATE TABLE t1 (\n    ->    a INT NOT NULL AUTO_INCREMENT PRIMARY KEY,\n    ->    message CHAR(20)) ENGINE=MyISAM;\nmysql> CREATE TABLE t2 (\n    ->    a INT NOT NULL AUTO_INCREMENT PRIMARY KEY,\n    ->    message CHAR(20)) ENGINE=MyISAM;\nmysql> INSERT INTO t1 (message) VALUES (\'Testing\'),(\'table\'),(\'t1\');\nmysql> INSERT INTO t2 (message) VALUES (\'Testing\'),(\'table\'),(\'t2\');\nmysql> CREATE TABLE total (\n    ->    a INT NOT NULL AUTO_INCREMENT,\n    ->    message CHAR(20), INDEX(a))\n    ->    ENGINE=MERGE UNION=(t1,t2) INSERT_METHOD=LAST;\n','https://dev.mysql.com/doc/refman/8.0/en/merge-storage-engine.html');
/*!40000 ALTER TABLE `help_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `innodb_index_stats`
--

/*!40000 ALTER TABLE `innodb_index_stats` DISABLE KEYS */;
INSERT  IGNORE INTO `innodb_index_stats` VALUES ('dbresourcehumaine','Annonce','PRIMARY','2024-11-11 05:29:25','n_diff_pfx01',4,1,'id'),('dbresourcehumaine','Annonce','PRIMARY','2024-11-11 05:29:25','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('dbresourcehumaine','Annonce','PRIMARY','2024-11-11 05:29:25','size',1,NULL,'Number of pages in the index'),('dbresourcehumaine','Annonce','idDepartement','2024-11-11 05:29:25','n_diff_pfx01',3,1,'idDepartement'),('dbresourcehumaine','Annonce','idDepartement','2024-11-11 05:29:25','n_diff_pfx02',4,1,'idDepartement,id'),('dbresourcehumaine','Annonce','idDepartement','2024-11-11 05:29:25','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('dbresourcehumaine','Annonce','idDepartement','2024-11-11 05:29:25','size',1,NULL,'Number of pages in the index'),('dbresourcehumaine','Annonce','idDiplome','2024-11-11 05:29:25','n_diff_pfx01',3,1,'idDiplome'),('dbresourcehumaine','Annonce','idDiplome','2024-11-11 05:29:25','n_diff_pfx02',4,1,'idDiplome,id'),('dbresourcehumaine','Annonce','idDiplome','2024-11-11 05:29:25','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('dbresourcehumaine','Annonce','idDiplome','2024-11-11 05:29:25','size',1,NULL,'Number of pages in the index'),('dbresourcehumaine','Annonce','idExperience','2024-11-11 05:29:25','n_diff_pfx01',3,1,'idExperience'),('dbresourcehumaine','Annonce','idExperience','2024-11-11 05:29:25','n_diff_pfx02',4,1,'idExperience,id'),('dbresourcehumaine','Annonce','idExperience','2024-11-11 05:29:25','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('dbresourcehumaine','Annonce','idExperience','2024-11-11 05:29:25','size',1,NULL,'Number of pages in the index'),('dbresourcehumaine','CV','PRIMARY','2024-11-11 05:29:35','n_diff_pfx01',8,1,'id'),('dbresourcehumaine','CV','PRIMARY','2024-11-11 05:29:35','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('dbresourcehumaine','CV','PRIMARY','2024-11-11 05:29:35','size',1,NULL,'Number of pages in the index'),('dbresourcehumaine','CV','idDepartement','2024-11-11 05:29:35','n_diff_pfx01',3,1,'idDepartement'),('dbresourcehumaine','CV','idDepartement','2024-11-11 05:29:35','n_diff_pfx02',8,1,'idDepartement,id'),('dbresourcehumaine','CV','idDepartement','2024-11-11 05:29:35','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('dbresourcehumaine','CV','idDepartement','2024-11-11 05:29:35','size',1,NULL,'Number of pages in the index'),('dbresourcehumaine','Contract','PRIMARY','2024-11-11 05:29:15','n_diff_pfx01',3,1,'id'),('dbresourcehumaine','Contract','PRIMARY','2024-11-11 05:29:15','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('dbresourcehumaine','Contract','PRIMARY','2024-11-11 05:29:15','size',1,NULL,'Number of pages in the index'),('dbresourcehumaine','Cv_Diplome','PRIMARY','2024-11-11 05:30:00','n_diff_pfx01',9,1,'id'),('dbresourcehumaine','Cv_Diplome','PRIMARY','2024-11-11 05:30:00','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('dbresourcehumaine','Cv_Diplome','PRIMARY','2024-11-11 05:30:00','size',1,NULL,'Number of pages in the index'),('dbresourcehumaine','Cv_Diplome','idCv','2024-11-11 05:30:00','n_diff_pfx01',8,1,'idCv'),('dbresourcehumaine','Cv_Diplome','idCv','2024-11-11 05:30:00','n_diff_pfx02',9,1,'idCv,id'),('dbresourcehumaine','Cv_Diplome','idCv','2024-11-11 05:30:00','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('dbresourcehumaine','Cv_Diplome','idCv','2024-11-11 05:30:00','size',1,NULL,'Number of pages in the index'),('dbresourcehumaine','Cv_Diplome','idDiplome','2024-11-11 05:30:00','n_diff_pfx01',3,1,'idDiplome'),('dbresourcehumaine','Cv_Diplome','idDiplome','2024-11-11 05:30:00','n_diff_pfx02',9,1,'idDiplome,id'),('dbresourcehumaine','Cv_Diplome','idDiplome','2024-11-11 05:30:00','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('dbresourcehumaine','Cv_Diplome','idDiplome','2024-11-11 05:30:00','size',1,NULL,'Number of pages in the index'),('dbresourcehumaine','Cv_Experience','PRIMARY','2024-11-11 05:30:10','n_diff_pfx01',12,1,'id'),('dbresourcehumaine','Cv_Experience','PRIMARY','2024-11-11 05:30:10','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('dbresourcehumaine','Cv_Experience','PRIMARY','2024-11-11 05:30:10','size',1,NULL,'Number of pages in the index'),('dbresourcehumaine','Cv_Experience','idCv','2024-11-11 05:30:10','n_diff_pfx01',8,1,'idCv'),('dbresourcehumaine','Cv_Experience','idCv','2024-11-11 05:30:10','n_diff_pfx02',12,1,'idCv,id'),('dbresourcehumaine','Cv_Experience','idCv','2024-11-11 05:30:10','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('dbresourcehumaine','Cv_Experience','idCv','2024-11-11 05:30:10','size',1,NULL,'Number of pages in the index'),('dbresourcehumaine','Cv_Experience','idExperience','2024-11-11 05:30:10','n_diff_pfx01',3,1,'idExperience'),('dbresourcehumaine','Cv_Experience','idExperience','2024-11-11 05:30:10','n_diff_pfx02',12,1,'idExperience,id'),('dbresourcehumaine','Cv_Experience','idExperience','2024-11-11 05:30:10','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('dbresourcehumaine','Cv_Experience','idExperience','2024-11-11 05:30:10','size',1,NULL,'Number of pages in the index'),('dbresourcehumaine','Departement','PRIMARY','2024-11-11 05:40:23','n_diff_pfx01',7,1,'id'),('dbresourcehumaine','Departement','PRIMARY','2024-11-11 05:40:23','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('dbresourcehumaine','Departement','PRIMARY','2024-11-11 05:40:23','size',1,NULL,'Number of pages in the index'),('dbresourcehumaine','Diplome','PRIMARY','2024-11-11 05:28:12','n_diff_pfx01',3,1,'id'),('dbresourcehumaine','Diplome','PRIMARY','2024-11-11 05:28:12','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('dbresourcehumaine','Diplome','PRIMARY','2024-11-11 05:28:12','size',1,NULL,'Number of pages in the index'),('dbresourcehumaine','Experience','PRIMARY','2024-11-11 05:28:16','n_diff_pfx01',3,1,'id'),('dbresourcehumaine','Experience','PRIMARY','2024-11-11 05:28:16','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('dbresourcehumaine','Experience','PRIMARY','2024-11-11 05:28:16','size',1,NULL,'Number of pages in the index'),('dbresourcehumaine','Login','PRIMARY','2024-11-11 06:01:59','n_diff_pfx01',7,1,'id'),('dbresourcehumaine','Login','PRIMARY','2024-11-11 06:01:59','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('dbresourcehumaine','Login','PRIMARY','2024-11-11 06:01:59','size',1,NULL,'Number of pages in the index'),('dbresourcehumaine','Note','GEN_CLUST_INDEX','2024-11-11 06:58:01','n_diff_pfx01',0,1,'DB_ROW_ID'),('dbresourcehumaine','Note','GEN_CLUST_INDEX','2024-11-11 06:58:01','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('dbresourcehumaine','Note','GEN_CLUST_INDEX','2024-11-11 06:58:01','size',1,NULL,'Number of pages in the index'),('dbresourcehumaine','Promotion','PRIMARY','2024-11-11 05:30:44','n_diff_pfx01',2,1,'id'),('dbresourcehumaine','Promotion','PRIMARY','2024-11-11 05:30:44','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('dbresourcehumaine','Promotion','PRIMARY','2024-11-11 05:30:44','size',1,NULL,'Number of pages in the index'),('dbresourcehumaine','Promotion','idDepartement','2024-11-11 05:30:44','n_diff_pfx01',1,1,'idDepartement'),('dbresourcehumaine','Promotion','idDepartement','2024-11-11 05:30:44','n_diff_pfx02',2,1,'idDepartement,id'),('dbresourcehumaine','Promotion','idDepartement','2024-11-11 05:30:44','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('dbresourcehumaine','Promotion','idDepartement','2024-11-11 05:30:44','size',1,NULL,'Number of pages in the index'),('dbresourcehumaine','Promotion','idDiplome','2024-11-11 05:30:44','n_diff_pfx01',1,1,'idDiplome'),('dbresourcehumaine','Promotion','idDiplome','2024-11-11 05:30:44','n_diff_pfx02',2,1,'idDiplome,id'),('dbresourcehumaine','Promotion','idDiplome','2024-11-11 05:30:44','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('dbresourcehumaine','Promotion','idDiplome','2024-11-11 05:30:44','size',1,NULL,'Number of pages in the index'),('dbresourcehumaine','Promotion','idExperience','2024-11-11 05:30:44','n_diff_pfx01',2,1,'idExperience'),('dbresourcehumaine','Promotion','idExperience','2024-11-11 05:30:44','n_diff_pfx02',2,1,'idExperience,id'),('dbresourcehumaine','Promotion','idExperience','2024-11-11 05:30:44','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('dbresourcehumaine','Promotion','idExperience','2024-11-11 05:30:44','size',1,NULL,'Number of pages in the index'),('dbresourcehumaine','Test','PRIMARY','2024-11-11 05:31:03','n_diff_pfx01',7,1,'id'),('dbresourcehumaine','Test','PRIMARY','2024-11-11 05:31:03','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('dbresourcehumaine','Test','PRIMARY','2024-11-11 05:31:03','size',1,NULL,'Number of pages in the index'),('dbresourcehumaine','Test','idCv','2024-11-11 05:31:03','n_diff_pfx01',4,1,'idCv'),('dbresourcehumaine','Test','idCv','2024-11-11 05:31:03','n_diff_pfx02',7,1,'idCv,id'),('dbresourcehumaine','Test','idCv','2024-11-11 05:31:03','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('dbresourcehumaine','Test','idCv','2024-11-11 05:31:03','size',1,NULL,'Number of pages in the index'),('master','test','GEN_CLUST_INDEX','2024-11-13 18:23:27','n_diff_pfx01',0,1,'DB_ROW_ID'),('master','test','GEN_CLUST_INDEX','2024-11-13 18:23:27','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('master','test','GEN_CLUST_INDEX','2024-11-13 18:23:27','size',1,NULL,'Number of pages in the index'),('mysql','component','PRIMARY','2024-11-13 05:09:37','n_diff_pfx01',0,1,'component_id'),('mysql','component','PRIMARY','2024-11-13 05:09:37','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('mysql','component','PRIMARY','2024-11-13 05:09:37','size',1,NULL,'Number of pages in the index'),('school','students','PRIMARY','2024-11-12 08:01:21','n_diff_pfx01',3,1,'id'),('school','students','PRIMARY','2024-11-12 08:01:21','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('school','students','PRIMARY','2024-11-12 08:01:21','size',1,NULL,'Number of pages in the index'),('school','users','PRIMARY','2024-11-12 08:33:58','n_diff_pfx01',3,1,'id'),('school','users','PRIMARY','2024-11-12 08:33:58','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('school','users','PRIMARY','2024-11-12 08:33:58','size',1,NULL,'Number of pages in the index'),('session','Session','PRIMARY','2024-11-13 09:10:38','n_diff_pfx01',45,1,'id'),('session','Session','PRIMARY','2024-11-13 09:10:38','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('session','Session','PRIMARY','2024-11-13 09:10:38','size',1,NULL,'Number of pages in the index'),('sys','sys_config','PRIMARY','2024-09-01 18:46:18','n_diff_pfx01',6,1,'variable'),('sys','sys_config','PRIMARY','2024-09-01 18:46:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('sys','sys_config','PRIMARY','2024-09-01 18:46:18','size',1,NULL,'Number of pages in the index'),('vary','Charge','PRIMARY','2024-09-30 09:59:54','n_diff_pfx01',3,1,'id'),('vary','Charge','PRIMARY','2024-09-30 09:59:54','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('vary','Charge','PRIMARY','2024-09-30 09:59:54','size',1,NULL,'Number of pages in the index'),('vary','Nature','PRIMARY','2024-09-30 09:59:54','n_diff_pfx01',2,1,'id'),('vary','Nature','PRIMARY','2024-09-30 09:59:54','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('vary','Nature','PRIMARY','2024-09-30 09:59:54','size',1,NULL,'Number of pages in the index'),('vary','Rubrique','PRIMARY','2024-09-30 10:19:00','n_diff_pfx01',8,1,'id'),('vary','Rubrique','PRIMARY','2024-09-30 10:19:00','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('vary','Rubrique','PRIMARY','2024-09-30 10:19:00','size',1,NULL,'Number of pages in the index'),('vary','Rubrique','id_unite_oeuvre','2024-09-30 10:19:00','n_diff_pfx01',3,1,'id_unite_oeuvre'),('vary','Rubrique','id_unite_oeuvre','2024-09-30 10:19:00','n_diff_pfx02',8,1,'id_unite_oeuvre,id'),('vary','Rubrique','id_unite_oeuvre','2024-09-30 10:19:00','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('vary','Rubrique','id_unite_oeuvre','2024-09-30 10:19:00','size',1,NULL,'Number of pages in the index'),('vary','Rubrique_Charge','PRIMARY','2024-09-30 10:41:21','n_diff_pfx01',54,1,'id'),('vary','Rubrique_Charge','PRIMARY','2024-09-30 10:41:21','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('vary','Rubrique_Charge','PRIMARY','2024-09-30 10:41:21','size',1,NULL,'Number of pages in the index'),('vary','Rubrique_Charge','id_charge','2024-09-30 10:41:21','n_diff_pfx01',3,1,'id_charge'),('vary','Rubrique_Charge','id_charge','2024-09-30 10:41:21','n_diff_pfx02',54,1,'id_charge,id'),('vary','Rubrique_Charge','id_charge','2024-09-30 10:41:21','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('vary','Rubrique_Charge','id_charge','2024-09-30 10:41:21','size',1,NULL,'Number of pages in the index'),('vary','Rubrique_Charge','id_rubrique','2024-09-30 10:41:21','n_diff_pfx01',9,1,'id_rubrique'),('vary','Rubrique_Charge','id_rubrique','2024-09-30 10:41:21','n_diff_pfx02',54,1,'id_rubrique,id'),('vary','Rubrique_Charge','id_rubrique','2024-09-30 10:41:21','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('vary','Rubrique_Charge','id_rubrique','2024-09-30 10:41:21','size',1,NULL,'Number of pages in the index'),('vary','Rubrique_Charge','id_type','2024-09-30 10:41:21','n_diff_pfx01',2,1,'id_type'),('vary','Rubrique_Charge','id_type','2024-09-30 10:41:21','n_diff_pfx02',54,1,'id_type,id'),('vary','Rubrique_Charge','id_type','2024-09-30 10:41:21','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('vary','Rubrique_Charge','id_type','2024-09-30 10:41:21','size',1,NULL,'Number of pages in the index'),('vary','Type','PRIMARY','2024-09-30 10:00:04','n_diff_pfx01',2,1,'id'),('vary','Type','PRIMARY','2024-09-30 10:00:04','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('vary','Type','PRIMARY','2024-09-30 10:00:04','size',1,NULL,'Number of pages in the index'),('vary','Unite_Oeuvre','PRIMARY','2024-09-30 10:00:14','n_diff_pfx01',6,1,'id'),('vary','Unite_Oeuvre','PRIMARY','2024-09-30 10:00:14','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('vary','Unite_Oeuvre','PRIMARY','2024-09-30 10:00:14','size',1,NULL,'Number of pages in the index');
/*!40000 ALTER TABLE `innodb_index_stats` ENABLE KEYS */;

--
-- Dumping data for table `innodb_table_stats`
--

/*!40000 ALTER TABLE `innodb_table_stats` DISABLE KEYS */;
INSERT  IGNORE INTO `innodb_table_stats` VALUES ('dbresourcehumaine','Annonce','2024-11-11 05:29:25',4,1,3),('dbresourcehumaine','CV','2024-11-11 05:29:35',8,1,1),('dbresourcehumaine','Contract','2024-11-11 05:29:15',3,1,0),('dbresourcehumaine','Cv_Diplome','2024-11-11 05:30:00',9,1,2),('dbresourcehumaine','Cv_Experience','2024-11-11 05:30:10',12,1,2),('dbresourcehumaine','Departement','2024-11-11 05:40:23',7,1,0),('dbresourcehumaine','Diplome','2024-11-11 05:28:12',3,1,0),('dbresourcehumaine','Experience','2024-11-11 05:28:16',3,1,0),('dbresourcehumaine','Login','2024-11-11 06:01:59',7,1,0),('dbresourcehumaine','Note','2024-11-11 06:58:01',0,1,0),('dbresourcehumaine','Promotion','2024-11-11 05:30:44',2,1,3),('dbresourcehumaine','Test','2024-11-11 05:31:03',7,1,1),('master','test','2024-11-13 18:23:27',0,1,0),('mysql','component','2024-11-13 05:09:37',0,1,0),('school','students','2024-11-12 08:01:21',3,1,0),('school','users','2024-11-12 08:33:58',3,1,0),('session','Session','2024-11-13 09:10:38',45,1,0),('sys','sys_config','2024-09-01 18:46:18',6,1,0),('vary','Charge','2024-09-30 09:59:54',3,1,0),('vary','Nature','2024-09-30 09:59:54',2,1,0),('vary','Rubrique','2024-09-30 10:19:00',8,1,1),('vary','Rubrique_Charge','2024-09-30 10:41:21',54,1,3),('vary','Type','2024-09-30 10:00:04',2,1,0),('vary','Unite_Oeuvre','2024-09-30 10:00:14',6,1,0);
/*!40000 ALTER TABLE `innodb_table_stats` ENABLE KEYS */;

--
-- Table structure for table `password_history`
--

DROP TABLE IF EXISTS `password_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_history` (
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `Password_timestamp` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `Password` text COLLATE utf8mb3_bin,
  PRIMARY KEY (`Host`,`User`,`Password_timestamp` DESC)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Password history for user accounts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_history`
--

LOCK TABLES `password_history` WRITE;
/*!40000 ALTER TABLE `password_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin`
--

DROP TABLE IF EXISTS `plugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugin` (
  `name` varchar(64) NOT NULL DEFAULT '',
  `dl` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='MySQL plugins';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin`
--

LOCK TABLES `plugin` WRITE;
/*!40000 ALTER TABLE `plugin` DISABLE KEYS */;
INSERT INTO `plugin` VALUES ('auth_socket','auth_socket.so');
/*!40000 ALTER TABLE `plugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procs_priv`
--

DROP TABLE IF EXISTS `procs_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `procs_priv` (
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `Routine_name` char(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `Routine_type` enum('FUNCTION','PROCEDURE') COLLATE utf8mb3_bin NOT NULL,
  `Grantor` varchar(288) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `Proc_priv` set('Execute','Alter Routine','Grant') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Host`,`User`,`Db`,`Routine_name`,`Routine_type`),
  KEY `Grantor` (`Grantor`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Procedure privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procs_priv`
--

LOCK TABLES `procs_priv` WRITE;
/*!40000 ALTER TABLE `procs_priv` DISABLE KEYS */;
/*!40000 ALTER TABLE `procs_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxies_priv`
--

DROP TABLE IF EXISTS `proxies_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proxies_priv` (
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `Proxied_host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `Proxied_user` char(32) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `With_grant` tinyint(1) NOT NULL DEFAULT '0',
  `Grantor` varchar(288) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Host`,`User`,`Proxied_host`,`Proxied_user`),
  KEY `Grantor` (`Grantor`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='User proxy privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxies_priv`
--

LOCK TABLES `proxies_priv` WRITE;
/*!40000 ALTER TABLE `proxies_priv` DISABLE KEYS */;
INSERT INTO `proxies_priv` VALUES ('localhost','root','','',1,'boot@','2024-09-01 18:46:17');
/*!40000 ALTER TABLE `proxies_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `replication_asynchronous_connection_failover`
--

DROP TABLE IF EXISTS `replication_asynchronous_connection_failover`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `replication_asynchronous_connection_failover` (
  `Channel_name` char(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'The replication channel name that connects source and replica.',
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL COMMENT 'The source hostname that the replica will attempt to switch over the replication connection to in case of a failure.',
  `Port` int unsigned NOT NULL COMMENT 'The source port that the replica will attempt to switch over the replication connection to in case of a failure.',
  `Network_namespace` char(64) NOT NULL COMMENT 'The source network namespace that the replica will attempt to switch over the replication connection to in case of a failure. If its value is empty, connections use the default (global) namespace.',
  `Weight` tinyint unsigned NOT NULL COMMENT 'The order in which the replica shall try to switch the connection over to when there are failures. Weight can be set to a number between 1 and 100, where 100 is the highest weight and 1 the lowest.',
  `Managed_name` char(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT 'The name of the group which this server belongs to.',
  PRIMARY KEY (`Channel_name`,`Host`,`Port`,`Network_namespace`,`Managed_name`),
  KEY `Channel_name` (`Channel_name`,`Managed_name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='The source configuration details';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `replication_asynchronous_connection_failover`
--

LOCK TABLES `replication_asynchronous_connection_failover` WRITE;
/*!40000 ALTER TABLE `replication_asynchronous_connection_failover` DISABLE KEYS */;
/*!40000 ALTER TABLE `replication_asynchronous_connection_failover` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `replication_asynchronous_connection_failover_managed`
--

DROP TABLE IF EXISTS `replication_asynchronous_connection_failover_managed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `replication_asynchronous_connection_failover_managed` (
  `Channel_name` char(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'The replication channel name that connects source and replica.',
  `Managed_name` char(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT 'The name of the source which needs to be managed.',
  `Managed_type` char(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT 'Determines the managed type.',
  `Configuration` json DEFAULT NULL COMMENT 'The data to help manage group. For Managed_type = GroupReplication, Configuration value should contain {"Primary_weight": 80, "Secondary_weight": 60}, so that it assigns weight=80 to PRIMARY of the group, and weight=60 for rest of the members in mysql.replication_asynchronous_connection_failover table.',
  PRIMARY KEY (`Channel_name`,`Managed_name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='The managed source configuration details';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `replication_asynchronous_connection_failover_managed`
--

LOCK TABLES `replication_asynchronous_connection_failover_managed` WRITE;
/*!40000 ALTER TABLE `replication_asynchronous_connection_failover_managed` DISABLE KEYS */;
/*!40000 ALTER TABLE `replication_asynchronous_connection_failover_managed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `replication_group_configuration_version`
--

DROP TABLE IF EXISTS `replication_group_configuration_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `replication_group_configuration_version` (
  `name` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL COMMENT 'The configuration name.',
  `version` bigint unsigned NOT NULL COMMENT 'The version of the configuration name.',
  PRIMARY KEY (`name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='The group configuration version.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `replication_group_configuration_version`
--

LOCK TABLES `replication_group_configuration_version` WRITE;
/*!40000 ALTER TABLE `replication_group_configuration_version` DISABLE KEYS */;
INSERT INTO `replication_group_configuration_version` VALUES ('replication_group_member_actions',1);
/*!40000 ALTER TABLE `replication_group_configuration_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `replication_group_member_actions`
--

DROP TABLE IF EXISTS `replication_group_member_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `replication_group_member_actions` (
  `name` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL COMMENT 'The action name.',
  `event` char(64) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL COMMENT 'The event that will trigger the action.',
  `enabled` tinyint(1) NOT NULL COMMENT 'Whether the action is enabled.',
  `type` char(64) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL COMMENT 'The action type.',
  `priority` tinyint unsigned NOT NULL COMMENT 'The order on which the action will be run, value between 1 and 100, lower values first.',
  `error_handling` char(64) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL COMMENT 'On errors during the action will be handled: IGNORE, CRITICAL.',
  PRIMARY KEY (`name`,`event`),
  KEY `event` (`event`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='The member actions configuration.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `replication_group_member_actions`
--

LOCK TABLES `replication_group_member_actions` WRITE;
/*!40000 ALTER TABLE `replication_group_member_actions` DISABLE KEYS */;
INSERT INTO `replication_group_member_actions` VALUES ('mysql_disable_super_read_only_if_primary','AFTER_PRIMARY_ELECTION',1,'INTERNAL',1,'IGNORE'),('mysql_start_failover_channels_if_primary','AFTER_PRIMARY_ELECTION',1,'INTERNAL',10,'CRITICAL');
/*!40000 ALTER TABLE `replication_group_member_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_edges`
--

DROP TABLE IF EXISTS `role_edges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_edges` (
  `FROM_HOST` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `FROM_USER` char(32) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `TO_HOST` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `TO_USER` char(32) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `WITH_ADMIN_OPTION` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`FROM_HOST`,`FROM_USER`,`TO_HOST`,`TO_USER`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Role hierarchy and role grants';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_edges`
--

LOCK TABLES `role_edges` WRITE;
/*!40000 ALTER TABLE `role_edges` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_edges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_cost`
--

DROP TABLE IF EXISTS `server_cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `server_cost` (
  `cost_name` varchar(64) NOT NULL,
  `cost_value` float DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comment` varchar(1024) DEFAULT NULL,
  `default_value` float GENERATED ALWAYS AS ((case `cost_name` when _utf8mb3'disk_temptable_create_cost' then 20.0 when _utf8mb3'disk_temptable_row_cost' then 0.5 when _utf8mb3'key_compare_cost' then 0.05 when _utf8mb3'memory_temptable_create_cost' then 1.0 when _utf8mb3'memory_temptable_row_cost' then 0.1 when _utf8mb3'row_evaluate_cost' then 0.1 else NULL end)) VIRTUAL,
  PRIMARY KEY (`cost_name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_cost`
--

LOCK TABLES `server_cost` WRITE;
/*!40000 ALTER TABLE `server_cost` DISABLE KEYS */;
INSERT INTO `server_cost` (`cost_name`, `cost_value`, `last_update`, `comment`) VALUES ('disk_temptable_create_cost',NULL,'2024-09-01 18:46:17',NULL),('disk_temptable_row_cost',NULL,'2024-09-01 18:46:17',NULL),('key_compare_cost',NULL,'2024-09-01 18:46:17',NULL),('memory_temptable_create_cost',NULL,'2024-09-01 18:46:17',NULL),('memory_temptable_row_cost',NULL,'2024-09-01 18:46:17',NULL),('row_evaluate_cost',NULL,'2024-09-01 18:46:17',NULL);
/*!40000 ALTER TABLE `server_cost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servers`
--

DROP TABLE IF EXISTS `servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servers` (
  `Server_name` char(64) NOT NULL DEFAULT '',
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `Db` char(64) NOT NULL DEFAULT '',
  `Username` char(64) NOT NULL DEFAULT '',
  `Password` char(64) NOT NULL DEFAULT '',
  `Port` int NOT NULL DEFAULT '0',
  `Socket` char(64) NOT NULL DEFAULT '',
  `Wrapper` char(64) NOT NULL DEFAULT '',
  `Owner` char(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`Server_name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='MySQL Foreign Servers table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servers`
--

LOCK TABLES `servers` WRITE;
/*!40000 ALTER TABLE `servers` DISABLE KEYS */;
/*!40000 ALTER TABLE `servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slave_master_info`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `slave_master_info` (
  `Number_of_lines` int unsigned NOT NULL COMMENT 'Number of lines in the file.',
  `Master_log_name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'The name of the master binary log currently being read from the master.',
  `Master_log_pos` bigint unsigned NOT NULL COMMENT 'The master log position of the last read event.',
  `Host` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL COMMENT 'The host name of the source.',
  `User_name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'The user name used to connect to the master.',
  `User_password` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'The password used to connect to the master.',
  `Port` int unsigned NOT NULL COMMENT 'The network port used to connect to the master.',
  `Connect_retry` int unsigned NOT NULL COMMENT 'The period (in seconds) that the slave will wait before trying to reconnect to the master.',
  `Enabled_ssl` tinyint(1) NOT NULL COMMENT 'Indicates whether the server supports SSL connections.',
  `Ssl_ca` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'The file used for the Certificate Authority (CA) certificate.',
  `Ssl_capath` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'The path to the Certificate Authority (CA) certificates.',
  `Ssl_cert` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'The name of the SSL certificate file.',
  `Ssl_cipher` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'The name of the cipher in use for the SSL connection.',
  `Ssl_key` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'The name of the SSL key file.',
  `Ssl_verify_server_cert` tinyint(1) NOT NULL COMMENT 'Whether to verify the server certificate.',
  `Heartbeat` float NOT NULL,
  `Bind` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'Displays which interface is employed when connecting to the MySQL server',
  `Ignored_server_ids` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'The number of server IDs to be ignored, followed by the actual server IDs',
  `Uuid` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'The master server uuid.',
  `Retry_count` bigint unsigned NOT NULL COMMENT 'Number of reconnect attempts, to the master, before giving up.',
  `Ssl_crl` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'The file used for the Certificate Revocation List (CRL)',
  `Ssl_crlpath` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'The path used for Certificate Revocation List (CRL) files',
  `Enabled_auto_position` tinyint(1) NOT NULL COMMENT 'Indicates whether GTIDs will be used to retrieve events from the master.',
  `Channel_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'The channel on which the replica is connected to a source. Used in Multisource Replication',
  `Tls_version` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'Tls version',
  `Public_key_path` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'The file containing public key of master server.',
  `Get_public_key` tinyint(1) NOT NULL COMMENT 'Preference to get public key from master.',
  `Network_namespace` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'Network namespace used for communication with the master server.',
  `Master_compression_algorithm` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'Compression algorithm supported for data transfer between source and replica.',
  `Master_zstd_compression_level` int unsigned NOT NULL COMMENT 'Compression level associated with zstd compression algorithm.',
  `Tls_ciphersuites` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'Ciphersuites used for TLS 1.3 communication with the master server.',
  `Source_connection_auto_failover` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Indicates whether the channel connection failover is enabled.',
  `Gtid_only` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Indicates if this channel only uses GTIDs and does not persist positions.',
  PRIMARY KEY (`Channel_name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Master Information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slave_relay_log_info`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `slave_relay_log_info` (
  `Number_of_lines` int unsigned NOT NULL COMMENT 'Number of lines in the file or rows in the table. Used to version table definitions.',
  `Relay_log_name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'The name of the current relay log file.',
  `Relay_log_pos` bigint unsigned DEFAULT NULL COMMENT 'The relay log position of the last executed event.',
  `Master_log_name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'The name of the master binary log file from which the events in the relay log file were read.',
  `Master_log_pos` bigint unsigned DEFAULT NULL COMMENT 'The master log position of the last executed event.',
  `Sql_delay` int DEFAULT NULL COMMENT 'The number of seconds that the slave must lag behind the master.',
  `Number_of_workers` int unsigned DEFAULT NULL,
  `Id` int unsigned DEFAULT NULL COMMENT 'Internal Id that uniquely identifies this record.',
  `Channel_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'The channel on which the replica is connected to a source. Used in Multisource Replication',
  `Privilege_checks_username` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'Username part of PRIVILEGE_CHECKS_USER.',
  `Privilege_checks_hostname` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL COMMENT 'Hostname part of PRIVILEGE_CHECKS_USER.',
  `Require_row_format` tinyint(1) NOT NULL COMMENT 'Indicates whether the channel shall only accept row based events.',
  `Require_table_primary_key_check` enum('STREAM','ON','OFF','GENERATE') NOT NULL DEFAULT 'STREAM' COMMENT 'Indicates what is the channel policy regarding tables without primary keys on create and alter table queries',
  `Assign_gtids_to_anonymous_transactions_type` enum('OFF','LOCAL','UUID') NOT NULL DEFAULT 'OFF' COMMENT 'Indicates whether the channel will generate a new GTID for anonymous transactions. OFF means that anonymous transactions will remain anonymous. LOCAL means that anonymous transactions will be assigned a newly generated GTID based on server_uuid. UUID indicates that anonymous transactions will be assigned a newly generated GTID based on Assign_gtids_to_anonymous_transactions_value',
  `Assign_gtids_to_anonymous_transactions_value` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'Indicates the UUID used while generating GTIDs for anonymous transactions',
  PRIMARY KEY (`Channel_name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Relay Log Information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slave_worker_info`
--

DROP TABLE IF EXISTS `slave_worker_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slave_worker_info` (
  `Id` int unsigned NOT NULL,
  `Relay_log_name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `Relay_log_pos` bigint unsigned NOT NULL,
  `Master_log_name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `Master_log_pos` bigint unsigned NOT NULL,
  `Checkpoint_relay_log_name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `Checkpoint_relay_log_pos` bigint unsigned NOT NULL,
  `Checkpoint_master_log_name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `Checkpoint_master_log_pos` bigint unsigned NOT NULL,
  `Checkpoint_seqno` int unsigned NOT NULL,
  `Checkpoint_group_size` int unsigned NOT NULL,
  `Checkpoint_group_bitmap` blob NOT NULL,
  `Channel_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'The channel on which the replica is connected to a source. Used in Multisource Replication',
  PRIMARY KEY (`Channel_name`,`Id`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Worker Information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slave_worker_info`
--

LOCK TABLES `slave_worker_info` WRITE;
/*!40000 ALTER TABLE `slave_worker_info` DISABLE KEYS */;
INSERT INTO `slave_worker_info` VALUES (1,'',0,'',0,'',0,'',0,0,64,_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',''),(2,'',0,'',0,'',0,'',0,0,64,_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',''),(3,'',0,'',0,'',0,'',0,0,64,_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',''),(4,'',0,'',0,'',0,'',0,0,64,_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0','');
/*!40000 ALTER TABLE `slave_worker_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tables_priv`
--

DROP TABLE IF EXISTS `tables_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tables_priv` (
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `Table_name` char(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `Grantor` varchar(288) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Table_priv` set('Select','Insert','Update','Delete','Create','Drop','Grant','References','Index','Alter','Create View','Show view','Trigger') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `Column_priv` set('Select','Insert','Update','References') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`Host`,`User`,`Db`,`Table_name`),
  KEY `Grantor` (`Grantor`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Table privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tables_priv`
--

LOCK TABLES `tables_priv` WRITE;
/*!40000 ALTER TABLE `tables_priv` DISABLE KEYS */;
INSERT INTO `tables_priv` VALUES ('localhost','mysql','mysql.session','user','boot@','2024-09-01 18:46:18','Select',''),('localhost','sys','mysql.sys','sys_config','root@localhost','2024-09-01 18:46:18','Select','');
/*!40000 ALTER TABLE `tables_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone`
--

DROP TABLE IF EXISTS `time_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_zone` (
  `Time_zone_id` int unsigned NOT NULL AUTO_INCREMENT,
  `Use_leap_seconds` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Time_zone_id`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Time zones';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone`
--

LOCK TABLES `time_zone` WRITE;
/*!40000 ALTER TABLE `time_zone` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone_leap_second`
--

DROP TABLE IF EXISTS `time_zone_leap_second`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_zone_leap_second` (
  `Transition_time` bigint NOT NULL,
  `Correction` int NOT NULL,
  PRIMARY KEY (`Transition_time`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Leap seconds information for time zones';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone_leap_second`
--

LOCK TABLES `time_zone_leap_second` WRITE;
/*!40000 ALTER TABLE `time_zone_leap_second` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_leap_second` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone_name`
--

DROP TABLE IF EXISTS `time_zone_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_zone_name` (
  `Name` char(64) NOT NULL,
  `Time_zone_id` int unsigned NOT NULL,
  PRIMARY KEY (`Name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Time zone names';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone_name`
--

LOCK TABLES `time_zone_name` WRITE;
/*!40000 ALTER TABLE `time_zone_name` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone_transition`
--

DROP TABLE IF EXISTS `time_zone_transition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_zone_transition` (
  `Time_zone_id` int unsigned NOT NULL,
  `Transition_time` bigint NOT NULL,
  `Transition_type_id` int unsigned NOT NULL,
  PRIMARY KEY (`Time_zone_id`,`Transition_time`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Time zone transitions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone_transition`
--

LOCK TABLES `time_zone_transition` WRITE;
/*!40000 ALTER TABLE `time_zone_transition` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_transition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone_transition_type`
--

DROP TABLE IF EXISTS `time_zone_transition_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_zone_transition_type` (
  `Time_zone_id` int unsigned NOT NULL,
  `Transition_type_id` int unsigned NOT NULL,
  `Offset` int NOT NULL DEFAULT '0',
  `Is_DST` tinyint unsigned NOT NULL DEFAULT '0',
  `Abbreviation` char(8) NOT NULL DEFAULT '',
  PRIMARY KEY (`Time_zone_id`,`Transition_type_id`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Time zone transition types';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone_transition_type`
--

LOCK TABLES `time_zone_transition_type` WRITE;
/*!40000 ALTER TABLE `time_zone_transition_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_transition_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `Select_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Reload_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Shutdown_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Process_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `File_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Show_db_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Super_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Repl_slave_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Repl_client_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Create_user_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Event_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Trigger_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Create_tablespace_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `ssl_type` enum('','ANY','X509','SPECIFIED') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `ssl_cipher` blob NOT NULL,
  `x509_issuer` blob NOT NULL,
  `x509_subject` blob NOT NULL,
  `max_questions` int unsigned NOT NULL DEFAULT '0',
  `max_updates` int unsigned NOT NULL DEFAULT '0',
  `max_connections` int unsigned NOT NULL DEFAULT '0',
  `max_user_connections` int unsigned NOT NULL DEFAULT '0',
  `plugin` char(64) COLLATE utf8mb3_bin NOT NULL DEFAULT 'caching_sha2_password',
  `authentication_string` text COLLATE utf8mb3_bin,
  `password_expired` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `password_last_changed` timestamp NULL DEFAULT NULL,
  `password_lifetime` smallint unsigned DEFAULT NULL,
  `account_locked` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Create_role_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Drop_role_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Password_reuse_history` smallint unsigned DEFAULT NULL,
  `Password_reuse_time` smallint unsigned DEFAULT NULL,
  `Password_require_current` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `User_attributes` json DEFAULT NULL,
  PRIMARY KEY (`Host`,`User`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Users and global privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('%','master_user','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','Y','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0,'caching_sha2_password','$A$005$7>x6b+3C1@s	tdSZu/3KZiXTANLW2.i6fCb2B7loLclSCcBUCVPxLzCc1FC','N','2024-11-13 09:34:37',NULL,'N','N','N',NULL,NULL,NULL,NULL),('%','repl','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','Y','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0,'caching_sha2_password','$A$005$R\ZZ,_N_m+<Pid\\n7SBzfHfokQbACUbiDC4QKaoULaj4.GmsQzGBBPcJh.','N','2024-11-13 18:22:24',NULL,'N','N','N',NULL,NULL,NULL,NULL),('%','replicator','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','Y','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0,'caching_sha2_password','$A$005$u^/>`-kR@/ut!y	\'J/7F1GoF6AAhBBLCd4xWBkMNE08XphmA8jdVLNyER0e8','N','2024-11-06 12:42:29',NULL,'N','N','N',NULL,NULL,NULL,NULL),('%','root','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0,'caching_sha2_password','$A$005$dx}uB\nrnOg	H)JQXQSS.q/595ggz7kKDpHQXT1AyvUM3jEjqjBHuLx4M1.6','N','2024-11-13 11:13:54',NULL,'N','N','N',NULL,NULL,NULL,NULL),('localhost','debian-sys-maint','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','','','','',0,0,0,0,'caching_sha2_password','$A$005$\r>[B\Z9_071%#[ KaHW2IrIGV9El.eO7be64UPr4Xh3G8356vgKO8v5LulGA','N','2024-09-01 18:46:20',NULL,'N','Y','Y',NULL,NULL,NULL,NULL),('localhost','mysql.infoschema','Y','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0,'caching_sha2_password','$A$005$THISISACOMBINATIONOFINVALIDSALTANDPASSWORDTHATMUSTNEVERBRBEUSED','N','2024-09-01 18:46:18',NULL,'Y','N','N',NULL,NULL,NULL,NULL),('localhost','mysql.session','N','N','N','N','N','N','N','Y','N','N','N','N','N','N','N','Y','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0,'caching_sha2_password','$A$005$THISISACOMBINATIONOFINVALIDSALTANDPASSWORDTHATMUSTNEVERBRBEUSED','N','2024-09-01 18:46:17',NULL,'Y','N','N',NULL,NULL,NULL,NULL),('localhost','mysql.sys','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0,'caching_sha2_password','$A$005$THISISACOMBINATIONOFINVALIDSALTANDPASSWORDTHATMUSTNEVERBRBEUSED','N','2024-09-01 18:46:18',NULL,'Y','N','N',NULL,NULL,NULL,NULL),('localhost','root','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','','','','',0,0,0,0,'mysql_native_password','*81F5E21E35407D884A6CD4A731AEBFB6AF209E1B','N','2024-09-20 14:18:38',NULL,'N','Y','Y',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `general_log`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `general_log` (
  `event_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `user_host` mediumtext NOT NULL,
  `thread_id` bigint unsigned NOT NULL,
  `server_id` int unsigned NOT NULL,
  `command_type` varchar(64) NOT NULL,
  `argument` mediumblob NOT NULL
) ENGINE=CSV DEFAULT CHARSET=utf8mb3 COMMENT='General log';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slow_log`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `slow_log` (
  `start_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `user_host` mediumtext NOT NULL,
  `query_time` time(6) NOT NULL,
  `lock_time` time(6) NOT NULL,
  `rows_sent` int NOT NULL,
  `rows_examined` int NOT NULL,
  `db` varchar(512) NOT NULL,
  `last_insert_id` int NOT NULL,
  `insert_id` int NOT NULL,
  `server_id` int unsigned NOT NULL,
  `sql_text` mediumblob NOT NULL,
  `thread_id` bigint unsigned NOT NULL
) ENGINE=CSV DEFAULT CHARSET=utf8mb3 COMMENT='Slow log';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `dbresourcehumaine`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbresourcehumaine` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `dbresourcehumaine`;

--
-- Table structure for table `Annonce`
--

DROP TABLE IF EXISTS `Annonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Annonce` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idDepartement` int DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `idDiplome` int DEFAULT NULL,
  `idExperience` int DEFAULT NULL,
  `nombrePersonne` int DEFAULT NULL,
  `annonce` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idDepartement` (`idDepartement`),
  KEY `idDiplome` (`idDiplome`),
  KEY `idExperience` (`idExperience`),
  CONSTRAINT `Annonce_ibfk_1` FOREIGN KEY (`idDepartement`) REFERENCES `Departement` (`id`),
  CONSTRAINT `Annonce_ibfk_2` FOREIGN KEY (`idDiplome`) REFERENCES `Diplome` (`id`),
  CONSTRAINT `Annonce_ibfk_3` FOREIGN KEY (`idExperience`) REFERENCES `Experience` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Annonce`
--

LOCK TABLES `Annonce` WRITE;
/*!40000 ALTER TABLE `Annonce` DISABLE KEYS */;
INSERT INTO `Annonce` VALUES (1,1,'Recherche développeur full-stack',1,1,2,'Offre de Développeur'),(2,2,'Ingénieur génie civil pour projets d\'infrastructure',2,2,1,'Offre d\'Ingénieur'),(3,3,'Analyste de données pour l\'analyse de marché',3,3,3,'Offre d\'Analyste'),(4,1,'exper en js , et scss',1,1,4,'offre dev Web ');
/*!40000 ALTER TABLE `Annonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CV`
--

DROP TABLE IF EXISTS `CV`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CV` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) DEFAULT NULL,
  `dateNaissance` date NOT NULL,
  `dateEtat` timestamp NULL DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `numero` varchar(15) DEFAULT NULL,
  `etat` int NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `salaire` double DEFAULT NULL,
  `idDepartement` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idDepartement` (`idDepartement`),
  CONSTRAINT `CV_ibfk_1` FOREIGN KEY (`idDepartement`) REFERENCES `Departement` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CV`
--

LOCK TABLES `CV` WRITE;
/*!40000 ALTER TABLE `CV` DISABLE KEYS */;
INSERT INTO `CV` VALUES (1,'Dupont','Jean','1990-01-15','2024-11-10 16:57:01','jean.dupont@example.com','+261320000001',3,'image1.jpg',45000,1),(2,'Martin','Paul','1985-03-22','2024-11-10 16:57:01','paul.martin@example.com','+261320000002',2,'image2.jpg',55000,2),(3,'Durand','Sophie','1992-07-12','2024-11-10 16:57:01','sophie.durand@example.com','+261320000003',4,'image3.jpg',60000,3),(4,'RANDRIANARISOA','Ravotiana','2003-07-30','2024-11-10 16:57:01','ravotina3@gmail.com','0327997740',1,'IMG_5537.jpeg',0,1),(10,'RANDRIANARISOA','Ravotiana','2024-11-10','2024-11-10 16:57:01','ravotina3@gmail.com','0327997740',1,'3292110_rectiffier_pasteur.png',6000000,2),(11,'RANDRIANARISOA','Ravotiana','2024-11-16','2024-11-10 16:57:01','ravotina3@gmail.com','0327997740',1,'3292110_rectiffier_pasteur.png',6000000,2),(12,'RANDRIANARISOA','Ravotiana','2024-11-10','2024-11-10 16:57:01','ravotina3@gmail.com','0327997740',1,'3292110_rectiffier.png',6000000,2),(13,'RANDRIANARISOA','Ravotiana','2024-11-10','2024-11-10 16:57:01','ravotina3@gmail.com','0327997740',1,'Capture d\'écran 2024-10-20 161208.png',6000000,2),(14,'Mikajy','RAMANANDRAITSIORY','1998-06-09',NULL,'ramsmikajy@gmail.com','0326527179',4,'calendrier_scolaire.jpg',10000000,1);
/*!40000 ALTER TABLE `CV` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `CV_With_Duree`
--

DROP TABLE IF EXISTS `CV_With_Duree`;
/*!50001 DROP VIEW IF EXISTS `CV_With_Duree`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `CV_With_Duree` AS SELECT 
 1 AS `id`,
 1 AS `nom`,
 1 AS `prenom`,
 1 AS `dateNaissance`,
 1 AS `email`,
 1 AS `numero`,
 1 AS `dateEtat`,
 1 AS `etat`,
 1 AS `idDepartement`,
 1 AS `duree`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Contract`
--

DROP TABLE IF EXISTS `Contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Contract` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idCv` int DEFAULT NULL,
  `dateFin` date DEFAULT NULL,
  `typeContract` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contract`
--

LOCK TABLES `Contract` WRITE;
/*!40000 ALTER TABLE `Contract` DISABLE KEYS */;
INSERT INTO `Contract` VALUES (1,1,'2025-12-31','CDI'),(2,2,'2024-06-30','CDD'),(3,3,'2026-09-15','CDI');
/*!40000 ALTER TABLE `Contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cv_Diplome`
--

DROP TABLE IF EXISTS `Cv_Diplome`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cv_Diplome` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idDiplome` int DEFAULT NULL,
  `idCv` int DEFAULT NULL,
  `dateObtention` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idDiplome` (`idDiplome`),
  KEY `idCv` (`idCv`),
  CONSTRAINT `Cv_Diplome_ibfk_1` FOREIGN KEY (`idDiplome`) REFERENCES `Diplome` (`id`),
  CONSTRAINT `Cv_Diplome_ibfk_2` FOREIGN KEY (`idCv`) REFERENCES `CV` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cv_Diplome`
--

LOCK TABLES `Cv_Diplome` WRITE;
/*!40000 ALTER TABLE `Cv_Diplome` DISABLE KEYS */;
INSERT INTO `Cv_Diplome` VALUES (1,1,1,'2015-06-30'),(2,2,2,'2012-09-15'),(3,3,3,'2018-11-20'),(4,1,4,'2024-11-10'),(12,1,10,'2024-11-16'),(13,1,11,'2024-11-10'),(14,1,12,'2024-11-10'),(15,2,12,'2024-11-01'),(16,1,13,'2024-11-09'),(17,1,14,'2010-07-14'),(18,3,14,'2017-06-15');
/*!40000 ALTER TABLE `Cv_Diplome` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cv_Experience`
--

DROP TABLE IF EXISTS `Cv_Experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cv_Experience` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idExperience` int DEFAULT NULL,
  `idCv` int DEFAULT NULL,
  `anneExperience` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idExperience` (`idExperience`),
  KEY `idCv` (`idCv`),
  CONSTRAINT `Cv_Experience_ibfk_1` FOREIGN KEY (`idExperience`) REFERENCES `Experience` (`id`),
  CONSTRAINT `Cv_Experience_ibfk_2` FOREIGN KEY (`idCv`) REFERENCES `CV` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cv_Experience`
--

LOCK TABLES `Cv_Experience` WRITE;
/*!40000 ALTER TABLE `Cv_Experience` DISABLE KEYS */;
INSERT INTO `Cv_Experience` VALUES (1,1,1,3),(2,2,2,5),(3,3,3,2),(4,1,4,1),(12,2,10,1),(13,3,10,5),(14,1,11,1),(15,2,11,2),(16,3,11,3),(17,2,12,1),(18,3,12,5),(19,2,13,1),(20,1,14,3),(21,2,14,6);
/*!40000 ALTER TABLE `Cv_Experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Departement`
--

DROP TABLE IF EXISTS `Departement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Departement` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nomDepartement` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Departement`
--

LOCK TABLES `Departement` WRITE;
/*!40000 ALTER TABLE `Departement` DISABLE KEYS */;
INSERT INTO `Departement` VALUES (1,'Informatique'),(2,'Construction'),(3,'Recherche et Développement'),(4,'Human Resources'),(5,'IT Department'),(6,'Communication'),(7,'recrutement');
/*!40000 ALTER TABLE `Departement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Diplome`
--

DROP TABLE IF EXISTS `Diplome`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Diplome` (
  `id` int NOT NULL AUTO_INCREMENT,
  `diplome` varchar(100) DEFAULT NULL,
  `grade` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Diplome`
--

LOCK TABLES `Diplome` WRITE;
/*!40000 ALTER TABLE `Diplome` DISABLE KEYS */;
INSERT INTO `Diplome` VALUES (1,'Licence en Informatique',3),(2,'Master en Génie Civil',5),(3,'Doctorat en Physique',8);
/*!40000 ALTER TABLE `Diplome` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Experience`
--

DROP TABLE IF EXISTS `Experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Experience` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nomExperience` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Experience`
--

LOCK TABLES `Experience` WRITE;
/*!40000 ALTER TABLE `Experience` DISABLE KEYS */;
INSERT INTO `Experience` VALUES (1,'Développeur Web'),(2,'Chef de Projet'),(3,'Analyste de Données');
/*!40000 ALTER TABLE `Experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Login`
--

DROP TABLE IF EXISTS `Login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Login` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `idDepartement` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Login`
--

LOCK TABLES `Login` WRITE;
/*!40000 ALTER TABLE `Login` DISABLE KEYS */;
INSERT INTO `Login` VALUES (1,'asd@gmail.com',' ',1),(2,'ram@gmail.com',' ',2),(3,'ravo@gmail.com',' ',3),(4,'lala@gmail.com',' ',4),(5,'koto@gmail.com',' ',5),(6,'rabe@gmail.com',' ',6),(7,'ketaka@gmail.com',' ',7);
/*!40000 ALTER TABLE `Login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Note`
--

DROP TABLE IF EXISTS `Note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Note` (
  `id` int NOT NULL,
  `idCv` int DEFAULT NULL,
  `note` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Note`
--

LOCK TABLES `Note` WRITE;
/*!40000 ALTER TABLE `Note` DISABLE KEYS */;
/*!40000 ALTER TABLE `Note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Promotion`
--

DROP TABLE IF EXISTS `Promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Promotion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idDepartement` int DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `idDiplome` int DEFAULT NULL,
  `idExperience` int DEFAULT NULL,
  `nombrePersonne` int DEFAULT NULL,
  `annonce` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idDepartement` (`idDepartement`),
  KEY `idDiplome` (`idDiplome`),
  KEY `idExperience` (`idExperience`),
  CONSTRAINT `Promotion_ibfk_1` FOREIGN KEY (`idDepartement`) REFERENCES `Departement` (`id`),
  CONSTRAINT `Promotion_ibfk_2` FOREIGN KEY (`idDiplome`) REFERENCES `Diplome` (`id`),
  CONSTRAINT `Promotion_ibfk_3` FOREIGN KEY (`idExperience`) REFERENCES `Experience` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Promotion`
--

LOCK TABLES `Promotion` WRITE;
/*!40000 ALTER TABLE `Promotion` DISABLE KEYS */;
INSERT INTO `Promotion` VALUES (1,1,'fghjk fghjk fghj',1,2,1,'offre dev Web '),(3,1,'ghjk',1,1,1,'offre dev Web ');
/*!40000 ALTER TABLE `Promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Test`
--

DROP TABLE IF EXISTS `Test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Test` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idCv` int DEFAULT NULL,
  `dateTest` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idCv` (`idCv`),
  CONSTRAINT `Test_ibfk_1` FOREIGN KEY (`idCv`) REFERENCES `CV` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Test`
--

LOCK TABLES `Test` WRITE;
/*!40000 ALTER TABLE `Test` DISABLE KEYS */;
INSERT INTO `Test` VALUES (1,1,'2024-10-01'),(2,2,'2024-10-02'),(3,3,'2024-10-03'),(4,1,'2024-10-30'),(5,2,'2024-11-07'),(6,3,'2024-11-07'),(7,13,'2024-11-07'),(8,14,'2024-11-20');
/*!40000 ALTER TABLE `Test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `master`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `master` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `master`;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test` (
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES ('Fluffy');
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `school`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `school` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `school`;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `age` int NOT NULL,
  `major` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Jean',18,'OUI'),(2,'Rabefakatra',12,'Non'),(3,'Randrongony',24,'OUI');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(252) NOT NULL,
  `token` varchar(252) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Jean',' ','asdafbdbvbcv'),(2,'Rabefakatra',' ','asdafbdbvbcv'),(3,'Randrongony',' ','asdafbdbvbcv');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `session`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `session` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `session`;

--
-- Table structure for table `Session`
--

DROP TABLE IF EXISTS `Session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Session` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `value` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Session`
--

LOCK TABLES `Session` WRITE;
/*!40000 ALTER TABLE `Session` DISABLE KEYS */;
INSERT INTO `Session` VALUES (1,'j38hu7051r2t419goferpv3nks','alika|s:6:\"movony\";'),(2,'j38hu7051r2t419goferpv3nks','alika|s:6:\"movony\";'),(3,'j38hu7051r2t419goferpv3nks','alika|s:6:\"movony\";'),(4,'j38hu7051r2t419goferpv3nks','alika|s:6:\"movony\";'),(5,'j38hu7051r2t419goferpv3nks','alika|s:6:\"movony\";'),(6,'j38hu7051r2t419goferpv3nks','alika|s:6:\"movony\";'),(7,'j38hu7051r2t419goferpv3nks','alika|s:6:\"movony\";'),(8,'j38hu7051r2t419goferpv3nks','alika|s:6:\"movony\";'),(9,'j38hu7051r2t419goferpv3nks','alika|s:6:\"movony\";'),(10,'j38hu7051r2t419goferpv3nks','alika|s:6:\"movony\";'),(11,'j38hu7051r2t419goferpv3nks','alika|s:6:\"movony\";'),(12,'j38hu7051r2t419goferpv3nks','alika|s:6:\"movony\";'),(13,'j38hu7051r2t419goferpv3nks','alika|s:6:\"movony\";'),(14,'j38hu7051r2t419goferpv3nks','alika|s:6:\"movony\";'),(15,'j38hu7051r2t419goferpv3nks','alika|s:6:\"movony\";'),(16,'j38hu7051r2t419goferpv3nks','alika|s:6:\"movony\";'),(17,'j38hu7051r2t419goferpv3nks','alika|s:6:\"movony\";'),(18,'j38hu7051r2t419goferpv3nks','alika|s:6:\"movony\";'),(19,'j38hu7051r2t419goferpv3nks','alika|s:6:\"movony\";'),(20,'j38hu7051r2t419goferpv3nks','alika|s:6:\"movony\";'),(21,'j38hu7051r2t419goferpv3nks','alika|s:6:\"movony\";'),(22,'j38hu7051r2t419goferpv3nks','alika|s:6:\"movony\";'),(23,'j38hu7051r2t419goferpv3nks','alika|s:6:\"movony\";'),(24,'j38hu7051r2t419goferpv3nks','alika|s:6:\"movony\";'),(25,'j38hu7051r2t419goferpv3nks','alika|s:6:\"movony\";'),(26,'j38hu7051r2t419goferpv3nks','alika|s:6:\"movony\";'),(27,'j38hu7051r2t419goferpv3nks','alika|s:6:\"movony\";'),(28,'j38hu7051r2t419goferpv3nks','alika|s:6:\"movony\";'),(29,'j38hu7051r2t419goferpv3nks','alika|s:6:\"movony\";'),(30,'j38hu7051r2t419goferpv3nks','alika|s:6:\"movony\";'),(31,'j38hu7051r2t419goferpv3nks','alika|s:6:\"movony\";'),(32,'j38hu7051r2t419goferpv3nks','alika|s:6:\"movony\";'),(33,'j38hu7051r2t419goferpv3nks','alika|s:6:\"movony\";'),(34,'j38hu7051r2t419goferpv3nks','alika|s:6:\"movony\";'),(35,'j38hu7051r2t419goferpv3nks','alika|s:6:\"movony\";'),(36,'j38hu7051r2t419goferpv3nks','alika|s:6:\"movony\";'),(37,'j38hu7051r2t419goferpv3nks','alika|s:6:\"movony\";'),(38,'j38hu7051r2t419goferpv3nks','alika|s:6:\"movony\";'),(39,'j38hu7051r2t419goferpv3nks','alika|s:6:\"movony\";'),(40,'j38hu7051r2t419goferpv3nks','alika|s:6:\"movony\";'),(41,'j38hu7051r2t419goferpv3nks','alika|s:6:\"movony\";'),(42,'j38hu7051r2t419goferpv3nks','alika|s:6:\"movony\";'),(43,'j38hu7051r2t419goferpv3nks','alika|s:6:\"movony\";'),(44,'j38hu7051r2t419goferpv3nks','alika|s:6:\"movony\";'),(45,'j38hu7051r2t419goferpv3nks','alika|s:6:\"movony\";');
/*!40000 ALTER TABLE `Session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `test`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `test` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `test`;

--
-- Current Database: `vary`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `vary` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `vary`;

--
-- Table structure for table `Charge`
--

DROP TABLE IF EXISTS `Charge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Charge` (
  `id` int NOT NULL AUTO_INCREMENT,
  `charge` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Charge`
--

LOCK TABLES `Charge` WRITE;
/*!40000 ALTER TABLE `Charge` DISABLE KEYS */;
INSERT INTO `Charge` VALUES (1,'ADM'),(2,'Plantation'),(3,'Usine');
/*!40000 ALTER TABLE `Charge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Nature`
--

DROP TABLE IF EXISTS `Nature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Nature` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nature` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Nature`
--

LOCK TABLES `Nature` WRITE;
/*!40000 ALTER TABLE `Nature` DISABLE KEYS */;
INSERT INTO `Nature` VALUES (1,'F'),(2,'V');
/*!40000 ALTER TABLE `Nature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rubrique`
--

DROP TABLE IF EXISTS `Rubrique`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Rubrique` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom_rubrique` varchar(20) DEFAULT NULL,
  `id_unite_oeuvre` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_unite_oeuvre` (`id_unite_oeuvre`),
  CONSTRAINT `Rubrique_ibfk_1` FOREIGN KEY (`id_unite_oeuvre`) REFERENCES `Unite_Oeuvre` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rubrique`
--

LOCK TABLES `Rubrique` WRITE;
/*!40000 ALTER TABLE `Rubrique` DISABLE KEYS */;
INSERT INTO `Rubrique` VALUES (1,'Achat semence',1),(2,'Transport',2),(3,'Eau et electricite',4),(4,'Medicament',2),(5,'Autre charges',2),(6,'Impots et taxes',2),(7,'Stockage',2),(8,'Entretien',2),(9,'Main d oeuvre',2);
/*!40000 ALTER TABLE `Rubrique` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rubrique_Charge`
--

DROP TABLE IF EXISTS `Rubrique_Charge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Rubrique_Charge` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_rubrique` int DEFAULT NULL,
  `id_charge` int DEFAULT NULL,
  `id_type` int DEFAULT NULL,
  `depense` double DEFAULT NULL,
  `nombre` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_rubrique` (`id_rubrique`),
  KEY `id_charge` (`id_charge`),
  KEY `id_type` (`id_type`),
  CONSTRAINT `Rubrique_Charge_ibfk_1` FOREIGN KEY (`id_rubrique`) REFERENCES `Rubrique` (`id`),
  CONSTRAINT `Rubrique_Charge_ibfk_2` FOREIGN KEY (`id_charge`) REFERENCES `Charge` (`id`),
  CONSTRAINT `Rubrique_Charge_ibfk_3` FOREIGN KEY (`id_type`) REFERENCES `Type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rubrique_Charge`
--

LOCK TABLES `Rubrique_Charge` WRITE;
/*!40000 ALTER TABLE `Rubrique_Charge` DISABLE KEYS */;
INSERT INTO `Rubrique_Charge` VALUES (1,1,1,1,0,0),(2,1,1,2,0,0),(3,2,1,1,0,0),(4,2,1,2,5000000,3),(5,3,1,1,0,0),(6,3,1,2,1800000.3,1),(7,4,1,1,0,0),(8,4,1,2,30000000,20),(9,5,1,1,9200000,1),(10,5,1,2,5400000.15,1),(11,6,1,1,0,0),(12,6,1,2,0,0),(13,7,1,1,700000,4),(14,7,1,2,1000000,4),(15,8,1,1,0,0),(16,8,1,2,11100000,4),(17,9,1,1,0,0),(18,9,1,2,500000000,40),(19,1,2,1,0,0),(20,1,2,2,300000000,22),(21,2,2,1,0,0),(22,2,2,2,5000000,3),(23,3,2,1,0,0),(24,3,2,2,1800000.3,1),(25,4,2,1,0,0),(26,4,2,2,30000000,20),(27,5,2,1,1200000,1),(28,5,2,2,1400000,1),(29,6,2,1,1500000,1),(30,6,2,2,1000000,1),(31,7,2,1,700000,4),(32,7,2,2,1000000,4),(33,8,2,1,0,0),(34,8,2,2,11100000,4),(35,9,2,1,0,0),(36,9,2,2,25000000.2,15),(37,1,3,1,0,0),(38,1,3,2,0,0),(39,2,3,1,0,0),(40,2,3,2,5900000,6),(41,3,3,1,0,0),(42,3,3,2,1800000.3,1),(43,4,3,1,0,0),(44,4,3,2,30000000,20),(45,5,3,1,3200000,1),(46,5,3,2,5400000,1),(47,6,3,1,1500000,1),(48,6,3,2,1000000,1),(49,7,3,1,700000,4),(50,7,3,2,1000000,4),(51,8,3,1,0,0),(52,8,3,2,11100000,4),(53,9,3,1,0,0),(54,9,3,2,20000000,10);
/*!40000 ALTER TABLE `Rubrique_Charge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `Rubrique_Charge_Complete`
--

DROP TABLE IF EXISTS `Rubrique_Charge_Complete`;
/*!50001 DROP VIEW IF EXISTS `Rubrique_Charge_Complete`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Rubrique_Charge_Complete` AS SELECT 
 1 AS `id`,
 1 AS `id_rubrique`,
 1 AS `nom_rubrique`,
 1 AS `id_unite`,
 1 AS `unite`,
 1 AS `id_type`,
 1 AS `type`,
 1 AS `depense`,
 1 AS `purcentage`,
 1 AS `id_charge`,
 1 AS `charge`,
 1 AS `nombre`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Rubrique_unite`
--

DROP TABLE IF EXISTS `Rubrique_unite`;
/*!50001 DROP VIEW IF EXISTS `Rubrique_unite`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Rubrique_unite` AS SELECT 
 1 AS `id_rubrique`,
 1 AS `nom_rubrique`,
 1 AS `id_unite`,
 1 AS `unite`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Type`
--

DROP TABLE IF EXISTS `Type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Type`
--

LOCK TABLES `Type` WRITE;
/*!40000 ALTER TABLE `Type` DISABLE KEYS */;
INSERT INTO `Type` VALUES (1,'Fixe'),(2,'Variable');
/*!40000 ALTER TABLE `Type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Unite_Oeuvre`
--

DROP TABLE IF EXISTS `Unite_Oeuvre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Unite_Oeuvre` (
  `id` int NOT NULL AUTO_INCREMENT,
  `unite` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Unite_Oeuvre`
--

LOCK TABLES `Unite_Oeuvre` WRITE;
/*!40000 ALTER TABLE `Unite_Oeuvre` DISABLE KEYS */;
INSERT INTO `Unite_Oeuvre` VALUES (1,'KG'),(2,'Cons periodique'),(3,'LITRES'),(4,'KW'),(5,'Heures de travail'),(6,'Sal men ou HT');
/*!40000 ALTER TABLE `Unite_Oeuvre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `depense_total_par_rubrique`
--

DROP TABLE IF EXISTS `depense_total_par_rubrique`;
/*!50001 DROP VIEW IF EXISTS `depense_total_par_rubrique`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `depense_total_par_rubrique` AS SELECT 
 1 AS `id_rubrique`,
 1 AS `id_unite`,
 1 AS `nom_rubrique`,
 1 AS `unite`,
 1 AS `total_depense`,
 1 AS `nombre_total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `depense_total_par_rubrique_par_type`
--

DROP TABLE IF EXISTS `depense_total_par_rubrique_par_type`;
/*!50001 DROP VIEW IF EXISTS `depense_total_par_rubrique_par_type`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `depense_total_par_rubrique_par_type` AS SELECT 
 1 AS `id_rubrique`,
 1 AS `id_unite`,
 1 AS `id_type`,
 1 AS `nom_rubrique`,
 1 AS `type`,
 1 AS `unite`,
 1 AS `total_depense`*/;
SET character_set_client = @saved_cs_client;

--
-- Current Database: `dbresourcehumaine`
--

USE `dbresourcehumaine`;

--
-- Final view structure for view `CV_With_Duree`
--

/*!50001 DROP VIEW IF EXISTS `CV_With_Duree`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `CV_With_Duree` AS select `CV`.`id` AS `id`,`CV`.`nom` AS `nom`,`CV`.`prenom` AS `prenom`,`CV`.`dateNaissance` AS `dateNaissance`,`CV`.`email` AS `email`,`CV`.`numero` AS `numero`,`CV`.`dateEtat` AS `dateEtat`,`CV`.`etat` AS `etat`,`CV`.`idDepartement` AS `idDepartement`,timestampdiff(MONTH,`CV`.`dateEtat`,now()) AS `duree` from `CV` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Current Database: `master`
--

USE `master`;

--
-- Current Database: `mysql`
--

USE `mysql`;

--
-- Current Database: `school`
--

USE `school`;

--
-- Current Database: `session`
--

USE `session`;

--
-- Current Database: `test`
--

USE `test`;

--
-- Current Database: `vary`
--

USE `vary`;

--
-- Final view structure for view `Rubrique_Charge_Complete`
--

/*!50001 DROP VIEW IF EXISTS `Rubrique_Charge_Complete`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Rubrique_Charge_Complete` AS select `rc`.`id` AS `id`,`rb`.`id_rubrique` AS `id_rubrique`,`rb`.`nom_rubrique` AS `nom_rubrique`,`rb`.`id_unite` AS `id_unite`,`rb`.`unite` AS `unite`,`rc`.`id_type` AS `id_type`,`t`.`type` AS `type`,`rc`.`depense` AS `depense`,((`rc`.`depense` * 100) / (select sum(`rb1`.`depense`) from `Rubrique_Charge` `rb1` where (`rb1`.`id_rubrique` = `rb`.`id_rubrique`))) AS `purcentage`,`rc`.`id_charge` AS `id_charge`,`c`.`charge` AS `charge`,`rc`.`nombre` AS `nombre` from (((`Rubrique_unite` `rb` join `Rubrique_Charge` `rc` on((`rb`.`id_rubrique` = `rc`.`id_rubrique`))) join `Type` `t` on((`t`.`id` = `rc`.`id_type`))) join `Charge` `c` on((`rc`.`id_charge` = `c`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Rubrique_unite`
--

/*!50001 DROP VIEW IF EXISTS `Rubrique_unite`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Rubrique_unite` AS select `rb`.`id` AS `id_rubrique`,`rb`.`nom_rubrique` AS `nom_rubrique`,`uo`.`id` AS `id_unite`,`uo`.`unite` AS `unite` from (`Rubrique` `rb` join `Unite_Oeuvre` `uo` on((`rb`.`id_unite_oeuvre` = `uo`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `depense_total_par_rubrique`
--

/*!50001 DROP VIEW IF EXISTS `depense_total_par_rubrique`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `depense_total_par_rubrique` AS select `Rubrique_Charge_Complete`.`id_rubrique` AS `id_rubrique`,`Rubrique_Charge_Complete`.`id_unite` AS `id_unite`,`Rubrique_Charge_Complete`.`nom_rubrique` AS `nom_rubrique`,`Rubrique_Charge_Complete`.`unite` AS `unite`,sum(`Rubrique_Charge_Complete`.`depense`) AS `total_depense`,sum(`Rubrique_Charge_Complete`.`nombre`) AS `nombre_total` from `Rubrique_Charge_Complete` group by `Rubrique_Charge_Complete`.`id_rubrique` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `depense_total_par_rubrique_par_type`
--

/*!50001 DROP VIEW IF EXISTS `depense_total_par_rubrique_par_type`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `depense_total_par_rubrique_par_type` AS select `Rubrique_Charge_Complete`.`id_rubrique` AS `id_rubrique`,`Rubrique_Charge_Complete`.`id_unite` AS `id_unite`,`Rubrique_Charge_Complete`.`id_type` AS `id_type`,`Rubrique_Charge_Complete`.`nom_rubrique` AS `nom_rubrique`,`Rubrique_Charge_Complete`.`type` AS `type`,`Rubrique_Charge_Complete`.`unite` AS `unite`,sum(`Rubrique_Charge_Complete`.`depense`) AS `total_depense` from `Rubrique_Charge_Complete` group by `Rubrique_Charge_Complete`.`id_rubrique`,`Rubrique_Charge_Complete`.`id_type` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!50606 SET GLOBAL INNODB_STATS_AUTO_RECALC=@OLD_INNODB_STATS_AUTO_RECALC */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-13 21:26:04