-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: 192.168.212.72    Database: tours_v5
-- ------------------------------------------------------
-- Server version	5.7.30-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `_groups`
--

DROP TABLE IF EXISTS `_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_groups` (
  `idgroup` int(11) NOT NULL AUTO_INCREMENT,
  `idcommongroup` int(11) NOT NULL DEFAULT '0',
  `groupdate` date DEFAULT NULL,
  `grouptime` time DEFAULT NULL,
  `idtour` int(11) NOT NULL DEFAULT '0',
  `idguid` int(11) NOT NULL DEFAULT '0',
  `groupamount` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `groupage` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `groupaddition` int(11) DEFAULT NULL,
  `groupstatus` int(11) DEFAULT NULL COMMENT '1 - completed\n2 - confirmed\n4 - deleted\n8 - dontchangeguid',
  `groupstatistic` int(11) DEFAULT NULL,
  `idcategory` int(11) NOT NULL DEFAULT '0',
  `groupcomment` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `groupdeletereason` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `groupnum` int(11) DEFAULT NULL,
  PRIMARY KEY (`idgroup`),
  KEY `fk_groups_tours1_idx` (`idtour`),
  KEY `fk_groups_guids1_idx` (`idguid`),
  KEY `fk_groups_commongroups1_idx` (`idcommongroup`),
  KEY `fk_groups_categories1_idx` (`idcategory`),
  CONSTRAINT `fk_groups_categories1` FOREIGN KEY (`idcategory`) REFERENCES `categories` (`idcategorie`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_groups_commongroups1` FOREIGN KEY (`idcommongroup`) REFERENCES `groupheaders` (`idgroupheader`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_groups_guids1` FOREIGN KEY (`idguid`) REFERENCES `guids` (`idguid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_groups_tours1` FOREIGN KEY (`idtour`) REFERENCES `tours` (`idtour`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4068 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `addition_guids`
--

DROP TABLE IF EXISTS `addition_guids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addition_guids` (
  `iddaysoptions` int(11) NOT NULL,
  `idguid` int(11) NOT NULL,
  PRIMARY KEY (`iddaysoptions`,`idguid`),
  KEY `guidfk_idx` (`idguid`),
  CONSTRAINT `dayoptionsfk` FOREIGN KEY (`iddaysoptions`) REFERENCES `daysoptions` (`iddaysoption`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `guidfk` FOREIGN KEY (`idguid`) REFERENCES `guids` (`idguid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `allgroup`
--

DROP TABLE IF EXISTS `allgroup`;
/*!50001 DROP VIEW IF EXISTS `allgroup`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `allgroup` AS SELECT 
 1 AS `idgroup`,
 1 AS `idcommongroup`,
 1 AS `groupdate`,
 1 AS `grouptime`,
 1 AS `organizationname`,
 1 AS `geoname`,
 1 AS `idtour`,
 1 AS `tourname`,
 1 AS `idguid`,
 1 AS `guidfullname`,
 1 AS `guidshortname`,
 1 AS `groupamount`,
 1 AS `groupage`,
 1 AS `groupaddition`,
 1 AS `groupstatus`,
 1 AS `groupstatistic`,
 1 AS `idcategory`,
 1 AS `groupcomment`,
 1 AS `groupdeletereason`,
 1 AS `groupnum`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `allgroupforsearch`
--

DROP TABLE IF EXISTS `allgroupforsearch`;
/*!50001 DROP VIEW IF EXISTS `allgroupforsearch`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `allgroupforsearch` AS SELECT 
 1 AS `idgroup`,
 1 AS `groupdate`,
 1 AS `grouptime`,
 1 AS `idorganization`,
 1 AS `organizationname`,
 1 AS `tourname`,
 1 AS `guidfullname`,
 1 AS `groupstatus`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `allguids`
--

DROP TABLE IF EXISTS `allguids`;
/*!50001 DROP VIEW IF EXISTS `allguids`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `allguids` AS SELECT 
 1 AS `idguid`,
 1 AS `guidfullname`,
 1 AS `idpost`,
 1 AS `postname`,
 1 AS `guidend`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `allheaders`
--

DROP TABLE IF EXISTS `allheaders`;
/*!50001 DROP VIEW IF EXISTS `allheaders`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `allheaders` AS SELECT 
 1 AS `idgroupheader`,
 1 AS `idorganization`,
 1 AS `organizationname`,
 1 AS `idgeo`,
 1 AS `geoname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `alltours`
--

DROP TABLE IF EXISTS `alltours`;
/*!50001 DROP VIEW IF EXISTS `alltours`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `alltours` AS SELECT 
 1 AS `idtour`,
 1 AS `idexpo_zone`,
 1 AS `expo_zonename`,
 1 AS `idtourtype`,
 1 AS `tourtypedescript`,
 1 AS `tourname`,
 1 AS `tourduration`,
 1 AS `tourpersist`,
 1 AS `tourstart`,
 1 AS `tourend`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `autocompletes`
--

DROP TABLE IF EXISTS `autocompletes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autocompletes` (
  `idautocomplete` int(11) NOT NULL AUTO_INCREMENT,
  `autocompleteword` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `autocompletetype` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`idautocomplete`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `idcategorie` int(11) NOT NULL AUTO_INCREMENT,
  `categoryname` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idcategorie`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commongroup_contacts`
--

DROP TABLE IF EXISTS `commongroup_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commongroup_contacts` (
  `idcommongroup_contact` int(11) NOT NULL AUTO_INCREMENT,
  `idcommongroup` int(11) NOT NULL DEFAULT '0',
  `idcontact` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idcommongroup_contact`,`idcontact`,`idcommongroup`),
  KEY `fk_commongroup_contacts_contacts1_idx` (`idcontact`),
  KEY `fk_commongroup_contacts_commongroups1_idx` (`idcommongroup`),
  CONSTRAINT `fk_commongroup_contacts_commongroups1` FOREIGN KEY (`idcommongroup`) REFERENCES `groupheaders` (`idgroupheader`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_commongroup_contacts_contacts1` FOREIGN KEY (`idcontact`) REFERENCES `contacts` (`idcontact`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2704 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `idcontact` int(11) NOT NULL AUTO_INCREMENT,
  `contactname` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `contactpost` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `contactphone` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idcontact`)
) ENGINE=InnoDB AUTO_INCREMENT=1556 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `daysoptions`
--

DROP TABLE IF EXISTS `daysoptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daysoptions` (
  `iddaysoption` int(11) NOT NULL AUTO_INCREMENT,
  `daysoptiondate` date NOT NULL,
  `workday` tinyint(4) DEFAULT NULL,
  `offcontrol` tinyint(4) DEFAULT '0',
  `obzor` tinyint(4) DEFAULT '0',
  `addguid` tinyint(4) DEFAULT '0',
  `usestarthour` tinyint(4) DEFAULT '0',
  `starthour` int(11) DEFAULT NULL,
  PRIMARY KEY (`iddaysoption`)
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eventgroup_contacts`
--

DROP TABLE IF EXISTS `eventgroup_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventgroup_contacts` (
  `ideventgroup_contact` int(11) NOT NULL AUTO_INCREMENT,
  `ideventgroup` int(11) DEFAULT NULL,
  `idcontact` int(11) DEFAULT NULL,
  PRIMARY KEY (`ideventgroup_contact`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eventgroups`
--

DROP TABLE IF EXISTS `eventgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventgroups` (
  `ideventgroup` int(11) NOT NULL AUTO_INCREMENT,
  `eventgroupdate` date DEFAULT NULL,
  `eventgrouptime` time DEFAULT NULL,
  `idevent` int(11) DEFAULT '0',
  `eventgroupstatus` int(11) DEFAULT '0',
  `eventgroupcomment` text CHARACTER SET utf8 COLLATE utf8_bin,
  `eventgroupdeletereason` text CHARACTER SET utf8 COLLATE utf8_bin,
  `eventgroupmaster` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `eventgroupamount` int(11) DEFAULT NULL,
  `eventgroupstat` int(11) DEFAULT '0',
  `idcategory` int(11) DEFAULT '1',
  `eventgroupage` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `idorganization` int(11) DEFAULT '181',
  `idgeo` int(11) DEFAULT '5',
  PRIMARY KEY (`ideventgroup`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `idevent` int(11) NOT NULL AUTO_INCREMENT,
  `eventname` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `idexpo_zone` int(11) DEFAULT NULL,
  `eventtype` varchar(4) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idevent`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `expo_zones`
--

DROP TABLE IF EXISTS `expo_zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expo_zones` (
  `idexpo_zone` int(11) NOT NULL AUTO_INCREMENT,
  `idfloor` int(11) NOT NULL DEFAULT '0',
  `expo_zonename` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idexpo_zone`,`idfloor`),
  KEY `fk_expo_zones_floors_idx` (`idfloor`),
  CONSTRAINT `fk_expo_zones_floors` FOREIGN KEY (`idfloor`) REFERENCES `floors` (`idfloor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `floors`
--

DROP TABLE IF EXISTS `floors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `floors` (
  `idfloor` int(11) NOT NULL AUTO_INCREMENT,
  `floorname` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idfloor`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `geos`
--

DROP TABLE IF EXISTS `geos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `geos` (
  `idgeo` int(11) NOT NULL AUTO_INCREMENT,
  `geoname` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idgeo`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `groupheaders`
--

DROP TABLE IF EXISTS `groupheaders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groupheaders` (
  `idgroupheader` int(11) NOT NULL AUTO_INCREMENT,
  `idorganization` int(11) NOT NULL DEFAULT '0',
  `idgeo` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idgroupheader`,`idgeo`,`idorganization`),
  KEY `fk_org_geos_geos1_idx` (`idgeo`),
  KEY `fk_org_geos_organizations1_idx` (`idorganization`),
  CONSTRAINT `fk_org_geos_geos1` FOREIGN KEY (`idgeo`) REFERENCES `geos` (`idgeo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_org_geos_organizations1` FOREIGN KEY (`idorganization`) REFERENCES `organizations` (`idorganization`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2795 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `guids`
--

DROP TABLE IF EXISTS `guids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guids` (
  `idguid` int(11) NOT NULL AUTO_INCREMENT,
  `guidfullname` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `guidshortname` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `idpost` int(11) NOT NULL DEFAULT '0',
  `guidaccept` date DEFAULT NULL,
  `guidend` date DEFAULT NULL,
  PRIMARY KEY (`idguid`,`idpost`),
  KEY `fk_guids_posts1_idx` (`idpost`),
  CONSTRAINT `fk_guids_posts1` FOREIGN KEY (`idpost`) REFERENCES `posts` (`idpost`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `missings`
--

DROP TABLE IF EXISTS `missings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `missings` (
  `idmissing` int(11) NOT NULL AUTO_INCREMENT,
  `idguid` int(11) NOT NULL,
  `missingbegin` datetime DEFAULT NULL,
  `missingend` datetime DEFAULT NULL,
  `missingcomment` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `missingnotfullday` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`idmissing`),
  KEY `miss_idguid_idx` (`idguid`),
  CONSTRAINT `miss_idguid` FOREIGN KEY (`idguid`) REFERENCES `guids` (`idguid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `month_options`
--

DROP TABLE IF EXISTS `month_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `month_options` (
  `idmonth_options` int(11) NOT NULL AUTO_INCREMENT,
  `date_` date DEFAULT NULL,
  `add_` tinyint(4) DEFAULT NULL,
  `miss_` tinyint(4) DEFAULT NULL,
  `work_` tinyint(4) DEFAULT NULL,
  `only_miss` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`idmonth_options`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notes` (
  `idnote` int(11) NOT NULL AUTO_INCREMENT,
  `notestartperiod` datetime DEFAULT NULL,
  `noteendperiod` datetime DEFAULT NULL,
  `note` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `notelimit` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`idnote`)
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `organizations`
--

DROP TABLE IF EXISTS `organizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organizations` (
  `idorganization` int(11) NOT NULL AUTO_INCREMENT,
  `organizationname` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idorganization`)
) ENGINE=InnoDB AUTO_INCREMENT=888 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `idpost` int(11) NOT NULL AUTO_INCREMENT,
  `postname` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `post_guidadd` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`idpost`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tours`
--

DROP TABLE IF EXISTS `tours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tours` (
  `idtour` int(11) NOT NULL AUTO_INCREMENT,
  `idexpo_zone` int(11) NOT NULL DEFAULT '0',
  `idtourtype` int(11) NOT NULL DEFAULT '0',
  `tourname` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `tourduration` int(11) DEFAULT NULL,
  `tourpersist` tinyint(4) DEFAULT NULL,
  `tourstart` date DEFAULT NULL,
  `tourend` date DEFAULT NULL,
  PRIMARY KEY (`idtour`,`idexpo_zone`,`idtourtype`),
  KEY `fk_tours_expo_zones1_idx` (`idexpo_zone`),
  KEY `fk_tours_tourtypes1_idx` (`idtourtype`),
  CONSTRAINT `fk_tours_expo_zones1` FOREIGN KEY (`idexpo_zone`) REFERENCES `expo_zones` (`idexpo_zone`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tours_tourtypes1` FOREIGN KEY (`idtourtype`) REFERENCES `tourtypes` (`idtourtype`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tourtypes`
--

DROP TABLE IF EXISTS `tourtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tourtypes` (
  `idtourtype` int(11) NOT NULL AUTO_INCREMENT,
  `tourtypedescript` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idtourtype`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `idusers` int(11) NOT NULL AUTO_INCREMENT,
  `usersname` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `userspass` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `usersrole` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `userscomment` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `userInactive` tinyint(4) NOT NULL DEFAULT '0',
  `login` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idusers`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'tours_v5'
--
/*!50003 DROP PROCEDURE IF EXISTS `DeleteConv` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteConv`()
BEGIN
	delete from contacts;    
	delete from geos;	    
    delete from _groups;
	delete from organizations;    
    delete from _groups;
    delete from groupheaders;
    delete from commongroup_contacts;
    delete from missings;
    delete from notes;
    delete from daysoptions;
    delete from autocompletes;
    delete from addition_guids;
    ALTER TABLE commongroup_contacts 		AUTO_INCREMENT = 1;
    ALTER TABLE autocompletes   AUTO_INCREMENT = 1;
    ALTER TABLE daysoptions		AUTO_INCREMENT = 1;
    ALTER TABLE addition_guids	AUTO_INCREMENT = 1;
    ALTER TABLE missings 		AUTO_INCREMENT = 1;
    ALTER TABLE notes	 		AUTO_INCREMENT = 1;
    ALTER TABLE _groups 		AUTO_INCREMENT = 1;
    ALTER TABLE contacts 		AUTO_INCREMENT = 1;
    ALTER TABLE organizations 	AUTO_INCREMENT = 1;
    ALTER TABLE groupheaders 	AUTO_INCREMENT = 1;
	ALTER TABLE _groups 		AUTO_INCREMENT = 1;
    ALTER TABLE geos 			AUTO_INCREMENT = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAdditionalGuidsOnDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`administrator`@`%` PROCEDURE `GetAdditionalGuidsOnDate`(in date_ date)
BEGIN
	select * from guids where idpost in (select idpost from posts where post_guidadd = 1 and idpost <> 4) and 
    ((date_ > date(guidaccept)) and ((guidend is null) or date_ < guidend)) and 
    idguid not in (select idguid from missings where ((date(date_) >= date(missingbegin) and date(date_) <= date(missingend))and(not missingnotfullday)))
    order by guidfullname;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetBackgroundHelper` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetBackgroundHelper`(in start_date date)
BEGIN
#************************************************************************************
#  Процедура составляет вспомогательную таблицу для создания бэкграунда календаря
#************************************************************************************

    declare damonth, daloop int;
    declare addcount, misscount, workcount, onlymiss int;    
    declare y, m int;
    declare end_date, started date;
	
	set end_date = DATE_ADD(start_date, INTERVAL 42 DAY);    
    set daloop := 1;
	set started = start_date;
    set onlymiss = 0;
    
	delete from month_options;    
    alter table month_options auto_increment = 1;
		WHILE daloop > 0 DO
        
        #Дни с добавленными экскурсоводами
			select count(*) into addcount from 
				(select distinct(daysoptiondate) from daysoptions where 
					iddaysoption in (select distinct(iddaysoptions) from addition_guids) and start_date = daysoptiondate) a;						
                
		#Дни по нештатному расписанию
			select count(*) into workcount from daysoptions where ((daysoption & 1) > 0) and (start_date = daysoptiondate) ;
            
            
		#Дни с отсутствующими экскурсоводами
			select count(*) into misscount from missings 
				where start_date >= date(missingbegin) and start_date <= date(missingend) and (missingcomment <> 'Отпуск');	
                
			if addcount = 0 and workcount = 0 and misscount > 0 then set onlymiss = 1;
				else set onlymiss = 0;
            end if;
            
			insert into month_options(date_, add_, miss_, work_, only_miss) values(start_date, addcount, misscount, workcount, onlymiss);         # always insert the first date...
			set start_date = DATE_ADD(start_date, INTERVAL 1 DAY);
			if start_date = end_date then set daloop := 0;
			end if;
            
            set addcount = 0;
            set misscount = 0;
            set workcount = 0;
		END WHILE;
    
    delete from month_options where (date_ not in (select distinct(daysoptiondate)from daysoptions where (daysoptiondate >= started and daysoptiondate <= end_date)) and only_miss = 0);
    
    
    select * from month_options;    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetContactsByHeaderId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`administrator`@`%` PROCEDURE `GetContactsByHeaderId`(in headerid int)
BEGIN
select * from contacts where idcontact in (SELECT idcontact FROM tours_v5.commongroup_contacts where idcommongroup = headerid);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetContactsByOrganization` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetContactsByOrganization`(in org int)
BEGIN
select * from contacts where idcontact in (select distinct(idcontact) from
(select commongroup_contacts.* from commongroup_contacts where idcommongroup in (SELECT idgroupheader FROM tours_v5.groupheaders where idorganization = org)) a);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetExpoSum` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `GetExpoSum`(in startPeriod date, in endPeriod date)
BEGIN
	select tours.tourname, count(_groups.idgroup) as count
	from _groups
	inner join tours on tours.idtour = _groups.idtour
	where (_groups.groupdate between startPeriod and endPeriod) and
			((_groups.groupstatus & 4) = 4)
	group by tours.tourname order by tours.idtour;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetGuidsByDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetGuidsByDate`(in date_ datetime)
BEGIN 
	select * from guids where 
		(idpost in (SELECT idpost FROM tours_v5.posts where not post_guidadd)) and
        ((date_ between guidaccept and guidend) or (date_ > guidaccept and guidend is null)) and 
        (idguid not in (select idguid from missings where (date_ between missingbegin and missingend)))
	union
    select * from guids where idguid in (select idguid from addition_guids where iddaysoptions in 
        (select iddaysoption from daysoptions where date(date_) = daysoptiondate));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetGuidSum` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `GetGuidSum`(in startPeriod date, in endPeriod date)
BEGIN
	SELECT guids.guidfullname, _groups.idguid, count(_groups.idgroup) as sum
	FROM _groups
	inner join guids on _groups.idguid = guids.idguid
	where (_groups.groupdate between startPeriod and endPeriod) and
			(_groups.groupstatus & 4)  = 4
	group by _groups.idguid order by guids.guidfullname;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetMissingsGuidByDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetMissingsGuidByDate`(in date_ datetime)
BEGIN
	select * from missings where date(date_) >= date(missingbegin) and date(date_) <= date(missingend);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetMissingsGuidByDatetime` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`administrator`@`%` PROCEDURE `GetMissingsGuidByDatetime`(in date_ datetime)
BEGIN
select * from missings where date_ between missingbegin and missingend;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetNotesByDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetNotesByDate`(in date_ datetime)
BEGIN
 select * from notes where date(date_) >= date(notestartperiod) and date(date_) <= date(noteendperiod);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetToursOnDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetToursOnDate`(in date_ date)
BEGIN
	SELECT * FROM tours_v5.tours where((tourstart is null and tourend is null) || date_ >= tourstart and date_ <= tourend);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetWorkedMissings` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetWorkedMissings`()
BEGIN
	select missings.*, guids.guidfullname from missings
	inner join guids on missings.idguid = guids.idguid 
    where missings.idguid in (select guids.idguid from guids where guidend is null) 
    order by missings.idmissing;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `allgroup`
--

/*!50001 DROP VIEW IF EXISTS `allgroup`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `allgroup` AS select `tours_v5`.`_groups`.`idgroup` AS `idgroup`,`tours_v5`.`_groups`.`idcommongroup` AS `idcommongroup`,`tours_v5`.`_groups`.`groupdate` AS `groupdate`,`tours_v5`.`_groups`.`grouptime` AS `grouptime`,`a`.`organizationname` AS `organizationname`,`a`.`geoname` AS `geoname`,`tours_v5`.`_groups`.`idtour` AS `idtour`,`tours_v5`.`tours`.`tourname` AS `tourname`,`tours_v5`.`_groups`.`idguid` AS `idguid`,`tours_v5`.`guids`.`guidfullname` AS `guidfullname`,`tours_v5`.`guids`.`guidshortname` AS `guidshortname`,`tours_v5`.`_groups`.`groupamount` AS `groupamount`,`tours_v5`.`_groups`.`groupage` AS `groupage`,`tours_v5`.`_groups`.`groupaddition` AS `groupaddition`,`tours_v5`.`_groups`.`groupstatus` AS `groupstatus`,`tours_v5`.`_groups`.`groupstatistic` AS `groupstatistic`,`tours_v5`.`_groups`.`idcategory` AS `idcategory`,`tours_v5`.`_groups`.`groupcomment` AS `groupcomment`,`tours_v5`.`_groups`.`groupdeletereason` AS `groupdeletereason`,`tours_v5`.`_groups`.`groupnum` AS `groupnum` from (((`tours_v5`.`_groups` join `tours_v5`.`guids` on((`tours_v5`.`_groups`.`idguid` = `tours_v5`.`guids`.`idguid`))) join `tours_v5`.`tours` on((`tours_v5`.`_groups`.`idtour` = `tours_v5`.`tours`.`idtour`))) join (select `tours_v5`.`groupheaders`.`idgroupheader` AS `idgroupheader`,`tours_v5`.`geos`.`geoname` AS `geoname`,`tours_v5`.`organizations`.`organizationname` AS `organizationname` from ((`tours_v5`.`groupheaders` join `tours_v5`.`geos` on((`tours_v5`.`groupheaders`.`idgeo` = `tours_v5`.`geos`.`idgeo`))) join `tours_v5`.`organizations` on((`tours_v5`.`groupheaders`.`idorganization` = `tours_v5`.`organizations`.`idorganization`)))) `a` on((`tours_v5`.`_groups`.`idcommongroup` = `a`.`idgroupheader`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `allgroupforsearch`
--

/*!50001 DROP VIEW IF EXISTS `allgroupforsearch`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`administrator`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `allgroupforsearch` AS select `tours_v5`.`_groups`.`idgroup` AS `idgroup`,`tours_v5`.`_groups`.`groupdate` AS `groupdate`,`tours_v5`.`_groups`.`grouptime` AS `grouptime`,`a`.`idorganization` AS `idorganization`,`a`.`organizationname` AS `organizationname`,`tours_v5`.`tours`.`tourname` AS `tourname`,`tours_v5`.`guids`.`guidfullname` AS `guidfullname`,`tours_v5`.`_groups`.`groupstatus` AS `groupstatus` from (((`tours_v5`.`_groups` join `tours_v5`.`guids` on((`tours_v5`.`_groups`.`idguid` = `tours_v5`.`guids`.`idguid`))) join `tours_v5`.`tours` on((`tours_v5`.`_groups`.`idtour` = `tours_v5`.`tours`.`idtour`))) join (select `tours_v5`.`groupheaders`.`idgroupheader` AS `idgroupheader`,`tours_v5`.`geos`.`geoname` AS `geoname`,`tours_v5`.`organizations`.`organizationname` AS `organizationname`,`tours_v5`.`groupheaders`.`idorganization` AS `idorganization` from ((`tours_v5`.`groupheaders` join `tours_v5`.`geos` on((`tours_v5`.`groupheaders`.`idgeo` = `tours_v5`.`geos`.`idgeo`))) join `tours_v5`.`organizations` on((`tours_v5`.`groupheaders`.`idorganization` = `tours_v5`.`organizations`.`idorganization`)))) `a` on((`tours_v5`.`_groups`.`idcommongroup` = `a`.`idgroupheader`))) order by `tours_v5`.`_groups`.`idgroup` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `allguids`
--

/*!50001 DROP VIEW IF EXISTS `allguids`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `allguids` AS select `guids`.`idguid` AS `idguid`,`guids`.`guidfullname` AS `guidfullname`,`guids`.`idpost` AS `idpost`,`posts`.`postname` AS `postname`,`guids`.`guidend` AS `guidend` from (`guids` join `posts`) where (`guids`.`idpost` = `posts`.`idpost`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `allheaders`
--

/*!50001 DROP VIEW IF EXISTS `allheaders`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `allheaders` AS select `groupheaders`.`idgroupheader` AS `idgroupheader`,`groupheaders`.`idorganization` AS `idorganization`,`organizations`.`organizationname` AS `organizationname`,`groupheaders`.`idgeo` AS `idgeo`,`geos`.`geoname` AS `geoname` from ((`groupheaders` join `geos` on((`groupheaders`.`idgeo` = `geos`.`idgeo`))) join `organizations` on((`groupheaders`.`idorganization` = `organizations`.`idorganization`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `alltours`
--

/*!50001 DROP VIEW IF EXISTS `alltours`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `alltours` AS select `tours`.`idtour` AS `idtour`,`tours`.`idexpo_zone` AS `idexpo_zone`,`expo_zones`.`expo_zonename` AS `expo_zonename`,`tours`.`idtourtype` AS `idtourtype`,`tourtypes`.`tourtypedescript` AS `tourtypedescript`,`tours`.`tourname` AS `tourname`,`tours`.`tourduration` AS `tourduration`,`tours`.`tourpersist` AS `tourpersist`,`tours`.`tourstart` AS `tourstart`,`tours`.`tourend` AS `tourend` from ((`tours` join `expo_zones` on((`tours`.`idexpo_zone` = `expo_zones`.`idexpo_zone`))) join `tourtypes` on((`tours`.`idtourtype` = `tourtypes`.`idtourtype`))) order by `tours`.`idtour` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-22 21:52:47
