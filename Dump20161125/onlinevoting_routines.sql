-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: localhost    Database: onlinevoting
-- ------------------------------------------------------
-- Server version	5.0.16-nt

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
-- Not dumping tablespaces as no INFORMATION_SCHEMA.FILES table on this server
--

--
-- Temporary view structure for view `canview`
--

DROP TABLE IF EXISTS `canview`;
/*!50001 DROP VIEW IF EXISTS `canview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `canview` AS SELECT 
 1 AS `cid`,
 1 AS `name`,
 1 AS `vid`,
 1 AS `bid`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vtview`
--

DROP TABLE IF EXISTS `vtview`;
/*!50001 DROP VIEW IF EXISTS `vtview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vtview` AS SELECT 
 1 AS `vid`,
 1 AS `name`,
 1 AS `adharNo`,
 1 AS `bid`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `canview`
--

/*!50001 DROP VIEW IF EXISTS `canview`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `canview` AS select `candidates`.`cid` AS `cid`,`voters`.`name` AS `name`,`candidates`.`vid` AS `vid`,`voters`.`bid` AS `bid` from (`voters` join `candidates`) where (`candidates`.`vid` = `voters`.`vid`) */;

--
-- Final view structure for view `vtview`
--

/*!50001 DROP VIEW IF EXISTS `vtview`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vtview` AS select `voters`.`vid` AS `vid`,`voters`.`name` AS `name`,`voters`.`adharNo` AS `adharNo`,`voters`.`bid` AS `bid` from `voters` */;

--
-- Dumping routines for database 'onlinevoting'
--
/*!50003 DROP PROCEDURE IF EXISTS `getBid` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE PROCEDURE `getBid`(IN vid INT,OUT bid1 INT)
BEGIN
		SELECT bid INTO bid1 from  voters v where v.vid=vid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getVotes` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE PROCEDURE `getVotes`(IN cid INT,OUT count INT)
BEGIN
	SELECT vote_count INTO count FROM leader l WHERE l.cid=cid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-25 12:14:04
