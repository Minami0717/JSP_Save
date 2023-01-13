-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: gall
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
-- Table structure for table `gall_list`
--

DROP TABLE IF EXISTS `gall_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gall_list` (
  `idx` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gall_list`
--

LOCK TABLES `gall_list` WRITE;
/*!40000 ALTER TABLE `gall_list` DISABLE KEYS */;
INSERT INTO `gall_list` VALUES (1,'실시간 베스트'),(2,'야구'),(3,'축구'),(4,'만화'),(5,'리그 오브 레전드'),(6,'프로그래밍');
/*!40000 ALTER TABLE `gall_list` ENABLE KEYS */;
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
  `recommend` int NOT NULL DEFAULT '0',
  `pw` varchar(20) NOT NULL,
  `replyNum` int NOT NULL DEFAULT '0',
  `gall_idx` int NOT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (9,'자바','tset','홍길동','2022-12-27 11:27:22',96,0,'',0,6),(10,'파이썬','test','홍길동','2022-12-27 11:29:08',81,3,'',0,1),(11,'안드로이드','hi','a','2022-12-27 11:39:51',17,0,'',0,2),(12,'아이폰','11','홍길동','2022-12-27 12:25:21',122,0,'',5,3),(13,'데이터베이스','dd','홍길동','2022-12-27 12:26:01',108,0,'',0,4),(14,'자바스크립트','ste','홍길동','2022-12-27 12:27:54',6,0,'',0,5),(16,'HTML','ㅁㅁ','홍길동','2022-12-27 16:54:16',2,0,'',0,6),(17,'CSS','abce','홍길동','2022-12-28 14:18:48',0,0,'',0,5),(18,'Oracle','테스트','홍길동','2022-12-28 16:18:29',13,0,'',0,4),(19,'DB','zz','ㅇㅇ','2022-12-29 15:07:23',1,0,'dddd',0,3),(20,'JSP','test','ㅇㅇ','2022-12-29 15:30:54',4,0,'1',0,2),(21,'dd','dd','ㅇㅇ','2023-01-13 15:07:13',33,1,'1',0,5);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reply`
--

DROP TABLE IF EXISTS `reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reply` (
  `replyindex` int NOT NULL AUTO_INCREMENT,
  `nickname` varchar(20) NOT NULL,
  `contents` varchar(100) NOT NULL,
  `post_idx` int NOT NULL,
  `date` varchar(30) NOT NULL,
  PRIMARY KEY (`replyindex`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
INSERT INTO `reply` VALUES (19,'b','bbb',12,'12.29 15:54:07'),(20,'c','ccc',12,'12.29 15:56:29'),(21,'c','ccc',12,'12.29 16:06:23'),(22,'c','ccc',12,'12.29 16:07:30'),(23,'홍길동','ㅎㅎ',12,'12.29 17:09:48');
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `code` varchar(20) NOT NULL,
  `pw` varchar(20) NOT NULL,
  `nick` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('1','1','에나낭','ena@nigo.com');
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

-- Dump completed on 2023-01-13 17:30:10
