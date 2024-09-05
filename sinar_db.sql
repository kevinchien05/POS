-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sinar_db
-- ------------------------------------------------------
-- Server version	5.7.33

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
-- Table structure for table `debt`
--

DROP TABLE IF EXISTS `debt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `debt` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `PayDate` date NOT NULL,
  `PurchasesID` varchar(20) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_debt_purchases1_idx` (`PurchasesID`),
  CONSTRAINT `fk_debt_purchases1` FOREIGN KEY (`PurchasesID`) REFERENCES `purchases` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `debt`
--

LOCK TABLES `debt` WRITE;
/*!40000 ALTER TABLE `debt` DISABLE KEYS */;
INSERT INTO `debt` VALUES (23,'2024-07-04','KB0004'),(24,'2024-07-05','KB0005'),(25,'2024-07-17','KB0008'),(26,'2024-07-17','KB0010');
/*!40000 ALTER TABLE `debt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fund`
--

DROP TABLE IF EXISTS `fund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fund` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Total` decimal(10,0) NOT NULL,
  `Supply` decimal(10,0) DEFAULT '0',
  `Status` int(1) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_Fund_User_idx` (`UserID`),
  CONSTRAINT `fk_Fund_User` FOREIGN KEY (`UserID`) REFERENCES `user` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fund`
--

LOCK TABLES `fund` WRITE;
/*!40000 ALTER TABLE `fund` DISABLE KEYS */;
INSERT INTO `fund` VALUES (17,'2024-06-01','Tambah Dana Toko',50000000,0,0,4),(18,'2024-06-24','Tambah Dana Toko',15000000,0,0,4),(19,'2024-07-01','Tambah Dana Toko',15000000,0,0,4),(20,'2024-07-01','Aset 06 2024',71115000,5475000,1,NULL),(21,'2024-08-01','Aset 07 2024',134940000,5890000,1,NULL),(22,'2025-01-01','Aset 2024',134190000,5890000,2,NULL),(23,'2024-07-17','Tambah Dana Toko',10000000,0,0,4),(24,'2024-07-17','Tambah Dana Toko',50000000,0,0,4);
/*!40000 ALTER TABLE `fund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operational`
--

DROP TABLE IF EXISTS `operational`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operational` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Total` decimal(10,0) NOT NULL,
  `UserID` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `UserID_idx` (`UserID`),
  CONSTRAINT `fk_user_operational` FOREIGN KEY (`UserID`) REFERENCES `user` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operational`
--

LOCK TABLES `operational` WRITE;
/*!40000 ALTER TABLE `operational` DISABLE KEYS */;
INSERT INTO `operational` VALUES (10,'2024-06-01','Gaji Pegawai',3000000,4),(11,'2024-06-18','Pajak',1000000,4),(12,'2024-07-05','Pinjaman',500000,4),(13,'2024-07-17','Gaji Pegawai',2500000,4),(14,'2024-07-17','Pajak',550000,4);
/*!40000 ALTER TABLE `operational` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `predict`
--

DROP TABLE IF EXISTS `predict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `predict` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Qnt` int(11) NOT NULL,
  `TimeIndex` int(11) NOT NULL,
  `ProductCode` varchar(20) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `ProductID_idx` (`ProductCode`),
  CONSTRAINT `fk_product_predict` FOREIGN KEY (`ProductCode`) REFERENCES `products` (`ProductCode`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `predict`
--

LOCK TABLES `predict` WRITE;
/*!40000 ALTER TABLE `predict` DISABLE KEYS */;
INSERT INTO `predict` VALUES (1,'2023-01-01',28,0,'A001'),(2,'2023-02-01',30,1,'A001'),(3,'2023-03-01',36,2,'A001'),(4,'2023-04-01',65,3,'A001'),(5,'2023-05-01',25,4,'A001'),(6,'2023-06-01',14,5,'A001'),(7,'2023-07-01',20,6,'A001'),(8,'2023-08-01',24,7,'A001'),(9,'2023-09-01',21,8,'A001'),(10,'2023-10-01',28,9,'A001'),(11,'2023-11-01',24,10,'A001'),(12,'2023-12-01',31,11,'A001'),(13,'2023-01-01',5,0,'A002'),(14,'2023-02-01',10,1,'A002'),(15,'2023-03-01',7,2,'A002'),(16,'2023-04-01',12,3,'A002'),(17,'2023-05-01',14,4,'A002'),(18,'2023-06-01',7,5,'A002'),(19,'2023-07-01',9,6,'A002'),(20,'2023-08-01',15,7,'A002'),(21,'2023-09-01',11,8,'A002'),(22,'2023-10-01',10,9,'A002'),(23,'2023-11-01',18,10,'A002'),(24,'2023-12-01',10,11,'A002'),(25,'2023-01-01',22,0,'A003'),(26,'2023-02-01',40,1,'A003'),(27,'2023-03-01',25,2,'A003'),(28,'2023-04-01',36,3,'A003'),(29,'2023-05-01',48,4,'A003'),(30,'2023-06-01',42,5,'A003'),(31,'2023-07-01',50,6,'A003'),(32,'2023-08-01',32,7,'A003'),(33,'2023-09-01',25,8,'A003'),(34,'2023-10-01',41,9,'A003'),(35,'2023-11-01',48,10,'A003'),(36,'2023-12-01',54,11,'A003'),(37,'2023-01-01',38,0,'A004'),(38,'2023-02-01',45,1,'A004'),(39,'2023-03-01',32,2,'A004'),(40,'2023-04-01',54,3,'A004'),(41,'2023-05-01',49,4,'A004'),(42,'2023-06-01',36,5,'A004'),(43,'2023-07-01',48,6,'A004'),(44,'2023-08-01',58,7,'A004'),(45,'2023-09-01',60,8,'A004'),(46,'2023-10-01',47,9,'A004'),(47,'2023-11-01',36,10,'A004'),(48,'2023-12-01',41,11,'A004'),(49,'2023-01-01',45,0,'A005'),(50,'2023-02-01',56,1,'A005'),(51,'2023-03-01',65,2,'A005'),(52,'2023-04-01',75,3,'A005'),(53,'2023-05-01',58,4,'A005'),(54,'2023-06-01',45,5,'A005'),(55,'2023-07-01',55,6,'A005'),(56,'2023-08-01',70,7,'A005'),(57,'2023-09-01',35,8,'A005'),(58,'2023-10-01',44,9,'A005'),(59,'2023-11-01',50,10,'A005'),(60,'2023-12-01',65,11,'A005');
/*!40000 ALTER TABLE `predict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `ProductCode` varchar(20) NOT NULL,
  `ProductName` varchar(255) NOT NULL,
  `Qnt` int(11) DEFAULT NULL,
  `Unit` varchar(255) NOT NULL,
  `BuyPrice` decimal(10,0) DEFAULT NULL,
  `SellPrice` decimal(10,0) NOT NULL,
  `Image` varchar(255) NOT NULL,
  `Url` varchar(255) NOT NULL,
  PRIMARY KEY (`ProductCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='			';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES ('A001','Cat Sapporo Hitam 300 ML',20,'Kaleng',15049,27000,'9fde6a88d96c314db85f8f457da72dd7.jpg','http://127.0.0.1:3000/images/9fde6a88d96c314db85f8f457da72dd7.jpg'),('A002','Thiner Simpati 300 ML',20,'Botol',5000,10000,'5d896421de77eed52d1b0db7e0b31059.jpg','http://127.0.0.1:3000/images/5d896421de77eed52d1b0db7e0b31059.jpg'),('A003','Asbes 1x1 meter',0,'Lembar',NULL,25000,'c9e0d2e8f92f67048ef335563111e0b3.jpg','http://127.0.0.1:3000/images/c9e0d2e8f92f67048ef335563111e0b3.jpg'),('A004','Dempul Nat Keramik',15,'Kg',5000,10000,'691e4e0fddad1494d0c62b6a1b58f469.jpg','http://127.0.0.1:3000/images/691e4e0fddad1494d0c62b6a1b58f469.jpg'),('A005','Semen Dynamix',180,'Sak',30000,47000,'26b1341b3ad268b5d74f315b66a088bb.jpg','http://127.0.0.1:3000/images/26b1341b3ad268b5d74f315b66a088bb.jpg');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchaseproducts`
--

DROP TABLE IF EXISTS `purchaseproducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchaseproducts` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Qnt` int(11) NOT NULL,
  `Price` decimal(10,0) NOT NULL,
  `Total` decimal(10,0) NOT NULL,
  `PurchasesID` varchar(20) NOT NULL,
  `ProductCode` varchar(20) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `PurchasesID_idx` (`PurchasesID`),
  KEY `ProductID_idx` (`ProductCode`),
  CONSTRAINT `fk_product_purchases` FOREIGN KEY (`ProductCode`) REFERENCES `products` (`ProductCode`),
  CONSTRAINT `fk_purchases` FOREIGN KEY (`PurchasesID`) REFERENCES `purchases` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchaseproducts`
--

LOCK TABLES `purchaseproducts` WRITE;
/*!40000 ALTER TABLE `purchaseproducts` DISABLE KEYS */;
INSERT INTO `purchaseproducts` VALUES (16,85,15000,1275000,'KB0001','A001'),(17,45,5000,225000,'KB0002','A002'),(18,50,5000,250000,'KB0002','A004'),(19,95,15000,1425000,'KB0003','A003'),(20,200,30000,6000000,'KB0004','A005'),(21,150,30000,4500000,'KB0005','A005'),(22,10,5000,50000,'KB0006','A002'),(23,10,5000,50000,'KB0007','A002'),(24,25,30000,750000,'KB0008','A005'),(25,50,30000,1500000,'KB0009','A005'),(26,50,30000,1500000,'KB0010','A005'),(27,25,30000,750000,'KB0011','A005'),(28,5,18000,90000,'KB0012','A001'),(29,30,15000,450000,'KB0013','A001'),(30,24,15000,360000,'KB0014','A001'),(31,36,15000,540000,'KB0015','A001');
/*!40000 ALTER TABLE `purchaseproducts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchases` (
  `Id` varchar(20) NOT NULL,
  `OrderDate` date NOT NULL,
  `Total` decimal(10,0) NOT NULL,
  `Status` int(1) NOT NULL,
  `SupplierID` varchar(20) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `SupplierID_idx` (`SupplierID`),
  CONSTRAINT `fk_supplier_purchases` FOREIGN KEY (`SupplierID`) REFERENCES `supplier` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchases`
--

LOCK TABLES `purchases` WRITE;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
INSERT INTO `purchases` VALUES ('KB0001','2024-06-04',1275000,0,'SUP002'),('KB0002','2024-06-05',475000,0,'SUP003'),('KB0003','2024-06-06',1425000,0,'SUP004'),('KB0004','2024-06-15',6000000,2,'SUP001'),('KB0005','2024-06-30',4500000,2,'SUP001'),('KB0006','2024-07-04',50000,0,'SUP003'),('KB0007','2024-07-04',50000,0,'SUP003'),('KB0008','2024-07-17',750000,2,'SUP001'),('KB0009','2024-07-17',1500000,0,'SUP001'),('KB0010','2024-07-17',1500000,2,'SUP001'),('KB0011','2024-07-17',750000,0,'SUP001'),('KB0012','2024-07-22',90000,0,'SUP002'),('KB0013','2024-01-01',450000,0,'SUP002'),('KB0014','2024-02-01',360000,0,'SUP002'),('KB0015','2024-03-01',540000,0,'SUP002');
/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `returproducts`
--

DROP TABLE IF EXISTS `returproducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `returproducts` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Qnt` int(11) NOT NULL,
  `Price` decimal(10,0) NOT NULL,
  `Total` decimal(10,0) NOT NULL,
  `ReturID` varchar(20) NOT NULL,
  `ProductCode` varchar(20) NOT NULL,
  `PurchasesID` varchar(20) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_retur_idx` (`ReturID`),
  KEY `fk_retur_product_idx` (`ProductCode`),
  KEY `fk_returproduct_purchase_idx` (`PurchasesID`),
  CONSTRAINT `fk_retur` FOREIGN KEY (`ReturID`) REFERENCES `returpurchases` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_retur_product` FOREIGN KEY (`ProductCode`) REFERENCES `products` (`ProductCode`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_returproduct_purchase` FOREIGN KEY (`PurchasesID`) REFERENCES `purchases` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `returproducts`
--

LOCK TABLES `returproducts` WRITE;
/*!40000 ALTER TABLE `returproducts` DISABLE KEYS */;
INSERT INTO `returproducts` VALUES (13,10,15000,150000,'1','A001','KB0001'),(14,0,5000,0,'2','A004','KB0002'),(15,5,5000,25000,'2','A002','KB0002'),(16,5,5000,25000,'3','A002','KB0007'),(17,5,5000,25000,'3','A002','KB0006'),(18,25,30000,750000,'4','A005','KB0008'),(19,0,30000,0,'4','A005','KB0009'),(20,0,30000,0,'5','A005','KB0008'),(21,0,30000,0,'5','A005','KB0009'),(22,0,30000,0,'5','A005','KB0010'),(23,25,30000,750000,'5','A005','KB0011'),(24,5,15000,75000,'6','A003','KB0003'),(25,5,15000,75000,'7','A001','KB0001');
/*!40000 ALTER TABLE `returproducts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `returpurchases`
--

DROP TABLE IF EXISTS `returpurchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `returpurchases` (
  `Id` varchar(20) NOT NULL,
  `ReturDate` date NOT NULL,
  `Total` decimal(10,0) NOT NULL,
  `SupplierID` varchar(20) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_retur_supplier_idx` (`SupplierID`),
  CONSTRAINT `fk_retur_supplier` FOREIGN KEY (`SupplierID`) REFERENCES `supplier` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `returpurchases`
--

LOCK TABLES `returpurchases` WRITE;
/*!40000 ALTER TABLE `returpurchases` DISABLE KEYS */;
INSERT INTO `returpurchases` VALUES ('1','2024-07-04',150000,'SUP002'),('2','2024-07-04',25000,'SUP003'),('3','2024-07-04',50000,'SUP003'),('4','2024-07-17',750000,'SUP001'),('5','2024-07-17',750000,'SUP001'),('6','2024-07-22',75000,'SUP004'),('7','2024-07-24',75000,'SUP002');
/*!40000 ALTER TABLE `returpurchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saleproducts`
--

DROP TABLE IF EXISTS `saleproducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saleproducts` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Qnt` int(11) NOT NULL,
  `Price` decimal(10,0) NOT NULL,
  `BuyPrice` decimal(10,0) NOT NULL,
  `Total` decimal(10,0) NOT NULL,
  `SalesID` int(11) NOT NULL,
  `ProductCode` varchar(20) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `ProductID_idx` (`ProductCode`),
  KEY `fk_saleproducts_sales1_idx` (`SalesID`),
  CONSTRAINT `fk_product_sales` FOREIGN KEY (`ProductCode`) REFERENCES `products` (`ProductCode`),
  CONSTRAINT `fk_saleproducts_sales1` FOREIGN KEY (`SalesID`) REFERENCES `sales` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saleproducts`
--

LOCK TABLES `saleproducts` WRITE;
/*!40000 ALTER TABLE `saleproducts` DISABLE KEYS */;
INSERT INTO `saleproducts` VALUES (31,50,47000,30000,2350000,1,'A005'),(32,5,27000,15000,135000,2,'A001'),(33,2,10000,5000,20000,2,'A002'),(34,5,10000,5000,50000,2,'A004'),(35,20,25000,15000,500000,3,'A003'),(36,50,47000,30000,2350000,3,'A005'),(37,5,10000,5000,50000,3,'A004'),(38,20,25000,15000,500000,4,'A003'),(39,5,10000,5000,50000,4,'A004'),(40,50,47000,30000,2350000,4,'A005'),(41,5,10000,5000,50000,5,'A004'),(42,50,47000,30000,2350000,5,'A005'),(43,5,27000,15000,135000,6,'A001'),(44,3,10000,5000,30000,6,'A002'),(45,5,27000,15000,135000,7,'A001'),(46,5,10000,5000,50000,7,'A002'),(47,20,25000,15000,500000,7,'A003'),(48,5,10000,5000,50000,7,'A004'),(49,20,25000,15000,500000,8,'A003'),(50,5,10000,5000,50000,8,'A004'),(51,30,47000,30000,1410000,8,'A005'),(52,10,10000,5000,100000,9,'A002'),(53,5,10000,5000,50000,9,'A004'),(54,40,47000,30000,1880000,9,'A005'),(55,15,27000,15000,405000,10,'A001'),(56,5,10000,5000,50000,10,'A002'),(57,10,25000,15000,250000,11,'A003'),(58,50,47000,30000,2350000,11,'A005'),(59,10,27000,15000,270000,12,'A001'),(60,20,27000,15000,540000,13,'A001'),(61,20,10000,5000,200000,13,'A002'),(62,5,25000,15000,125000,14,'A003'),(63,10,27000,15000,270000,15,'A001'),(64,30,27000,15300,810000,16,'A001'),(65,24,27000,15136,648000,17,'A001'),(66,36,27000,15049,972000,18,'A001');
/*!40000 ALTER TABLE `saleproducts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `Id` int(11) NOT NULL,
  `OrderDate` date NOT NULL,
  `Total` decimal(10,0) NOT NULL,
  `CustomerName` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (1,'2024-06-07',2350000,'Leny','Jl.Manggis No.20'),(2,'2024-06-07',205000,'Rudi','Jl.Semangka No.10L'),(3,'2024-06-08',2900000,'Ramat','Jl.Rengas No.10'),(4,'2024-06-08',2900000,'Budi','Jl.Rengas No.101'),(5,'2024-06-10',2400000,'Letty','Jl.Semarang No.1'),(6,'2024-06-10',165000,'Sergio',''),(7,'2024-06-11',735000,'Budiman',''),(8,'2024-06-11',1960000,'Lisa','Jl.Jeruk No.101'),(9,'2024-07-05',2030000,'Lisa','Jl.Jeruk No.101'),(10,'2024-07-05',455000,'Budiman',''),(11,'2024-07-05',2600000,'Edi','Jl.Semarang No.121'),(12,'2024-07-05',270000,'Rudi',''),(13,'2024-07-05',740000,'Rendy',''),(14,'2024-07-17',125000,'Budiman','Jl.Semarang No.121'),(15,'2024-07-17',270000,'Budiman','Jl.Semarang No.121'),(16,'2024-01-02',810000,'Budiman','Jl.Semarang No.121'),(17,'2024-02-02',648000,'Budiman','Jl.Semarang No.121'),(18,'2024-03-02',972000,'Budiman','Jl.Semarang No.121');
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `Id` varchar(20) NOT NULL,
  `SupplierName` varchar(255) NOT NULL,
  `PhoneNumber` varchar(13) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES ('SUP001','Budiman','081253791231','Jl.Besar Pantai Labu','Semen'),('SUP002','Manto','08169843567','Jl.Semangka no.10','Cat Sapporo'),('SUP003','Rudi','08123612730','Jl.Sunggal No.11B','Dempul dan Thiner'),('SUP004','Suni','08123612731','Jl.Cemara No.101','Asbes');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Status` int(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (4,'admin','admin',1),(5,'gudang','gudang',2),(6,'akuntan','akuntan',3);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-05 19:35:36
