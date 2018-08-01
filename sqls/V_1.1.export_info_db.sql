-- MySQL dump 10.13  Distrib 8.0.11, for Win64 (x86_64)
--
-- Host: localhost    Database: epm
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `epm`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `epm` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;

USE `epm`;

--
-- Table structure for table `access_groups`
--

DROP TABLE IF EXISTS `access_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `access_groups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GROUP_NAME` varchar(100) NOT NULL,
  `GROUP_DESC` varchar(255) DEFAULT NULL,
  `ENABLED` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `GROUP_NAME` (`GROUP_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_groups`
--

LOCK TABLES `access_groups` WRITE;
/*!40000 ALTER TABLE `access_groups` DISABLE KEYS */;
INSERT INTO `access_groups` VALUES (1,'Admin','ForAllAccess','Y');
/*!40000 ALTER TABLE `access_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_dropdown`
--

DROP TABLE IF EXISTS `app_dropdown`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `app_dropdown` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DROPDOWN_NAME` varchar(100) DEFAULT NULL,
  `DROPDOWN_KEY` varchar(100) DEFAULT NULL,
  `DROPDOWN_VALUE` varchar(100) DEFAULT NULL,
  `ENABLED` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_dropdown`
--

LOCK TABLES `app_dropdown` WRITE;
/*!40000 ALTER TABLE `app_dropdown` DISABLE KEYS */;
INSERT INTO `app_dropdown` VALUES (2,'TaskType','Meeting','Meeting','Y'),(3,'TaskType','Assignment','Assignment','Y'),(4,'TaskType','Development','Development','Y'),(5,'ProjectName','DAC','DAC','Y'),(6,'ProjectName','DMC','DMC','Y'),(7,'ProjectName','DSSD','DSSD','Y'),(8,'ProjectName','DITISS','DITISS','Y'),(9,'TaskStatus','New','New','Y'),(10,'TaskStatus','InProgress','InProgress','Y'),(11,'TaskStatus','Closed','Closed','Y');
/*!40000 ALTER TABLE `app_dropdown` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tasks` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TASKNAME` varchar(100) DEFAULT NULL,
  `TASKTYPE` varchar(100) DEFAULT NULL,
  `TASKDESC` varchar(255) DEFAULT NULL,
  `TASK_CREATEDATE` datetime DEFAULT NULL,
  `TASK_UPDATEDATE` datetime DEFAULT NULL,
  `TASK_CLOSEDDATE` datetime DEFAULT NULL,
  `OWNER_USERID` varchar(100) DEFAULT NULL,
  `OWNER_GROUPID` varchar(100) DEFAULT NULL,
  `ENABLED` varchar(10) DEFAULT NULL,
  `TASK_COMMITDATE` datetime DEFAULT NULL,
  `TASK_STATUS` varchar(100) DEFAULT NULL,
  `CREATORID` varchar(100) DEFAULT NULL,
  `TASK_STARTDATE` datetime DEFAULT NULL,
  `POINTS` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (21,'Project Development','Assignment','Project Deveworklopment ','2018-08-01 17:10:10','2018-08-01 17:10:10','2018-08-09 00:00:00','Rohit','DSSD','Y','2018-08-03 00:00:00','Closed',NULL,'2018-08-02 00:00:00',130),(22,'Dashboard','Assignment','Dashboard Development','2018-08-01 17:10:41','2018-08-01 17:10:49','2018-08-17 00:00:00','Rohit','DSSD','Y','2018-08-08 00:00:00','Closed',NULL,'2018-08-04 00:00:00',220),(23,'Unit Testing','Assignment','Unit Testing','2018-07-31 00:00:00','2018-08-01 17:11:16','2018-08-23 00:00:00','Rohit','DSSD','Y','2018-08-23 00:00:00','New',NULL,'2018-08-15 00:00:00',80),(24,'Tool Validation','Development','Tool Validation','2018-07-30 00:00:00','2018-08-01 17:15:14','2018-08-09 00:00:00','Admin','DSSD','Y','2018-08-02 00:00:00','New',NULL,'2018-08-01 00:00:00',150),(25,'Project meeting','Meeting','Project meeting to discuss issues','2018-08-01 17:17:11','2018-08-01 17:17:11','2018-08-24 00:00:00','Admin','DAC','Y','2018-08-11 00:00:00','Closed',NULL,'2018-08-03 00:00:00',340);
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks_activity`
--

DROP TABLE IF EXISTS `tasks_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tasks_activity` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TASKID` int(11) DEFAULT NULL,
  `NOTES` varchar(100) DEFAULT NULL,
  `TASKDESC` varchar(255) DEFAULT NULL,
  `TASK_CREATEDATE` datetime DEFAULT NULL,
  `TASK_UPDATEDATE` datetime DEFAULT NULL,
  `TASK_ENDDATE` datetime DEFAULT NULL,
  `TASK_CLOSEDDATE` datetime DEFAULT NULL,
  `OWNER_USERID` varchar(100) DEFAULT NULL,
  `OWNER_GROUPID` varchar(100) DEFAULT NULL,
  `ENABLED` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `TASKID` (`TASKID`),
  CONSTRAINT `tasks_activity_ibfk_1` FOREIGN KEY (`TASKID`) REFERENCES `tasks` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks_activity`
--

LOCK TABLES `tasks_activity` WRITE;
/*!40000 ALTER TABLE `tasks_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasks_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_access_groups`
--

DROP TABLE IF EXISTS `user_access_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_access_groups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USERID` varchar(100) DEFAULT NULL,
  `GROUPID` varchar(100) DEFAULT NULL,
  `ENABLED` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `GROUPID` (`GROUPID`),
  KEY `USERID` (`USERID`),
  CONSTRAINT `user_access_groups_ibfk_1` FOREIGN KEY (`GROUPID`) REFERENCES `access_groups` (`group_name`),
  CONSTRAINT `user_access_groups_ibfk_2` FOREIGN KEY (`USERID`) REFERENCES `user_details` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_access_groups`
--

LOCK TABLES `user_access_groups` WRITE;
/*!40000 ALTER TABLE `user_access_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_access_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_details`
--

DROP TABLE IF EXISTS `user_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_details` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USERID` varchar(100) NOT NULL,
  `FIRST_NAME` varchar(100) DEFAULT NULL,
  `LAST_NAME` varchar(100) DEFAULT NULL,
  `EMAILID` varchar(100) DEFAULT NULL,
  `PASSWORD` varchar(100) DEFAULT NULL,
  `ENABLED` varchar(10) DEFAULT NULL,
  `DESIGNATION` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(100) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `ADDRESS` varchar(255) DEFAULT NULL,
  `AGE` int(11) DEFAULT NULL,
  `USERGROUP` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `USERID` (`USERID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_details`
--

LOCK TABLES `user_details` WRITE;
/*!40000 ALTER TABLE `user_details` DISABLE KEYS */;
INSERT INTO `user_details` VALUES (1,'123','rahul','sawaw','rahul.sawan@amdocs.com','123',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,'Rohit','Rohit','Rohit','Rohit@CDAC.com','$2a$10$4GYZAT/w/Gyw28TODlwOLO1U7QF4Jyo72CjJFtu1eRioEHmSXiqrm','Y','Developer',NULL,NULL,NULL,NULL,'DAC'),(14,'Admin','Admin','Admin','Admin@CDAC.com','$2a$10$HTIMQH3aotcHqDbZX2kJse3d2OAQSq4./0MjTivmKDkEWFX7JcK7q','Y','Admin',NULL,NULL,NULL,NULL,'DAC');
/*!40000 ALTER TABLE `user_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_hierarchy`
--

DROP TABLE IF EXISTS `user_hierarchy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_hierarchy` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USERID` varchar(100) NOT NULL,
  `PARENT_USERID` varchar(100) DEFAULT NULL,
  `PARENT_USERID_RELATION` varchar(100) DEFAULT NULL,
  `ENABLED` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `USERID` (`USERID`),
  CONSTRAINT `user_hierarchy_ibfk_1` FOREIGN KEY (`USERID`) REFERENCES `user_details` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_hierarchy`
--

LOCK TABLES `user_hierarchy` WRITE;
/*!40000 ALTER TABLE `user_hierarchy` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_hierarchy` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-01 17:32:56
