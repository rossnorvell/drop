USE `drop`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: closedwa_login
-- ------------------------------------------------------
-- Server version	5.5.16

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
-- Table structure for table `dp_majors`
--

DROP TABLE IF EXISTS `dp_majors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dp_majors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dp_majors`
--

LOCK TABLES `dp_majors` WRITE;
/*!40000 ALTER TABLE `dp_majors` DISABLE KEYS */;
INSERT INTO `dp_majors` VALUES (1,'Other'),(2,'Accounting'),(3,'Economics'),(4,'Basic'),(5,'International'),(6,'Finance'),(7,'Management'),(8,'Marketing'),(9,'Athletic Training'),(10,'Exercise, Sport and Health Education'),(11,'Exercise and Sports Studies'),(12,'Sports Medicine'),(13,'Health Education and Health Promotion'),(14,'Physical and Health Education'),(15,'Commercial & Corporate Fitness'),(16,'Fitness, Strength, & Conditioning'),(17,'Sports Administration'),(18,'Nutrition and Dietetics'),(19,'Dietetics'),(20,'Recreation, Parks and Tourism'),(21,'Outdoor Recreation'),(22,'Tourism and Recreation Management'),(23,'Recreation Therapy'),(24,'Teacher Education'),(25,'Communication Sciences and Disorders'),(26,'Nursing'),(27,'Social Work'),(28,'Criminal Justice'),(29,'English'),(30,'English Education*'),(31,'Technical and Business Writing'),(32,'Foreign Languages and Literatures'),(33,'French'),(34,'German'),(35,'Spanish'),(36,'History'),(37,'History Education*'),(38,'Interdisciplinary Studies'),(39,'Early Childhood Education/Early Childhood Special Education with 5th year M.S. and licensure'),(40,'Elementary Education'),(41,'Liberal Arts - non-teaching'),(42,'Special Education: Deaf and Hard of Hearing with licensure in Hearing Impairment'),(43,'Special Education: General Curriculum with 5th year M.S. and licensure in ED, LD, & MR'),(44,'Middle Education Licensure'),(45,'Philosophy and Religious Studies'),(46,'Philosophy'),(47,'Religious Studies'),(48,'Political Science'),(49,'General'),(50,'Public Administration & Public Service'),(51,'Psychology'),(52,'School of Communication'),(53,'Communication'),(54,'Corporate Communication & Public Advocacy'),(55,'Public Relations'),(56,'Media Studies'),(57,'Advertising'),(58,'Journalism'),(59,'Production Technology'),(60,'Web Design'),(61,'Social Science'),(62,'Sociology'),(63,'Anthropological Sciences'),(64,'Forensic Anthropology'),(65,'Biology'),(66,'Biology Education*'),(67,'Biotechnology'),(68,'Environmental Biology'),(69,'General Biology'),(70,'Medical Technology'),(71,'Chemistry'),(72,'Biochemistry'),(73,'Chemistry Education*'),(74,'Forensics'),(75,'General Chemistry'),(76,'Pre-Health Professional'),(77,'Professional Chemist'),(78,'Computer Science and Technology'),(79,'Computer Science'),(80,'Database'),(81,'Networks'),(82,'Software Engineering'),(83,'Geology'),(84,'Earth Sciences'),(85,'Environmental and Engineering Geosciences'),(86,'General Geology'),(87,'Geospatial Science'),(88,'Environmental'),(89,'Geoinformatics'),(90,'Information Science and Systems'),(91,'Information Systems'),(92,'Web Development'),(93,'Mathematics'),(94,'Applied Mathematics'),(95,'Mathematics Education*'),(96,'Statistics'),(97,'Physics'),(98,'Physical Science'),(99,'Arts'),(100,'Art'),(101,'Art Education*'),(102,'Art History and Museum Studies'),(103,'Graphic Design'),(104,'Studio'),(105,'Dance'),(106,'Design'),(107,'Merchandising for Design'),(108,'Design Management'),(109,'Design Culture'),(110,'Fashion Design'),(111,'Interior Design'),(112,'Music'),(113,'Music'),(114,'Music Business'),(115,'Music Education'),(116,'Music Therapy'),(117,'Theatre');
/*!40000 ALTER TABLE `dp_majors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dp_colleges`
--

DROP TABLE IF EXISTS `dp_colleges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dp_colleges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dp_colleges`
--

LOCK TABLES `dp_colleges` WRITE;
/*!40000 ALTER TABLE `dp_colleges` DISABLE KEYS */;
INSERT INTO `dp_colleges` VALUES (1,'College of Humanities & Behavioral Sciences'),(2,'College of Business & Economics'),(3,'College of Education & Human Development'),(4,'College of Science & Technology'),(5,'College of Visual & Performing Arts'),(6,'College of Health & Human Services'),(7,'Pre-Major Advising');
/*!40000 ALTER TABLE `dp_colleges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dp_disabilities`
--

DROP TABLE IF EXISTS `dp_disabilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dp_disabilities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dp_disabilities`
--

LOCK TABLES `dp_disabilities` WRITE;
/*!40000 ALTER TABLE `dp_disabilities` DISABLE KEYS */;
INSERT INTO `dp_disabilities` VALUES (1,'HOH'),(2,'Temp'),(3,'Psych'),(4,'Med'),(5,'Visual'),(6,'Speech'),(7,'Ortho'),(8,'Neuro'),(9,'AD/HD'),(10,'Brain Injury'),(11,'Blind'),(12,'Low Vision'),(13,'Reading'),(14,'Math'),(15,'Language'),(16,'Writing'),(17,'Auditory'),(18,'Physical'),(19,'Autism Spectrum Disorders'),(20,'Other'),(21,'LD');
/*!40000 ALTER TABLE `dp_disabilities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-06-25 16:34:48
