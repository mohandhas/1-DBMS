-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: HOTEL_MANAGEMENT_SYSTEM
-- ------------------------------------------------------
-- Server version	5.7.20

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
-- Table structure for table `BILL`
--

DROP TABLE IF EXISTS `BILL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BILL` (
  `BID` int(11) NOT NULL AUTO_INCREMENT,
  `COST` float DEFAULT NULL,
  `OID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`BID`),
  KEY `OID` (`OID`),
  CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`OID`) REFERENCES `ORDERS` (`OID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BILL`
--

LOCK TABLES `BILL` WRITE;
/*!40000 ALTER TABLE `BILL` DISABLE KEYS */;
INSERT INTO `BILL` VALUES (1,150,'ORDER3');
/*!40000 ALTER TABLE `BILL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOMER`
--

DROP TABLE IF EXISTS `CUSTOMER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CUSTOMER` (
  `CID` varchar(10) NOT NULL,
  `CNAME` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOMER`
--

LOCK TABLES `CUSTOMER` WRITE;
/*!40000 ALTER TABLE `CUSTOMER` DISABLE KEYS */;
INSERT INTO `CUSTOMER` VALUES ('C1','SATHYA'),('C2','TARUN'),('C3','JAHANGIR'),('C4','MOHAN'),('C5','PIYUISH');
/*!40000 ALTER TABLE `CUSTOMER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MENU`
--

DROP TABLE IF EXISTS `MENU`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MENU` (
  `ITEMID` varchar(10) NOT NULL,
  `ITEMNAME` varchar(50) DEFAULT NULL,
  `PRICE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ITEMID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MENU`
--

LOCK TABLES `MENU` WRITE;
/*!40000 ALTER TABLE `MENU` DISABLE KEYS */;
INSERT INTO `MENU` VALUES ('ITEM1','IDLY',50),('ITEM2','DOSA',60),('ITEM3','CHAPATHI',40),('ITEM4','POORI',60),('ITEM5','VADAI',20),('ITEM6','PONGAL',50);
/*!40000 ALTER TABLE `MENU` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORDERS`
--

DROP TABLE IF EXISTS `ORDERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ORDERS` (
  `OID` varchar(10) NOT NULL,
  `OTIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`OID`),
  KEY `CID` (`CID`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`CID`) REFERENCES `CUSTOMER` (`CID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORDERS`
--

LOCK TABLES `ORDERS` WRITE;
/*!40000 ALTER TABLE `ORDERS` DISABLE KEYS */;
INSERT INTO `ORDERS` VALUES ('ORDER 5','2017-12-27 13:46:57','C5'),('ORDER1','2017-12-27 13:31:04','C5'),('ORDER2','2017-12-27 13:31:14','C4'),('ORDER3','2017-12-27 13:31:27','C3'),('ORDER4','2017-12-27 13:31:36','C2');
/*!40000 ALTER TABLE `ORDERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORDER_MENU`
--

DROP TABLE IF EXISTS `ORDER_MENU`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ORDER_MENU` (
  `OID` varchar(10) NOT NULL,
  `ITEMID` varchar(10) NOT NULL,
  `QUANTITY` int(11) DEFAULT NULL,
  PRIMARY KEY (`OID`,`ITEMID`),
  KEY `ITEMID` (`ITEMID`),
  CONSTRAINT `order_menu_ibfk_1` FOREIGN KEY (`OID`) REFERENCES `ORDERS` (`OID`),
  CONSTRAINT `order_menu_ibfk_2` FOREIGN KEY (`ITEMID`) REFERENCES `MENU` (`ITEMID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORDER_MENU`
--

LOCK TABLES `ORDER_MENU` WRITE;
/*!40000 ALTER TABLE `ORDER_MENU` DISABLE KEYS */;
INSERT INTO `ORDER_MENU` VALUES ('ORDER1','ITEM2',4),('ORDER1','ITEM3',2),('ORDER2','ITEM3',2),('ORDER2','ITEM5',6),('ORDER3','ITEM1',3),('ORDER4','ITEM4',3),('ORDER4','ITEM6',3);
/*!40000 ALTER TABLE `ORDER_MENU` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_customersnapshot`
--

DROP TABLE IF EXISTS `vw_customersnapshot`;
/*!50001 DROP VIEW IF EXISTS `vw_customersnapshot`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_customersnapshot` AS SELECT 
 1 AS `CID`,
 1 AS `CNAME`,
 1 AS `FREQUENCY`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_ordersnapshot`
--

DROP TABLE IF EXISTS `vw_ordersnapshot`;
/*!50001 DROP VIEW IF EXISTS `vw_ordersnapshot`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_ordersnapshot` AS SELECT 
 1 AS `ITEMID`,
 1 AS `ITEMNAME`,
 1 AS `PRICE`,
 1 AS `FREQUENCY`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'HOTEL_MANAGEMENT_SYSTEM'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_GetOrderTimeElapsed` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_GetOrderTimeElapsed`(CUSTID VARCHAR(10)) RETURNS time
BEGIN
  DECLARE TIME_ELAPSED time;
  SET TIME_ELAPSED = sec_to_time(now()-(select OTIME FROM ORDERS WHERE CID=CUSTID GROUP BY OTIME DESC LIMIT 1))	;
  RETURN (TIME_ELAPSED) ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GenerateBill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GenerateBill`(IN OrderID varchar(10), out BillAMT int)
BEGIN
	DECLARE TOTAL int;
    SET TOTAL = (SELECT SUM(QUANTITY*PRICE) AS AMOUNT 
	FROM ORDER_MENU JOIN MENU
	ON MENU.ITEMID = ORDER_MENU.ITEMID
	WHERE OID = OrderID);
	IF NOT EXISTS(SELECT COST FROM BILL WHERE OID=OrderID)
	THEN
	INSERT INTO BILL(COST,OID) VALUES (TOTAL,OrderID);
	END IF;
	SET BillAMT = TOTAL;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetOrder`(IN CustID varchar(10))
BEGIN
	SELECT * FROM ORDER_MENU
	WHERE OID = 
	(SELECT OID FROM ORDERS WHERE CID = CustID ORDER BY OTIME DESC LIMIT 1);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_customersnapshot`
--

/*!50001 DROP VIEW IF EXISTS `vw_customersnapshot`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_customersnapshot` AS select `customer`.`CID` AS `CID`,`customer`.`CNAME` AS `CNAME`,count(0) AS `FREQUENCY` from (`orders` join `customer` on((`orders`.`CID` = `customer`.`CID`))) group by `customer`.`CID` order by `FREQUENCY` desc limit 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ordersnapshot`
--

/*!50001 DROP VIEW IF EXISTS `vw_ordersnapshot`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ordersnapshot` AS select `menu`.`ITEMID` AS `ITEMID`,`menu`.`ITEMNAME` AS `ITEMNAME`,`menu`.`PRICE` AS `PRICE`,count(0) AS `FREQUENCY` from (`order_menu` join `menu` on((`order_menu`.`ITEMID` = `menu`.`ITEMID`))) group by `menu`.`ITEMID` order by `FREQUENCY` desc limit 1 */;
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

-- Dump completed on 2017-12-27 23:45:44
