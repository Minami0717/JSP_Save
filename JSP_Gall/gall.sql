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
INSERT INTO `gall_list` VALUES (1,'실시간 베스트'),(2,'HIT'),(3,'축구'),(4,'만화'),(5,'리그 오브 레전드'),(6,'프로그래밍'),(7,'야구');
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
  `decommend` int NOT NULL DEFAULT '0',
  `pw` varchar(20) NOT NULL,
  `replyNum` int NOT NULL DEFAULT '0',
  `gall_idx` int NOT NULL,
  `isMember` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (9,'자바','tset','홍길동','2022-12-27 11:27:22',97,0,0,'',0,6,0),(10,'파이썬','test','홍길동','2022-12-27 11:29:08',110,3,0,'',1,1,1),(11,'안드로이드','hi','a','2022-12-27 11:39:51',118,2,1,'',3,2,0),(12,'아이폰','11','홍길동','2022-12-27 12:25:21',122,0,0,'',5,3,0),(13,'데이터베이스','dd','홍길동','2022-12-27 12:26:01',108,0,0,'',0,4,0),(14,'자바스크립트','ste','홍길동','2022-12-27 12:27:54',15,0,0,'',0,5,0),(16,'HTML','ㅁㅁ','홍길동','2022-12-27 16:54:16',3,0,0,'',0,6,0),(17,'CSS','abce','홍길동','2022-12-28 14:18:48',2,0,0,'',0,5,0),(18,'Oracle','테스트','홍길동','2022-12-28 16:18:29',13,0,0,'',0,4,0),(19,'DB','zz','ㅇㅇ','2022-12-29 15:07:23',1,0,0,'dddd',0,3,0),(20,'JSP','test','ㅇㅇ','2022-12-29 15:30:54',6,0,0,'1',1,2,0),(21,'dd','dd','ㅇㅇ','2023-01-13 15:07:13',50,10,0,'1',1,5,0),(22,'ㅇㅇ','ㅇㅇ','ㅇㅇ','2023-01-16 15:52:49',0,0,0,'1',0,5,0),(23,'ㅇ','ㅇ','ㅇㅇ','2023-01-16 16:12:26',19,0,1,'2',0,2,0),(24,'zz','tt','ㅇㅇ','2023-01-19 15:26:11',0,0,0,'1',0,5,0),(25,'tt','aa','dd','2023-01-19 15:27:24',5,0,0,'1',1,5,0),(26,'test','tt','에나낭','2023-01-19 17:07:59',13,0,0,'1',0,5,1),(27,'test','test','ㅇㅇ','2023-01-20 16:49:25',0,0,0,'1',0,1,0),(28,'test','test','ㅇㅇ','2023-01-20 17:08:18',0,0,0,'1',0,6,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
INSERT INTO `reply` VALUES (19,'b','bbb',12,'12.29 15:54:07'),(20,'c','ccc',12,'12.29 15:56:29'),(21,'c','ccc',12,'12.29 16:06:23'),(22,'c','ccc',12,'12.29 16:07:30'),(23,'홍길동','ㅎㅎ',12,'12.29 17:09:48'),(24,'에나낭','zz',20,'01.16 11:24:45'),(25,'에나낭','ㅋㅋ',11,'01.16 11:27:58'),(26,'에나낭','test',11,'01.16 12:43:56'),(27,'ㅇㅇ','test',11,'01.16 13:49:51'),(28,'ㅇㅇ','ㅇㅇ',10,'01.16 15:39:57'),(29,'ㅇㅇ','ㅇㅇ',21,'01.16 15:52:03'),(30,'ㅇㅇ','33',25,'01.19 16:56:13');
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
INSERT INTO `user` VALUES ('1','1','홍길동','ena@nigo.com'),('2','1','test','test@test'),('3','3','a','4@5');
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

-- Dump completed on 2023-01-20 17:29:30
