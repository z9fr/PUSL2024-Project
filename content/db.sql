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
-- Table structure for table `booking_reminders`
--

DROP TABLE IF EXISTS `booking_reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking_reminders` (
  `remind_id` int(11) NOT NULL AUTO_INCREMENT,
  `start_date` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_date` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isDone` tinyint(1) DEFAULT NULL,
  `booking_id` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`remind_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_reminders`
--

LOCK TABLES `booking_reminders` WRITE;
/*!40000 ALTER TABLE `booking_reminders` DISABLE KEYS */;
INSERT INTO `booking_reminders` VALUES (28,'2021-12-19','2021-12-20',1,'17');
/*!40000 ALTER TABLE `booking_reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookings` (
  `booking_id` int(11) NOT NULL AUTO_INCREMENT,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `booked_by` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `paymentAmount` double NOT NULL,
  `reason` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_id` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isComplete` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `room_id` (`room_id`),
  KEY `booked_by` (`booked_by`),
  CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `room_info` (`room_id`),
  CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`booked_by`) REFERENCES `users` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `getAllusers`
--

DROP TABLE IF EXISTS `getAllusers`;
/*!50001 DROP VIEW IF EXISTS `getAllusers`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `getAllusers` (
  `uname` tinyint NOT NULL,
  `email` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `quotes`
--

DROP TABLE IF EXISTS `quotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quotes` (
  `quote_id` int(11) NOT NULL AUTO_INCREMENT,
  `msg` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`quote_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quotes`
--

LOCK TABLES `quotes` WRITE;
/*!40000 ALTER TABLE `quotes` DISABLE KEYS */;
INSERT INTO `quotes` VALUES (2,'“To be kind to all, to like many and love a few, to be needed and wanted by those we love, is certainly the nearest we can come to happiness.” —Mary Stuart'),(3,'“Happiness depends upon ourselves.” —Aristotle'),(4,'“Happiness is not something ready-made. It comes from your own actions.” —Dalai Lama'),(5,'“If you want happiness for an hour—take a nap. If you want happiness for a day—go fishing. <br> If you want happiness for a year—inherit a fortune. If you want happiness for a lifetime—help someone else.” —Chinese Proverb'),(6,'“It’s a helluva start, being able to recognize what makes you happy.” —Lucille Ball'),(7,'Don’t underestimate the value of Doing Nothing, of just going along, listening to all the things you can’t hear, and not bothering.” —Winnie the Pooh'),(8,'Some cause happiness wherever they go; others whenever they go.” —Oscar Wilde'),(9,'“Happiness is not in the mere possession of money; it lies in the joy of achievement, in the thrill of creative effort.” —Franklin D. Roosevelt'),(10,'“It’s been my experience that you can nearly always enjoy things if you make up your mind firmly that you will.” —L.M. Montgomery'),(11,'Some cause happiness wherever they go; others whenever they go.” —Oscar Wilde');
/*!40000 ALTER TABLE `quotes` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis, perferendis?',3,'john'),(6,'I stayed for two nights there. Great facilities and staffs!',4,'User name'),(8,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis',4,'john'),(9,'Lorem ipsum dolor sit amet coctetur adipisg elit.',4,'john'),(10,'Lorem ipsum dolor sit amet consectetur adipisicing elit',4,'john'),(11,'test',1,'admin'),(12,'Good',3,'admin'),(14,'hello friend',4,'admin'),(15,'good good ',4,'admin'),(16,'good good ',4,'admin');
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
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_info`
--

LOCK TABLES `room_info` WRITE;
/*!40000 ALTER TABLE `room_info` DISABLE KEYS */;
INSERT INTO `room_info` VALUES (1,'Lorem ipsum dolor sit amet.','Lorem ipsum dolor, sit amet consectetur adipisicing elit. Tempora a consectetur quaerat, aspernatur sint dolore! Voluptates sapiente mollitia explicabo veniam blanditiis, tempora, ullam fuga ratione nulla exercitationem natus nemo dolorum!','https://www.silverkris.com/wp-content/uploads/2019/03/081-DS-Bocage.jpg',200),(2,'Lorem ipsum dolor sit amet.','Lorem ipsum dolor, sit amet consectetur adipisicing elit. Tempora a consectetur quaerat, aspernatur sint dolore! Voluptates sapiente mollitia explicabo veniam blanditiis, tempora, ullam fuga ratione nulla exercitationem natus nemo dolorum!','https://designlimitededition.com/wp-content/uploads/2018/01/Luxury-Hotel-Interior-Design-Minimalist-Monochromatic-Style-6.jpg',300),(3,'Lorem ipsum dolor sit amet.','Lorem ipsum dolor, sit amet consectetur adipisicing elit. Tempora a consectetur quaerat, aspernatur sint dolore! Voluptates sapiente mollitia explicabo veniam blanditiis, tempora, ullam fuga ratione nulla exercitationem natus nemo dolorum!','http://designlimitededition.com/wp-content/uploads/2018/01/Luxury-Hotel-Interior-Design-Minimalist-Monochromatic-Style-8.jpg',12121),(4,'Lorem ipsum dolor sit amet.','Lorem ipsum dolor, sit amet consectetur adipisicing elit. Tempora a consectetur quaerat, aspernatur sint dolore! Voluptates sapiente mollitia explicabo veniam blanditiis, tempora, ullam fuga ratione nulla exercitationem natus nemo dolorum!','http://designlimitededition.com/wp-content/uploads/2018/01/Luxury-Hotel-Interior-Design-Minimalist-Monochromatic-Style-4.jpg',500),(5,'Lorem ipsum dolor sit amet.','Lorem ipsum dolor, sit amet consectetur adipisicing elit. Tempora a consectetur quaerat, aspernatur sint dolore! Voluptates sapiente mollitia explicabo veniam blanditiis, tempora, ullam fuga ratione nulla exercitationem natus nemo dolorum!','http://designlimitededition.com/wp-content/uploads/2018/01/Luxury-Hotel-Interior-Design-Minimalist-Monochromatic-Style-3.jpg',9110);
/*!40000 ALTER TABLE `room_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `uuid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'user',
  `isVerified` tinyint(1) DEFAULT 0,
  `verificationid` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phoneNumber` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin@dasith.local','5f4dcc3b5aa765d61d8327deb882cf99','admin',1,NULL,'94764641397'),(2,'user','user@dasith.local','5f4dcc3b5aa765d61d8327deb882cf99','user',1,NULL,'94764641397'),(12,'test','dasithsv@gmail.com','5f4dcc3b5aa765d61d8327deb882cf99','user',1,'ff682b65-9ed3-453a-9c32-050001820a18','94764641397'),(14,'hello','dogehi8530@pyrelle.com','5f4dcc3b5aa765d61d8327deb882cf99','user',1,'df86f919-11e3-4c46-ae48-45811f5dc5a8','94764641397'),(16,'exampleuser','suydefufye@vusra.com','5f4dcc3b5aa765d61d8327deb882cf99','user',1,'23b79606-3580-4840-983d-9480fa93f20e','0764641397'),(22,'helloworld','scoffey834@gmail.com','5f4dcc3b5aa765d61d8327deb882cf99','user',0,'61028f5d-13db-47b1-a3e3-897bf311459f','0764641397'),(23,'sfsdfsdjfhdskjhfkj','madef70622@whecode.com','f68cef4297ac7b5ea159d173730ab358','user',0,'e676fa8d-4ee5-4163-bf3a-9a8f2afac33f','12123'),(24,'mivalic146','mivalic146@wusehe.com','5f4dcc3b5aa765d61d8327deb882cf99','user',0,'eea80af0-f675-49c1-b340-249570bf893a','0764641397'),(26,'sdlkfjlksdf','z9fr@pm.me','5f4dcc3b5aa765d61d8327deb882cf99','user',0,'6d1cac8c-71e1-4694-b805-489be03cc426','0764641397'),(27,'kavindurupasinghe','kavindurupasinghe@gmail.com','5f4dcc3b5aa765d61d8327deb882cf99','user',0,'49a9e09a-8e10-440d-b6e2-1b0d36d67dca','0764641397'),(28,'myuser2','z9fr@protonmail.com','5f4dcc3b5aa765d61d8327deb882cf99','user',0,'fa20f1de-1c37-4c98-ba2a-3d46caead243','0764641397');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verfication_token`
--

DROP TABLE IF EXISTS `verfication_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verfication_token` (
  `verificationid` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isvalid` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`verificationid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verfication_token`
--

LOCK TABLES `verfication_token` WRITE;
/*!40000 ALTER TABLE `verfication_token` DISABLE KEYS */;
INSERT INTO `verfication_token` VALUES ('17a30e1e-908b-4206-b297-67c592b7c7ad','a0f84c87-b044-452d-b600-50c98411460f',1),('23b79606-3580-4840-983d-9480fa93f20e','ac54910a-2284-46bf-988b-7502cfd96ce1',0),('418cfab9-e1ce-4b37-9009-7183e237b39f','6a51c0d8-829b-4651-8ef7-0d7f11c832b9',1),('42ec5848-262f-4bdb-9b77-d6da2e7b3941','868efe0a-d3f6-40d1-b500-c39f28c6d5e8',1),('49a9e09a-8e10-440d-b6e2-1b0d36d67dca','e32e0a84-4fc2-408c-b6c4-300594084a37',1),('61028f5d-13db-47b1-a3e3-897bf311459f','84807a34-8821-44fe-829c-4220c0d91e2d',1),('6d1cac8c-71e1-4694-b805-489be03cc426','0cfef305-ee8d-44b0-b5b4-3ed2bebcd2f5',1),('89995f1c-affe-4248-9691-1fffa99bf9d0','16738158-4074-4cb0-acf8-624f26690201',1),('91a93643-4d32-4dae-bb40-5340c4c024db','06848133-6c7e-4b5b-b7b9-0ed96da64a26',1),('a2f6a9a9-723e-4210-acae-bc77aa1fbe26','461832a8-742b-4c8c-b6d1-ded71c40712e',0),('a664ced5-92a0-46bd-aa47-052e81f14f3b','4ea39dca-d740-4bbd-9341-ee92bd8cccb1',1),('e596d907-9329-4ee0-87f7-3684b199271d','fd83f26c-36fc-4aec-8f5c-015dc59d9ca3',0),('e676fa8d-4ee5-4163-bf3a-9a8f2afac33f','0eea21c6-a446-4119-8f90-5414c1df3cda',1),('eaf8d295-468a-4540-8c7f-dd11d6cacf2b','0228bd8f-be9b-4c4f-b68f-bdaaa3be8468',0),('eea80af0-f675-49c1-b340-249570bf893a','a5a429de-ecf7-4d55-9f17-1380edf6a14b',1),('f41f6bae-c5f4-4e92-a534-c4e49c7a704a','d136ba64-b258-471a-a01b-b8e645163663',1),('fa20f1de-1c37-4c98-ba2a-3d46caead243','767063f1-7138-44a7-8df5-26ce8d16004f',1);
/*!40000 ALTER TABLE `verfication_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `getAllusers`
--

/*!50001 DROP TABLE IF EXISTS `getAllusers`*/;
/*!50001 DROP VIEW IF EXISTS `getAllusers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `getAllusers` AS select `users`.`uname` AS `uname`,`users`.`email` AS `email` from `users` where `users`.`role` = 'user' */;
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

-- Dump completed on 2022-01-13 15:51:18
