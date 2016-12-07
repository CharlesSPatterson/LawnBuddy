CREATE DATABASE  IF NOT EXISTS `lawnbuddy` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `lawnbuddy`;
-- MySQL dump 10.13  Distrib 5.7.16, for Win64 (x86_64)
--
-- Host: localhost    Database: lawnbuddy
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Table structure for table `tbl_bids`
--

DROP TABLE IF EXISTS `tbl_bids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_bids` (
  `bid_id` int(11) NOT NULL AUTO_INCREMENT,
  `home_id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  PRIMARY KEY (`bid_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_bids`
--

LOCK TABLES `tbl_bids` WRITE;
/*!40000 ALTER TABLE `tbl_bids` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_bids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_homes`
--

DROP TABLE IF EXISTS `tbl_homes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_homes` (
  `home_id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `zipcode` varchar(10) DEFAULT NULL,
  `phonenumber` varchar(10) DEFAULT NULL,
  `groundsize` int(4) DEFAULT '0',
  `notes` varchar(5000) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`home_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10232 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_homes`
--

LOCK TABLES `tbl_homes` WRITE;
/*!40000 ALTER TABLE `tbl_homes` DISABLE KEYS */;
INSERT INTO `tbl_homes` VALUES (7,'13 Lawnside Rd','Cheltenham','PA','19012','2674746860',5012,'hello world',19),(56,'123 Fake Street','Bronx','NY','12345','1234567890',207,'nothing to see here',34),(10231,'421 Jump Street','Los Angeles','CA','90210','1234567890',6,'nothing to see here again',37);
/*!40000 ALTER TABLE `tbl_homes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_reviews`
--

DROP TABLE IF EXISTS `tbl_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_reviews` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `review` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_reviews`
--

LOCK TABLES `tbl_reviews` WRITE;
/*!40000 ALTER TABLE `tbl_reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_users`
--

DROP TABLE IF EXISTS `tbl_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_users` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `user_username` varchar(255) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `user_type` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_users`
--

LOCK TABLES `tbl_users` WRITE;
/*!40000 ALTER TABLE `tbl_users` DISABLE KEYS */;
INSERT INTO `tbl_users` VALUES (19,'cust','cust@cust','pbkdf2:sha1:1000$DaNsKBaj$006dc2177e6da9dd7d2d97a5b7d7046c90f46f36',0),(20,'vend','vend@vend','pbkdf2:sha1:1000$U6sA0E9e$f711bb3cc816d3fb9dddcc55070865c463aaaea8',1);
/*!40000 ALTER TABLE `tbl_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_vendors`
--

DROP TABLE IF EXISTS `tbl_vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_vendors` (
  `vendor_id` int(11) NOT NULL AUTO_INCREMENT,
  `price_per_sf` int(20) NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  `notes` varchar(5000) DEFAULT NULL,
  `rating` int(10) DEFAULT '0',
  PRIMARY KEY (`vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_vendors`
--

LOCK TABLES `tbl_vendors` WRITE;
/*!40000 ALTER TABLE `tbl_vendors` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_vendors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'lawnbuddy'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_createUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_createUser`(
    IN p_name VARCHAR(255),
    IN p_username VARCHAR(255),
    IN p_password VARCHAR(255),
    IN p_type TINYINT(1)
)
BEGIN
    if ( select exists (select 1 from tbl_users where user_username = p_username) ) THEN
     
        select 'Username Exists !!';
     
    ELSE
     
        insert into tbl_users
        (
            user_name,
            user_username,
            user_password,
            user_type
        )
        values
        (
            p_name,
            p_username,
            p_password,
            p_type
        );
     
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_updateHome` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updateHome`(
    IN p_address varchar(255),
    IN p_city varchar(255),
    IN p_groundsize int(4),
    IN p_phonenumber varchar(10),
    IN p_state varchar(2),
    IN p_notes varchar(5000),
    IN p_zipcode varchar(10),
    IN p_user_id bigint
)
BEGIN
    if ( select exists (select 1 from tbl_homes where user_id = p_user_id) ) THEN
     
		UPDATE
		tbl_homes
		SET
		`address` = p_address,
		`city` = p_city,
		`state` = p_state,
		`zipcode` = p_zipcode,
		`phonenumber` = p_phonenumber,
		`groundsize` = p_groundsize,
		`notes` = p_notes
		WHERE `user_id` = p_user_id;
     
    ELSE

    insert into tbl_homes(
        address,
        city,
        groundsize,
        phonenumber,
        state,
        notes,
        zipcode,
        user_id
    )
    values
    (
		p_address,
		p_city,
		p_groundsize,
		p_phonenumber,
		p_state,
		p_notes,
		p_zipcode,
		p_user_id
    );
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_validateLogin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_validateLogin`(
IN p_username VARCHAR(255)
)
BEGIN
    select * from tbl_users where user_username = p_username;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-07  7:35:57
