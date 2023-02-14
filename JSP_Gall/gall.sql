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
  `type` varchar(5) NOT NULL,
  `desc` varchar(200) DEFAULT NULL,
  `category` varchar(20) NOT NULL,
  `admin` varchar(20) DEFAULT NULL,
  `sub_admin` varchar(20) DEFAULT NULL,
  `date` date NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gall_list`
--

LOCK TABLES `gall_list` WRITE;
/*!40000 ALTER TABLE `gall_list` DISABLE KEYS */;
INSERT INTO `gall_list` VALUES (1,'실시간 베스트','',NULL,'기타',NULL,NULL,'0000-00-00',NULL),(2,'HIT','',NULL,'기타',NULL,NULL,'0000-00-00',NULL),(3,'축구','',NULL,'스포츠',NULL,NULL,'0000-00-00',NULL),(4,'만화','',NULL,'취미',NULL,NULL,'0000-00-00',NULL),(5,'리그 오브 레전드','',NULL,'게임',NULL,NULL,'0000-00-00',NULL),(6,'프로그래밍','',NULL,'디지털/IT',NULL,NULL,'0000-00-00',NULL),(7,'야구','',NULL,'스포츠',NULL,NULL,'0000-00-00',NULL),(8,'김유신','minor','','취미','1',NULL,'0000-00-00',NULL),(9,'삼성 라이온즈','minor','야구','스포츠','1',NULL,'2023-02-10','samsunglions_new_temp2.jpg'),(10,'일본어','minor','','취미','1',NULL,'2023-02-14',NULL),(11,'갤럭시','minor','','디지털/IT','1',NULL,'2023-02-14',NULL);
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
  `member_id` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (9,'자바','tset','홍길동','2022-12-27 11:27:22',102,0,0,'1',0,6,'1'),(10,'파이썬','test','홍길동','2022-12-27 11:29:08',152,10,0,'1',1,6,'1'),(11,'안드로이드','hi','a','2022-12-27 11:39:51',119,2,1,'1',3,2,NULL),(12,'아이폰','11','홍길동','2022-12-27 12:25:21',123,1,1,'1',5,3,'1'),(13,'데이터베이스','dd','홍길동','2022-12-27 12:26:01',120,4,1,'1',0,4,'1'),(14,'드락사르','ste','홍길동','2022-12-27 12:27:54',29,10,0,'1',1,5,'1'),(16,'HTML','ㅁㅁ','홍길동','2022-12-27 16:54:16',3,0,0,'1',0,6,'1'),(17,'CSS','abce','홍길동','2022-12-28 14:18:48',2,0,0,'1',0,5,'1'),(18,'Oracle','테스트','홍길동','2022-12-28 16:18:29',93,5,3,'1',3,4,'1'),(19,'DB','zz','ㅇㅇ','2022-12-29 15:07:23',6,0,0,'dddd',0,3,NULL),(20,'JSP','test','ㅇㅇ','2022-12-29 15:30:54',6,0,0,'1',1,2,NULL),(21,'카사딘','ㅈㅈ','ㅇㅇ','2023-01-13 15:07:13',69,11,0,'1',1,5,NULL),(23,'ㅇ','ㅇ','ㅇㅇ','2023-01-16 16:12:26',19,0,1,'2',0,2,NULL),(24,'럼블','tt','홍길동','2023-01-19 15:26:11',3,0,0,'1',0,5,NULL),(25,'다리우스','aa','dd','2023-01-19 15:27:24',9,0,0,'1',1,5,NULL),(27,'test33','test4455','ㅇㅇ','2023-01-20 16:49:25',13,0,0,'null',0,4,NULL),(28,'test','test','ㅇㅇ','2023-01-20 17:08:18',5,1,1,'1',1,6,NULL),(29,'tt','aa','dd','2023-01-26 11:03:59',3,0,0,'1',0,3,NULL),(30,'dfsdf','dsfdfsdfsdf','홍길동','2023-01-26 11:08:49',7,1,1,'1',0,4,'1'),(32,'aa','bb','test','2023-01-26 12:12:57',28,0,0,'2',0,5,'2'),(33,'ㅎㅇ요','ㅋㅋ','홍길동','2023-01-26 17:15:12',7,1,1,'1',2,7,'1'),(35,'삼성','ㅇ','ㅇㅇ','2023-01-31 16:09:01',2,0,0,'1',1,7,NULL),(37,'dd','test','홍길동','2023-02-14 10:49:54',3,0,0,'1',0,9,'1'),(38,'tetst','test','ㅇㅇ','2023-02-14 11:26:52',1,0,0,'1',1,8,NULL);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reco_list`
--

DROP TABLE IF EXISTS `reco_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reco_list` (
  `post_idx` int NOT NULL,
  `user_ip` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `isReco` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reco_list`
--

LOCK TABLES `reco_list` WRITE;
/*!40000 ALTER TABLE `reco_list` DISABLE KEYS */;
INSERT INTO `reco_list` VALUES (18,'192.168.0.235','2023-01-26',0),(18,'192.168.0.235','2023-01-26',1),(13,'192.168.0.235','2023-01-26',1),(13,'192.168.0.235','2023-01-26',0),(30,'192.168.0.235','2023-01-26',1),(30,'192.168.0.235','2023-01-26',0),(21,'192.168.0.235','2023-01-26',1),(14,'192.168.0.235','2023-01-26',1),(33,'192.168.0.235','2023-01-26',1),(33,'192.168.0.235','2023-01-26',0),(31,'192.168.0.235','2023-01-26',1),(31,'192.168.0.235','2023-01-26',0),(12,'192.168.0.235','2023-01-27',1),(12,'192.168.0.235','2023-01-27',0),(18,'192.168.0.235','2023-01-27',1),(18,'192.168.0.235','2023-01-27',0),(28,'192.168.0.235','2023-01-27',1),(28,'192.168.0.235','2023-01-27',0);
/*!40000 ALTER TABLE `reco_list` ENABLE KEYS */;
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
  `member_id` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`replyindex`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
INSERT INTO `reply` VALUES (19,'b','bbb',12,'12.29 15:54:07',NULL),(20,'c','ccc',12,'12.29 15:56:29',NULL),(21,'c','ccc',12,'12.29 16:06:23',NULL),(22,'c','ccc',12,'12.29 16:07:30',NULL),(23,'홍길동','ㅎㅎ',12,'12.29 17:09:48',NULL),(24,'에나낭','zz',20,'01.16 11:24:45',NULL),(25,'에나낭','ㅋㅋ',11,'01.16 11:27:58',NULL),(26,'에나낭','test',11,'01.16 12:43:56',NULL),(27,'ㅇㅇ','test',11,'01.16 13:49:51',NULL),(28,'ㅇㅇ','ㅇㅇ',10,'01.16 15:39:57',NULL),(29,'ㅇㅇ','ㅇㅇ',21,'01.16 15:52:03',NULL),(30,'ㅇㅇ','33',25,'01.19 16:56:13',NULL),(31,'dd','asdf',18,'01.26 13:32:33',NULL),(32,'홍길동','ㅅㄷㅅㄴ',18,'01.26 13:49:53',NULL),(33,'홍길동','ddd',18,'01.26 14:15:28',NULL),(34,'홍길동','1',33,'01.26 17:15:25',NULL),(35,'홍길동','ㅋㅋ',33,'01.26 17:15:48',NULL),(39,'홍길동','fdsf',28,'01.27 14:33:24','1'),(40,'dd','tt',35,'01.31 16:10:28',NULL),(41,'dd','f',14,'02.01 16:46:21',NULL),(42,'ㅇㅇ','test',38,'02.14 11:27:15',NULL);
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search`
--

DROP TABLE IF EXISTS `search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `search` (
  `idx` int NOT NULL AUTO_INCREMENT,
  `word` varchar(20) NOT NULL,
  `ip` varchar(20) NOT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search`
--

LOCK TABLES `search` WRITE;
/*!40000 ALTER TABLE `search` DISABLE KEYS */;
INSERT INTO `search` VALUES (37,'ㅇ','192.168.0.235');
/*!40000 ALTER TABLE `search` ENABLE KEYS */;
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
  `isFixed` tinyint NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('1','1','홍길동','ena@nigo.com',1),('2','2','test','test@test',0),('3','3','a','4@5',0),('4','4','dd','test@test',0);
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

-- Dump completed on 2023-02-14 16:20:50
