CREATE DATABASE  IF NOT EXISTS `lawnbuddy` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `lawnbuddy`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
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
  `vendor_id` int(11) NOT NULL,
  `bid_price` int(20) NOT NULL,
  `accepted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`bid_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_bids`
--

LOCK TABLES `tbl_bids` WRITE;
/*!40000 ALTER TABLE `tbl_bids` DISABLE KEYS */;
INSERT INTO `tbl_bids` VALUES (1,7,2,34,0),(2,35,2,35,0),(3,1,2,25,0),(4,7,3,7,0);
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
  `presetgroundsize` varchar(20) DEFAULT NULL,
  `notes` varchar(5000) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`home_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10236 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_homes`
--

LOCK TABLES `tbl_homes` WRITE;
/*!40000 ALTER TABLE `tbl_homes` DISABLE KEYS */;
INSERT INTO `tbl_homes` VALUES (7,'13 Lawnside Rd','Cheltenham','PA','19012','2674746860',400,'Medium','magic',19),(56,'123 Fake Street','Bronx','NY','12345','1234567890',207,NULL,'nothing to see here',34),(10231,'421 Jump Street','Los Angeles','CA','90210','1234567890',6,NULL,'nothing to see here again',37),(10232,'133 Lawnside Rd','Cheltenham','PA','19012','2674746860',11,NULL,'testing 123',20),(10233,'13 Lawnside Rd','Cheltenham','PA','19012','2674746860',100,NULL,'I have very high shrubs',21),(10234,'more','fake','AR','19120','126738249',45,'Medium','lots of stuff',24),(10235,'13 Lawnside Rd','Cheltenham','PA','19012','2674746860',1,'Small','stuff',25);
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_users`
--

LOCK TABLES `tbl_users` WRITE;
/*!40000 ALTER TABLE `tbl_users` DISABLE KEYS */;
INSERT INTO `tbl_users` VALUES (19,'cust','cust@cust','pbkdf2:sha1:1000$cr9dNmll$7f5d7aee60870397c1aebd55c3c350228164d554',0),(21,'chuck','chuck@gmail.com','pbkdf2:sha1:1000$nwoyFAoS$bc8cd9313760cada9a5b0639fb6cb178dd1459d8',0),(22,'vend','vend@vend','pbkdf2:sha1:1000$nd3J25t4$737f01ed3d77277b41d5e9cc0788e4646657a7b8',1),(23,'chuck2','chuck2@gmail.com','pbkdf2:sha1:1000$ooBeEMI3$53a3e82250e22f03df8a3232cd02e0e89e2be0a3',0),(24,'thing','thing@thing','pbkdf2:sha1:1000$j7L2iijI$f381e24b340378343f51c7212b12847572a9b91f',0),(26,'vend2','vend2@vend','pbkdf2:sha1:1000$dlrnsTpW$519b139028f3f7d9e04b39e7ec61df7e6b99dafd',1),(27,'vendor3','vendor3@vend','pbkdf2:sha1:1000$yxFtOr9P$a3df71d3e677e3edd5110e030bdb01561ceb2a83',1);
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
  `phonenumber` varchar(10) NOT NULL,
  `notes` varchar(5000) DEFAULT NULL,
  `rating` int(10) DEFAULT '0',
  `state` varchar(2) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`vendor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_vendors`
--

LOCK TABLES `tbl_vendors` WRITE;
/*!40000 ALTER TABLE `tbl_vendors` DISABLE KEYS */;
INSERT INTO `tbl_vendors` VALUES (1,15,'1234567890','I charge a lot',0,'PA',20),(2,20,'12345678','nothing',0,'RI',26),(3,50,'1234567','Love',0,'PA',27);
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_getCurrentBid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getCurrentBid`(
    IN p_home_id int(11)
)
BEGIN
	SELECT *, MIN(bid_price) as lowestBid
    FROM lawnbuddy.tbl_bids, tbl_users, tbl_homes
    WHERE tbl_bids.home_id = p_home_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getHomeID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getHomeID`(
    IN p_user_id bigint
)
BEGIN
	SELECT home_id, user_id
    FROM lawnbuddy.tbl_homes
    WHERE user_id = p_user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetHousesForVendors` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetHousesForVendors`(
IN p_user_id bigint
)
BEGIN
    select * from tbl_homes where user_id != p_user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getVendorID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getVendorID`(
    IN p_user_id bigint
)
BEGIN
	SELECT vendor_id, user_id
    FROM lawnbuddy.tbl_vendors
    WHERE user_id = p_user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_submitBid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_submitBid`(
    IN p_home_id int(11),
	IN p_vendor_id int(11),
    IN p_bid_price int(20)
)
BEGIN
    if ( select exists (select 1 from tbl_bids where vendor_id = p_vendor_id and home_id = p_home_id) ) THEN
     
		UPDATE
		tbl_bids
		SET
		`bid_price` = p_bid_price
		WHERE `vendor_id` = p_vendor_id
        AND `home_id` = p_home_id;
     
    ELSE

    insert into tbl_bids(
        home_id,
        vendor_id,
        bid_price
    )
    values
    (
		p_home_id,
		p_vendor_id,
		p_bid_price
    );
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_submitReview` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_submitReview`(
    IN p_vendor_id int(11),
    IN p_rating int(10),
    IN p_review varchar(5000),
    IN p_user_id bigint
)
BEGIN
    if ( select exists (select 1 from tbl_reviews where user_id = p_user_id and vendor_id = p_vendor_id) ) THEN
     
		UPDATE
		tbl_reviews
		SET
		`rating` = p_rating,
		`review` = p_review
		WHERE `user_id` = p_user_id
        AND `vendor_id` = p_vendor_id;
     
    ELSE

    insert into tbl_reviews(
        vendor_id,
        rating,
        review,
        user_id
    )
    values
    (
		p_vendor_id,
		p_rating,
		p_review,
        p_user_id
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
    IN p_presetgroundsize varchar(20),
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
        `presetgroundsize` = p_presetgroundsize,
		`notes` = p_notes
		WHERE `user_id` = p_user_id;
     
    ELSE

    insert into tbl_homes(
        address,
        city,
        groundsize,
        presetgroundsize,
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
        p_presetgroundsize,
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_updateVend` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updateVend`(
    IN p_ppsf int(20),
	IN p_state varchar(2),
    IN p_phonenumber varchar(10),
    IN p_notes varchar(5000),
    IN p_user_id bigint
)
BEGIN
    if ( select exists (select 1 from tbl_vendors where user_id = p_user_id) ) THEN
     
		UPDATE
		tbl_vendors
		SET
		`price_per_sf` = p_ppsf,
		`state` = p_state,
		`phonenumber` = p_phonenumber,
		`notes` = p_notes
		WHERE `user_id` = p_user_id;
     
    ELSE

    insert into tbl_vendors(
        price_per_sf,
        phonenumber,
        state,
        notes,
        user_id
    )
    values
    (
		p_ppsf,
		p_phonenumber,
		p_state,
		p_notes,
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

-- Dump completed on 2016-12-13 14:52:52
