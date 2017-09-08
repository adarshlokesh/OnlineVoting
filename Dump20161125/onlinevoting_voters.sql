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
-- Table structure for table `voters`
--

DROP TABLE IF EXISTS `voters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voters` (
  `vid` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL,
  `adharNo` bigint(20) unsigned NOT NULL,
  `email` varchar(45) NOT NULL,
  `mobile` bigint(20) unsigned NOT NULL,
  `bid` int(10) unsigned NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY  (`vid`),
  KEY `bid` (`bid`),
  CONSTRAINT `bid` FOREIGN KEY (`bid`) REFERENCES `branch` (`bid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voters`
--

LOCK TABLES `voters` WRITE;
/*!40000 ALTER TABLE `voters` DISABLE KEYS */;
INSERT INTO `voters` VALUES (100,'Adarsh',100,'adarsh@gmail.com',8105631592,1,'adi123'),(150,'Tanusha',150,'tanu@gmail.com',9097456734,1,'150'),(200,'Akash',200,'akash@gmail.com',9999999999,1,'akash'),(250,'Darshan',250,'darshan@gmail.com',9878777734,2,'250'),(300,'Rahul',300,'rahul@gmail.com',8889998889,2,'rahul'),(350,'Rakesh',350,'raki@gmail.com',9559556783,2,'350'),(400,'Bharath',400,'bharath@gmail.com',7345623452,2,'400'),(450,'Daranish',450,'daranish@gmail.com',9698878683,4,'450'),(500,'Suhas',500,'suhas@gmail.com',8912345678,2,'500'),(550,'Srujan',550,'sru@gmail.com',9493955677,4,'550'),(600,'Rajath',600,'raj@gmail.com',9797878767,2,'600'),(650,'Sanga',650,'sanga@gmail.com',9900667744,4,'650'),(700,'Harish',700,'har@gmail.com',8080785634,3,'700'),(750,'Rohith',750,'rohith@gmail.com',8723122343,4,'750'),(800,'Gagan',800,'gagan@gmail.com',8899776655,3,'800'),(850,'Raj',850,'rajeev@gmail.com',8117113452,3,'850'),(900,'Raghu',900,'rag@gmail.com',8767563454,3,'900'),(950,'Sriharsha',950,'sriharsha@gmail.com',8765439087,3,'950'),(951,'Varsha',951,'chimay@gmail.com',7411116211,2,'951');
/*!40000 ALTER TABLE `voters` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-25 12:13:58
