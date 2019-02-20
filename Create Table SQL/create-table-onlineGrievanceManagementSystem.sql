/* DROP schema */

drop database if exists onlinegreivancemanagementsystem;

/*Create TABLE IF NOT EXISTS */

CREATE DATABASE  IF NOT EXISTS `onlinegreivancemanagementsystem` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `onlinegreivancemanagementsystem`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: onlinegreivancemanagementsystem
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Table structure for table `grievance`
--

DROP TABLE IF EXISTS `grievance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grievance` (
  `grievance_id` int(11) NOT NULL AUTO_INCREMENT,
  `eta` date NOT NULL,
  `category` varchar(150) DEFAULT NULL,
  `description` text,
  `raised_by_id` int(11) NOT NULL,
  `assigned_to_user_id` int(11) NOT NULL,
  PRIMARY KEY (`grievance_id`),
  KEY `raised_by_id_idx` (`raised_by_id`),
  KEY `assigned_to_user_id_idx` (`assigned_to_user_id`),
  CONSTRAINT `assigned_to_user_id` FOREIGN KEY (`assigned_to_user_id`) REFERENCES `user_committee_member` (`user_committee_memeber`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `raised_by_id` FOREIGN KEY (`raised_by_id`) REFERENCES `user_student` (`user_student_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_committee_member`
--

DROP TABLE IF EXISTS `user_committee_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_committee_member` (
  `user_committee_memeber` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `priviledge` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_committee_member`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_student`
--

DROP TABLE IF EXISTS `user_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_student` (
  `user_student_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `email` varchar(100) NOT NULL,
  `priviledge` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`user_student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;


DROP TABLE IF EXISTS `user_principal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_principal` (
  `user_principal_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `priviledge` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_principal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `warning`
--
DROP TABLE IF EXISTS `warning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warning` (
  `warning_id` int(11) NOT NULL,
  `issued_by_id` int(11) NOT NULL,
  `issued_to_id` int(11) NOT NULL,
  PRIMARY KEY (`warning_id`),
  KEY `issued_to_id_idx` (`issued_to_id`),
  KEY `issued_by_id_idx` (`issued_by_id`),
  CONSTRAINT `issued_by_id` FOREIGN KEY (`issued_by_id`) REFERENCES `user_principal` (`user_principal_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `issued_to_id` FOREIGN KEY (`issued_to_id`) REFERENCES `user_committee_member` (`user_committee_memeber`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-10 13:04:01
