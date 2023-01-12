-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: mall
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `idx` int NOT NULL AUTO_INCREMENT,
  `id` varchar(10) NOT NULL,
  `product` varchar(20) NOT NULL,
  `price` int NOT NULL,
  `count` int NOT NULL,
  `member_id` varchar(10) NOT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (7,'P1234','iPhone 6s',800000,2,'admin'),(10,'P1237','Galaxy Watch 5',400000,2,'1'),(11,'P1234','iPhone 6s',800000,1,'1');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `id` varchar(10) NOT NULL,
  `pw` varchar(10) NOT NULL,
  `name` varchar(10) NOT NULL,
  `gender` varchar(4) DEFAULT NULL,
  `birth` varchar(10) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(90) DEFAULT NULL,
  `regist_day` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('1','1','홍길동','여','2023-02-10','test@gmail.com','012-2952-4839','대구','2023-01-10'),('admin','1','관리자','남','1999-09-12','admin@admin.com','010-0000-0000','대구','2023-01-11');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_list`
--

DROP TABLE IF EXISTS `order_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_list` (
  `idx` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `product` varchar(30) NOT NULL,
  `price` int NOT NULL,
  `count` int NOT NULL,
  `member_id` varchar(10) NOT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_list`
--

LOCK TABLES `order_list` WRITE;
/*!40000 ALTER TABLE `order_list` DISABLE KEYS */;
INSERT INTO `order_list` VALUES (1,'2023-01-12 05:00:54','P1237 - Galaxy Watch 5',400000,2,'1'),(2,'2023-01-12 05:00:54','P1234 - iPhone 6s',800000,1,'1');
/*!40000 ALTER TABLE `order_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `idx` int NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  `content` varchar(100) NOT NULL,
  `writer` varchar(15) NOT NULL,
  `date` datetime NOT NULL,
  `hits` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'공지','* 무료 배송 혜택을 받으신 후 부분 반품을 원하실 경우, 반품 배송비 6,000원 (제주 및 기타 도서산간지역 11,000원)이 부과됩니다.','관리자','2023-01-11 17:09:03',2);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` varchar(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `price` int NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `maker` varchar(15) DEFAULT NULL,
  `category` varchar(20) DEFAULT NULL,
  `stock` int DEFAULT '0',
  `state` varchar(15) DEFAULT NULL,
  `image` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES ('P1234','iPhone 6s',800000,'4.7inch, 1334X750 Renina HD display, 8-megapixel iSight Camera','Apple','Smart Phone',1000,'New','P1234.jpg'),('P1235','LG PC 그램',1500000,'13.3-inch, IPS LED display, 5rd Generation Intel Core processor','LG','Notebook',1000,'Refurbished','P1235.jpg'),('P1236','Galaxy Tab 5',900000,'212.8*125.6*6.6mm, Super AMOLED display, Octa-Core processor','Samsung','Tablet',1000,'Old','P1236.jpg'),('P1237','Galaxy Watch 5',400000,'자동 스포츠 추적 및 3-in-1 생체 활성 센서\r,\r 최신 Wear OS 운영 체제','Samsung','Watch',50,'New','P1237.jpg');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-12 17:30:19
