-- MariaDB dump 10.19  Distrib 10.6.5-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: xyzhotel
-- ------------------------------------------------------
-- Server version	10.6.5-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `review_content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `review_starts` int(11) DEFAULT NULL,
  `review_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`review_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis, perferendis?',3,'john'),(2,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis, perferendis?',3,'Lorem, ipsum. '),(3,'Lorem2 ipsum dolor sit amet consectetur adipisicing elit. Reiciendis, perferendis?',3,'Lorem, ipsum. '),(4,'Good place to recommend',3,'Lorem, ipsum. '),(5,' Really helpful staff, good location (8 mins to airport express), very clean. ',4,'Lorem, ipsum. '),(6,'I stayed for two nights there. Great facilities and staffs!',4,'User name'),(8,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis',4,'john'),(9,'Lorem ipsum dolor sit amet coctetur adipisg elit.',4,'john'),(10,'Lorem ipsum dolor sit amet consectetur adipisicing elit',4,'john');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_info`
--

DROP TABLE IF EXISTS `room_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room_info` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `room_description` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `room_image` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_info`
--

LOCK TABLES `room_info` WRITE;
/*!40000 ALTER TABLE `room_info` DISABLE KEYS */;
INSERT INTO `room_info` VALUES (1,'Lorem ipsum dolor sit amet.','Lorem ipsum dolor, sit amet consectetur adipisicing elit. Tempora a consectetur quaerat, aspernatur sint dolore! Voluptates sapiente mollitia explicabo veniam blanditiis, tempora, ullam fuga ratione nulla exercitationem natus nemo dolorum!','https://www.silverkris.com/wp-content/uploads/2019/03/081-DS-Bocage.jpg'),(2,'Lorem ipsum dolor sit amet.','Lorem ipsum dolor, sit amet consectetur adipisicing elit. Tempora a consectetur quaerat, aspernatur sint dolore! Voluptates sapiente mollitia explicabo veniam blanditiis, tempora, ullam fuga ratione nulla exercitationem natus nemo dolorum!','https://designlimitededition.com/wp-content/uploads/2018/01/Luxury-Hotel-Interior-Design-Minimalist-Monochromatic-Style-6.jpg'),(3,'Lorem ipsum dolor sit amet.','Lorem ipsum dolor, sit amet consectetur adipisicing elit. Tempora a consectetur quaerat, aspernatur sint dolore! Voluptates sapiente mollitia explicabo veniam blanditiis, tempora, ullam fuga ratione nulla exercitationem natus nemo dolorum!','http://designlimitededition.com/wp-content/uploads/2018/01/Luxury-Hotel-Interior-Design-Minimalist-Monochromatic-Style-8.jpg'),(4,'Lorem ipsum dolor sit amet.','Lorem ipsum dolor, sit amet consectetur adipisicing elit. Tempora a consectetur quaerat, aspernatur sint dolore! Voluptates sapiente mollitia explicabo veniam blanditiis, tempora, ullam fuga ratione nulla exercitationem natus nemo dolorum!','http://designlimitededition.com/wp-content/uploads/2018/01/Luxury-Hotel-Interior-Design-Minimalist-Monochromatic-Style-4.jpg'),(5,'Lorem ipsum dolor sit amet.','Lorem ipsum dolor, sit amet consectetur adipisicing elit. Tempora a consectetur quaerat, aspernatur sint dolore! Voluptates sapiente mollitia explicabo veniam blanditiis, tempora, ullam fuga ratione nulla exercitationem natus nemo dolorum!','http://designlimitededition.com/wp-content/uploads/2018/01/Luxury-Hotel-Interior-Design-Minimalist-Monochromatic-Style-3.jpg');
/*!40000 ALTER TABLE `room_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `uuid` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'user',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-18  1:53:39