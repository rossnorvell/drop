-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: drop
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
-- Table structure for table `dp_history`
--

DROP TABLE IF EXISTS `dp_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dp_history` (
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `message` longtext,
  PRIMARY KEY (`history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dp_history`
--

LOCK TABLES `dp_history` WRITE;
/*!40000 ALTER TABLE `dp_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `dp_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dp_services`
--

DROP TABLE IF EXISTS `dp_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dp_services` (
  `service_id` int(11) NOT NULL DEFAULT '0',
  `service_name` longtext,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dp_services`
--

LOCK TABLES `dp_services` WRITE;
/*!40000 ALTER TABLE `dp_services` DISABLE KEYS */;
INSERT INTO `dp_services` VALUES (1,'Time Management','2012-07-06 19:40:27'),(2,'Study Skills','2012-07-06 19:40:27'),(3,'Career Counseling','2012-07-06 19:40:27'),(4,'Counseling Center','2012-07-06 19:40:27'),(5,'Academic Advising','2012-07-06 19:40:27'),(6,'TRIO','2012-07-06 19:40:27'),(7,'LARC','2012-07-06 19:40:27'),(8,'Computer Lab','2012-07-06 19:40:27'),(9,'Study Groups','2012-07-06 19:40:27'),(10,'Writing Center','2012-07-06 19:40:27');
/*!40000 ALTER TABLE `dp_services` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Table structure for table `tie_class_accoms`
--

DROP TABLE IF EXISTS `tie_class_accoms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tie_class_accoms` (
  `accommodation_id` int(11) NOT NULL DEFAULT '0',
  `class_accom_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`class_accom_id`,`accommodation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tie_class_accoms`
--

LOCK TABLES `tie_class_accoms` WRITE;
/*!40000 ALTER TABLE `tie_class_accoms` DISABLE KEYS */;
INSERT INTO `tie_class_accoms` VALUES (8,35),(11,35),(12,35),(3,36),(10,36),(11,36),(9,37),(3,39),(8,39),(8,40),(12,40),(12,41),(3,42),(10,42),(8,43),(3,47),(11,50),(12,50),(8,52),(12,52),(3,53),(8,53),(10,53),(3,55),(9,55);
/*!40000 ALTER TABLE `tie_class_accoms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members` (
  `member_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `login` varchar(100) NOT NULL DEFAULT '',
  `passwd` varchar(32) NOT NULL DEFAULT '',
  `group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`member_id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'Ross','Norvell','admin','daeccf0ad3c1fc8c8015205c332f5b42',1),(9,'Carly','Dearing','cdearing2','ad64bed07b257421985bd0674afdec92',1),(6,'Angela','DeVore-Greene','amdevore','5d75d49cc0ab98397e686a0432b18750',1),(7,'Courtney','Bell','cbell7','1fef16b6129f65e9941f95116801eb3a',1),(8,'Maggie','Ramseyer','mramseyer','580f6fd3cb1d332644fbcc3577a19df6',1),(10,'bob','hermit','bhermit','daeccf0ad3c1fc8c8015205c332f5b42',1),(11,'Judy','Todd','jtodd','81dc9bdb52d04dc20036dbd8313ed055',1),(12,'Kristina','Contreras','kcontreras','81dc9bdb52d04dc20036dbd8313ed055',1),(13,NULL,'Frack','jfrack','daeccf0ad3c1fc8c8015205c332f5b42',1);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dp_contact`
--

DROP TABLE IF EXISTS `dp_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dp_contact` (
  `con_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `con_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `member_id` int(11) DEFAULT NULL,
  `purpose` varchar(255) DEFAULT NULL,
  `length` int(11) DEFAULT NULL,
  `notes` longtext,
  PRIMARY KEY (`con_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dp_contact`
--

LOCK TABLES `dp_contact` WRITE;
/*!40000 ALTER TABLE `dp_contact` DISABLE KEYS */;
INSERT INTO `dp_contact` VALUES (1,5,'2012-04-30 04:00:00',7,'',0,'Hello Erica!'),(2,125,'2012-06-20 04:00:00',12,'',0,'Received documentation- KC'),(3,127,'2012-06-20 04:00:00',12,'',0,'Received documentation- KC'),(4,6,'2012-06-20 04:00:00',12,'',0,'Student picked up accommodations. Please note Summer accommodations had &quot;Spring 2012&quot; semester on them but were signed by Specialist on 06/11/12- KC'),(5,5,'2012-07-09 02:19:36',1,'something',4,'a meeting of random testing...'),(6,129,'2012-07-09 23:01:23',1,'video',15,'example'),(7,134,'2012-07-27 00:24:33',1,'testing',4,'about cheese');
/*!40000 ALTER TABLE `dp_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dp_intake_doc_status`
--

DROP TABLE IF EXISTS `dp_intake_doc_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dp_intake_doc_status` (
  `doc_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `status_name` longtext,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`doc_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dp_intake_doc_status`
--

LOCK TABLES `dp_intake_doc_status` WRITE;
/*!40000 ALTER TABLE `dp_intake_doc_status` DISABLE KEYS */;
INSERT INTO `dp_intake_doc_status` VALUES (1,'No Documentation','2012-07-06 18:47:42'),(2,'Complete Documentation','2012-07-06 18:47:42'),(3,'Complete for ETS Standards','2012-07-06 18:47:42'),(4,'Complete for RU Standards','2012-07-06 18:47:42'),(5,'Doc Does Not Support Disability Definition','2012-07-06 18:47:42'),(6,'Partial Documentation','2012-07-06 18:47:42'),(7,'Referred for Evaluation/Documentation','2012-07-06 18:47:42'),(8,'Updated Documentation Necessary','2012-07-06 18:47:42');
/*!40000 ALTER TABLE `dp_intake_doc_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dp_exam_accommodations`
--

DROP TABLE IF EXISTS `dp_exam_accommodations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dp_exam_accommodations` (
  `exam_accom_id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_option` longtext,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`exam_accom_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dp_exam_accommodations`
--

LOCK TABLES `dp_exam_accommodations` WRITE;
/*!40000 ALTER TABLE `dp_exam_accommodations` DISABLE KEYS */;
INSERT INTO `dp_exam_accommodations` VALUES (1,'Reader','2012-07-01 18:03:14'),(2,'Scribe','2012-07-01 18:03:14'),(3,'Magnification Equipment','2012-07-01 18:03:14'),(4,'Reduced Distraction Environment','2012-07-01 18:03:14'),(5,'Calculator','2012-07-01 18:03:14'),(6,'Computer','2012-07-01 18:03:14'),(7,'Spell Checker','2012-07-01 18:03:14'),(8,'Dictionary/Thesaurus','2012-07-01 18:03:14'),(9,'Word Bank','2012-07-01 18:03:14'),(10,'Exam Breaks','2012-07-01 18:03:14'),(11,'Sign Language Interpreter','2012-07-01 18:03:14'),(12,'Electronic Exams w/ Captions','2012-07-01 18:03:14');
/*!40000 ALTER TABLE `dp_exam_accommodations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dp_class_accommodations`
--

DROP TABLE IF EXISTS `dp_class_accommodations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dp_class_accommodations` (
  `class_accom_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_option` longtext,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`class_accom_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dp_class_accommodations`
--

LOCK TABLES `dp_class_accommodations` WRITE;
/*!40000 ALTER TABLE `dp_class_accommodations` DISABLE KEYS */;
INSERT INTO `dp_class_accommodations` VALUES (35,'Accessible Furniture','2012-07-01 17:38:49'),(36,'Accessible Seating','2012-07-01 17:38:49'),(37,'Preferential Seating','2012-07-01 17:38:49'),(38,'Use of a Service Animal','2012-07-01 17:38:49'),(39,'Use of a Recording Device','2012-07-01 17:38:49'),(40,'Assistance Listening Technology','2012-07-01 17:38:49'),(41,'Alternative Text','2012-07-01 17:38:49'),(42,'Brailed Materials','2012-07-01 17:38:49'),(43,'Reproductions of overheads, graphs, charts, powerpoint and/or notes','2012-07-01 17:38:49'),(44,'Sign Language Interpreter/closed caption','2012-07-01 17:38:49'),(45,'Written Instructions','2012-07-01 17:38:49'),(46,'Oral Instructions','2012-07-01 17:38:49'),(47,'No Grammar or Spelling Penalty','2012-07-01 17:38:49'),(48,'Use of a Calculator','2012-07-01 17:38:49'),(49,'Use of a Laptop','2012-07-01 17:38:49'),(50,'Classroom Breaks as Needed','2012-07-01 17:38:49'),(51,'Amended Attendance policy','2012-07-01 17:38:49'),(52,'Extended time for in-class assignments','2012-07-01 17:38:49'),(53,'Extended Time for post-syllabus assignments','2012-07-01 17:38:49'),(54,'Closed Captioned Media','2012-07-01 17:38:49'),(55,'Note Taker','2012-07-01 17:38:49');
/*!40000 ALTER TABLE `dp_class_accommodations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL,
  `createAccoms` tinyint(4) NOT NULL DEFAULT '0',
  `createContact` tinyint(4) NOT NULL DEFAULT '0',
  `createIntake` tinyint(4) NOT NULL DEFAULT '0',
  `createStudent` tinyint(4) NOT NULL DEFAULT '0',
  `canView` tinyint(1) DEFAULT NULL,
  `adminPanel` tinyint(1) DEFAULT '0',
  `deleteAccoms` tinyint(1) DEFAULT '0',
  `deleteContact` tinyint(1) DEFAULT '0',
  `deleteIntake` tinyint(1) DEFAULT '0',
  `deleteStudent` tinyint(1) DEFAULT '0',
  `statisticsPanel` tinyint(1) DEFAULT '0',
  `editUser` tinyint(1) DEFAULT '0',
  `addUser` tinyint(1) DEFAULT '0',
  `editGroup` tinyint(1) DEFAULT '0',
  `addGroup` tinyint(1) DEFAULT '0',
  `springCleaning` tinyint(1) DEFAULT '0',
  `logs` tinyint(1) DEFAULT '0',
  `addClassAccommodations` tinyint(1) DEFAULT '0',
  `alterForms` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` VALUES (1,'Super Admin',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1);
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dp_intake`
--

DROP TABLE IF EXISTS `dp_intake`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dp_intake` (
  `student_id` int(11) DEFAULT NULL,
  `intake_id` int(11) NOT NULL AUTO_INCREMENT,
  `intake_date` date DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `primaryDis` varchar(255) DEFAULT NULL,
  `secondaryDis` varchar(255) DEFAULT NULL,
  `tertiaryDis` varchar(255) DEFAULT NULL,
  `otherDis` longtext,
  `docStatus` varchar(255) DEFAULT NULL,
  `docDate` date DEFAULT NULL,
  `docExp` date DEFAULT NULL,
  `docNeeded` longtext,
  `recommendation` longtext,
  `medications` longtext,
  `followup_notes` longtext,
  `followup_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `intake_notes` longtext,
  PRIMARY KEY (`intake_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dp_intake`
--

LOCK TABLES `dp_intake` WRITE;
/*!40000 ALTER TABLE `dp_intake` DISABLE KEYS */;
INSERT INTO `dp_intake` VALUES (5,1,'2012-04-30',7,'LD','Med','Other','','Complete for RU Standards','2011-04-28','2016-04-28','','extended time on tests and projects, will require visual prompts to assist with memory however IEP indicates several additional accommodations recommendations: note taker, clarification of instructions, use of a calculator across settings, visual prompts, permission to make presentations within a small group rather than large class, reader or other auditory medium for tests, separate quiet room, 100% extended time for testing, use of a study guide as justified by need for visual prompts. Recommendations for all campus services also suggested.','','','2012-07-06 04:00:00',''),(129,9,'2012-07-09',1,'Autism Spectrum Disorders','Autism Spectrum Disorders','Autism Spectrum Disorders','just crazy','Complete for ETS Standards','2012-07-09','2017-07-12','','no','none','talk about school so far.','2012-08-14 04:00:00','this is a test intake'),(134,10,'2012-07-26',1,'Auditory','Auditory','Auditory','asdf','Complete Documentation','2012-07-26','2016-07-05','','','','Talk about that thing.','2012-07-31 04:00:00','');
/*!40000 ALTER TABLE `dp_intake` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tie_service_intake`
--

DROP TABLE IF EXISTS `tie_service_intake`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tie_service_intake` (
  `intake_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tie_service_intake`
--

LOCK TABLES `tie_service_intake` WRITE;
/*!40000 ALTER TABLE `tie_service_intake` DISABLE KEYS */;
INSERT INTO `tie_service_intake` VALUES (1,3),(1,9),(1,10),(9,8),(9,7),(10,2),(10,10);
/*!40000 ALTER TABLE `tie_service_intake` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `message` longtext,
  `posted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`message_id`)
) ENGINE=MyISAM AUTO_INCREMENT=177 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (116,1,'tomatonator!','2012-04-25 00:01:44'),(115,1,'potato','2012-04-25 00:01:36'),(114,1,'test 2 34','2012-04-25 00:01:34'),(113,1,'testing 1 2 3','2012-04-25 00:01:04'),(112,1,'something else','2012-04-24 22:59:45'),(111,1,'some test','2012-04-24 22:59:33'),(110,1,'blah','2012-04-20 00:24:33'),(109,1,'test','2012-04-20 00:24:15'),(108,1,'test2','2012-04-20 00:23:23'),(106,1,'aljdsk','2012-04-20 00:22:49'),(107,1,'skjf','2012-04-20 00:22:52'),(105,1,'lksad','2012-04-20 00:22:45'),(104,1,'it didn\'t','2012-04-20 00:20:58'),(103,1,'why did that work?','2012-04-20 00:20:53'),(102,1,'fjlaksd','2012-04-20 00:20:43'),(101,1,'test','2012-04-20 00:19:49'),(100,1,'lkj','2012-04-20 00:14:51'),(99,1,'ksdjf','2012-04-20 00:14:24'),(98,1,'something','2012-04-20 00:13:08'),(97,1,'lksdjf','2012-04-20 00:12:58'),(96,1,'....','2012-04-20 00:11:35'),(95,1,'testing','2012-04-20 00:11:27'),(94,1,'...','2012-04-17 23:14:35'),(93,1,'message test','2012-04-17 23:14:27'),(92,8,'hi','2012-04-17 22:48:55'),(90,1,'Hey','2012-04-17 22:48:22'),(91,7,'hello =)','2012-04-17 22:48:34'),(117,1,'djfalk','2012-04-25 00:08:34'),(118,1,'cool, I think that that one worked!','2012-04-25 00:18:32'),(119,1,'me too!','2012-04-25 00:19:22'),(120,1,'make sure to refresh the page','2012-04-30 21:34:22'),(121,1,'blah','2012-05-25 18:13:04'),(122,1,'stuff','2012-05-25 21:05:51'),(123,1,'something','2012-05-25 21:10:27'),(124,1,'asdfasd','2012-05-25 21:10:30'),(125,1,'something','2012-05-26 11:18:37'),(126,1,'something','2012-05-27 03:33:46'),(127,1,'test','2012-05-27 03:33:55'),(128,1,'You see the game yester day?','2012-05-27 03:38:21'),(129,1,'na, you?','2012-05-27 03:38:30'),(130,1,'no, I\'m you! Silly goose','2012-05-27 03:38:40'),(131,1,'blah','2012-05-30 23:17:22'),(132,1,'blah','2012-05-30 23:18:24'),(133,1,'blah 2','2012-05-30 23:18:31'),(134,1,'testing?','2012-05-30 23:18:48'),(135,1,'testing the chat system','2012-05-30 23:27:33'),(136,1,'testing chat','2012-05-30 23:27:53'),(137,1,'testing the chat\'s comma feature','2012-05-30 23:38:19'),(138,1,'asdf','2012-05-30 23:38:35'),(139,1,'tesitng','2012-05-30 23:39:50'),(140,1,'tesing 1 2 3','2012-05-30 23:40:17'),(141,1,'blah','2012-05-30 23:40:23'),(142,1,'testing and more!','2012-05-30 23:40:44'),(143,1,'blah','2012-05-30 23:41:13'),(144,1,'blah\'s','2012-05-30 23:41:19'),(145,1,'jumbo shrimp','2012-05-30 23:41:27'),(146,1,'and last chat messages test \'\'\'\'\'','2012-05-30 23:54:37'),(147,1,'Hiza, it works!','2012-05-30 23:54:52'),(148,11,'Cho','2012-06-01 14:25:21'),(149,1,'test message 123','2012-06-24 15:55:13'),(150,1,'ajsldkf','2012-07-01 23:07:06'),(151,1,'blarg','2012-07-09 21:43:25'),(152,1,'lj','2012-07-09 21:43:39'),(153,1,'Hi!','2012-07-09 22:37:42'),(154,1,'hi!','2012-07-09 22:52:34'),(155,1,'asdfa','2012-07-09 22:52:44'),(156,1,'wow that\'s neat!','2012-07-09 22:54:08'),(157,1,'no it\'s not.','2012-07-09 22:56:20'),(158,1,'testing','2012-07-10 00:43:02'),(159,1,'testing','2012-07-10 00:43:15'),(160,1,'lksadjf','2012-07-10 00:43:18'),(161,1,'testing of message color','2012-07-10 00:44:10'),(162,1,'aksjd','2012-07-10 00:44:16'),(163,1,'blah','2012-07-10 00:44:58'),(164,1,';ljk','2012-07-10 00:45:51'),(165,1,'hi','2012-07-10 00:45:56'),(166,1,'hi','2012-07-10 00:45:57'),(167,1,'hi','2012-07-10 00:45:58'),(168,1,'Hi!','2012-07-10 00:46:07'),(169,1,'test','2012-07-10 00:47:37'),(170,1,'laksd','2012-07-10 00:48:22'),(171,1,'test','2012-07-10 00:49:49'),(172,1,'test','2012-07-10 00:50:21'),(173,1,'tester','2012-07-10 00:50:25'),(174,1,'hello ross!','2012-07-27 00:04:53'),(175,1,'hi!','2012-07-27 00:15:52'),(176,1,'hello','2012-07-27 00:20:28');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
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

--
-- Table structure for table `dp_accommodations`
--

DROP TABLE IF EXISTS `dp_accommodations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dp_accommodations` (
  `accommodation_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `accom_date` date DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `semester` varchar(50) DEFAULT NULL,
  `crn` varchar(7) DEFAULT NULL,
  `course` varchar(100) DEFAULT NULL,
  `section` varchar(2) DEFAULT NULL,
  `room_loc` varchar(100) DEFAULT NULL,
  `prof` varchar(150) DEFAULT NULL,
  `classNotes` varchar(100) DEFAULT NULL,
  `otherClassAccoms` longtext,
  `classAccomNotes` longtext,
  `altExamForm` varchar(100) DEFAULT NULL,
  `otherExamAccoms` longtext,
  `examAccomNotes` longtext,
  `extendedTimeEssay` double DEFAULT '0',
  `extendedTimeMath` double DEFAULT '0',
  PRIMARY KEY (`accommodation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dp_accommodations`
--

LOCK TABLES `dp_accommodations` WRITE;
/*!40000 ALTER TABLE `dp_accommodations` DISABLE KEYS */;
INSERT INTO `dp_accommodations` VALUES (3,5,'2012-04-30',7,'Fall 2012','30108','POSC120','1','Russell 347','Blond','Copy of Classmate\'s Notes','Permitted to deliver presentations and speeches in small group setting \nPermitted to have snacks in the classroom \nRequires visual prompts whenever possible','She needed this because Ross Said so....','Essay','','',0,0.75),(4,5,'2012-04-30',7,'Summer 2012','30108','POSC120','1','Russell 347','Bland','Copy of Classmate\'s Notes','Permitted to have snacks in the classroom Permitted to deliver presentations and speeches in small group setting Requires visual prompts whenever possible',NULL,'','','',NULL,NULL),(7,5,'1969-12-31',7,'Fall 2012','99999','RDRO999','','Tyler','Clark','Copy of Classmate\'s Notes','',NULL,'','','',NULL,NULL),(8,5,NULL,1,'Fall 2012','44444','asdf','5','456','norvell',NULL,'asdf is a hard class\n','','','','',0,1),(9,5,'0000-00-00',1,'Fall 2012','3454','asdf2','5','3454','norvell',NULL,'','','Answers Allowed on Test, rather scantron','','',0,1),(10,5,'0000-00-00',1,'Fall 2012','sfdg','sdfg','5','sdfg','ggg',NULL,'','','Answers Allowed on Test, rather scantron','','',0,1),(11,129,'0000-00-00',10,'Spring 2012','5555','Basket Weaving','4','55 Davis','Dr. bla',NULL,'','steals pencils.','Essay','Needs special chairs.','just notes',1,0.75),(12,134,'1970-01-01',10,'Fall 2013','55555','Basket Weaving','04','Davis 345','Dr. Blue',NULL,'Ross\'s other Accommodation.','Still a trouble maker','Essay','Exam accom test','',0.75,0.75);
/*!40000 ALTER TABLE `dp_accommodations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dp_limitations`
--

DROP TABLE IF EXISTS `dp_limitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dp_limitations` (
  `limitation_id` int(11) NOT NULL AUTO_INCREMENT,
  `limitation_name` longtext,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`limitation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dp_limitations`
--

LOCK TABLES `dp_limitations` WRITE;
/*!40000 ALTER TABLE `dp_limitations` DISABLE KEYS */;
INSERT INTO `dp_limitations` VALUES (1,'Distractibility','2012-07-06 19:37:39'),(2,'Hyperactivity','2012-07-06 19:37:39'),(3,'Organization','2012-07-06 19:37:39'),(4,'Time Management','2012-07-06 19:37:39'),(5,'Attention Concentration','2012-07-06 19:37:39'),(6,'Impulsivity','2012-07-06 19:37:39'),(7,'Deaf','2012-07-06 19:37:39'),(8,'Hard of Hearing','2012-07-06 19:37:39'),(9,'Access to Visual Information','2012-07-06 19:37:39'),(10,'Receptive Language','2012-07-06 19:37:39'),(11,'Expressive Language','2012-07-06 19:37:39'),(12,'Specific Language','2012-07-06 19:37:39'),(13,'Perserveration','2012-07-06 19:37:39'),(14,'Social Skills','2012-07-06 19:37:39'),(15,'Motor Coordination','2012-07-06 19:37:39'),(16,'Wheel Chair User','2012-07-06 19:37:39'),(17,'Ambulation Difficulty','2012-07-06 19:37:39'),(18,'Involuntary Ticks','2012-07-06 19:37:39'),(19,'InvoluntaryUtterances','2012-07-06 19:37:39'),(20,'Frequent Class Absences','2012-07-06 19:37:39'),(21,'Medication Induced Side Effects','2012-07-06 19:37:39'),(22,'Fatigue','2012-07-06 19:37:39'),(23,'Pain','2012-07-06 19:37:39'),(24,'Fluid Reasoning','2012-07-06 19:37:39'),(25,'Word Finding','2012-07-06 19:37:39'),(26,'Auditory Processing Intergration','2012-07-06 19:37:39'),(27,'Auditory Memory','2012-07-06 19:37:39'),(28,'Written Expression','2012-07-06 19:37:39'),(29,'Spelling','2012-07-06 19:37:39'),(30,'Oral Expression','2012-07-06 19:37:39'),(31,'Short Term Memory','2012-07-06 19:37:39'),(32,'Long Term Memory Information/Analysis Synthesis','2012-07-06 19:37:39'),(33,'Abstract Reasoning','2012-07-06 19:37:39'),(34,'Problem Solving','2012-07-06 19:37:39'),(35,'Processing Speed','2012-07-06 19:37:39'),(36,'Decoding','2012-07-06 19:37:39'),(37,'Executive Functioning','2012-07-06 19:37:39'),(38,'Judgement','2012-07-06 19:37:40'),(39,'Graphomotor','2012-07-06 19:37:40'),(40,'Working Memory','2012-07-06 19:37:40'),(41,'Reading Comprehension','2012-07-06 19:37:40'),(42,'Reading Rate','2012-07-06 19:37:40'),(43,'Spatial Orientation','2012-07-06 19:37:40'),(44,'Visual Processing/Integration','2012-07-06 19:37:40'),(45,'visual Motor Coordination','2012-07-06 19:37:40'),(46,'Visual Memory','2012-07-06 19:37:40'),(47,'Mathematical Reasoning','2012-07-06 19:37:40'),(48,'Mathematical Calculations','2012-07-06 19:37:40'),(49,'Maintaining/Sustaining Focus Inhibition','2012-07-06 19:37:40'),(50,'Task Completion','2012-07-06 19:37:40'),(51,'Alternative Media','2012-07-06 19:37:40'),(52,'Priority Registration','2012-07-06 19:37:40'),(53,'Auditory Learner','2012-07-06 19:37:40'),(54,'Visual Learner','2012-07-06 19:37:40'),(55,'Kinesthetic Learner','2012-07-06 19:37:40');
/*!40000 ALTER TABLE `dp_limitations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tie_limitation_intake`
--

DROP TABLE IF EXISTS `tie_limitation_intake`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tie_limitation_intake` (
  `intake_id` int(11) DEFAULT NULL,
  `limitation_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tie_limitation_intake`
--

LOCK TABLES `tie_limitation_intake` WRITE;
/*!40000 ALTER TABLE `tie_limitation_intake` DISABLE KEYS */;
INSERT INTO `tie_limitation_intake` VALUES (1,13),(1,43),(1,4),(1,44),(9,18),(9,19),(9,38),(9,48),(10,36),(10,22),(10,48);
/*!40000 ALTER TABLE `tie_limitation_intake` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tie_exam_accoms`
--

DROP TABLE IF EXISTS `tie_exam_accoms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tie_exam_accoms` (
  `accommodation_id` int(11) NOT NULL DEFAULT '0',
  `exam_accom_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`exam_accom_id`,`accommodation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tie_exam_accoms`
--

LOCK TABLES `tie_exam_accoms` WRITE;
/*!40000 ALTER TABLE `tie_exam_accoms` DISABLE KEYS */;
INSERT INTO `tie_exam_accoms` VALUES (12,1),(3,3),(9,3),(10,3),(11,5),(3,6),(9,6),(10,6),(11,6),(3,7),(12,7),(11,8),(3,9),(12,9),(12,11);
/*!40000 ALTER TABLE `tie_exam_accoms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dp_student`
--

DROP TABLE IF EXISTS `dp_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dp_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `univId` varchar(20) DEFAULT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `middlename` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `gender` varchar(6) DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `race` varchar(50) DEFAULT NULL,
  `studentType` varchar(150) DEFAULT NULL,
  `GPA` double DEFAULT NULL,
  `EnrollmentStatus` varchar(100) DEFAULT NULL,
  `creditLoad` varchar(100) DEFAULT NULL,
  `college` varchar(175) DEFAULT NULL,
  `major` varchar(100) DEFAULT NULL,
  `minor` varchar(100) DEFAULT NULL,
  `phoneNum` varchar(12) DEFAULT NULL,
  `ok2leaveConfMessage` tinyint(1) DEFAULT NULL,
  `ok2sendConfMessage` tinyint(1) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `locStAddress` varchar(300) DEFAULT NULL,
  `locStAddress2` varchar(300) DEFAULT NULL,
  `locCity` varchar(175) DEFAULT NULL,
  `locState` varchar(100) DEFAULT NULL,
  `locZip` varchar(10) DEFAULT NULL,
  `locCountry` varchar(200) DEFAULT NULL,
  `permStAddress` varchar(300) DEFAULT NULL,
  `permStAddress2` varchar(300) DEFAULT NULL,
  `permCity` varchar(175) DEFAULT NULL,
  `permState` varchar(100) DEFAULT NULL,
  `permZip` varchar(10) DEFAULT NULL,
  `permCountry` varchar(200) DEFAULT NULL,
  `emergencyFirst` varchar(100) DEFAULT NULL,
  `emergencyLast` varchar(150) DEFAULT NULL,
  `emergencyRelation` varchar(100) DEFAULT NULL,
  `emergencyPhoneNum` varchar(12) DEFAULT NULL,
  `notes` longtext,
  `lastUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `citizen` tinyint(1) DEFAULT NULL,
  `ferpaOnFile` tinyint(1) DEFAULT '0',
  `veteran` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=135 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dp_log`
--

DROP TABLE IF EXISTS `dp_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dp_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `message` longtext,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dp_log`
--

LOCK TABLES `dp_log` WRITE;
/*!40000 ALTER TABLE `dp_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `dp_log` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-09-05 19:10:20


-- CHANGE LOG
alter table dp_student change studentType studentStatus varchar (150) ;
alter table dp_student add column studentType varchar(150);

alter table dp_student add column endOfService date;

alter table dp_intake add column primaryDesc longtext;
alter table dp_intake add column secondaryDesc longtext;
alter table dp_intake add column tertiaryDesc longtext;

alter table dp_contact change purpose other longtext;
create table dp_purpose(
    purpose_id integer primary key auto_increment 
,   description longtext, 
    created timestamp default current_timestamp
);
alter table dp_contact add column purpose_id integer references dp_purpose(purpose_id);
create table dp_contact_type(
    contact_type_id integer primary key auto_increment 
,   description longtext, 
    created timestamp default current_timestamp
);
alter table dp_contact add column contact_type_id integer references dp_contact_type(contact_type_id);
