-- phpMyAdmin SQL Dump
-- version 3.2.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 14, 2012 at 01:42 PM
-- Server version: 5.1.30
-- PHP Version: 5.2.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


-- --------------------------------------------------------

--
-- Table structure for table `dp_accommodations`
--

CREATE TABLE IF NOT EXISTS `dp_accommodations` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=46 ;

--
-- Table structure for table `dp_class_accommodations`
--

CREATE TABLE IF NOT EXISTS `dp_class_accommodations` (
  `class_accom_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_option` longtext,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`class_accom_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=56 ;

--
-- Dumping data for table `dp_class_accommodations`
--

INSERT INTO `dp_class_accommodations` (`class_accom_id`, `class_option`, `created`) VALUES
(35, 'Accessible Furniture', '2012-07-01 17:38:49'),
(36, 'Accessible Seating', '2012-07-01 17:38:49'),
(37, 'Preferential Seating', '2012-07-01 17:38:49'),
(38, 'Use of a Service Animal', '2012-07-01 17:38:49'),
(39, 'Use of a Recording Device', '2012-07-01 17:38:49'),
(40, 'Assistance Listening Technology', '2012-07-01 17:38:49'),
(41, 'Alternative Text', '2012-07-01 17:38:49'),
(42, 'Brailed Materials', '2012-07-01 17:38:49'),
(43, 'Reproductions of overheads, graphs, charts, powerpoint and/or notes', '2012-07-01 17:38:49'),
(44, 'Sign Language Interpreter/closed caption', '2012-07-01 17:38:49'),
(45, 'Written Instructions', '2012-07-01 17:38:49'),
(46, 'Oral Instructions', '2012-07-01 17:38:49'),
(47, 'No Grammar or Spelling Penalty', '2012-07-01 17:38:49'),
(48, 'Use of a Calculator', '2012-07-01 17:38:49'),
(49, 'Use of a Laptop', '2012-07-01 17:38:49'),
(50, 'Classroom Breaks as Needed', '2012-07-01 17:38:49'),
(51, 'Amended Attendance policy', '2012-07-01 17:38:49'),
(52, 'Extended time for in-class assignments', '2012-07-01 17:38:49'),
(53, 'Extended Time for post-syllabus assignments', '2012-07-01 17:38:49'),
(54, 'Closed Captioned Media', '2012-07-01 17:38:49'),
(55, 'Note Taker', '2012-07-01 17:38:49');

-- --------------------------------------------------------

--
-- Table structure for table `dp_colleges`
--

CREATE TABLE IF NOT EXISTS `dp_colleges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `dp_colleges`
--

INSERT INTO `dp_colleges` (`id`, `name`) VALUES
(1, 'College of Humanities & Behavioral Sciences'),
(2, 'College of Business & Economics'),
(3, 'College of Education & Human Development'),
(4, 'College of Science & Technology'),
(5, 'College of Visual & Performing Arts'),
(6, 'College of Health & Human Services'),
(7, 'Pre-Major Advising');

-- --------------------------------------------------------

--
-- Table structure for table `dp_configs`
--

CREATE TABLE IF NOT EXISTS `dp_configs` (
  `config_id` int(11) NOT NULL AUTO_INCREMENT,
  `config_name` longtext,
  `merge_text` longtext,
  `location` longtext,
  `email` longtext,
  `dept_name` longtext,
  `phone_num` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`config_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `dp_configs`
--

INSERT INTO `dp_configs` (`config_id`, `config_name`, `merge_text`, `location`, `email`, `dept_name`, `phone_num`) VALUES
(1, 'DEFAULT', '<p align="center">\n	The student named in this agreement has a documented disability and is registered with the Disability Resource Office. In accordance with the Americans with Disabilities Act, the student has the right to be provided with reasonable academic accommodations.</p>\n<p align="center">\n	<em>These accommodations are supported by documentation on record in the DRO. Should these accommodations violate the technical standards of the class, major, or program, alternate accommodations or strategies may be negotiated through our office.</em></p>\n<p align="center">\n	Signatures on the accompanying RU Academic Accommodations Agreement signify that both parties have discussed and are in agreement with how the accommodations will be provided.</p>\n<p align="center">\n	<strong>Please handle these documents in a confidential manner.</strong></p>\n', 'Tyler Hall ', 'dro@radford.edu', 'DisAbility Office', '(540) 831-6350');

-- --------------------------------------------------------

--
-- Table structure for table `dp_contact`
--

CREATE TABLE IF NOT EXISTS `dp_contact` (
  `con_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `con_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `member_id` int(11) DEFAULT NULL,
  `other` longtext,
  `length` int(11) DEFAULT NULL,
  `notes` longtext,
  `purpose_id` int(11) DEFAULT NULL,
  `contact_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`con_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `dp_contact`
--


-- --------------------------------------------------------

--
-- Table structure for table `dp_contact_type`
--

CREATE TABLE IF NOT EXISTS `dp_contact_type` (
  `contact_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` longtext,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`contact_type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `dp_contact_type`
--

INSERT INTO `dp_contact_type` (`contact_type_id`, `description`, `created`) VALUES
(1, 'Phone', '2012-10-05 13:56:14'),
(2, 'Email', '2012-10-05 13:56:23');

-- --------------------------------------------------------

--
-- Table structure for table `dp_disabilities`
--

CREATE TABLE IF NOT EXISTS `dp_disabilities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `dp_disabilities`
--

INSERT INTO `dp_disabilities` (`id`, `name`) VALUES
(1, 'HOH'),
(2, 'Temp'),
(3, 'Psych'),
(4, 'Med'),
(5, 'Visual'),
(6, 'Speech'),
(7, 'Ortho'),
(8, 'Neuro'),
(9, 'AD/HD'),
(10, 'Brain Injury'),
(11, 'Blind'),
(12, 'Low Vision'),
(13, 'Reading'),
(14, 'Math'),
(15, 'Language'),
(16, 'Writing'),
(17, 'Auditory'),
(18, 'Physical'),
(19, 'Autism Spectrum Disorders'),
(20, 'Other'),
(21, 'LD');

-- --------------------------------------------------------

--
-- Table structure for table `dp_exam_accommodations`
--

CREATE TABLE IF NOT EXISTS `dp_exam_accommodations` (
  `exam_accom_id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_option` longtext,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`exam_accom_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `dp_exam_accommodations`
--

INSERT INTO `dp_exam_accommodations` (`exam_accom_id`, `exam_option`, `created`) VALUES
(1, 'Reader', '2012-07-01 18:03:14'),
(2, 'Scribe', '2012-07-01 18:03:14'),
(3, 'Magnification Equipment', '2012-07-01 18:03:14'),
(4, 'Reduced Distraction Environment', '2012-07-01 18:03:14'),
(5, 'Calculator', '2012-07-01 18:03:14'),
(6, 'Computer', '2012-07-01 18:03:14'),
(7, 'Spell Checker', '2012-07-01 18:03:14'),
(8, 'Dictionary/Thesaurus', '2012-07-01 18:03:14'),
(9, 'Word Bank', '2012-07-01 18:03:14'),
(10, 'Exam Breaks', '2012-07-01 18:03:14'),
(11, 'Sign Language Interpreter', '2012-07-01 18:03:14'),
(12, 'Electronic Exams w/ Captions', '2012-07-01 18:03:14');

-- --------------------------------------------------------

--
-- Table structure for table `dp_history`
--

CREATE TABLE IF NOT EXISTS `dp_history` (
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `message` longtext,
  PRIMARY KEY (`history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `dp_history`
--


-- --------------------------------------------------------

--
-- Table structure for table `dp_intake`
--

CREATE TABLE IF NOT EXISTS `dp_intake` (
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
  `primaryDesc` longtext,
  `secondaryDesc` longtext,
  `tertiaryDesc` longtext,
  PRIMARY KEY (`intake_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `dp_intake`
--


-- --------------------------------------------------------

--
-- Table structure for table `dp_intake_doc_status`
--

CREATE TABLE IF NOT EXISTS `dp_intake_doc_status` (
  `doc_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `status_name` longtext,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`doc_status_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `dp_intake_doc_status`
--

INSERT INTO `dp_intake_doc_status` (`doc_status_id`, `status_name`, `created`) VALUES
(1, 'No Documentation', '2012-07-06 18:47:42'),
(2, 'Complete Documentation', '2012-07-06 18:47:42'),
(3, 'Complete for ETS Standards', '2012-07-06 18:47:42'),
(4, 'Complete for RU Standards', '2012-07-06 18:47:42'),
(5, 'Doc Does Not Support Disability Definition', '2012-07-06 18:47:42'),
(6, 'Partial Documentation', '2012-07-06 18:47:42'),
(7, 'Referred for Evaluation/Documentation', '2012-07-06 18:47:42'),
(8, 'Updated Documentation Necessary', '2012-07-06 18:47:42');

-- --------------------------------------------------------

--
-- Table structure for table `dp_limitations`
--

CREATE TABLE IF NOT EXISTS `dp_limitations` (
  `limitation_id` int(11) NOT NULL AUTO_INCREMENT,
  `limitation_name` longtext,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`limitation_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=57 ;

--
-- Dumping data for table `dp_limitations`
--

INSERT INTO `dp_limitations` (`limitation_id`, `limitation_name`, `created`) VALUES
(1, 'Distractibility', '2012-07-06 19:37:39'),
(2, 'Hyperactivity', '2012-07-06 19:37:39'),
(3, 'Organization', '2012-07-06 19:37:39'),
(4, 'Time Management', '2012-07-06 19:37:39'),
(5, 'Attention Concentration', '2012-07-06 19:37:39'),
(6, 'Impulsivity', '2012-07-06 19:37:39'),
(7, 'Deaf', '2012-07-06 19:37:39'),
(8, 'Hard of Hearing', '2012-07-06 19:37:39'),
(9, 'Access to Visual Information', '2012-07-06 19:37:39'),
(10, 'Receptive Language', '2012-07-06 19:37:39'),
(11, 'Expressive Language', '2012-07-06 19:37:39'),
(12, 'Specific Language', '2012-07-06 19:37:39'),
(13, 'Perserveration', '2012-07-06 19:37:39'),
(14, 'Social Skills', '2012-07-06 19:37:39'),
(15, 'Motor Coordination', '2012-07-06 19:37:39'),
(16, 'Wheel Chair User', '2012-07-06 19:37:39'),
(17, 'Ambulation Difficulty', '2012-07-06 19:37:39'),
(18, 'Involuntary Ticks', '2012-07-06 19:37:39'),
(19, 'InvoluntaryUtterances', '2012-07-06 19:37:39'),
(20, 'Frequent Class Absences', '2012-07-06 19:37:39'),
(21, 'Medication Induced Side Effects', '2012-07-06 19:37:39'),
(22, 'Fatigue', '2012-07-06 19:37:39'),
(23, 'Pain', '2012-07-06 19:37:39'),
(24, 'Fluid Reasoning', '2012-07-06 19:37:39'),
(25, 'Word Finding', '2012-07-06 19:37:39'),
(26, 'Auditory Processing Intergration', '2012-07-06 19:37:39'),
(27, 'Auditory Memory', '2012-07-06 19:37:39'),
(28, 'Written Expression', '2012-07-06 19:37:39'),
(29, 'Spelling', '2012-07-06 19:37:39'),
(30, 'Oral Expression', '2012-07-06 19:37:39'),
(31, 'Short Term Memory', '2012-07-06 19:37:39'),
(32, 'Long Term Memory Information/Analysis Synthesis', '2012-07-06 19:37:39'),
(33, 'Abstract Reasoning', '2012-07-06 19:37:39'),
(34, 'Problem Solving', '2012-07-06 19:37:39'),
(35, 'Processing Speed', '2012-07-06 19:37:39'),
(36, 'Decoding', '2012-07-06 19:37:39'),
(37, 'Executive Functioning', '2012-07-06 19:37:39'),
(38, 'Judgement', '2012-07-06 19:37:40'),
(39, 'Graphomotor', '2012-07-06 19:37:40'),
(40, 'Working Memory', '2012-07-06 19:37:40'),
(41, 'Reading Comprehension', '2012-07-06 19:37:40'),
(42, 'Reading Rate', '2012-07-06 19:37:40'),
(43, 'Spatial Orientation', '2012-07-06 19:37:40'),
(44, 'Visual Processing/Integration', '2012-07-06 19:37:40'),
(45, 'visual Motor Coordination', '2012-07-06 19:37:40'),
(46, 'Visual Memory', '2012-07-06 19:37:40'),
(47, 'Mathematical Reasoning', '2012-07-06 19:37:40'),
(48, 'Mathematical Calculations', '2012-07-06 19:37:40'),
(49, 'Maintaining/Sustaining Focus Inhibition', '2012-07-06 19:37:40'),
(50, 'Task Completion', '2012-07-06 19:37:40'),
(51, 'Alternative Media', '2012-07-06 19:37:40'),
(53, 'Auditory Learner', '2012-07-06 19:37:40'),
(54, 'Visual Learner', '2012-07-06 19:37:40'),
(55, 'Kinesthetic Learner', '2012-07-06 19:37:40');

-- --------------------------------------------------------

--
-- Table structure for table `dp_log`
--

CREATE TABLE IF NOT EXISTS `dp_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `message` longtext,
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `dp_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `dp_majors`
--

CREATE TABLE IF NOT EXISTS `dp_majors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=118 ;

--
-- Dumping data for table `dp_majors`
--

INSERT INTO `dp_majors` (`id`, `name`) VALUES
(1, 'Other'),
(2, 'Accounting'),
(3, 'Economics'),
(4, 'Basic'),
(5, 'International'),
(6, 'Finance'),
(7, 'Management'),
(8, 'Marketing'),
(9, 'Athletic Training'),
(10, 'Exercise, Sport and Health Education'),
(11, 'Exercise and Sports Studies'),
(12, 'Sports Medicine'),
(13, 'Health Education and Health Promotion'),
(14, 'Physical and Health Education'),
(15, 'Commercial & Corporate Fitness'),
(16, 'Fitness, Strength, & Conditioning'),
(17, 'Sports Administration'),
(18, 'Nutrition and Dietetics'),
(19, 'Dietetics'),
(20, 'Recreation, Parks and Tourism'),
(21, 'Outdoor Recreation'),
(22, 'Tourism and Recreation Management'),
(23, 'Recreation Therapy'),
(24, 'Teacher Education'),
(25, 'Communication Sciences and Disorders'),
(26, 'Nursing'),
(27, 'Social Work'),
(28, 'Criminal Justice'),
(29, 'English'),
(30, 'English Education*'),
(31, 'Technical and Business Writing'),
(32, 'Foreign Languages and Literatures'),
(33, 'French'),
(34, 'German'),
(35, 'Spanish'),
(36, 'History'),
(37, 'History Education*'),
(38, 'Interdisciplinary Studies'),
(39, 'Early Childhood Education/Early Childhood Special Education with 5th year M.S. and licensure'),
(40, 'Elementary Education'),
(41, 'Liberal Arts - non-teaching'),
(42, 'Special Education: Deaf and Hard of Hearing with licensure in Hearing Impairment'),
(43, 'Special Education: General Curriculum with 5th year M.S. and licensure in ED, LD, & MR'),
(44, 'Middle Education Licensure'),
(45, 'Philosophy and Religious Studies'),
(46, 'Philosophy'),
(47, 'Religious Studies'),
(48, 'Political Science'),
(49, 'General'),
(50, 'Public Administration & Public Service'),
(51, 'Psychology'),
(52, 'School of Communication'),
(53, 'Communication'),
(54, 'Corporate Communication & Public Advocacy'),
(55, 'Public Relations'),
(56, 'Media Studies'),
(57, 'Advertising'),
(58, 'Journalism'),
(59, 'Production Technology'),
(60, 'Web Design'),
(61, 'Social Science'),
(62, 'Sociology'),
(63, 'Anthropological Sciences'),
(64, 'Forensic Anthropology'),
(65, 'Biology'),
(66, 'Biology Education*'),
(67, 'Biotechnology'),
(68, 'Environmental Biology'),
(69, 'General Biology'),
(70, 'Medical Technology'),
(71, 'Chemistry'),
(72, 'Biochemistry'),
(73, 'Chemistry Education*'),
(74, 'Forensics'),
(75, 'General Chemistry'),
(76, 'Pre-Health Professional'),
(77, 'Professional Chemist'),
(78, 'Computer Science and Technology'),
(79, 'Computer Science'),
(80, 'Database'),
(81, 'Networks'),
(82, 'Software Engineering'),
(83, 'Geology'),
(84, 'Earth Sciences'),
(85, 'Environmental and Engineering Geosciences'),
(86, 'General Geology'),
(87, 'Geospatial Science'),
(88, 'Environmental'),
(89, 'Geoinformatics'),
(90, 'Information Science and Systems'),
(91, 'Information Systems'),
(92, 'Web Development'),
(93, 'Mathematics'),
(94, 'Applied Mathematics'),
(95, 'Mathematics Education*'),
(96, 'Statistics'),
(97, 'Physics'),
(98, 'Physical Science'),
(99, 'Arts'),
(100, 'Art'),
(101, 'Art Education*'),
(102, 'Art History and Museum Studies'),
(103, 'Graphic Design'),
(104, 'Studio'),
(105, 'Dance'),
(106, 'Design'),
(107, 'Merchandising for Design'),
(108, 'Design Management'),
(109, 'Design Culture'),
(110, 'Fashion Design'),
(111, 'Interior Design'),
(112, 'Music'),
(113, 'Music'),
(114, 'Music Business'),
(115, 'Music Education'),
(116, 'Music Therapy'),
(117, 'Theatre');

-- --------------------------------------------------------

--
-- Table structure for table `dp_purpose`
--

CREATE TABLE IF NOT EXISTS `dp_purpose` (
  `purpose_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` longtext,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`purpose_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `dp_purpose`
--

INSERT INTO `dp_purpose` (`purpose_id`, `description`, `created`) VALUES
(1, 'Follow Up', '2012-10-05 13:57:00'),
(2, 'Interview', '2012-10-05 13:57:09');

-- --------------------------------------------------------

--
-- Table structure for table `dp_services`
--

CREATE TABLE IF NOT EXISTS `dp_services` (
  `service_id` int(11) NOT NULL DEFAULT '0',
  `service_name` longtext,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`service_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dp_services`
--

INSERT INTO `dp_services` (`service_id`, `service_name`, `created`) VALUES
(1, 'Time Management', '2012-07-06 19:40:27'),
(2, 'Study Skills', '2012-07-06 19:40:27'),
(3, 'Career Counseling', '2012-07-06 19:40:27'),
(4, 'Counseling Center', '2012-07-06 19:40:27'),
(5, 'Academic Advising', '2012-07-06 19:40:27'),
(6, 'TRIO', '2012-07-06 19:40:27'),
(7, 'LARC', '2012-07-06 19:40:27'),
(8, 'Computer Lab', '2012-07-06 19:40:27'),
(9, 'Study Groups', '2012-07-06 19:40:27'),
(10, 'Writing Center', '2012-07-06 19:40:27'),
(0, 'Programming.', '2012-09-12 14:18:27');

-- --------------------------------------------------------

--
-- Table structure for table `dp_student`
--

CREATE TABLE IF NOT EXISTS `dp_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `univId` varchar(20) DEFAULT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `middlename` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `gender` varchar(6) DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `race` varchar(50) DEFAULT NULL,
  `studentStatus` varchar(150) DEFAULT NULL,
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
  `studentType` varchar(150) DEFAULT NULL,
  `endOfService` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=153 ;

--
-- Dumping data for table `dp_student`
--


-- --------------------------------------------------------

--
-- Table structure for table `group`
--

CREATE TABLE IF NOT EXISTS `group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL,
  `createAccoms` tinyint(4) NOT NULL DEFAULT '0',
  `createContact` tinyint(4) NOT NULL DEFAULT '0',
  `createIntake` tinyint(4) NOT NULL DEFAULT '0',
  `createStudent` tinyint(4) NOT NULL DEFAULT '0',
  `canView` tinyint(1) DEFAULT '0',
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
  `editConfigs` tinyint(1) DEFAULT '0',
  `addClassAccommodations` tinyint(1) DEFAULT '0',
  `alterForms` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `group`
--

INSERT INTO `group` (`group_id`, `name`, `createAccoms`, `createContact`, `createIntake`, `createStudent`, `canView`, `adminPanel`, `deleteAccoms`, `deleteContact`, `deleteIntake`, `deleteStudent`, `statisticsPanel`, `editUser`, `addUser`, `editGroup`, `addGroup`, `springCleaning`, `editConfigs`, `addClassAccommodations`, `alterForms`) VALUES
(1, 'Super Admin', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(2, 'Normal', 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 'Admin', 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE IF NOT EXISTS `members` (
  `member_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `login` varchar(100) NOT NULL DEFAULT '',
  `passwd` varchar(32) NOT NULL DEFAULT '',
  `group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`member_id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`member_id`, `firstname`, `lastname`, `login`, `passwd`, `group_id`) VALUES
(1, 'Ross', 'Norvell', 'admin', 'daeccf0ad3c1fc8c8015205c332f5b42', 1),
(9, 'Carly', 'Dearing', 'cdearing2', 'ad64bed07b257421985bd0674afdec92', 3),
(6, 'Angela', 'DeVore-Greene', 'amdevore', '5d75d49cc0ab98397e686a0432b18750', 1),
(7, 'Courtney', 'Bell', 'cbell7', '1fef16b6129f65e9941f95116801eb3a', 1),
(8, 'Maggie', 'Ramseyer', 'mramseyer', '580f6fd3cb1d332644fbcc3577a19df6', 3),
(12, 'Kristina', 'Contreras', 'kcontreras', '81dc9bdb52d04dc20036dbd8313ed055', 3),
(13, 'Jesica', 'Myers', 'jmyers7', 'ea6dc597e14c198cce4856eb85fa6cd8', 3);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `message` longtext,
  `posted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`message_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=182 ;

--
-- Dumping data for table `messages`
--


-- --------------------------------------------------------

--
-- Table structure for table `tie_class_accoms`
--

CREATE TABLE IF NOT EXISTS `tie_class_accoms` (
  `accommodation_id` int(11) NOT NULL DEFAULT '0',
  `class_accom_id` int(11) NOT NULL DEFAULT '0',
  `specifically` longtext,
  PRIMARY KEY (`class_accom_id`,`accommodation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tie_class_accoms`
--


-- --------------------------------------------------------

--
-- Table structure for table `tie_exam_accoms`
--

CREATE TABLE IF NOT EXISTS `tie_exam_accoms` (
  `accommodation_id` int(11) NOT NULL DEFAULT '0',
  `exam_accom_id` int(11) NOT NULL DEFAULT '0',
  `specifically` longtext,
  PRIMARY KEY (`exam_accom_id`,`accommodation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tie_exam_accoms`
--


-- --------------------------------------------------------

--
-- Table structure for table `tie_limitation_intake`
--

CREATE TABLE IF NOT EXISTS `tie_limitation_intake` (
  `intake_id` int(11) DEFAULT NULL,
  `limitation_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tie_limitation_intake`
--


-- --------------------------------------------------------

--
-- Table structure for table `tie_service_intake`
--

CREATE TABLE IF NOT EXISTS `tie_service_intake` (
  `intake_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tie_service_intake`
--

--
-- Database: `information_schema`
--
CREATE DATABASE `information_schema` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `information_schema`;

-- --------------------------------------------------------

--
-- Table structure for table `CHARACTER_SETS`
--

CREATE TEMPORARY TABLE `CHARACTER_SETS` (
  `CHARACTER_SET_NAME` varchar(64) NOT NULL DEFAULT '',
  `DEFAULT_COLLATE_NAME` varchar(64) NOT NULL DEFAULT '',
  `DESCRIPTION` varchar(60) NOT NULL DEFAULT '',
  `MAXLEN` bigint(3) NOT NULL DEFAULT '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `CHARACTER_SETS`
--

INSERT INTO `CHARACTER_SETS` (`CHARACTER_SET_NAME`, `DEFAULT_COLLATE_NAME`, `DESCRIPTION`, `MAXLEN`) VALUES
('dec8', 'dec8_swedish_ci', 'DEC West European', 1),
('cp850', 'cp850_general_ci', 'DOS West European', 1),
('hp8', 'hp8_english_ci', 'HP West European', 1),
('koi8r', 'koi8r_general_ci', 'KOI8-R Relcom Russian', 1),
('latin1', 'latin1_swedish_ci', 'cp1252 West European', 1),
('latin2', 'latin2_general_ci', 'ISO 8859-2 Central European', 1),
('swe7', 'swe7_swedish_ci', '7bit Swedish', 1),
('ascii', 'ascii_general_ci', 'US ASCII', 1),
('hebrew', 'hebrew_general_ci', 'ISO 8859-8 Hebrew', 1),
('koi8u', 'koi8u_general_ci', 'KOI8-U Ukrainian', 1),
('greek', 'greek_general_ci', 'ISO 8859-7 Greek', 1),
('cp1250', 'cp1250_general_ci', 'Windows Central European', 1),
('latin5', 'latin5_turkish_ci', 'ISO 8859-9 Turkish', 1),
('armscii8', 'armscii8_general_ci', 'ARMSCII-8 Armenian', 1),
('utf8', 'utf8_general_ci', 'UTF-8 Unicode', 3),
('cp866', 'cp866_general_ci', 'DOS Russian', 1),
('keybcs2', 'keybcs2_general_ci', 'DOS Kamenicky Czech-Slovak', 1),
('macce', 'macce_general_ci', 'Mac Central European', 1),
('macroman', 'macroman_general_ci', 'Mac West European', 1),
('cp852', 'cp852_general_ci', 'DOS Central European', 1),
('latin7', 'latin7_general_ci', 'ISO 8859-13 Baltic', 1),
('cp1251', 'cp1251_general_ci', 'Windows Cyrillic', 1),
('cp1256', 'cp1256_general_ci', 'Windows Arabic', 1),
('cp1257', 'cp1257_general_ci', 'Windows Baltic', 1),
('binary', 'binary', 'Binary pseudo charset', 1),
('geostd8', 'geostd8_general_ci', 'GEOSTD8 Georgian', 1);

-- --------------------------------------------------------

--
-- Table structure for table `COLLATIONS`
--

CREATE TEMPORARY TABLE `COLLATIONS` (
  `COLLATION_NAME` varchar(64) NOT NULL DEFAULT '',
  `CHARACTER_SET_NAME` varchar(64) NOT NULL DEFAULT '',
  `ID` bigint(11) NOT NULL DEFAULT '0',
  `IS_DEFAULT` varchar(3) NOT NULL DEFAULT '',
  `IS_COMPILED` varchar(3) NOT NULL DEFAULT '',
  `SORTLEN` bigint(3) NOT NULL DEFAULT '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `COLLATIONS`
--

INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES
('dec8_swedish_ci', 'dec8', 3, 'Yes', '', 0),
('dec8_bin', 'dec8', 69, '', '', 0),
('cp850_general_ci', 'cp850', 4, 'Yes', '', 0),
('cp850_bin', 'cp850', 80, '', '', 0),
('hp8_english_ci', 'hp8', 6, 'Yes', '', 0),
('hp8_bin', 'hp8', 72, '', '', 0),
('koi8r_general_ci', 'koi8r', 7, 'Yes', '', 0),
('koi8r_bin', 'koi8r', 74, '', '', 0),
('latin1_german1_ci', 'latin1', 5, '', 'Yes', 1),
('latin1_swedish_ci', 'latin1', 8, 'Yes', 'Yes', 1),
('latin1_danish_ci', 'latin1', 15, '', 'Yes', 1),
('latin1_german2_ci', 'latin1', 31, '', 'Yes', 2),
('latin1_bin', 'latin1', 47, '', 'Yes', 1),
('latin1_general_ci', 'latin1', 48, '', 'Yes', 1),
('latin1_general_cs', 'latin1', 49, '', 'Yes', 1),
('latin1_spanish_ci', 'latin1', 94, '', 'Yes', 1),
('latin2_general_ci', 'latin2', 9, 'Yes', '', 0),
('latin2_hungarian_ci', 'latin2', 21, '', '', 0),
('latin2_croatian_ci', 'latin2', 27, '', '', 0),
('latin2_bin', 'latin2', 77, '', '', 0),
('swe7_swedish_ci', 'swe7', 10, 'Yes', '', 0),
('swe7_bin', 'swe7', 82, '', '', 0),
('ascii_general_ci', 'ascii', 11, 'Yes', '', 0),
('ascii_bin', 'ascii', 65, '', '', 0),
('hebrew_general_ci', 'hebrew', 16, 'Yes', '', 0),
('hebrew_bin', 'hebrew', 71, '', '', 0),
('koi8u_general_ci', 'koi8u', 22, 'Yes', '', 0),
('koi8u_bin', 'koi8u', 75, '', '', 0),
('greek_general_ci', 'greek', 25, 'Yes', '', 0),
('greek_bin', 'greek', 70, '', '', 0),
('cp1250_general_ci', 'cp1250', 26, 'Yes', '', 0),
('cp1250_croatian_ci', 'cp1250', 44, '', '', 0),
('cp1250_bin', 'cp1250', 66, '', '', 0),
('cp1250_polish_ci', 'cp1250', 99, '', '', 0),
('latin5_turkish_ci', 'latin5', 30, 'Yes', '', 0),
('latin5_bin', 'latin5', 78, '', '', 0),
('armscii8_general_ci', 'armscii8', 32, 'Yes', '', 0),
('armscii8_bin', 'armscii8', 64, '', '', 0),
('utf8_general_ci', 'utf8', 33, 'Yes', 'Yes', 1),
('utf8_bin', 'utf8', 83, '', 'Yes', 1),
('utf8_unicode_ci', 'utf8', 192, '', 'Yes', 8),
('utf8_icelandic_ci', 'utf8', 193, '', 'Yes', 8),
('utf8_latvian_ci', 'utf8', 194, '', 'Yes', 8),
('utf8_romanian_ci', 'utf8', 195, '', 'Yes', 8),
('utf8_slovenian_ci', 'utf8', 196, '', 'Yes', 8),
('utf8_polish_ci', 'utf8', 197, '', 'Yes', 8),
('utf8_estonian_ci', 'utf8', 198, '', 'Yes', 8),
('utf8_spanish_ci', 'utf8', 199, '', 'Yes', 8),
('utf8_swedish_ci', 'utf8', 200, '', 'Yes', 8),
('utf8_turkish_ci', 'utf8', 201, '', 'Yes', 8),
('utf8_czech_ci', 'utf8', 202, '', 'Yes', 8),
('utf8_danish_ci', 'utf8', 203, '', 'Yes', 8),
('utf8_lithuanian_ci', 'utf8', 204, '', 'Yes', 8),
('utf8_slovak_ci', 'utf8', 205, '', 'Yes', 8),
('utf8_spanish2_ci', 'utf8', 206, '', 'Yes', 8),
('utf8_roman_ci', 'utf8', 207, '', 'Yes', 8),
('utf8_persian_ci', 'utf8', 208, '', 'Yes', 8),
('utf8_esperanto_ci', 'utf8', 209, '', 'Yes', 8),
('utf8_hungarian_ci', 'utf8', 210, '', 'Yes', 8),
('cp866_general_ci', 'cp866', 36, 'Yes', '', 0),
('cp866_bin', 'cp866', 68, '', '', 0),
('keybcs2_general_ci', 'keybcs2', 37, 'Yes', '', 0),
('keybcs2_bin', 'keybcs2', 73, '', '', 0),
('macce_general_ci', 'macce', 38, 'Yes', '', 0),
('macce_bin', 'macce', 43, '', '', 0),
('macroman_general_ci', 'macroman', 39, 'Yes', '', 0),
('macroman_bin', 'macroman', 53, '', '', 0),
('cp852_general_ci', 'cp852', 40, 'Yes', '', 0),
('cp852_bin', 'cp852', 81, '', '', 0),
('latin7_estonian_cs', 'latin7', 20, '', '', 0),
('latin7_general_ci', 'latin7', 41, 'Yes', '', 0),
('latin7_general_cs', 'latin7', 42, '', '', 0),
('latin7_bin', 'latin7', 79, '', '', 0),
('cp1251_bulgarian_ci', 'cp1251', 14, '', '', 0),
('cp1251_ukrainian_ci', 'cp1251', 23, '', '', 0),
('cp1251_bin', 'cp1251', 50, '', '', 0),
('cp1251_general_ci', 'cp1251', 51, 'Yes', '', 0),
('cp1251_general_cs', 'cp1251', 52, '', '', 0),
('cp1256_general_ci', 'cp1256', 57, 'Yes', '', 0),
('cp1256_bin', 'cp1256', 67, '', '', 0),
('cp1257_lithuanian_ci', 'cp1257', 29, '', '', 0),
('cp1257_bin', 'cp1257', 58, '', '', 0),
('cp1257_general_ci', 'cp1257', 59, 'Yes', '', 0),
('binary', 'binary', 63, 'Yes', 'Yes', 1),
('geostd8_general_ci', 'geostd8', 92, 'Yes', '', 0),
('geostd8_bin', 'geostd8', 93, '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `COLLATION_CHARACTER_SET_APPLICABILITY`
--

CREATE TEMPORARY TABLE `COLLATION_CHARACTER_SET_APPLICABILITY` (
  `COLLATION_NAME` varchar(64) NOT NULL DEFAULT '',
  `CHARACTER_SET_NAME` varchar(64) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `COLLATION_CHARACTER_SET_APPLICABILITY`
--

INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES
('dec8_swedish_ci', 'dec8'),
('dec8_bin', 'dec8'),
('cp850_general_ci', 'cp850'),
('cp850_bin', 'cp850'),
('hp8_english_ci', 'hp8'),
('hp8_bin', 'hp8'),
('koi8r_general_ci', 'koi8r'),
('koi8r_bin', 'koi8r'),
('latin1_german1_ci', 'latin1'),
('latin1_swedish_ci', 'latin1'),
('latin1_danish_ci', 'latin1'),
('latin1_german2_ci', 'latin1'),
('latin1_bin', 'latin1'),
('latin1_general_ci', 'latin1'),
('latin1_general_cs', 'latin1'),
('latin1_spanish_ci', 'latin1'),
('latin2_general_ci', 'latin2'),
('latin2_hungarian_ci', 'latin2'),
('latin2_croatian_ci', 'latin2'),
('latin2_bin', 'latin2'),
('swe7_swedish_ci', 'swe7'),
('swe7_bin', 'swe7'),
('ascii_general_ci', 'ascii'),
('ascii_bin', 'ascii'),
('hebrew_general_ci', 'hebrew'),
('hebrew_bin', 'hebrew'),
('filename', 'filename'),
('koi8u_general_ci', 'koi8u'),
('koi8u_bin', 'koi8u'),
('greek_general_ci', 'greek'),
('greek_bin', 'greek'),
('cp1250_general_ci', 'cp1250'),
('cp1250_croatian_ci', 'cp1250'),
('cp1250_bin', 'cp1250'),
('cp1250_polish_ci', 'cp1250'),
('latin5_turkish_ci', 'latin5'),
('latin5_bin', 'latin5'),
('armscii8_general_ci', 'armscii8'),
('armscii8_bin', 'armscii8'),
('utf8_general_ci', 'utf8'),
('utf8_bin', 'utf8'),
('utf8_unicode_ci', 'utf8'),
('utf8_icelandic_ci', 'utf8'),
('utf8_latvian_ci', 'utf8'),
('utf8_romanian_ci', 'utf8'),
('utf8_slovenian_ci', 'utf8'),
('utf8_polish_ci', 'utf8'),
('utf8_estonian_ci', 'utf8'),
('utf8_spanish_ci', 'utf8'),
('utf8_swedish_ci', 'utf8'),
('utf8_turkish_ci', 'utf8'),
('utf8_czech_ci', 'utf8'),
('utf8_danish_ci', 'utf8'),
('utf8_lithuanian_ci', 'utf8'),
('utf8_slovak_ci', 'utf8'),
('utf8_spanish2_ci', 'utf8'),
('utf8_roman_ci', 'utf8'),
('utf8_persian_ci', 'utf8'),
('utf8_esperanto_ci', 'utf8'),
('utf8_hungarian_ci', 'utf8'),
('cp866_general_ci', 'cp866'),
('cp866_bin', 'cp866'),
('keybcs2_general_ci', 'keybcs2'),
('keybcs2_bin', 'keybcs2'),
('macce_general_ci', 'macce'),
('macce_bin', 'macce'),
('macroman_general_ci', 'macroman'),
('macroman_bin', 'macroman'),
('cp852_general_ci', 'cp852'),
('cp852_bin', 'cp852'),
('latin7_estonian_cs', 'latin7'),
('latin7_general_ci', 'latin7'),
('latin7_general_cs', 'latin7'),
('latin7_bin', 'latin7'),
('cp1251_bulgarian_ci', 'cp1251'),
('cp1251_ukrainian_ci', 'cp1251'),
('cp1251_bin', 'cp1251'),
('cp1251_general_ci', 'cp1251'),
('cp1251_general_cs', 'cp1251'),
('cp1256_general_ci', 'cp1256'),
('cp1256_bin', 'cp1256'),
('cp1257_lithuanian_ci', 'cp1257'),
('cp1257_bin', 'cp1257'),
('cp1257_general_ci', 'cp1257'),
('binary', 'binary'),
('geostd8_general_ci', 'geostd8'),
('geostd8_bin', 'geostd8');

-- --------------------------------------------------------

--
-- Table structure for table `COLUMNS`
--

CREATE TEMPORARY TABLE `COLUMNS` (
  `TABLE_CATALOG` varchar(512) DEFAULT NULL,
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `COLUMN_NAME` varchar(64) NOT NULL DEFAULT '',
  `ORDINAL_POSITION` bigint(21) unsigned NOT NULL DEFAULT '0',
  `COLUMN_DEFAULT` longtext,
  `IS_NULLABLE` varchar(3) NOT NULL DEFAULT '',
  `DATA_TYPE` varchar(64) NOT NULL DEFAULT '',
  `CHARACTER_MAXIMUM_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `CHARACTER_OCTET_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `NUMERIC_PRECISION` bigint(21) unsigned DEFAULT NULL,
  `NUMERIC_SCALE` bigint(21) unsigned DEFAULT NULL,
  `CHARACTER_SET_NAME` varchar(64) DEFAULT NULL,
  `COLLATION_NAME` varchar(64) DEFAULT NULL,
  `COLUMN_TYPE` longtext NOT NULL,
  `COLUMN_KEY` varchar(3) NOT NULL DEFAULT '',
  `EXTRA` varchar(27) NOT NULL DEFAULT '',
  `PRIVILEGES` varchar(80) NOT NULL DEFAULT '',
  `COLUMN_COMMENT` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `COLUMNS`
--

INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES
(NULL, 'information_schema', 'CHARACTER_SETS', 'CHARACTER_SET_NAME', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'CHARACTER_SETS', 'DEFAULT_COLLATE_NAME', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'CHARACTER_SETS', 'DESCRIPTION', 3, '', 'NO', 'varchar', 60, 180, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(60)', '', '', 'select', ''),
(NULL, 'information_schema', 'CHARACTER_SETS', 'MAXLEN', 4, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLLATIONS', 'COLLATION_NAME', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLLATIONS', 'CHARACTER_SET_NAME', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLLATIONS', 'ID', 3, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(11)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLLATIONS', 'IS_DEFAULT', 4, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLLATIONS', 'IS_COMPILED', 5, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLLATIONS', 'SORTLEN', 6, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLLATION_CHARACTER_SET_APPLICABILITY', 'COLLATION_NAME', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLLATION_CHARACTER_SET_APPLICABILITY', 'CHARACTER_SET_NAME', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'TABLE_CATALOG', 1, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'TABLE_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'TABLE_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'COLUMN_NAME', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'ORDINAL_POSITION', 5, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'COLUMN_DEFAULT', 6, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'IS_NULLABLE', 7, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'DATA_TYPE', 8, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'CHARACTER_MAXIMUM_LENGTH', 9, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'CHARACTER_OCTET_LENGTH', 10, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'NUMERIC_PRECISION', 11, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'NUMERIC_SCALE', 12, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'CHARACTER_SET_NAME', 13, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'COLLATION_NAME', 14, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'COLUMN_TYPE', 15, NULL, 'NO', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'COLUMN_KEY', 16, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'EXTRA', 17, '', 'NO', 'varchar', 27, 81, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(27)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'PRIVILEGES', 18, '', 'NO', 'varchar', 80, 240, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(80)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'COLUMN_COMMENT', 19, '', 'NO', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMN_PRIVILEGES', 'GRANTEE', 1, '', 'NO', 'varchar', 81, 243, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(81)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMN_PRIVILEGES', 'TABLE_CATALOG', 2, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMN_PRIVILEGES', 'TABLE_SCHEMA', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMN_PRIVILEGES', 'TABLE_NAME', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMN_PRIVILEGES', 'COLUMN_NAME', 5, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMN_PRIVILEGES', 'PRIVILEGE_TYPE', 6, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMN_PRIVILEGES', 'IS_GRANTABLE', 7, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'ENGINES', 'ENGINE', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'ENGINES', 'SUPPORT', 2, '', 'NO', 'varchar', 8, 24, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(8)', '', '', 'select', ''),
(NULL, 'information_schema', 'ENGINES', 'COMMENT', 3, '', 'NO', 'varchar', 80, 240, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(80)', '', '', 'select', ''),
(NULL, 'information_schema', 'ENGINES', 'TRANSACTIONS', 4, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'ENGINES', 'XA', 5, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'ENGINES', 'SAVEPOINTS', 6, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'EVENT_CATALOG', 1, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'EVENT_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'EVENT_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'DEFINER', 4, '', 'NO', 'varchar', 77, 231, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(77)', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'TIME_ZONE', 5, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'EVENT_BODY', 6, '', 'NO', 'varchar', 8, 24, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(8)', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'EVENT_DEFINITION', 7, NULL, 'NO', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'EVENT_TYPE', 8, '', 'NO', 'varchar', 9, 27, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(9)', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'EXECUTE_AT', 9, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'INTERVAL_VALUE', 10, NULL, 'YES', 'varchar', 256, 768, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(256)', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'INTERVAL_FIELD', 11, NULL, 'YES', 'varchar', 18, 54, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(18)', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'SQL_MODE', 12, NULL, 'NO', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'STARTS', 13, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'ENDS', 14, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'STATUS', 15, '', 'NO', 'varchar', 18, 54, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(18)', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'ON_COMPLETION', 16, '', 'NO', 'varchar', 12, 36, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(12)', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'CREATED', 17, '0000-00-00 00:00:00', 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'LAST_ALTERED', 18, '0000-00-00 00:00:00', 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'LAST_EXECUTED', 19, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'EVENT_COMMENT', 20, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'ORIGINATOR', 21, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(10)', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'CHARACTER_SET_CLIENT', 22, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'COLLATION_CONNECTION', 23, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'DATABASE_COLLATION', 24, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'FILE_ID', 1, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'FILE_NAME', 2, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'FILE_TYPE', 3, '', 'NO', 'varchar', 20, 60, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'TABLESPACE_NAME', 4, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'TABLE_CATALOG', 5, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'TABLE_SCHEMA', 6, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'TABLE_NAME', 7, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'LOGFILE_GROUP_NAME', 8, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'LOGFILE_GROUP_NUMBER', 9, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'ENGINE', 10, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'FULLTEXT_KEYS', 11, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'DELETED_ROWS', 12, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'UPDATE_COUNT', 13, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'FREE_EXTENTS', 14, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'TOTAL_EXTENTS', 15, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'EXTENT_SIZE', 16, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'INITIAL_SIZE', 17, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'MAXIMUM_SIZE', 18, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'AUTOEXTEND_SIZE', 19, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'CREATION_TIME', 20, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'LAST_UPDATE_TIME', 21, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'LAST_ACCESS_TIME', 22, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'RECOVER_TIME', 23, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'TRANSACTION_COUNTER', 24, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'VERSION', 25, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'ROW_FORMAT', 26, NULL, 'YES', 'varchar', 10, 30, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(10)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'TABLE_ROWS', 27, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'AVG_ROW_LENGTH', 28, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'DATA_LENGTH', 29, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'MAX_DATA_LENGTH', 30, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'INDEX_LENGTH', 31, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'DATA_FREE', 32, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'CREATE_TIME', 33, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'UPDATE_TIME', 34, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'CHECK_TIME', 35, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'CHECKSUM', 36, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'STATUS', 37, '', 'NO', 'varchar', 20, 60, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'EXTRA', 38, NULL, 'YES', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select', ''),
(NULL, 'information_schema', 'GLOBAL_STATUS', 'VARIABLE_NAME', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'GLOBAL_STATUS', 'VARIABLE_VALUE', 2, NULL, 'YES', 'varchar', 20480, 61440, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20480)', '', '', 'select', ''),
(NULL, 'information_schema', 'GLOBAL_VARIABLES', 'VARIABLE_NAME', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'GLOBAL_VARIABLES', 'VARIABLE_VALUE', 2, NULL, 'YES', 'varchar', 20480, 61440, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20480)', '', '', 'select', ''),
(NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'CONSTRAINT_CATALOG', 1, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'CONSTRAINT_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'CONSTRAINT_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'TABLE_CATALOG', 4, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'TABLE_SCHEMA', 5, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'TABLE_NAME', 6, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'COLUMN_NAME', 7, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'ORDINAL_POSITION', 8, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(10)', '', '', 'select', ''),
(NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'POSITION_IN_UNIQUE_CONSTRAINT', 9, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(10)', '', '', 'select', ''),
(NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'REFERENCED_TABLE_SCHEMA', 10, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'REFERENCED_TABLE_NAME', 11, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'REFERENCED_COLUMN_NAME', 12, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'TABLE_CATALOG', 1, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'TABLE_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'TABLE_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'PARTITION_NAME', 4, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'SUBPARTITION_NAME', 5, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'PARTITION_ORDINAL_POSITION', 6, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'SUBPARTITION_ORDINAL_POSITION', 7, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'PARTITION_METHOD', 8, NULL, 'YES', 'varchar', 12, 36, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(12)', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'SUBPARTITION_METHOD', 9, NULL, 'YES', 'varchar', 12, 36, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(12)', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'PARTITION_EXPRESSION', 10, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'SUBPARTITION_EXPRESSION', 11, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'PARTITION_DESCRIPTION', 12, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'TABLE_ROWS', 13, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'AVG_ROW_LENGTH', 14, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'DATA_LENGTH', 15, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'MAX_DATA_LENGTH', 16, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'INDEX_LENGTH', 17, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'DATA_FREE', 18, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'CREATE_TIME', 19, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'UPDATE_TIME', 20, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'CHECK_TIME', 21, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'CHECKSUM', 22, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'PARTITION_COMMENT', 23, '', 'NO', 'varchar', 80, 240, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(80)', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'NODEGROUP', 24, '', 'NO', 'varchar', 12, 36, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(12)', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'TABLESPACE_NAME', 25, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'PLUGINS', 'PLUGIN_NAME', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'PLUGINS', 'PLUGIN_VERSION', 2, '', 'NO', 'varchar', 20, 60, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PLUGINS', 'PLUGIN_STATUS', 3, '', 'NO', 'varchar', 10, 30, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(10)', '', '', 'select', ''),
(NULL, 'information_schema', 'PLUGINS', 'PLUGIN_TYPE', 4, '', 'NO', 'varchar', 80, 240, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(80)', '', '', 'select', ''),
(NULL, 'information_schema', 'PLUGINS', 'PLUGIN_TYPE_VERSION', 5, '', 'NO', 'varchar', 20, 60, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PLUGINS', 'PLUGIN_LIBRARY', 6, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'PLUGINS', 'PLUGIN_LIBRARY_VERSION', 7, NULL, 'YES', 'varchar', 20, 60, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PLUGINS', 'PLUGIN_AUTHOR', 8, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'PLUGINS', 'PLUGIN_DESCRIPTION', 9, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
(NULL, 'information_schema', 'PLUGINS', 'PLUGIN_LICENSE', 10, NULL, 'YES', 'varchar', 80, 240, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(80)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROCESSLIST', 'ID', 1, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROCESSLIST', 'USER', 2, '', 'NO', 'varchar', 16, 48, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(16)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROCESSLIST', 'HOST', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROCESSLIST', 'DB', 4, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROCESSLIST', 'COMMAND', 5, '', 'NO', 'varchar', 16, 48, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(16)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROCESSLIST', 'TIME', 6, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(7)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROCESSLIST', 'STATE', 7, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROCESSLIST', 'INFO', 8, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'QUERY_ID', 1, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'SEQ', 2, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'STATE', 3, '', 'NO', 'varchar', 30, 90, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(30)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'DURATION', 4, '0.000000', 'NO', 'decimal', NULL, NULL, 9, 6, NULL, NULL, 'decimal(9,6)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'CPU_USER', 5, NULL, 'YES', 'decimal', NULL, NULL, 9, 6, NULL, NULL, 'decimal(9,6)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'CPU_SYSTEM', 6, NULL, 'YES', 'decimal', NULL, NULL, 9, 6, NULL, NULL, 'decimal(9,6)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'CONTEXT_VOLUNTARY', 7, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'CONTEXT_INVOLUNTARY', 8, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'BLOCK_OPS_IN', 9, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'BLOCK_OPS_OUT', 10, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'MESSAGES_SENT', 11, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'MESSAGES_RECEIVED', 12, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'PAGE_FAULTS_MAJOR', 13, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'PAGE_FAULTS_MINOR', 14, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'SWAPS', 15, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'SOURCE_FUNCTION', 16, NULL, 'YES', 'varchar', 30, 90, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(30)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'SOURCE_FILE', 17, NULL, 'YES', 'varchar', 20, 60, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'SOURCE_LINE', 18, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'CONSTRAINT_CATALOG', 1, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'CONSTRAINT_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'CONSTRAINT_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'UNIQUE_CONSTRAINT_CATALOG', 4, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'UNIQUE_CONSTRAINT_SCHEMA', 5, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'UNIQUE_CONSTRAINT_NAME', 6, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'MATCH_OPTION', 7, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'UPDATE_RULE', 8, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'DELETE_RULE', 9, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'TABLE_NAME', 10, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'REFERENCED_TABLE_NAME', 11, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'SPECIFIC_NAME', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'ROUTINE_CATALOG', 2, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'ROUTINE_SCHEMA', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'ROUTINE_NAME', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'ROUTINE_TYPE', 5, '', 'NO', 'varchar', 9, 27, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(9)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'DTD_IDENTIFIER', 6, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'ROUTINE_BODY', 7, '', 'NO', 'varchar', 8, 24, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(8)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'ROUTINE_DEFINITION', 8, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'EXTERNAL_NAME', 9, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'EXTERNAL_LANGUAGE', 10, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'PARAMETER_STYLE', 11, '', 'NO', 'varchar', 8, 24, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(8)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'IS_DETERMINISTIC', 12, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'SQL_DATA_ACCESS', 13, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'SQL_PATH', 14, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'SECURITY_TYPE', 15, '', 'NO', 'varchar', 7, 21, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(7)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'CREATED', 16, '0000-00-00 00:00:00', 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'LAST_ALTERED', 17, '0000-00-00 00:00:00', 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'SQL_MODE', 18, NULL, 'NO', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'ROUTINE_COMMENT', 19, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'DEFINER', 20, '', 'NO', 'varchar', 77, 231, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(77)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'CHARACTER_SET_CLIENT', 21, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'COLLATION_CONNECTION', 22, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'DATABASE_COLLATION', 23, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
(NULL, 'information_schema', 'SCHEMATA', 'CATALOG_NAME', 1, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'SCHEMATA', 'SCHEMA_NAME', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'SCHEMATA', 'DEFAULT_CHARACTER_SET_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'SCHEMATA', 'DEFAULT_COLLATION_NAME', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'SCHEMATA', 'SQL_PATH', 5, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'SCHEMA_PRIVILEGES', 'GRANTEE', 1, '', 'NO', 'varchar', 81, 243, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(81)', '', '', 'select', ''),
(NULL, 'information_schema', 'SCHEMA_PRIVILEGES', 'TABLE_CATALOG', 2, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'SCHEMA_PRIVILEGES', 'TABLE_SCHEMA', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'SCHEMA_PRIVILEGES', 'PRIVILEGE_TYPE', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'SCHEMA_PRIVILEGES', 'IS_GRANTABLE', 5, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'SESSION_STATUS', 'VARIABLE_NAME', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'SESSION_STATUS', 'VARIABLE_VALUE', 2, NULL, 'YES', 'varchar', 20480, 61440, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20480)', '', '', 'select', ''),
(NULL, 'information_schema', 'SESSION_VARIABLES', 'VARIABLE_NAME', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'SESSION_VARIABLES', 'VARIABLE_VALUE', 2, NULL, 'YES', 'varchar', 20480, 61440, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20480)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'TABLE_CATALOG', 1, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'TABLE_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'TABLE_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'NON_UNIQUE', 4, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(1)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'INDEX_SCHEMA', 5, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'INDEX_NAME', 6, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'SEQ_IN_INDEX', 7, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(2)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'COLUMN_NAME', 8, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'COLLATION', 9, NULL, 'YES', 'varchar', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(1)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'CARDINALITY', 10, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'SUB_PART', 11, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'PACKED', 12, NULL, 'YES', 'varchar', 10, 30, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(10)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'NULLABLE', 13, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'INDEX_TYPE', 14, '', 'NO', 'varchar', 16, 48, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(16)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'COMMENT', 15, NULL, 'YES', 'varchar', 16, 48, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(16)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'TABLE_CATALOG', 1, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'TABLE_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'TABLE_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'TABLE_TYPE', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'ENGINE', 5, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'VERSION', 6, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'ROW_FORMAT', 7, NULL, 'YES', 'varchar', 10, 30, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(10)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'TABLE_ROWS', 8, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'AVG_ROW_LENGTH', 9, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'DATA_LENGTH', 10, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'MAX_DATA_LENGTH', 11, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'INDEX_LENGTH', 12, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'DATA_FREE', 13, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'AUTO_INCREMENT', 14, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'CREATE_TIME', 15, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'UPDATE_TIME', 16, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'CHECK_TIME', 17, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'TABLE_COLLATION', 18, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'CHECKSUM', 19, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'CREATE_OPTIONS', 20, NULL, 'YES', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'TABLE_COMMENT', 21, '', 'NO', 'varchar', 80, 240, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(80)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLE_CONSTRAINTS', 'CONSTRAINT_CATALOG', 1, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLE_CONSTRAINTS', 'CONSTRAINT_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLE_CONSTRAINTS', 'CONSTRAINT_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLE_CONSTRAINTS', 'TABLE_SCHEMA', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLE_CONSTRAINTS', 'TABLE_NAME', 5, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLE_CONSTRAINTS', 'CONSTRAINT_TYPE', 6, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLE_PRIVILEGES', 'GRANTEE', 1, '', 'NO', 'varchar', 81, 243, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(81)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLE_PRIVILEGES', 'TABLE_CATALOG', 2, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLE_PRIVILEGES', 'TABLE_SCHEMA', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLE_PRIVILEGES', 'TABLE_NAME', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLE_PRIVILEGES', 'PRIVILEGE_TYPE', 5, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLE_PRIVILEGES', 'IS_GRANTABLE', 6, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'TRIGGER_CATALOG', 1, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'TRIGGER_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'TRIGGER_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'EVENT_MANIPULATION', 4, '', 'NO', 'varchar', 6, 18, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(6)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'EVENT_OBJECT_CATALOG', 5, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'EVENT_OBJECT_SCHEMA', 6, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'EVENT_OBJECT_TABLE', 7, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'ACTION_ORDER', 8, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'ACTION_CONDITION', 9, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'ACTION_STATEMENT', 10, NULL, 'NO', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'ACTION_ORIENTATION', 11, '', 'NO', 'varchar', 9, 27, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(9)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'ACTION_TIMING', 12, '', 'NO', 'varchar', 6, 18, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(6)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'ACTION_REFERENCE_OLD_TABLE', 13, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'ACTION_REFERENCE_NEW_TABLE', 14, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'ACTION_REFERENCE_OLD_ROW', 15, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'ACTION_REFERENCE_NEW_ROW', 16, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'CREATED', 17, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'SQL_MODE', 18, NULL, 'NO', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'DEFINER', 19, NULL, 'NO', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'CHARACTER_SET_CLIENT', 20, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES
(NULL, 'information_schema', 'TRIGGERS', 'COLLATION_CONNECTION', 21, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'DATABASE_COLLATION', 22, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
(NULL, 'information_schema', 'USER_PRIVILEGES', 'GRANTEE', 1, '', 'NO', 'varchar', 81, 243, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(81)', '', '', 'select', ''),
(NULL, 'information_schema', 'USER_PRIVILEGES', 'TABLE_CATALOG', 2, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'USER_PRIVILEGES', 'PRIVILEGE_TYPE', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'USER_PRIVILEGES', 'IS_GRANTABLE', 4, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'VIEWS', 'TABLE_CATALOG', 1, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'VIEWS', 'TABLE_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'VIEWS', 'TABLE_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'VIEWS', 'VIEW_DEFINITION', 4, NULL, 'NO', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
(NULL, 'information_schema', 'VIEWS', 'CHECK_OPTION', 5, '', 'NO', 'varchar', 8, 24, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(8)', '', '', 'select', ''),
(NULL, 'information_schema', 'VIEWS', 'IS_UPDATABLE', 6, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'VIEWS', 'DEFINER', 7, '', 'NO', 'varchar', 77, 231, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(77)', '', '', 'select', ''),
(NULL, 'information_schema', 'VIEWS', 'SECURITY_TYPE', 8, '', 'NO', 'varchar', 7, 21, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(7)', '', '', 'select', ''),
(NULL, 'information_schema', 'VIEWS', 'CHARACTER_SET_CLIENT', 9, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
(NULL, 'information_schema', 'VIEWS', 'COLLATION_CONNECTION', 10, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
(NULL, 'dro', 'dp_accommodations', 'accommodation_id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_accommodations', 'student_id', 2, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_accommodations', 'accom_date', 3, NULL, 'YES', 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_accommodations', 'member_id', 4, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_accommodations', 'semester', 5, NULL, 'YES', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_accommodations', 'crn', 6, NULL, 'YES', 'varchar', 7, 7, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(7)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_accommodations', 'course', 7, NULL, 'YES', 'varchar', 100, 100, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(100)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_accommodations', 'section', 8, NULL, 'YES', 'varchar', 2, 2, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(2)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_accommodations', 'room_loc', 9, NULL, 'YES', 'varchar', 100, 100, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(100)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_accommodations', 'prof', 10, NULL, 'YES', 'varchar', 150, 150, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(150)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_accommodations', 'classNotes', 11, NULL, 'YES', 'varchar', 100, 100, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(100)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_accommodations', 'otherClassAccoms', 12, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'longtext', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_accommodations', 'classAccomNotes', 13, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'longtext', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_accommodations', 'altExamForm', 14, NULL, 'YES', 'varchar', 100, 100, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(100)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_accommodations', 'otherExamAccoms', 15, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'longtext', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_accommodations', 'examAccomNotes', 16, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'longtext', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_accommodations', 'extendedTimeEssay', 17, '0', 'YES', 'double', NULL, NULL, 22, NULL, NULL, NULL, 'double', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_accommodations', 'extendedTimeMath', 18, '0', 'YES', 'double', NULL, NULL, 22, NULL, NULL, NULL, 'double', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_class_accommodations', 'class_accom_id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_class_accommodations', 'class_option', 2, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'longtext', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_class_accommodations', 'created', 3, 'CURRENT_TIMESTAMP', 'NO', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_colleges', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_colleges', 'name', 2, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'longtext', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_configs', 'config_id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_configs', 'config_name', 2, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'longtext', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_configs', 'merge_text', 3, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'longtext', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_configs', 'location', 4, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'longtext', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_configs', 'email', 5, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'longtext', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_configs', 'dept_name', 6, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'longtext', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_configs', 'phone_num', 7, NULL, 'YES', 'varchar', 25, 25, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(25)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_contact', 'con_id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_contact', 'student_id', 2, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_contact', 'con_date', 3, 'CURRENT_TIMESTAMP', 'NO', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_contact', 'member_id', 4, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_contact', 'other', 5, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'longtext', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_contact', 'length', 6, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_contact', 'notes', 7, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'longtext', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_contact', 'purpose_id', 8, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_contact', 'contact_type_id', 9, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_contact_type', 'contact_type_id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_contact_type', 'description', 2, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'longtext', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_contact_type', 'created', 3, 'CURRENT_TIMESTAMP', 'NO', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_disabilities', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_disabilities', 'name', 2, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'longtext', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_exam_accommodations', 'exam_accom_id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_exam_accommodations', 'exam_option', 2, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'longtext', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_exam_accommodations', 'created', 3, 'CURRENT_TIMESTAMP', 'NO', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_history', 'history_id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_history', 'member_id', 2, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_history', 'student_id', 3, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_history', 'message', 4, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'longtext', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_intake', 'student_id', 1, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_intake', 'intake_id', 2, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_intake', 'intake_date', 3, NULL, 'YES', 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_intake', 'member_id', 4, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_intake', 'primaryDis', 5, NULL, 'YES', 'varchar', 255, 255, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_intake', 'secondaryDis', 6, NULL, 'YES', 'varchar', 255, 255, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_intake', 'tertiaryDis', 7, NULL, 'YES', 'varchar', 255, 255, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_intake', 'otherDis', 8, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'longtext', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_intake', 'docStatus', 9, NULL, 'YES', 'varchar', 255, 255, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_intake', 'docDate', 10, NULL, 'YES', 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_intake', 'docExp', 11, NULL, 'YES', 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_intake', 'docNeeded', 12, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'longtext', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_intake', 'recommendation', 13, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'longtext', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_intake', 'medications', 14, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'longtext', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_intake', 'followup_notes', 15, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'longtext', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_intake', 'followup_date', 16, 'CURRENT_TIMESTAMP', 'NO', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_intake', 'intake_notes', 17, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'longtext', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_intake', 'primaryDesc', 18, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'longtext', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_intake', 'secondaryDesc', 19, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'longtext', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_intake', 'tertiaryDesc', 20, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'longtext', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_intake_doc_status', 'doc_status_id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_intake_doc_status', 'status_name', 2, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'longtext', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_intake_doc_status', 'created', 3, 'CURRENT_TIMESTAMP', 'NO', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_limitations', 'limitation_id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_limitations', 'limitation_name', 2, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'longtext', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_limitations', 'created', 3, 'CURRENT_TIMESTAMP', 'NO', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_log', 'log_id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_log', 'member_id', 2, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_log', 'message', 3, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'longtext', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_majors', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_majors', 'name', 2, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'longtext', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_purpose', 'purpose_id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_purpose', 'description', 2, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'longtext', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_purpose', 'created', 3, 'CURRENT_TIMESTAMP', 'NO', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_services', 'service_id', 1, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_services', 'service_name', 2, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'longtext', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_services', 'created', 3, 'CURRENT_TIMESTAMP', 'NO', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_student', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_student', 'univId', 2, NULL, 'YES', 'varchar', 20, 20, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(20)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_student', 'firstname', 3, NULL, 'YES', 'varchar', 100, 100, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(100)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_student', 'middlename', 4, NULL, 'YES', 'varchar', 100, 100, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(100)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_student', 'lastname', 5, NULL, 'YES', 'varchar', 100, 100, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(100)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_student', 'gender', 6, NULL, 'YES', 'varchar', 6, 6, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(6)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_student', 'dateOfBirth', 7, NULL, 'YES', 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_student', 'race', 8, NULL, 'YES', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_student', 'studentStatus', 9, NULL, 'YES', 'varchar', 150, 150, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(150)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_student', 'GPA', 10, NULL, 'YES', 'double', NULL, NULL, 22, NULL, NULL, NULL, 'double', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_student', 'EnrollmentStatus', 11, NULL, 'YES', 'varchar', 100, 100, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(100)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_student', 'creditLoad', 12, NULL, 'YES', 'varchar', 100, 100, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(100)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_student', 'college', 13, NULL, 'YES', 'varchar', 175, 175, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(175)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_student', 'major', 14, NULL, 'YES', 'varchar', 100, 100, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(100)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_student', 'minor', 15, NULL, 'YES', 'varchar', 100, 100, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(100)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_student', 'phoneNum', 16, NULL, 'YES', 'varchar', 12, 12, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(12)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_student', 'ok2leaveConfMessage', 17, NULL, 'YES', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(1)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_student', 'ok2sendConfMessage', 18, NULL, 'YES', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(1)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_student', 'email', 19, NULL, 'YES', 'varchar', 200, 200, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(200)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_student', 'locStAddress', 20, NULL, 'YES', 'varchar', 300, 300, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(300)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_student', 'locStAddress2', 21, NULL, 'YES', 'varchar', 300, 300, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(300)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_student', 'locCity', 22, NULL, 'YES', 'varchar', 175, 175, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(175)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_student', 'locState', 23, NULL, 'YES', 'varchar', 100, 100, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(100)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_student', 'locZip', 24, NULL, 'YES', 'varchar', 10, 10, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(10)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_student', 'locCountry', 25, NULL, 'YES', 'varchar', 200, 200, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(200)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_student', 'permStAddress', 26, NULL, 'YES', 'varchar', 300, 300, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(300)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_student', 'permStAddress2', 27, NULL, 'YES', 'varchar', 300, 300, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(300)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_student', 'permCity', 28, NULL, 'YES', 'varchar', 175, 175, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(175)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_student', 'permState', 29, NULL, 'YES', 'varchar', 100, 100, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(100)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_student', 'permZip', 30, NULL, 'YES', 'varchar', 10, 10, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(10)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_student', 'permCountry', 31, NULL, 'YES', 'varchar', 200, 200, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(200)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_student', 'emergencyFirst', 32, NULL, 'YES', 'varchar', 100, 100, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(100)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_student', 'emergencyLast', 33, NULL, 'YES', 'varchar', 150, 150, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(150)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_student', 'emergencyRelation', 34, NULL, 'YES', 'varchar', 100, 100, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(100)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_student', 'emergencyPhoneNum', 35, NULL, 'YES', 'varchar', 12, 12, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(12)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_student', 'notes', 36, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'longtext', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_student', 'lastUpdate', 37, 'CURRENT_TIMESTAMP', 'NO', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', 'on update CURRENT_TIMESTAMP', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_student', 'citizen', 38, NULL, 'YES', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(1)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_student', 'ferpaOnFile', 39, '0', 'YES', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(1)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_student', 'veteran', 40, '0', 'YES', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(1)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_student', 'studentType', 41, NULL, 'YES', 'varchar', 150, 150, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(150)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'dp_student', 'endOfService', 42, NULL, 'YES', 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'group', 'group_id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
(NULL, 'dro', 'group', 'name', 2, NULL, 'YES', 'varchar', 60, 60, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(60)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'group', 'createAccoms', 3, '0', 'NO', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(4)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'group', 'createContact', 4, '0', 'NO', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(4)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'group', 'createIntake', 5, '0', 'NO', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(4)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'group', 'createStudent', 6, '0', 'NO', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(4)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'group', 'canView', 7, '0', 'YES', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(1)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'group', 'adminPanel', 8, '0', 'YES', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(1)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'group', 'deleteAccoms', 9, '0', 'YES', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(1)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'group', 'deleteContact', 10, '0', 'YES', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(1)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'group', 'deleteIntake', 11, '0', 'YES', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(1)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'group', 'deleteStudent', 12, '0', 'YES', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(1)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'group', 'statisticsPanel', 13, '0', 'YES', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(1)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'group', 'editUser', 14, '0', 'YES', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(1)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'group', 'addUser', 15, '0', 'YES', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(1)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'group', 'editGroup', 16, '0', 'YES', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(1)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'group', 'addGroup', 17, '0', 'YES', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(1)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'group', 'springCleaning', 18, '0', 'YES', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(1)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'group', 'editConfigs', 19, '0', 'YES', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(1)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'group', 'addClassAccommodations', 20, '0', 'YES', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(1)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'group', 'alterForms', 21, '0', 'YES', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(1)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'members', 'member_id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11) unsigned', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
(NULL, 'dro', 'members', 'firstname', 2, NULL, 'YES', 'varchar', 100, 100, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(100)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'members', 'lastname', 3, NULL, 'YES', 'varchar', 100, 100, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(100)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'members', 'login', 4, '', 'NO', 'varchar', 100, 100, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(100)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'members', 'passwd', 5, '', 'NO', 'varchar', 32, 32, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(32)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'members', 'group_id', 6, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'messages', 'message_id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
(NULL, 'dro', 'messages', 'member_id', 2, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'messages', 'message', 3, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'longtext', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'messages', 'posted', 4, 'CURRENT_TIMESTAMP', 'NO', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'tie_class_accoms', 'accommodation_id', 1, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'tie_class_accoms', 'class_accom_id', 2, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'tie_class_accoms', 'specifically', 3, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'longtext', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'tie_exam_accoms', 'accommodation_id', 1, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'tie_exam_accoms', 'exam_accom_id', 2, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'tie_exam_accoms', 'specifically', 3, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'longtext', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'tie_limitation_intake', 'intake_id', 1, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'tie_limitation_intake', 'limitation_id', 2, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'tie_service_intake', 'intake_id', 1, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
(NULL, 'dro', 'tie_service_intake', 'service_id', 2, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', '');

-- --------------------------------------------------------

--
-- Table structure for table `COLUMN_PRIVILEGES`
--

CREATE TEMPORARY TABLE `COLUMN_PRIVILEGES` (
  `GRANTEE` varchar(81) NOT NULL DEFAULT '',
  `TABLE_CATALOG` varchar(512) DEFAULT NULL,
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `COLUMN_NAME` varchar(64) NOT NULL DEFAULT '',
  `PRIVILEGE_TYPE` varchar(64) NOT NULL DEFAULT '',
  `IS_GRANTABLE` varchar(3) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `COLUMN_PRIVILEGES`
--


-- --------------------------------------------------------

--
-- Table structure for table `ENGINES`
--

CREATE TEMPORARY TABLE `ENGINES` (
  `ENGINE` varchar(64) NOT NULL DEFAULT '',
  `SUPPORT` varchar(8) NOT NULL DEFAULT '',
  `COMMENT` varchar(80) NOT NULL DEFAULT '',
  `TRANSACTIONS` varchar(3) NOT NULL DEFAULT '',
  `XA` varchar(3) NOT NULL DEFAULT '',
  `SAVEPOINTS` varchar(3) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ENGINES`
--

INSERT INTO `ENGINES` (`ENGINE`, `SUPPORT`, `COMMENT`, `TRANSACTIONS`, `XA`, `SAVEPOINTS`) VALUES
('CSV', 'YES', 'CSV storage engine', 'NO', 'NO', 'NO'),
('MRG_MYISAM', 'YES', 'Collection of identical MyISAM tables', 'NO', 'NO', 'NO'),
('MEMORY', 'YES', 'Hash based, stored in memory, useful for temporary tables', 'NO', 'NO', 'NO'),
('MyISAM', 'DEFAULT', 'Default engine as of MySQL 3.23 with great performance', 'NO', 'NO', 'NO');

-- --------------------------------------------------------

--
-- Table structure for table `EVENTS`
--

CREATE TEMPORARY TABLE `EVENTS` (
  `EVENT_CATALOG` varchar(64) DEFAULT NULL,
  `EVENT_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `EVENT_NAME` varchar(64) NOT NULL DEFAULT '',
  `DEFINER` varchar(77) NOT NULL DEFAULT '',
  `TIME_ZONE` varchar(64) NOT NULL DEFAULT '',
  `EVENT_BODY` varchar(8) NOT NULL DEFAULT '',
  `EVENT_DEFINITION` longtext NOT NULL,
  `EVENT_TYPE` varchar(9) NOT NULL DEFAULT '',
  `EXECUTE_AT` datetime DEFAULT NULL,
  `INTERVAL_VALUE` varchar(256) DEFAULT NULL,
  `INTERVAL_FIELD` varchar(18) DEFAULT NULL,
  `SQL_MODE` longtext NOT NULL,
  `STARTS` datetime DEFAULT NULL,
  `ENDS` datetime DEFAULT NULL,
  `STATUS` varchar(18) NOT NULL DEFAULT '',
  `ON_COMPLETION` varchar(12) NOT NULL DEFAULT '',
  `CREATED` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LAST_ALTERED` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LAST_EXECUTED` datetime DEFAULT NULL,
  `EVENT_COMMENT` varchar(64) NOT NULL DEFAULT '',
  `ORIGINATOR` bigint(10) NOT NULL DEFAULT '0',
  `CHARACTER_SET_CLIENT` varchar(32) NOT NULL DEFAULT '',
  `COLLATION_CONNECTION` varchar(32) NOT NULL DEFAULT '',
  `DATABASE_COLLATION` varchar(32) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `EVENTS`
--


-- --------------------------------------------------------

--
-- Table structure for table `FILES`
--

CREATE TEMPORARY TABLE `FILES` (
  `FILE_ID` bigint(4) NOT NULL DEFAULT '0',
  `FILE_NAME` varchar(64) DEFAULT NULL,
  `FILE_TYPE` varchar(20) NOT NULL DEFAULT '',
  `TABLESPACE_NAME` varchar(64) DEFAULT NULL,
  `TABLE_CATALOG` varchar(64) DEFAULT NULL,
  `TABLE_SCHEMA` varchar(64) DEFAULT NULL,
  `TABLE_NAME` varchar(64) DEFAULT NULL,
  `LOGFILE_GROUP_NAME` varchar(64) DEFAULT NULL,
  `LOGFILE_GROUP_NUMBER` bigint(4) DEFAULT NULL,
  `ENGINE` varchar(64) NOT NULL DEFAULT '',
  `FULLTEXT_KEYS` varchar(64) DEFAULT NULL,
  `DELETED_ROWS` bigint(4) DEFAULT NULL,
  `UPDATE_COUNT` bigint(4) DEFAULT NULL,
  `FREE_EXTENTS` bigint(4) DEFAULT NULL,
  `TOTAL_EXTENTS` bigint(4) DEFAULT NULL,
  `EXTENT_SIZE` bigint(4) NOT NULL DEFAULT '0',
  `INITIAL_SIZE` bigint(21) unsigned DEFAULT NULL,
  `MAXIMUM_SIZE` bigint(21) unsigned DEFAULT NULL,
  `AUTOEXTEND_SIZE` bigint(21) unsigned DEFAULT NULL,
  `CREATION_TIME` datetime DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime DEFAULT NULL,
  `LAST_ACCESS_TIME` datetime DEFAULT NULL,
  `RECOVER_TIME` bigint(4) DEFAULT NULL,
  `TRANSACTION_COUNTER` bigint(4) DEFAULT NULL,
  `VERSION` bigint(21) unsigned DEFAULT NULL,
  `ROW_FORMAT` varchar(10) DEFAULT NULL,
  `TABLE_ROWS` bigint(21) unsigned DEFAULT NULL,
  `AVG_ROW_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `DATA_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `MAX_DATA_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `INDEX_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `DATA_FREE` bigint(21) unsigned DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `CHECK_TIME` datetime DEFAULT NULL,
  `CHECKSUM` bigint(21) unsigned DEFAULT NULL,
  `STATUS` varchar(20) NOT NULL DEFAULT '',
  `EXTRA` varchar(255) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `FILES`
--


-- --------------------------------------------------------

--
-- Table structure for table `GLOBAL_STATUS`
--

CREATE TEMPORARY TABLE `GLOBAL_STATUS` (
  `VARIABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `VARIABLE_VALUE` varchar(20480) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `GLOBAL_STATUS`
--

INSERT INTO `GLOBAL_STATUS` (`VARIABLE_NAME`, `VARIABLE_VALUE`) VALUES
('ABORTED_CLIENTS', '14'),
('ABORTED_CONNECTS', '3216'),
('BINLOG_CACHE_DISK_USE', '0'),
('BINLOG_CACHE_USE', '5371'),
('BYTES_RECEIVED', '1447265735'),
('BYTES_SENT', '4030355916'),
('COM_ADMIN_COMMANDS', '89071'),
('COM_ASSIGN_TO_KEYCACHE', '0'),
('COM_ALTER_DB', '0'),
('COM_ALTER_DB_UPGRADE', '0'),
('COM_ALTER_EVENT', '0'),
('COM_ALTER_FUNCTION', '0'),
('COM_ALTER_PROCEDURE', '0'),
('COM_ALTER_SERVER', '0'),
('COM_ALTER_TABLE', '8806'),
('COM_ALTER_TABLESPACE', '0'),
('COM_ANALYZE', '1'),
('COM_BACKUP_TABLE', '0'),
('COM_BEGIN', '34021'),
('COM_BINLOG', '0'),
('COM_CALL_PROCEDURE', '0'),
('COM_CHANGE_DB', '5132492'),
('COM_CHANGE_MASTER', '0'),
('COM_CHECK', '0'),
('COM_CHECKSUM', '0'),
('COM_COMMIT', '28432'),
('COM_CREATE_DB', '24'),
('COM_CREATE_EVENT', '0'),
('COM_CREATE_FUNCTION', '0'),
('COM_CREATE_INDEX', '0'),
('COM_CREATE_PROCEDURE', '0'),
('COM_CREATE_SERVER', '0'),
('COM_CREATE_TABLE', '246'),
('COM_CREATE_TRIGGER', '0'),
('COM_CREATE_UDF', '0'),
('COM_CREATE_USER', '26'),
('COM_CREATE_VIEW', '74'),
('COM_DEALLOC_SQL', '0'),
('COM_DELETE', '145213'),
('COM_DELETE_MULTI', '0'),
('COM_DO', '0'),
('COM_DROP_DB', '0'),
('COM_DROP_EVENT', '0'),
('COM_DROP_FUNCTION', '0'),
('COM_DROP_INDEX', '0'),
('COM_DROP_PROCEDURE', '0'),
('COM_DROP_SERVER', '0'),
('COM_DROP_TABLE', '69'),
('COM_DROP_TRIGGER', '0'),
('COM_DROP_USER', '0'),
('COM_DROP_VIEW', '1'),
('COM_EMPTY_QUERY', '1'),
('COM_EXECUTE_SQL', '0'),
('COM_FLUSH', '193'),
('COM_GRANT', '48'),
('COM_HA_CLOSE', '0'),
('COM_HA_OPEN', '0'),
('COM_HA_READ', '0'),
('COM_HELP', '0'),
('COM_INSERT', '220241'),
('COM_INSERT_SELECT', '28'),
('COM_INSTALL_PLUGIN', '0'),
('COM_KILL', '0'),
('COM_LOAD', '0'),
('COM_LOAD_MASTER_DATA', '0'),
('COM_LOAD_MASTER_TABLE', '0'),
('COM_LOCK_TABLES', '0'),
('COM_OPTIMIZE', '0'),
('COM_PRELOAD_KEYS', '0'),
('COM_PREPARE_SQL', '0'),
('COM_PURGE', '0'),
('COM_PURGE_BEFORE_DATE', '88'),
('COM_RELEASE_SAVEPOINT', '0'),
('COM_RENAME_TABLE', '0'),
('COM_RENAME_USER', '0'),
('COM_REPAIR', '1'),
('COM_REPLACE', '36107'),
('COM_REPLACE_SELECT', '0'),
('COM_RESET', '0'),
('COM_RESTORE_TABLE', '0'),
('COM_REVOKE', '0'),
('COM_REVOKE_ALL', '0'),
('COM_ROLLBACK', '2'),
('COM_ROLLBACK_TO_SAVEPOINT', '0'),
('COM_SAVEPOINT', '0'),
('COM_SELECT', '78096478'),
('COM_SET_OPTION', '5662967'),
('COM_SHOW_AUTHORS', '0'),
('COM_SHOW_BINLOG_EVENTS', '0'),
('COM_SHOW_BINLOGS', '638'),
('COM_SHOW_CHARSETS', '250'),
('COM_SHOW_COLLATIONS', '250'),
('COM_SHOW_COLUMN_TYPES', '0'),
('COM_SHOW_CONTRIBUTORS', '0'),
('COM_SHOW_CREATE_DB', '64846'),
('COM_SHOW_CREATE_EVENT', '0'),
('COM_SHOW_CREATE_FUNC', '0'),
('COM_SHOW_CREATE_PROC', '0'),
('COM_SHOW_CREATE_TABLE', '1003923'),
('COM_SHOW_CREATE_TRIGGER', '174'),
('COM_SHOW_DATABASES', '1744'),
('COM_SHOW_ENGINE_LOGS', '0'),
('COM_SHOW_ENGINE_MUTEX', '0'),
('COM_SHOW_ENGINE_STATUS', '0'),
('COM_SHOW_EVENTS', '0'),
('COM_SHOW_ERRORS', '0'),
('COM_SHOW_FIELDS', '1016912'),
('COM_SHOW_FUNCTION_STATUS', '5'),
('COM_SHOW_GRANTS', '368'),
('COM_SHOW_KEYS', '2254'),
('COM_SHOW_MASTER_STATUS', '60'),
('COM_SHOW_NEW_MASTER', '0'),
('COM_SHOW_OPEN_TABLES', '0'),
('COM_SHOW_PLUGINS', '7799'),
('COM_SHOW_PRIVILEGES', '0'),
('COM_SHOW_PROCEDURE_STATUS', '5'),
('COM_SHOW_PROCESSLIST', '130'),
('COM_SHOW_PROFILE', '0'),
('COM_SHOW_PROFILES', '0'),
('COM_SHOW_SLAVE_HOSTS', '0'),
('COM_SHOW_SLAVE_STATUS', '60'),
('COM_SHOW_STATUS', '11'),
('COM_SHOW_STORAGE_ENGINES', '173'),
('COM_SHOW_TABLE_STATUS', '1009169'),
('COM_SHOW_TABLES', '108770'),
('COM_SHOW_TRIGGERS', '1001106'),
('COM_SHOW_VARIABLES', '1556'),
('COM_SHOW_WARNINGS', '512'),
('COM_SLAVE_START', '0'),
('COM_SLAVE_STOP', '0'),
('COM_STMT_CLOSE', '0'),
('COM_STMT_EXECUTE', '0'),
('COM_STMT_FETCH', '0'),
('COM_STMT_PREPARE', '0'),
('COM_STMT_REPREPARE', '0'),
('COM_STMT_RESET', '0'),
('COM_STMT_SEND_LONG_DATA', '0'),
('COM_TRUNCATE', '15'),
('COM_UNINSTALL_PLUGIN', '0'),
('COM_UNLOCK_TABLES', '0'),
('COM_UPDATE', '3110127'),
('COM_UPDATE_MULTI', '0'),
('COM_XA_COMMIT', '0'),
('COM_XA_END', '0'),
('COM_XA_PREPARE', '0'),
('COM_XA_RECOVER', '0'),
('COM_XA_ROLLBACK', '0'),
('COM_XA_START', '0'),
('COMPRESSION', 'OFF'),
('CONNECTIONS', '3880951'),
('CREATED_TMP_DISK_TABLES', '3036123'),
('CREATED_TMP_FILES', '2506'),
('CREATED_TMP_TABLES', '4442021'),
('DELAYED_ERRORS', '0'),
('DELAYED_INSERT_THREADS', '0'),
('DELAYED_WRITES', '0'),
('FLUSH_COMMANDS', '175'),
('HANDLER_COMMIT', '10268'),
('HANDLER_DELETE', '148484'),
('HANDLER_DISCOVER', '0'),
('HANDLER_PREPARE', '0'),
('HANDLER_READ_FIRST', '5960564'),
('HANDLER_READ_KEY', '177768907'),
('HANDLER_READ_NEXT', '461770003'),
('HANDLER_READ_PREV', '3189176'),
('HANDLER_READ_RND', '32829692'),
('HANDLER_READ_RND_NEXT', '739431464'),
('HANDLER_ROLLBACK', '0'),
('HANDLER_SAVEPOINT', '0'),
('HANDLER_SAVEPOINT_ROLLBACK', '0'),
('HANDLER_UPDATE', '48622547'),
('HANDLER_WRITE', '24501632'),
('KEY_BLOCKS_NOT_FLUSHED', '0'),
('KEY_BLOCKS_UNUSED', '14264'),
('KEY_BLOCKS_USED', '5315'),
('KEY_READ_REQUESTS', '714370297'),
('KEY_READS', '5138226'),
('KEY_WRITE_REQUESTS', '6324700'),
('KEY_WRITES', '3058827'),
('LAST_QUERY_COST', '0.000000'),
('MAX_USED_CONNECTIONS', '82'),
('NOT_FLUSHED_DELAYED_ROWS', '0'),
('OPEN_FILES', '126'),
('OPEN_STREAMS', '0'),
('OPEN_TABLE_DEFINITIONS', '256'),
('OPEN_TABLES', '64'),
('OPENED_FILES', '20733824'),
('OPENED_TABLE_DEFINITIONS', '2841711'),
('OPENED_TABLES', '3621224'),
('PREPARED_STMT_COUNT', '0'),
('QCACHE_FREE_BLOCKS', '0'),
('QCACHE_FREE_MEMORY', '0'),
('QCACHE_HITS', '0'),
('QCACHE_INSERTS', '0'),
('QCACHE_LOWMEM_PRUNES', '0'),
('QCACHE_NOT_CACHED', '0'),
('QCACHE_QUERIES_IN_CACHE', '0'),
('QCACHE_TOTAL_BLOCKS', '0'),
('QUESTIONS', '100575785'),
('RPL_STATUS', 'NULL'),
('SELECT_FULL_JOIN', '21000'),
('SELECT_FULL_RANGE_JOIN', '5546'),
('SELECT_RANGE', '4937423'),
('SELECT_RANGE_CHECK', '4506'),
('SELECT_SCAN', '5225636'),
('SLAVE_OPEN_TEMP_TABLES', '0'),
('SLAVE_RETRIED_TRANSACTIONS', '0'),
('SLAVE_RUNNING', 'OFF'),
('SLOW_LAUNCH_THREADS', '9'),
('SLOW_QUERIES', '6'),
('SORT_MERGE_PASSES', '1253'),
('SORT_RANGE', '2631691'),
('SORT_ROWS', '48506010'),
('SORT_SCAN', '1664271'),
('TABLE_LOCKS_IMMEDIATE', '89191874'),
('TABLE_LOCKS_WAITED', '41089'),
('TC_LOG_MAX_PAGES_USED', '0'),
('TC_LOG_PAGE_SIZE', '0'),
('TC_LOG_PAGE_WAITS', '0'),
('THREADS_CACHED', '0'),
('THREADS_CONNECTED', '2'),
('THREADS_CREATED', '3880950'),
('THREADS_RUNNING', '1'),
('UPTIME', '7550578'),
('UPTIME_SINCE_FLUSH_STATUS', '7550578');

-- --------------------------------------------------------

--
-- Table structure for table `GLOBAL_VARIABLES`
--

CREATE TEMPORARY TABLE `GLOBAL_VARIABLES` (
  `VARIABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `VARIABLE_VALUE` varchar(20480) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `GLOBAL_VARIABLES`
--

INSERT INTO `GLOBAL_VARIABLES` (`VARIABLE_NAME`, `VARIABLE_VALUE`) VALUES
('BACK_LOG', '50'),
('CHARACTER_SETS_DIR', '/usr/local/mysql/share/mysql/charsets/'),
('FT_MAX_WORD_LEN', '84'),
('FT_MIN_WORD_LEN', '4'),
('FT_QUERY_EXPANSION_LIMIT', '20'),
('FT_STOPWORD_FILE', '(built-in)'),
('INIT_FILE', ''),
('LANGUAGE', '/usr/local/mysql/share/mysql/english/'),
('LARGE_FILES_SUPPORT', 'ON'),
('LARGE_PAGE_SIZE', '0'),
('LARGE_PAGES', 'OFF'),
('LOCKED_IN_MEMORY', 'OFF'),
('LOG_BIN', 'ON'),
('LOG_ERROR', '/usr/local/mysql/var/php.radford.edu.err'),
('LOWER_CASE_FILE_SYSTEM', 'OFF'),
('LOWER_CASE_TABLE_NAMES', '0'),
('MYISAM_RECOVER_OPTIONS', 'OFF'),
('OPEN_FILES_LIMIT', '1024'),
('PID_FILE', '/usr/local/mysql/var/php.radford.edu.pid'),
('PLUGIN_DIR', '/usr/local/mysql/lib/mysql/plugin'),
('PORT', '3306'),
('PROTOCOL_VERSION', '10'),
('SKIP_EXTERNAL_LOCKING', 'ON'),
('SKIP_NETWORKING', 'OFF'),
('SKIP_SHOW_DATABASE', 'OFF'),
('SOCKET', '/tmp/mysql.sock'),
('THREAD_STACK', '196608'),
('LOG_SLAVE_UPDATES', 'OFF'),
('RELAY_LOG', ''),
('RELAY_LOG_INDEX', ''),
('RELAY_LOG_INFO_FILE', 'relay-log.info'),
('RELAY_LOG_SPACE_LIMIT', '0'),
('SLAVE_LOAD_TMPDIR', '/tmp'),
('SLAVE_SKIP_ERRORS', 'OFF'),
('LICENSE', 'GPL'),
('MAX_ERROR_COUNT', '64'),
('HAVE_CRYPT', 'YES'),
('NET_BUFFER_LENGTH', '8192'),
('MYISAM_REPAIR_THREADS', '1'),
('AUTOMATIC_SP_PRIVILEGES', 'ON'),
('OPTIMIZER_PRUNE_LEVEL', '1'),
('CHARACTER_SET_CONNECTION', 'latin1'),
('LOG_BIN_TRUST_FUNCTION_CREATORS', 'OFF'),
('OLD_PASSWORDS', 'OFF'),
('FT_BOOLEAN_SYNTAX', '+ -><()~*:""&|'),
('SSL_CIPHER', ''),
('HAVE_OPENSSL', 'NO'),
('CHARACTER_SET_RESULTS', 'latin1'),
('LOG_BIN_TRUST_ROUTINE_CREATORS', 'OFF'),
('MAX_RELAY_LOG_SIZE', '0'),
('SORT_BUFFER_SIZE', '524288'),
('BINLOG_CACHE_SIZE', '32768'),
('IDENTITY', '0'),
('COLLATION_DATABASE', 'latin1_swedish_ci'),
('UPDATABLE_VIEWS_WITH_LIMIT', 'YES'),
('COMPLETION_TYPE', '0'),
('SLOW_LAUNCH_TIME', '2'),
('CONNECT_TIMEOUT', '10'),
('INIT_CONNECT', ''),
('HAVE_NDBCLUSTER', 'NO'),
('SQL_SAFE_UPDATES', 'OFF'),
('SLAVE_EXEC_MODE', 'STRICT'),
('SQL_QUOTE_SHOW_CREATE', 'ON'),
('DELAYED_QUEUE_SIZE', '1000'),
('SQL_LOG_UPDATE', 'ON'),
('DELAYED_INSERT_TIMEOUT', '300'),
('WAIT_TIMEOUT', '28800'),
('FLUSH_TIME', '0'),
('TMP_TABLE_SIZE', '16777216'),
('INTERACTIVE_TIMEOUT', '28800'),
('QUERY_PREALLOC_SIZE', '8192'),
('PSEUDO_THREAD_ID', '0'),
('REPORT_HOST', ''),
('CHARACTER_SET_DATABASE', 'latin1'),
('SSL_KEY', ''),
('QUERY_CACHE_WLOCK_INVALIDATE', 'OFF'),
('REPORT_USER', ''),
('FLUSH', 'OFF'),
('HAVE_GEOMETRY', 'YES'),
('JOIN_BUFFER_SIZE', '131072'),
('INSERT_ID', '0'),
('MAX_BINLOG_SIZE', '1073741824'),
('RELAY_LOG_PURGE', 'ON'),
('INIT_SLAVE', ''),
('LOG_WARNINGS', '1'),
('MAX_CONNECT_ERRORS', '10'),
('GROUP_CONCAT_MAX_LEN', '1024'),
('TRANSACTION_ALLOC_BLOCK_SIZE', '8192'),
('RANGE_ALLOC_BLOCK_SIZE', '4096'),
('MAX_CONNECTIONS', '151'),
('SECURE_FILE_PRIV', ''),
('AUTOCOMMIT', 'ON'),
('LOG_SLOW_QUERIES', 'OFF'),
('TIMED_MUTEXES', 'OFF'),
('TRANSACTION_PREALLOC_SIZE', '4096'),
('MAX_SEEKS_FOR_KEY', '4294967295'),
('VERSION_COMPILE_OS', 'pc-linux-gnu'),
('MAX_PREPARED_STMT_COUNT', '16382'),
('SQL_NOTES', 'ON'),
('EVENT_SCHEDULER', 'OFF'),
('LOW_PRIORITY_UPDATES', 'OFF'),
('LOG_QUERIES_NOT_USING_INDEXES', 'OFF'),
('REPORT_PASSWORD', ''),
('DELAYED_INSERT_LIMIT', '100'),
('MAX_INSERT_DELAYED_THREADS', '20'),
('CHARACTER_SET_SERVER', 'latin1'),
('HAVE_COMPRESS', 'YES'),
('MAX_LENGTH_FOR_SORT_DATA', '1024'),
('HAVE_DYNAMIC_LOADING', 'YES'),
('MAX_HEAP_TABLE_SIZE', '16777216'),
('SYNC_BINLOG', '0'),
('READ_RND_BUFFER_SIZE', '524288'),
('SYNC_FRM', 'ON'),
('KEY_CACHE_AGE_THRESHOLD', '300'),
('HAVE_CSV', 'YES'),
('NET_RETRY_COUNT', '10'),
('DEFAULT_WEEK_FORMAT', '0'),
('HAVE_SSL', 'NO'),
('LOG_OUTPUT', 'FILE'),
('OLD_ALTER_TABLE', 'OFF'),
('MYISAM_USE_MMAP', 'OFF'),
('LONG_QUERY_TIME', '10.000000'),
('KEY_BUFFER_SIZE', '16777216'),
('MAX_DELAYED_THREADS', '20'),
('HAVE_SYMLINK', 'YES'),
('MAX_USER_CONNECTIONS', '0'),
('TIME_ZONE', 'SYSTEM'),
('THREAD_CACHE_SIZE', '0'),
('SLOW_QUERY_LOG', 'OFF'),
('READ_BUFFER_SIZE', '262144'),
('SLOW_QUERY_LOG_FILE', '/usr/local/mysql/var/php-slow.log'),
('MYISAM_MAX_SORT_FILE_SIZE', '2147483647'),
('SSL_CA', ''),
('NET_WRITE_TIMEOUT', '60'),
('MAX_BINLOG_CACHE_SIZE', '4294967295'),
('OLD', 'OFF'),
('SLAVE_NET_TIMEOUT', '3600'),
('MIN_EXAMINED_ROW_LIMIT', '0'),
('SLAVE_TRANSACTION_RETRIES', '10'),
('QUERY_CACHE_LIMIT', '1048576'),
('LOCAL_INFILE', 'ON'),
('VERSION_COMMENT', 'Source distribution'),
('GENERAL_LOG', 'OFF'),
('QUERY_CACHE_SIZE', '0'),
('TABLE_TYPE', 'MyISAM'),
('MYISAM_DATA_POINTER_SIZE', '6'),
('QUERY_CACHE_MIN_RES_UNIT', '4096'),
('BINLOG_FORMAT', 'MIXED'),
('SQL_WARNINGS', 'OFF'),
('MYISAM_SORT_BUFFER_SIZE', '8388608'),
('MAX_JOIN_SIZE', '4294967295'),
('SSL_CERT', ''),
('TIMESTAMP', '1352918551'),
('AUTO_INCREMENT_OFFSET', '1'),
('HAVE_INNODB', 'NO'),
('QUERY_ALLOC_BLOCK_SIZE', '8192'),
('DATETIME_FORMAT', '%Y-%m-%d %H:%i:%s'),
('QUERY_CACHE_TYPE', 'ON'),
('WARNING_COUNT', '0'),
('SQL_LOW_PRIORITY_UPDATES', 'OFF'),
('BIG_TABLES', 'OFF'),
('THREAD_HANDLING', 'one-thread-per-connection'),
('SQL_SELECT_LIMIT', '4294967295'),
('HOSTNAME', 'php.radford.edu'),
('DATE_FORMAT', '%Y-%m-%d'),
('COLLATION_SERVER', 'latin1_swedish_ci'),
('READ_ONLY', 'OFF'),
('MYISAM_STATS_METHOD', 'nulls_unequal'),
('RAND_SEED1', ''),
('SYSTEM_TIME_ZONE', 'EDT'),
('NET_READ_TIMEOUT', '30'),
('SQL_MAX_JOIN_SIZE', '4294967295'),
('MAX_WRITE_LOCK_COUNT', '4294967295'),
('CHARACTER_SET_FILESYSTEM', 'binary'),
('PROFILING', 'OFF'),
('HAVE_RTREE_KEYS', 'YES'),
('CHARACTER_SET_SYSTEM', 'utf8'),
('SERVER_ID', '1'),
('KEY_CACHE_DIVISION_LIMIT', '100'),
('SQL_LOG_BIN', 'ON'),
('GENERAL_LOG_FILE', '/usr/local/mysql/var/php.log'),
('OPTIMIZER_SEARCH_DEPTH', '62'),
('BULK_INSERT_BUFFER_SIZE', '8388608'),
('RPL_RECOVERY_RANK', '0'),
('AUTO_INCREMENT_INCREMENT', '1'),
('VERSION_COMPILE_MACHINE', 'i686'),
('TMPDIR', '/tmp'),
('TABLE_DEFINITION_CACHE', '256'),
('EXPIRE_LOGS_DAYS', '0'),
('PROFILING_HISTORY_SIZE', '15'),
('HAVE_PARTITIONING', 'NO'),
('BASEDIR', '/usr/local/mysql/'),
('FOREIGN_KEY_CHECKS', 'ON'),
('SQL_MODE', ''),
('SQL_BIG_SELECTS', 'ON'),
('SECURE_AUTH', 'OFF'),
('SLAVE_COMPRESSED_PROTOCOL', 'OFF'),
('ENGINE_CONDITION_PUSHDOWN', 'ON'),
('TABLE_LOCK_WAIT_TIMEOUT', '50'),
('LAST_INSERT_ID', '0'),
('MAX_TMP_TABLES', '32'),
('SQL_BIG_TABLES', 'OFF'),
('UNIQUE_CHECKS', 'ON'),
('SQL_AUTO_IS_NULL', 'ON'),
('VERSION', '5.1.30-log'),
('MAX_SP_RECURSION_DEPTH', '0'),
('MAX_SORT_LENGTH', '1024'),
('ERROR_COUNT', '0'),
('CHARACTER_SET_CLIENT', 'latin1'),
('DELAY_KEY_WRITE', 'ON'),
('COLLATION_CONNECTION', 'latin1_swedish_ci'),
('CONCURRENT_INSERT', '1'),
('HAVE_QUERY_CACHE', 'YES'),
('KEEP_FILES_ON_CREATE', 'OFF'),
('MULTI_RANGE_COUNT', '256'),
('SSL_CAPATH', ''),
('NEW', 'OFF'),
('TABLE_OPEN_CACHE', '64'),
('DIV_PRECISION_INCREMENT', '4'),
('HAVE_COMMUNITY_FEATURES', 'YES'),
('DATADIR', '/usr/local/mysql/var/'),
('REPORT_PORT', '3306'),
('SQL_LOG_OFF', 'OFF'),
('SQL_BUFFER_RESULT', 'OFF'),
('RAND_SEED2', ''),
('KEY_CACHE_BLOCK_SIZE', '1024'),
('SQL_SLAVE_SKIP_COUNTER', ''),
('LC_TIME_NAMES', 'en_US'),
('TIME_FORMAT', '%H:%i:%s'),
('PRELOAD_BUFFER_SIZE', '32768'),
('MAX_ALLOWED_PACKET', '2097152'),
('LOG', 'OFF'),
('STORAGE_ENGINE', 'MyISAM'),
('TX_ISOLATION', 'REPEATABLE-READ');

-- --------------------------------------------------------

--
-- Table structure for table `KEY_COLUMN_USAGE`
--

CREATE TEMPORARY TABLE `KEY_COLUMN_USAGE` (
  `CONSTRAINT_CATALOG` varchar(512) DEFAULT NULL,
  `CONSTRAINT_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `CONSTRAINT_NAME` varchar(64) NOT NULL DEFAULT '',
  `TABLE_CATALOG` varchar(512) DEFAULT NULL,
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `COLUMN_NAME` varchar(64) NOT NULL DEFAULT '',
  `ORDINAL_POSITION` bigint(10) NOT NULL DEFAULT '0',
  `POSITION_IN_UNIQUE_CONSTRAINT` bigint(10) DEFAULT NULL,
  `REFERENCED_TABLE_SCHEMA` varchar(64) DEFAULT NULL,
  `REFERENCED_TABLE_NAME` varchar(64) DEFAULT NULL,
  `REFERENCED_COLUMN_NAME` varchar(64) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `KEY_COLUMN_USAGE`
--

INSERT INTO `KEY_COLUMN_USAGE` (`CONSTRAINT_CATALOG`, `CONSTRAINT_SCHEMA`, `CONSTRAINT_NAME`, `TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `POSITION_IN_UNIQUE_CONSTRAINT`, `REFERENCED_TABLE_SCHEMA`, `REFERENCED_TABLE_NAME`, `REFERENCED_COLUMN_NAME`) VALUES
(NULL, 'dro', 'PRIMARY', NULL, 'dro', 'dp_accommodations', 'accommodation_id', 1, NULL, NULL, NULL, NULL),
(NULL, 'dro', 'PRIMARY', NULL, 'dro', 'dp_class_accommodations', 'class_accom_id', 1, NULL, NULL, NULL, NULL),
(NULL, 'dro', 'PRIMARY', NULL, 'dro', 'dp_colleges', 'id', 1, NULL, NULL, NULL, NULL),
(NULL, 'dro', 'PRIMARY', NULL, 'dro', 'dp_configs', 'config_id', 1, NULL, NULL, NULL, NULL),
(NULL, 'dro', 'PRIMARY', NULL, 'dro', 'dp_contact', 'con_id', 1, NULL, NULL, NULL, NULL),
(NULL, 'dro', 'PRIMARY', NULL, 'dro', 'dp_contact_type', 'contact_type_id', 1, NULL, NULL, NULL, NULL),
(NULL, 'dro', 'PRIMARY', NULL, 'dro', 'dp_disabilities', 'id', 1, NULL, NULL, NULL, NULL),
(NULL, 'dro', 'PRIMARY', NULL, 'dro', 'dp_exam_accommodations', 'exam_accom_id', 1, NULL, NULL, NULL, NULL),
(NULL, 'dro', 'PRIMARY', NULL, 'dro', 'dp_history', 'history_id', 1, NULL, NULL, NULL, NULL),
(NULL, 'dro', 'PRIMARY', NULL, 'dro', 'dp_intake', 'intake_id', 1, NULL, NULL, NULL, NULL),
(NULL, 'dro', 'PRIMARY', NULL, 'dro', 'dp_intake_doc_status', 'doc_status_id', 1, NULL, NULL, NULL, NULL),
(NULL, 'dro', 'PRIMARY', NULL, 'dro', 'dp_limitations', 'limitation_id', 1, NULL, NULL, NULL, NULL),
(NULL, 'dro', 'PRIMARY', NULL, 'dro', 'dp_log', 'log_id', 1, NULL, NULL, NULL, NULL),
(NULL, 'dro', 'PRIMARY', NULL, 'dro', 'dp_majors', 'id', 1, NULL, NULL, NULL, NULL),
(NULL, 'dro', 'PRIMARY', NULL, 'dro', 'dp_purpose', 'purpose_id', 1, NULL, NULL, NULL, NULL),
(NULL, 'dro', 'PRIMARY', NULL, 'dro', 'dp_services', 'service_id', 1, NULL, NULL, NULL, NULL),
(NULL, 'dro', 'PRIMARY', NULL, 'dro', 'dp_student', 'id', 1, NULL, NULL, NULL, NULL),
(NULL, 'dro', 'PRIMARY', NULL, 'dro', 'group', 'group_id', 1, NULL, NULL, NULL, NULL),
(NULL, 'dro', 'PRIMARY', NULL, 'dro', 'members', 'member_id', 1, NULL, NULL, NULL, NULL),
(NULL, 'dro', 'PRIMARY', NULL, 'dro', 'messages', 'message_id', 1, NULL, NULL, NULL, NULL),
(NULL, 'dro', 'PRIMARY', NULL, 'dro', 'tie_class_accoms', 'class_accom_id', 1, NULL, NULL, NULL, NULL),
(NULL, 'dro', 'PRIMARY', NULL, 'dro', 'tie_class_accoms', 'accommodation_id', 2, NULL, NULL, NULL, NULL),
(NULL, 'dro', 'PRIMARY', NULL, 'dro', 'tie_exam_accoms', 'exam_accom_id', 1, NULL, NULL, NULL, NULL),
(NULL, 'dro', 'PRIMARY', NULL, 'dro', 'tie_exam_accoms', 'accommodation_id', 2, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `PARTITIONS`
--

CREATE TEMPORARY TABLE `PARTITIONS` (
  `TABLE_CATALOG` varchar(512) DEFAULT NULL,
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `PARTITION_NAME` varchar(64) DEFAULT NULL,
  `SUBPARTITION_NAME` varchar(64) DEFAULT NULL,
  `PARTITION_ORDINAL_POSITION` bigint(21) unsigned DEFAULT NULL,
  `SUBPARTITION_ORDINAL_POSITION` bigint(21) unsigned DEFAULT NULL,
  `PARTITION_METHOD` varchar(12) DEFAULT NULL,
  `SUBPARTITION_METHOD` varchar(12) DEFAULT NULL,
  `PARTITION_EXPRESSION` longtext,
  `SUBPARTITION_EXPRESSION` longtext,
  `PARTITION_DESCRIPTION` longtext,
  `TABLE_ROWS` bigint(21) unsigned NOT NULL DEFAULT '0',
  `AVG_ROW_LENGTH` bigint(21) unsigned NOT NULL DEFAULT '0',
  `DATA_LENGTH` bigint(21) unsigned NOT NULL DEFAULT '0',
  `MAX_DATA_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `INDEX_LENGTH` bigint(21) unsigned NOT NULL DEFAULT '0',
  `DATA_FREE` bigint(21) unsigned NOT NULL DEFAULT '0',
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `CHECK_TIME` datetime DEFAULT NULL,
  `CHECKSUM` bigint(21) unsigned DEFAULT NULL,
  `PARTITION_COMMENT` varchar(80) NOT NULL DEFAULT '',
  `NODEGROUP` varchar(12) NOT NULL DEFAULT '',
  `TABLESPACE_NAME` varchar(64) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PARTITIONS`
--

INSERT INTO `PARTITIONS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `PARTITION_NAME`, `SUBPARTITION_NAME`, `PARTITION_ORDINAL_POSITION`, `SUBPARTITION_ORDINAL_POSITION`, `PARTITION_METHOD`, `SUBPARTITION_METHOD`, `PARTITION_EXPRESSION`, `SUBPARTITION_EXPRESSION`, `PARTITION_DESCRIPTION`, `TABLE_ROWS`, `AVG_ROW_LENGTH`, `DATA_LENGTH`, `MAX_DATA_LENGTH`, `INDEX_LENGTH`, `DATA_FREE`, `CREATE_TIME`, `UPDATE_TIME`, `CHECK_TIME`, `CHECKSUM`, `PARTITION_COMMENT`, `NODEGROUP`, `TABLESPACE_NAME`) VALUES
(NULL, 'information_schema', 'CHARACTER_SETS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 576, 0, 16661376, 0, 0, NULL, NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'COLLATIONS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 423, 0, 16737264, 0, 0, NULL, NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'COLLATION_CHARACTER_SET_APPLICABILITY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 387, 0, 16733880, 0, 0, NULL, NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'COLUMNS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2012-11-14 13:42:31', '2012-11-14 13:42:31', NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'COLUMN_PRIVILEGES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2565, 0, 16757145, 0, 0, NULL, NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'ENGINES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 490, 0, 16709000, 0, 0, NULL, NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'EVENTS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2012-11-14 13:42:31', '2012-11-14 13:42:31', NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'FILES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2677, 0, 16758020, 0, 0, NULL, NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'GLOBAL_STATUS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 61636, 0, 16764992, 0, 0, NULL, NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'GLOBAL_VARIABLES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 61636, 0, 16764992, 0, 0, NULL, NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'KEY_COLUMN_USAGE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 4637, 0, 16762755, 0, 0, NULL, NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'PARTITIONS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2012-11-14 13:42:31', '2012-11-14 13:42:31', NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'PLUGINS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2012-11-14 13:42:31', '2012-11-14 13:42:31', NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'PROCESSLIST', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2012-11-14 13:42:31', '2012-11-14 13:42:31', NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'PROFILING', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 308, 0, 16562084, 0, 0, NULL, NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'REFERENTIAL_CONSTRAINTS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 4814, 0, 16767162, 0, 0, NULL, NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'ROUTINES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2012-11-14 13:42:31', '2012-11-14 13:42:31', NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'SCHEMATA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3656, 0, 16755448, 0, 0, NULL, NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'SCHEMA_PRIVILEGES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2179, 0, 16767405, 0, 0, NULL, NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'SESSION_STATUS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 61636, 0, 16764992, 0, 0, NULL, NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'SESSION_VARIABLES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 61636, 0, 16764992, 0, 0, NULL, NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'STATISTICS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2679, 0, 16770540, 0, 0, NULL, NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'TABLES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3641, 0, 16763164, 0, 0, NULL, NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'TABLE_CONSTRAINTS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2504, 0, 16749256, 0, 0, NULL, NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'TABLE_PRIVILEGES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2372, 0, 16748692, 0, 0, NULL, NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'TRIGGERS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2012-11-14 13:42:31', '2012-11-14 13:42:31', NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'USER_PRIVILEGES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1986, 0, 16759854, 0, 0, NULL, NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'VIEWS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2012-11-14 13:42:31', '2012-11-14 13:42:31', NULL, NULL, '', '', NULL),
(NULL, 'dro', 'dp_accommodations', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 2476, 281474976710655, 2048, 2476, '2012-07-10 21:19:47', '2012-11-14 13:38:35', '2012-08-15 18:10:49', NULL, '', '', NULL),
(NULL, 'dro', 'dp_class_accommodations', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, 44, 928, 281474976710655, 2048, 0, '2012-07-26 19:18:24', '2012-07-26 19:18:24', '2012-08-15 18:10:49', NULL, '', '', NULL),
(NULL, 'dro', 'dp_colleges', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 46, 328, 281474976710655, 2048, 0, '2012-07-10 21:19:47', '2012-07-10 21:19:47', '2012-08-15 18:10:49', NULL, '', '', NULL),
(NULL, 'dro', 'dp_configs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 952, 952, 281474976710655, 2048, 0, '2012-11-08 18:52:08', '2012-11-09 13:41:18', NULL, NULL, '', '', NULL),
(NULL, 'dro', 'dp_contact', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 148, 281474976710655, 2048, 148, '2012-10-03 18:38:30', '2012-11-14 13:32:41', NULL, NULL, '', '', NULL),
(NULL, 'dro', 'dp_contact_type', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 24, 48, 281474976710655, 2048, 0, '2012-10-03 18:38:30', '2012-10-05 13:56:23', NULL, NULL, '', '', NULL),
(NULL, 'dro', 'dp_disabilities', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, 22, 464, 281474976710655, 2048, 0, '2012-07-10 21:19:47', '2012-07-10 21:19:47', '2012-08-15 18:10:49', NULL, '', '', NULL),
(NULL, 'dro', 'dp_exam_accommodations', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, 34, 412, 281474976710655, 2048, 0, '2012-07-10 21:19:47', '2012-07-10 21:19:47', '2012-08-15 18:10:49', NULL, '', '', NULL),
(NULL, 'dro', 'dp_history', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2012-07-26 19:18:24', '2012-07-26 19:18:24', '2012-08-15 18:10:49', NULL, '', '', NULL),
(NULL, 'dro', 'dp_intake', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1160, 281474976710655, 2048, 1160, '2012-10-03 18:38:30', '2012-11-14 13:32:41', NULL, NULL, '', '', NULL),
(NULL, 'dro', 'dp_intake_doc_status', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 46, 368, 281474976710655, 2048, 0, '2012-07-10 21:19:47', '2012-07-10 21:19:47', '2012-08-15 18:10:49', NULL, '', '', NULL),
(NULL, 'dro', 'dp_limitations', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 54, 36, 2028, 281474976710655, 2048, 84, '2012-07-10 21:19:47', '2012-10-05 14:31:09', '2012-08-15 18:10:49', NULL, '', '', NULL),
(NULL, 'dro', 'dp_log', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2012-07-26 19:18:24', '2012-07-26 19:18:24', '2012-08-15 18:10:49', NULL, '', '', NULL),
(NULL, 'dro', 'dp_majors', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 117, 32, 3844, 281474976710655, 4096, 0, '2012-07-10 21:19:47', '2012-07-10 21:19:47', '2012-08-15 18:10:49', NULL, '', '', NULL),
(NULL, 'dro', 'dp_purpose', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 28, 56, 281474976710655, 2048, 0, '2012-10-03 18:38:30', '2012-10-05 13:57:09', NULL, NULL, '', '', NULL),
(NULL, 'dro', 'dp_services', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, 31, 344, 281474976710655, 2048, 0, '2012-07-10 21:19:47', '2012-09-12 14:18:27', '2012-08-15 18:10:49', NULL, '', '', NULL),
(NULL, 'dro', 'dp_student', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 44392, 281474976710655, 4096, 44392, '2012-10-03 18:38:30', '2012-11-14 13:38:35', NULL, NULL, '', '', NULL),
(NULL, 'dro', 'group', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 33, 100, 281474976710655, 2048, 0, '2012-09-12 13:51:14', '2012-11-08 19:10:19', NULL, NULL, '', '', NULL),
(NULL, 'dro', 'members', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 71, 632, 281474976710655, 3072, 132, '2012-07-10 21:19:47', '2012-10-05 14:35:43', '2012-08-15 18:10:49', NULL, '', '', NULL),
(NULL, 'dro', 'messages', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2012-07-10 21:19:47', '2012-11-14 13:30:23', '2012-08-15 18:10:49', NULL, '', '', NULL),
(NULL, 'dro', 'tie_class_accoms', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2012-11-08 18:52:08', '2012-11-14 13:40:42', NULL, NULL, '', '', NULL),
(NULL, 'dro', 'tie_exam_accoms', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2012-11-08 18:52:08', '2012-11-14 13:40:35', NULL, NULL, '', '', NULL),
(NULL, 'dro', 'tie_limitation_intake', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 2533274790395903, 1024, 0, '2012-07-10 21:19:47', '2012-11-14 13:40:23', '2012-08-15 18:10:49', NULL, '', '', NULL),
(NULL, 'dro', 'tie_service_intake', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 2533274790395903, 1024, 0, '2012-07-10 21:19:47', '2012-11-14 13:40:10', '2012-08-15 18:10:49', NULL, '', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `PLUGINS`
--

CREATE TEMPORARY TABLE `PLUGINS` (
  `PLUGIN_NAME` varchar(64) NOT NULL DEFAULT '',
  `PLUGIN_VERSION` varchar(20) NOT NULL DEFAULT '',
  `PLUGIN_STATUS` varchar(10) NOT NULL DEFAULT '',
  `PLUGIN_TYPE` varchar(80) NOT NULL DEFAULT '',
  `PLUGIN_TYPE_VERSION` varchar(20) NOT NULL DEFAULT '',
  `PLUGIN_LIBRARY` varchar(64) DEFAULT NULL,
  `PLUGIN_LIBRARY_VERSION` varchar(20) DEFAULT NULL,
  `PLUGIN_AUTHOR` varchar(64) DEFAULT NULL,
  `PLUGIN_DESCRIPTION` longtext,
  `PLUGIN_LICENSE` varchar(80) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PLUGINS`
--

INSERT INTO `PLUGINS` (`PLUGIN_NAME`, `PLUGIN_VERSION`, `PLUGIN_STATUS`, `PLUGIN_TYPE`, `PLUGIN_TYPE_VERSION`, `PLUGIN_LIBRARY`, `PLUGIN_LIBRARY_VERSION`, `PLUGIN_AUTHOR`, `PLUGIN_DESCRIPTION`, `PLUGIN_LICENSE`) VALUES
('binlog', '1.0', 'ACTIVE', 'STORAGE ENGINE', '50130.0', NULL, NULL, 'MySQL AB', 'This is a pseudo storage engine to represent the binlog in a transaction', 'GPL'),
('CSV', '1.0', 'ACTIVE', 'STORAGE ENGINE', '50130.0', NULL, NULL, 'Brian Aker, MySQL AB', 'CSV storage engine', 'GPL'),
('MEMORY', '1.0', 'ACTIVE', 'STORAGE ENGINE', '50130.0', NULL, NULL, 'MySQL AB', 'Hash based, stored in memory, useful for temporary tables', 'GPL'),
('MyISAM', '1.0', 'ACTIVE', 'STORAGE ENGINE', '50130.0', NULL, NULL, 'MySQL AB', 'Default engine as of MySQL 3.23 with great performance', 'GPL'),
('MRG_MYISAM', '1.0', 'ACTIVE', 'STORAGE ENGINE', '50130.0', NULL, NULL, 'MySQL AB', 'Collection of identical MyISAM tables', 'GPL');

-- --------------------------------------------------------

--
-- Table structure for table `PROCESSLIST`
--

CREATE TEMPORARY TABLE `PROCESSLIST` (
  `ID` bigint(4) NOT NULL DEFAULT '0',
  `USER` varchar(16) NOT NULL DEFAULT '',
  `HOST` varchar(64) NOT NULL DEFAULT '',
  `DB` varchar(64) DEFAULT NULL,
  `COMMAND` varchar(16) NOT NULL DEFAULT '',
  `TIME` bigint(7) NOT NULL DEFAULT '0',
  `STATE` varchar(64) DEFAULT NULL,
  `INFO` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PROCESSLIST`
--

INSERT INTO `PROCESSLIST` (`ID`, `USER`, `HOST`, `DB`, `COMMAND`, `TIME`, `STATE`, `INFO`) VALUES
(3880950, 'dro', 'localhost', NULL, 'Query', 0, 'executing', 'SELECT * FROM `information_schema`.`PROCESSLIST`');

-- --------------------------------------------------------

--
-- Table structure for table `PROFILING`
--

CREATE TEMPORARY TABLE `PROFILING` (
  `QUERY_ID` int(20) NOT NULL DEFAULT '0',
  `SEQ` int(20) NOT NULL DEFAULT '0',
  `STATE` varchar(30) NOT NULL DEFAULT '',
  `DURATION` decimal(9,6) NOT NULL DEFAULT '0.000000',
  `CPU_USER` decimal(9,6) DEFAULT NULL,
  `CPU_SYSTEM` decimal(9,6) DEFAULT NULL,
  `CONTEXT_VOLUNTARY` int(20) DEFAULT NULL,
  `CONTEXT_INVOLUNTARY` int(20) DEFAULT NULL,
  `BLOCK_OPS_IN` int(20) DEFAULT NULL,
  `BLOCK_OPS_OUT` int(20) DEFAULT NULL,
  `MESSAGES_SENT` int(20) DEFAULT NULL,
  `MESSAGES_RECEIVED` int(20) DEFAULT NULL,
  `PAGE_FAULTS_MAJOR` int(20) DEFAULT NULL,
  `PAGE_FAULTS_MINOR` int(20) DEFAULT NULL,
  `SWAPS` int(20) DEFAULT NULL,
  `SOURCE_FUNCTION` varchar(30) DEFAULT NULL,
  `SOURCE_FILE` varchar(20) DEFAULT NULL,
  `SOURCE_LINE` int(20) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PROFILING`
--


-- --------------------------------------------------------

--
-- Table structure for table `REFERENTIAL_CONSTRAINTS`
--

CREATE TEMPORARY TABLE `REFERENTIAL_CONSTRAINTS` (
  `CONSTRAINT_CATALOG` varchar(512) DEFAULT NULL,
  `CONSTRAINT_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `CONSTRAINT_NAME` varchar(64) NOT NULL DEFAULT '',
  `UNIQUE_CONSTRAINT_CATALOG` varchar(512) DEFAULT NULL,
  `UNIQUE_CONSTRAINT_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `UNIQUE_CONSTRAINT_NAME` varchar(64) DEFAULT NULL,
  `MATCH_OPTION` varchar(64) NOT NULL DEFAULT '',
  `UPDATE_RULE` varchar(64) NOT NULL DEFAULT '',
  `DELETE_RULE` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `REFERENCED_TABLE_NAME` varchar(64) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `REFERENTIAL_CONSTRAINTS`
--


-- --------------------------------------------------------

--
-- Table structure for table `ROUTINES`
--

CREATE TEMPORARY TABLE `ROUTINES` (
  `SPECIFIC_NAME` varchar(64) NOT NULL DEFAULT '',
  `ROUTINE_CATALOG` varchar(512) DEFAULT NULL,
  `ROUTINE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `ROUTINE_NAME` varchar(64) NOT NULL DEFAULT '',
  `ROUTINE_TYPE` varchar(9) NOT NULL DEFAULT '',
  `DTD_IDENTIFIER` varchar(64) DEFAULT NULL,
  `ROUTINE_BODY` varchar(8) NOT NULL DEFAULT '',
  `ROUTINE_DEFINITION` longtext,
  `EXTERNAL_NAME` varchar(64) DEFAULT NULL,
  `EXTERNAL_LANGUAGE` varchar(64) DEFAULT NULL,
  `PARAMETER_STYLE` varchar(8) NOT NULL DEFAULT '',
  `IS_DETERMINISTIC` varchar(3) NOT NULL DEFAULT '',
  `SQL_DATA_ACCESS` varchar(64) NOT NULL DEFAULT '',
  `SQL_PATH` varchar(64) DEFAULT NULL,
  `SECURITY_TYPE` varchar(7) NOT NULL DEFAULT '',
  `CREATED` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LAST_ALTERED` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SQL_MODE` longtext NOT NULL,
  `ROUTINE_COMMENT` varchar(64) NOT NULL DEFAULT '',
  `DEFINER` varchar(77) NOT NULL DEFAULT '',
  `CHARACTER_SET_CLIENT` varchar(32) NOT NULL DEFAULT '',
  `COLLATION_CONNECTION` varchar(32) NOT NULL DEFAULT '',
  `DATABASE_COLLATION` varchar(32) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ROUTINES`
--


-- --------------------------------------------------------

--
-- Table structure for table `SCHEMATA`
--

CREATE TEMPORARY TABLE `SCHEMATA` (
  `CATALOG_NAME` varchar(512) DEFAULT NULL,
  `SCHEMA_NAME` varchar(64) NOT NULL DEFAULT '',
  `DEFAULT_CHARACTER_SET_NAME` varchar(64) NOT NULL DEFAULT '',
  `DEFAULT_COLLATION_NAME` varchar(64) NOT NULL DEFAULT '',
  `SQL_PATH` varchar(512) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `SCHEMATA`
--

INSERT INTO `SCHEMATA` (`CATALOG_NAME`, `SCHEMA_NAME`, `DEFAULT_CHARACTER_SET_NAME`, `DEFAULT_COLLATION_NAME`, `SQL_PATH`) VALUES
(NULL, 'information_schema', 'utf8', 'utf8_general_ci', NULL),
(NULL, 'dro', 'latin1', 'latin1_swedish_ci', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `SCHEMA_PRIVILEGES`
--

CREATE TEMPORARY TABLE `SCHEMA_PRIVILEGES` (
  `GRANTEE` varchar(81) NOT NULL DEFAULT '',
  `TABLE_CATALOG` varchar(512) DEFAULT NULL,
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `PRIVILEGE_TYPE` varchar(64) NOT NULL DEFAULT '',
  `IS_GRANTABLE` varchar(3) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `SCHEMA_PRIVILEGES`
--

INSERT INTO `SCHEMA_PRIVILEGES` (`GRANTEE`, `TABLE_CATALOG`, `TABLE_SCHEMA`, `PRIVILEGE_TYPE`, `IS_GRANTABLE`) VALUES
('''dro''@''localhost''', NULL, 'dro', 'SELECT', 'NO'),
('''dro''@''localhost''', NULL, 'dro', 'INSERT', 'NO'),
('''dro''@''localhost''', NULL, 'dro', 'UPDATE', 'NO'),
('''dro''@''localhost''', NULL, 'dro', 'DELETE', 'NO'),
('''dro''@''localhost''', NULL, 'dro', 'CREATE', 'NO'),
('''dro''@''localhost''', NULL, 'dro', 'DROP', 'NO'),
('''dro''@''localhost''', NULL, 'dro', 'REFERENCES', 'NO'),
('''dro''@''localhost''', NULL, 'dro', 'INDEX', 'NO'),
('''dro''@''localhost''', NULL, 'dro', 'ALTER', 'NO'),
('''dro''@''localhost''', NULL, 'dro', 'CREATE TEMPORARY TABLES', 'NO'),
('''dro''@''localhost''', NULL, 'dro', 'LOCK TABLES', 'NO'),
('''dro''@''localhost''', NULL, 'dro', 'EXECUTE', 'NO'),
('''dro''@''localhost''', NULL, 'dro', 'CREATE VIEW', 'NO'),
('''dro''@''localhost''', NULL, 'dro', 'SHOW VIEW', 'NO'),
('''dro''@''localhost''', NULL, 'dro', 'CREATE ROUTINE', 'NO'),
('''dro''@''localhost''', NULL, 'dro', 'ALTER ROUTINE', 'NO'),
('''dro''@''localhost''', NULL, 'dro', 'EVENT', 'NO'),
('''dro''@''localhost''', NULL, 'dro', 'TRIGGER', 'NO');

-- --------------------------------------------------------

--
-- Table structure for table `SESSION_STATUS`
--

CREATE TEMPORARY TABLE `SESSION_STATUS` (
  `VARIABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `VARIABLE_VALUE` varchar(20480) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `SESSION_STATUS`
--

INSERT INTO `SESSION_STATUS` (`VARIABLE_NAME`, `VARIABLE_VALUE`) VALUES
('ABORTED_CLIENTS', '14'),
('ABORTED_CONNECTS', '3216'),
('BINLOG_CACHE_DISK_USE', '0'),
('BINLOG_CACHE_USE', '5371'),
('BYTES_RECEIVED', '11290'),
('BYTES_SENT', '233494'),
('COM_ADMIN_COMMANDS', '0'),
('COM_ASSIGN_TO_KEYCACHE', '0'),
('COM_ALTER_DB', '0'),
('COM_ALTER_DB_UPGRADE', '0'),
('COM_ALTER_EVENT', '0'),
('COM_ALTER_FUNCTION', '0'),
('COM_ALTER_PROCEDURE', '0'),
('COM_ALTER_SERVER', '0'),
('COM_ALTER_TABLE', '0'),
('COM_ALTER_TABLESPACE', '0'),
('COM_ANALYZE', '0'),
('COM_BACKUP_TABLE', '0'),
('COM_BEGIN', '0'),
('COM_BINLOG', '0'),
('COM_CALL_PROCEDURE', '0'),
('COM_CHANGE_DB', '0'),
('COM_CHANGE_MASTER', '0'),
('COM_CHECK', '0'),
('COM_CHECKSUM', '0'),
('COM_COMMIT', '0'),
('COM_CREATE_DB', '0'),
('COM_CREATE_EVENT', '0'),
('COM_CREATE_FUNCTION', '0'),
('COM_CREATE_INDEX', '0'),
('COM_CREATE_PROCEDURE', '0'),
('COM_CREATE_SERVER', '0'),
('COM_CREATE_TABLE', '0'),
('COM_CREATE_TRIGGER', '0'),
('COM_CREATE_UDF', '0'),
('COM_CREATE_USER', '0'),
('COM_CREATE_VIEW', '0'),
('COM_DEALLOC_SQL', '0'),
('COM_DELETE', '0'),
('COM_DELETE_MULTI', '0'),
('COM_DO', '0'),
('COM_DROP_DB', '0'),
('COM_DROP_EVENT', '0'),
('COM_DROP_FUNCTION', '0'),
('COM_DROP_INDEX', '0'),
('COM_DROP_PROCEDURE', '0'),
('COM_DROP_SERVER', '0'),
('COM_DROP_TABLE', '0'),
('COM_DROP_TRIGGER', '0'),
('COM_DROP_USER', '0'),
('COM_DROP_VIEW', '0'),
('COM_EMPTY_QUERY', '0'),
('COM_EXECUTE_SQL', '0'),
('COM_FLUSH', '0'),
('COM_GRANT', '0'),
('COM_HA_CLOSE', '0'),
('COM_HA_OPEN', '0'),
('COM_HA_READ', '0'),
('COM_HELP', '0'),
('COM_INSERT', '0'),
('COM_INSERT_SELECT', '0'),
('COM_INSTALL_PLUGIN', '0'),
('COM_KILL', '0'),
('COM_LOAD', '0'),
('COM_LOAD_MASTER_DATA', '0'),
('COM_LOAD_MASTER_TABLE', '0'),
('COM_LOCK_TABLES', '0'),
('COM_OPTIMIZE', '0'),
('COM_PRELOAD_KEYS', '0'),
('COM_PREPARE_SQL', '0'),
('COM_PURGE', '0'),
('COM_PURGE_BEFORE_DATE', '0'),
('COM_RELEASE_SAVEPOINT', '0'),
('COM_RENAME_TABLE', '0'),
('COM_RENAME_USER', '0'),
('COM_REPAIR', '0'),
('COM_REPLACE', '0'),
('COM_REPLACE_SELECT', '0'),
('COM_RESET', '0'),
('COM_RESTORE_TABLE', '0'),
('COM_REVOKE', '0'),
('COM_REVOKE_ALL', '0'),
('COM_ROLLBACK', '0'),
('COM_ROLLBACK_TO_SAVEPOINT', '0'),
('COM_SAVEPOINT', '0'),
('COM_SELECT', '45'),
('COM_SET_OPTION', '47'),
('COM_SHOW_AUTHORS', '0'),
('COM_SHOW_BINLOG_EVENTS', '0'),
('COM_SHOW_BINLOGS', '0'),
('COM_SHOW_CHARSETS', '0'),
('COM_SHOW_COLLATIONS', '0'),
('COM_SHOW_COLUMN_TYPES', '0'),
('COM_SHOW_CONTRIBUTORS', '0'),
('COM_SHOW_CREATE_DB', '0'),
('COM_SHOW_CREATE_EVENT', '0'),
('COM_SHOW_CREATE_FUNC', '0'),
('COM_SHOW_CREATE_PROC', '0'),
('COM_SHOW_CREATE_TABLE', '44'),
('COM_SHOW_CREATE_TRIGGER', '0'),
('COM_SHOW_DATABASES', '1'),
('COM_SHOW_ENGINE_LOGS', '0'),
('COM_SHOW_ENGINE_MUTEX', '0'),
('COM_SHOW_ENGINE_STATUS', '0'),
('COM_SHOW_EVENTS', '0'),
('COM_SHOW_ERRORS', '0'),
('COM_SHOW_FIELDS', '0'),
('COM_SHOW_FUNCTION_STATUS', '0'),
('COM_SHOW_GRANTS', '0'),
('COM_SHOW_KEYS', '0'),
('COM_SHOW_MASTER_STATUS', '0'),
('COM_SHOW_NEW_MASTER', '0'),
('COM_SHOW_OPEN_TABLES', '0'),
('COM_SHOW_PLUGINS', '1'),
('COM_SHOW_PRIVILEGES', '0'),
('COM_SHOW_PROCEDURE_STATUS', '0'),
('COM_SHOW_PROCESSLIST', '0'),
('COM_SHOW_PROFILE', '0'),
('COM_SHOW_PROFILES', '0'),
('COM_SHOW_SLAVE_HOSTS', '0'),
('COM_SHOW_SLAVE_STATUS', '0'),
('COM_SHOW_STATUS', '0'),
('COM_SHOW_STORAGE_ENGINES', '0'),
('COM_SHOW_TABLE_STATUS', '46'),
('COM_SHOW_TABLES', '2'),
('COM_SHOW_TRIGGERS', '43'),
('COM_SHOW_VARIABLES', '0'),
('COM_SHOW_WARNINGS', '0'),
('COM_SLAVE_START', '0'),
('COM_SLAVE_STOP', '0'),
('COM_STMT_CLOSE', '0'),
('COM_STMT_EXECUTE', '0'),
('COM_STMT_FETCH', '0'),
('COM_STMT_PREPARE', '0'),
('COM_STMT_REPREPARE', '0'),
('COM_STMT_RESET', '0'),
('COM_STMT_SEND_LONG_DATA', '0'),
('COM_TRUNCATE', '0'),
('COM_UNINSTALL_PLUGIN', '0'),
('COM_UNLOCK_TABLES', '0'),
('COM_UPDATE', '0'),
('COM_UPDATE_MULTI', '0'),
('COM_XA_COMMIT', '0'),
('COM_XA_END', '0'),
('COM_XA_PREPARE', '0'),
('COM_XA_RECOVER', '0'),
('COM_XA_ROLLBACK', '0'),
('COM_XA_START', '0'),
('COMPRESSION', 'OFF'),
('CONNECTIONS', '3880951'),
('CREATED_TMP_DISK_TABLES', '108'),
('CREATED_TMP_FILES', '2506'),
('CREATED_TMP_TABLES', '313'),
('DELAYED_ERRORS', '0'),
('DELAYED_INSERT_THREADS', '0'),
('DELAYED_WRITES', '0'),
('FLUSH_COMMANDS', '175'),
('HANDLER_COMMIT', '0'),
('HANDLER_DELETE', '0'),
('HANDLER_DISCOVER', '0'),
('HANDLER_PREPARE', '0'),
('HANDLER_READ_FIRST', '16'),
('HANDLER_READ_KEY', '0'),
('HANDLER_READ_NEXT', '3'),
('HANDLER_READ_PREV', '0'),
('HANDLER_READ_RND', '0'),
('HANDLER_READ_RND_NEXT', '1805'),
('HANDLER_ROLLBACK', '0'),
('HANDLER_SAVEPOINT', '0'),
('HANDLER_SAVEPOINT_ROLLBACK', '0'),
('HANDLER_UPDATE', '0'),
('HANDLER_WRITE', '1577'),
('KEY_BLOCKS_NOT_FLUSHED', '0'),
('KEY_BLOCKS_UNUSED', '14263'),
('KEY_BLOCKS_USED', '5315'),
('KEY_READ_REQUESTS', '714370301'),
('KEY_READS', '5138228'),
('KEY_WRITE_REQUESTS', '6324700'),
('KEY_WRITES', '3058827'),
('LAST_QUERY_COST', '10.499000'),
('MAX_USED_CONNECTIONS', '82'),
('NOT_FLUSHED_DELAYED_ROWS', '0'),
('OPEN_FILES', '126'),
('OPEN_STREAMS', '0'),
('OPEN_TABLE_DEFINITIONS', '256'),
('OPEN_TABLES', '64'),
('OPENED_FILES', '20734031'),
('OPENED_TABLE_DEFINITIONS', '1'),
('OPENED_TABLES', '26'),
('PREPARED_STMT_COUNT', '0'),
('QCACHE_FREE_BLOCKS', '0'),
('QCACHE_FREE_MEMORY', '0'),
('QCACHE_HITS', '0'),
('QCACHE_INSERTS', '0'),
('QCACHE_LOWMEM_PRUNES', '0'),
('QCACHE_NOT_CACHED', '0'),
('QCACHE_QUERIES_IN_CACHE', '0'),
('QCACHE_TOTAL_BLOCKS', '0'),
('QUESTIONS', '100575840'),
('RPL_STATUS', 'NULL'),
('SELECT_FULL_JOIN', '0'),
('SELECT_FULL_RANGE_JOIN', '0'),
('SELECT_RANGE', '0'),
('SELECT_RANGE_CHECK', '0'),
('SELECT_SCAN', '126'),
('SLAVE_OPEN_TEMP_TABLES', '0'),
('SLAVE_RETRIED_TRANSACTIONS', '0'),
('SLAVE_RUNNING', 'OFF'),
('SLOW_LAUNCH_THREADS', '9'),
('SLOW_QUERIES', '0'),
('SORT_MERGE_PASSES', '0'),
('SORT_RANGE', '0'),
('SORT_ROWS', '0'),
('SORT_SCAN', '0'),
('TABLE_LOCKS_IMMEDIATE', '89191875'),
('TABLE_LOCKS_WAITED', '41089'),
('TC_LOG_MAX_PAGES_USED', '0'),
('TC_LOG_PAGE_SIZE', '0'),
('TC_LOG_PAGE_WAITS', '0'),
('THREADS_CACHED', '0'),
('THREADS_CONNECTED', '2'),
('THREADS_CREATED', '3880950'),
('THREADS_RUNNING', '1'),
('UPTIME', '7550578'),
('UPTIME_SINCE_FLUSH_STATUS', '7550578');

-- --------------------------------------------------------

--
-- Table structure for table `SESSION_VARIABLES`
--

CREATE TEMPORARY TABLE `SESSION_VARIABLES` (
  `VARIABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `VARIABLE_VALUE` varchar(20480) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `SESSION_VARIABLES`
--

INSERT INTO `SESSION_VARIABLES` (`VARIABLE_NAME`, `VARIABLE_VALUE`) VALUES
('BACK_LOG', '50'),
('CHARACTER_SETS_DIR', '/usr/local/mysql/share/mysql/charsets/'),
('FT_MAX_WORD_LEN', '84'),
('FT_MIN_WORD_LEN', '4'),
('FT_QUERY_EXPANSION_LIMIT', '20'),
('FT_STOPWORD_FILE', '(built-in)'),
('INIT_FILE', ''),
('LANGUAGE', '/usr/local/mysql/share/mysql/english/'),
('LARGE_FILES_SUPPORT', 'ON'),
('LARGE_PAGE_SIZE', '0'),
('LARGE_PAGES', 'OFF'),
('LOCKED_IN_MEMORY', 'OFF'),
('LOG_BIN', 'ON'),
('LOG_ERROR', '/usr/local/mysql/var/php.radford.edu.err'),
('LOWER_CASE_FILE_SYSTEM', 'OFF'),
('LOWER_CASE_TABLE_NAMES', '0'),
('MYISAM_RECOVER_OPTIONS', 'OFF'),
('OPEN_FILES_LIMIT', '1024'),
('PID_FILE', '/usr/local/mysql/var/php.radford.edu.pid'),
('PLUGIN_DIR', '/usr/local/mysql/lib/mysql/plugin'),
('PORT', '3306'),
('PROTOCOL_VERSION', '10'),
('SKIP_EXTERNAL_LOCKING', 'ON'),
('SKIP_NETWORKING', 'OFF'),
('SKIP_SHOW_DATABASE', 'OFF'),
('SOCKET', '/tmp/mysql.sock'),
('THREAD_STACK', '196608'),
('LOG_SLAVE_UPDATES', 'OFF'),
('RELAY_LOG', ''),
('RELAY_LOG_INDEX', ''),
('RELAY_LOG_INFO_FILE', 'relay-log.info'),
('RELAY_LOG_SPACE_LIMIT', '0'),
('SLAVE_LOAD_TMPDIR', '/tmp'),
('SLAVE_SKIP_ERRORS', 'OFF'),
('LICENSE', 'GPL'),
('MAX_ERROR_COUNT', '64'),
('HAVE_CRYPT', 'YES'),
('NET_BUFFER_LENGTH', '8192'),
('MYISAM_REPAIR_THREADS', '1'),
('AUTOMATIC_SP_PRIVILEGES', 'ON'),
('OPTIMIZER_PRUNE_LEVEL', '1'),
('CHARACTER_SET_CONNECTION', 'utf8'),
('LOG_BIN_TRUST_FUNCTION_CREATORS', 'OFF'),
('OLD_PASSWORDS', 'OFF'),
('FT_BOOLEAN_SYNTAX', '+ -><()~*:""&|'),
('SSL_CIPHER', ''),
('HAVE_OPENSSL', 'NO'),
('CHARACTER_SET_RESULTS', 'utf8'),
('LOG_BIN_TRUST_ROUTINE_CREATORS', 'OFF'),
('MAX_RELAY_LOG_SIZE', '0'),
('SORT_BUFFER_SIZE', '524288'),
('BINLOG_CACHE_SIZE', '32768'),
('IDENTITY', '0'),
('COLLATION_DATABASE', 'latin1_swedish_ci'),
('UPDATABLE_VIEWS_WITH_LIMIT', 'YES'),
('COMPLETION_TYPE', '0'),
('SLOW_LAUNCH_TIME', '2'),
('CONNECT_TIMEOUT', '10'),
('INIT_CONNECT', ''),
('HAVE_NDBCLUSTER', 'NO'),
('SQL_SAFE_UPDATES', 'OFF'),
('SLAVE_EXEC_MODE', 'STRICT'),
('SQL_QUOTE_SHOW_CREATE', 'ON'),
('DELAYED_QUEUE_SIZE', '1000'),
('SQL_LOG_UPDATE', 'ON'),
('DELAYED_INSERT_TIMEOUT', '300'),
('WAIT_TIMEOUT', '28800'),
('FLUSH_TIME', '0'),
('TMP_TABLE_SIZE', '16777216'),
('INTERACTIVE_TIMEOUT', '28800'),
('QUERY_PREALLOC_SIZE', '8192'),
('PSEUDO_THREAD_ID', '3880950'),
('REPORT_HOST', ''),
('CHARACTER_SET_DATABASE', 'latin1'),
('SSL_KEY', ''),
('QUERY_CACHE_WLOCK_INVALIDATE', 'OFF'),
('REPORT_USER', ''),
('FLUSH', 'OFF'),
('HAVE_GEOMETRY', 'YES'),
('JOIN_BUFFER_SIZE', '131072'),
('INSERT_ID', '0'),
('MAX_BINLOG_SIZE', '1073741824'),
('RELAY_LOG_PURGE', 'ON'),
('INIT_SLAVE', ''),
('LOG_WARNINGS', '1'),
('MAX_CONNECT_ERRORS', '10'),
('GROUP_CONCAT_MAX_LEN', '1024'),
('TRANSACTION_ALLOC_BLOCK_SIZE', '8192'),
('RANGE_ALLOC_BLOCK_SIZE', '4096'),
('MAX_CONNECTIONS', '151'),
('SECURE_FILE_PRIV', ''),
('AUTOCOMMIT', 'ON'),
('LOG_SLOW_QUERIES', 'OFF'),
('TIMED_MUTEXES', 'OFF'),
('TRANSACTION_PREALLOC_SIZE', '4096'),
('MAX_SEEKS_FOR_KEY', '4294967295'),
('VERSION_COMPILE_OS', 'pc-linux-gnu'),
('MAX_PREPARED_STMT_COUNT', '16382'),
('SQL_NOTES', 'ON'),
('EVENT_SCHEDULER', 'OFF'),
('LOW_PRIORITY_UPDATES', 'OFF'),
('LOG_QUERIES_NOT_USING_INDEXES', 'OFF'),
('REPORT_PASSWORD', ''),
('DELAYED_INSERT_LIMIT', '100'),
('MAX_INSERT_DELAYED_THREADS', '20'),
('CHARACTER_SET_SERVER', 'latin1'),
('HAVE_COMPRESS', 'YES'),
('MAX_LENGTH_FOR_SORT_DATA', '1024'),
('HAVE_DYNAMIC_LOADING', 'YES'),
('MAX_HEAP_TABLE_SIZE', '16777216'),
('SYNC_BINLOG', '0'),
('READ_RND_BUFFER_SIZE', '524288'),
('SYNC_FRM', 'ON'),
('KEY_CACHE_AGE_THRESHOLD', '300'),
('HAVE_CSV', 'YES'),
('NET_RETRY_COUNT', '10'),
('DEFAULT_WEEK_FORMAT', '0'),
('HAVE_SSL', 'NO'),
('LOG_OUTPUT', 'FILE'),
('OLD_ALTER_TABLE', 'OFF'),
('MYISAM_USE_MMAP', 'OFF'),
('LONG_QUERY_TIME', '10.000000'),
('KEY_BUFFER_SIZE', '16777216'),
('MAX_DELAYED_THREADS', '20'),
('HAVE_SYMLINK', 'YES'),
('MAX_USER_CONNECTIONS', '0'),
('TIME_ZONE', 'SYSTEM'),
('THREAD_CACHE_SIZE', '0'),
('SLOW_QUERY_LOG', 'OFF'),
('READ_BUFFER_SIZE', '262144'),
('SLOW_QUERY_LOG_FILE', '/usr/local/mysql/var/php-slow.log'),
('MYISAM_MAX_SORT_FILE_SIZE', '2147483647'),
('SSL_CA', ''),
('NET_WRITE_TIMEOUT', '60'),
('MAX_BINLOG_CACHE_SIZE', '4294967295'),
('OLD', 'OFF'),
('SLAVE_NET_TIMEOUT', '3600'),
('MIN_EXAMINED_ROW_LIMIT', '0'),
('SLAVE_TRANSACTION_RETRIES', '10'),
('QUERY_CACHE_LIMIT', '1048576'),
('LOCAL_INFILE', 'ON'),
('VERSION_COMMENT', 'Source distribution'),
('GENERAL_LOG', 'OFF'),
('QUERY_CACHE_SIZE', '0'),
('TABLE_TYPE', 'MyISAM'),
('MYISAM_DATA_POINTER_SIZE', '6'),
('QUERY_CACHE_MIN_RES_UNIT', '4096'),
('BINLOG_FORMAT', 'MIXED'),
('SQL_WARNINGS', 'OFF'),
('MYISAM_SORT_BUFFER_SIZE', '8388608'),
('MAX_JOIN_SIZE', '4294967295'),
('SSL_CERT', ''),
('TIMESTAMP', '1352918551'),
('AUTO_INCREMENT_OFFSET', '1'),
('HAVE_INNODB', 'NO'),
('QUERY_ALLOC_BLOCK_SIZE', '8192'),
('DATETIME_FORMAT', '%Y-%m-%d %H:%i:%s'),
('QUERY_CACHE_TYPE', 'ON'),
('WARNING_COUNT', '0'),
('SQL_LOW_PRIORITY_UPDATES', 'OFF'),
('BIG_TABLES', 'OFF'),
('THREAD_HANDLING', 'one-thread-per-connection'),
('SQL_SELECT_LIMIT', '4294967295'),
('HOSTNAME', 'php.radford.edu'),
('DATE_FORMAT', '%Y-%m-%d'),
('COLLATION_SERVER', 'latin1_swedish_ci'),
('READ_ONLY', 'OFF'),
('MYISAM_STATS_METHOD', 'nulls_unequal'),
('RAND_SEED1', ''),
('SYSTEM_TIME_ZONE', 'EDT'),
('NET_READ_TIMEOUT', '30'),
('SQL_MAX_JOIN_SIZE', '4294967295'),
('MAX_WRITE_LOCK_COUNT', '4294967295'),
('CHARACTER_SET_FILESYSTEM', 'binary'),
('PROFILING', 'OFF'),
('HAVE_RTREE_KEYS', 'YES'),
('CHARACTER_SET_SYSTEM', 'utf8'),
('SERVER_ID', '1'),
('KEY_CACHE_DIVISION_LIMIT', '100'),
('SQL_LOG_BIN', 'ON'),
('GENERAL_LOG_FILE', '/usr/local/mysql/var/php.log'),
('OPTIMIZER_SEARCH_DEPTH', '62'),
('BULK_INSERT_BUFFER_SIZE', '8388608'),
('RPL_RECOVERY_RANK', '0'),
('AUTO_INCREMENT_INCREMENT', '1'),
('VERSION_COMPILE_MACHINE', 'i686'),
('TMPDIR', '/tmp'),
('TABLE_DEFINITION_CACHE', '256'),
('EXPIRE_LOGS_DAYS', '0'),
('PROFILING_HISTORY_SIZE', '15'),
('HAVE_PARTITIONING', 'NO'),
('BASEDIR', '/usr/local/mysql/'),
('FOREIGN_KEY_CHECKS', 'ON'),
('SQL_MODE', ''),
('SQL_BIG_SELECTS', 'ON'),
('SECURE_AUTH', 'OFF'),
('SLAVE_COMPRESSED_PROTOCOL', 'OFF'),
('ENGINE_CONDITION_PUSHDOWN', 'ON'),
('TABLE_LOCK_WAIT_TIMEOUT', '50'),
('LAST_INSERT_ID', '0'),
('MAX_TMP_TABLES', '32'),
('SQL_BIG_TABLES', 'OFF'),
('UNIQUE_CHECKS', 'ON'),
('SQL_AUTO_IS_NULL', 'ON'),
('VERSION', '5.1.30-log'),
('MAX_SP_RECURSION_DEPTH', '0'),
('MAX_SORT_LENGTH', '1024'),
('ERROR_COUNT', '0'),
('CHARACTER_SET_CLIENT', 'utf8'),
('DELAY_KEY_WRITE', 'ON'),
('COLLATION_CONNECTION', 'utf8_general_ci'),
('CONCURRENT_INSERT', '1'),
('HAVE_QUERY_CACHE', 'YES'),
('KEEP_FILES_ON_CREATE', 'OFF'),
('MULTI_RANGE_COUNT', '256'),
('SSL_CAPATH', ''),
('NEW', 'OFF'),
('TABLE_OPEN_CACHE', '64'),
('DIV_PRECISION_INCREMENT', '4'),
('HAVE_COMMUNITY_FEATURES', 'YES'),
('DATADIR', '/usr/local/mysql/var/'),
('REPORT_PORT', '3306'),
('SQL_LOG_OFF', 'OFF'),
('SQL_BUFFER_RESULT', 'OFF'),
('RAND_SEED2', ''),
('KEY_CACHE_BLOCK_SIZE', '1024'),
('SQL_SLAVE_SKIP_COUNTER', ''),
('LC_TIME_NAMES', 'en_US'),
('TIME_FORMAT', '%H:%i:%s'),
('PRELOAD_BUFFER_SIZE', '32768'),
('MAX_ALLOWED_PACKET', '2097152'),
('LOG', 'OFF'),
('STORAGE_ENGINE', 'MyISAM'),
('TX_ISOLATION', 'REPEATABLE-READ');

-- --------------------------------------------------------

--
-- Table structure for table `STATISTICS`
--

CREATE TEMPORARY TABLE `STATISTICS` (
  `TABLE_CATALOG` varchar(512) DEFAULT NULL,
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `NON_UNIQUE` bigint(1) NOT NULL DEFAULT '0',
  `INDEX_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `INDEX_NAME` varchar(64) NOT NULL DEFAULT '',
  `SEQ_IN_INDEX` bigint(2) NOT NULL DEFAULT '0',
  `COLUMN_NAME` varchar(64) NOT NULL DEFAULT '',
  `COLLATION` varchar(1) DEFAULT NULL,
  `CARDINALITY` bigint(21) DEFAULT NULL,
  `SUB_PART` bigint(3) DEFAULT NULL,
  `PACKED` varchar(10) DEFAULT NULL,
  `NULLABLE` varchar(3) NOT NULL DEFAULT '',
  `INDEX_TYPE` varchar(16) NOT NULL DEFAULT '',
  `COMMENT` varchar(16) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `STATISTICS`
--

INSERT INTO `STATISTICS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `NON_UNIQUE`, `INDEX_SCHEMA`, `INDEX_NAME`, `SEQ_IN_INDEX`, `COLUMN_NAME`, `COLLATION`, `CARDINALITY`, `SUB_PART`, `PACKED`, `NULLABLE`, `INDEX_TYPE`, `COMMENT`) VALUES
(NULL, 'dro', 'dp_accommodations', 0, 'dro', 'PRIMARY', 1, 'accommodation_id', 'A', 0, NULL, NULL, '', 'BTREE', ''),
(NULL, 'dro', 'dp_class_accommodations', 0, 'dro', 'PRIMARY', 1, 'class_accom_id', 'A', 21, NULL, NULL, '', 'BTREE', ''),
(NULL, 'dro', 'dp_colleges', 0, 'dro', 'PRIMARY', 1, 'id', 'A', 7, NULL, NULL, '', 'BTREE', ''),
(NULL, 'dro', 'dp_configs', 0, 'dro', 'PRIMARY', 1, 'config_id', 'A', 1, NULL, NULL, '', 'BTREE', ''),
(NULL, 'dro', 'dp_contact', 0, 'dro', 'PRIMARY', 1, 'con_id', 'A', 0, NULL, NULL, '', 'BTREE', ''),
(NULL, 'dro', 'dp_contact_type', 0, 'dro', 'PRIMARY', 1, 'contact_type_id', 'A', 2, NULL, NULL, '', 'BTREE', ''),
(NULL, 'dro', 'dp_disabilities', 0, 'dro', 'PRIMARY', 1, 'id', 'A', 21, NULL, NULL, '', 'BTREE', ''),
(NULL, 'dro', 'dp_exam_accommodations', 0, 'dro', 'PRIMARY', 1, 'exam_accom_id', 'A', 12, NULL, NULL, '', 'BTREE', ''),
(NULL, 'dro', 'dp_history', 0, 'dro', 'PRIMARY', 1, 'history_id', 'A', 0, NULL, NULL, '', 'BTREE', ''),
(NULL, 'dro', 'dp_intake', 0, 'dro', 'PRIMARY', 1, 'intake_id', 'A', 0, NULL, NULL, '', 'BTREE', ''),
(NULL, 'dro', 'dp_intake_doc_status', 0, 'dro', 'PRIMARY', 1, 'doc_status_id', 'A', 8, NULL, NULL, '', 'BTREE', ''),
(NULL, 'dro', 'dp_limitations', 0, 'dro', 'PRIMARY', 1, 'limitation_id', 'A', 54, NULL, NULL, '', 'BTREE', ''),
(NULL, 'dro', 'dp_log', 0, 'dro', 'PRIMARY', 1, 'log_id', 'A', 0, NULL, NULL, '', 'BTREE', ''),
(NULL, 'dro', 'dp_majors', 0, 'dro', 'PRIMARY', 1, 'id', 'A', 117, NULL, NULL, '', 'BTREE', ''),
(NULL, 'dro', 'dp_purpose', 0, 'dro', 'PRIMARY', 1, 'purpose_id', 'A', 2, NULL, NULL, '', 'BTREE', ''),
(NULL, 'dro', 'dp_services', 0, 'dro', 'PRIMARY', 1, 'service_id', 'A', 11, NULL, NULL, '', 'BTREE', ''),
(NULL, 'dro', 'dp_student', 0, 'dro', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', ''),
(NULL, 'dro', 'group', 0, 'dro', 'PRIMARY', 1, 'group_id', 'A', 3, NULL, NULL, '', 'BTREE', ''),
(NULL, 'dro', 'members', 0, 'dro', 'PRIMARY', 1, 'member_id', 'A', 7, NULL, NULL, '', 'BTREE', ''),
(NULL, 'dro', 'members', 1, 'dro', 'group_id', 1, 'group_id', 'A', 0, NULL, NULL, 'YES', 'BTREE', ''),
(NULL, 'dro', 'messages', 0, 'dro', 'PRIMARY', 1, 'message_id', 'A', 0, NULL, NULL, '', 'BTREE', ''),
(NULL, 'dro', 'tie_class_accoms', 0, 'dro', 'PRIMARY', 1, 'class_accom_id', 'A', NULL, NULL, NULL, '', 'BTREE', ''),
(NULL, 'dro', 'tie_class_accoms', 0, 'dro', 'PRIMARY', 2, 'accommodation_id', 'A', 0, NULL, NULL, '', 'BTREE', ''),
(NULL, 'dro', 'tie_exam_accoms', 0, 'dro', 'PRIMARY', 1, 'exam_accom_id', 'A', NULL, NULL, NULL, '', 'BTREE', ''),
(NULL, 'dro', 'tie_exam_accoms', 0, 'dro', 'PRIMARY', 2, 'accommodation_id', 'A', 0, NULL, NULL, '', 'BTREE', '');

-- --------------------------------------------------------

--
-- Table structure for table `TABLES`
--

CREATE TEMPORARY TABLE `TABLES` (
  `TABLE_CATALOG` varchar(512) DEFAULT NULL,
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `TABLE_TYPE` varchar(64) NOT NULL DEFAULT '',
  `ENGINE` varchar(64) DEFAULT NULL,
  `VERSION` bigint(21) unsigned DEFAULT NULL,
  `ROW_FORMAT` varchar(10) DEFAULT NULL,
  `TABLE_ROWS` bigint(21) unsigned DEFAULT NULL,
  `AVG_ROW_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `DATA_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `MAX_DATA_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `INDEX_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `DATA_FREE` bigint(21) unsigned DEFAULT NULL,
  `AUTO_INCREMENT` bigint(21) unsigned DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `CHECK_TIME` datetime DEFAULT NULL,
  `TABLE_COLLATION` varchar(64) DEFAULT NULL,
  `CHECKSUM` bigint(21) unsigned DEFAULT NULL,
  `CREATE_OPTIONS` varchar(255) DEFAULT NULL,
  `TABLE_COMMENT` varchar(80) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `TABLES`
--

INSERT INTO `TABLES` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `TABLE_TYPE`, `ENGINE`, `VERSION`, `ROW_FORMAT`, `TABLE_ROWS`, `AVG_ROW_LENGTH`, `DATA_LENGTH`, `MAX_DATA_LENGTH`, `INDEX_LENGTH`, `DATA_FREE`, `AUTO_INCREMENT`, `CREATE_TIME`, `UPDATE_TIME`, `CHECK_TIME`, `TABLE_COLLATION`, `CHECKSUM`, `CREATE_OPTIONS`, `TABLE_COMMENT`) VALUES
(NULL, 'information_schema', 'CHARACTER_SETS', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 576, 0, 16661376, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=29127', ''),
(NULL, 'information_schema', 'COLLATIONS', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 423, 0, 16737264, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=39662', ''),
(NULL, 'information_schema', 'COLLATION_CHARACTER_SET_APPLICABILITY', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 387, 0, 16733880, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=43351', ''),
(NULL, 'information_schema', 'COLUMNS', 'SYSTEM VIEW', 'MyISAM', 10, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2012-11-14 13:42:32', '2012-11-14 13:42:32', NULL, 'utf8_general_ci', NULL, 'max_rows=4334', ''),
(NULL, 'information_schema', 'COLUMN_PRIVILEGES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 2565, 0, 16757145, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=6540', ''),
(NULL, 'information_schema', 'ENGINES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 490, 0, 16709000, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=34239', ''),
(NULL, 'information_schema', 'EVENTS', 'SYSTEM VIEW', 'MyISAM', 10, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2012-11-14 13:42:32', '2012-11-14 13:42:32', NULL, 'utf8_general_ci', NULL, 'max_rows=6607', ''),
(NULL, 'information_schema', 'FILES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 2677, 0, 16758020, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=6267', ''),
(NULL, 'information_schema', 'GLOBAL_STATUS', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 61636, 0, 16764992, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=272', ''),
(NULL, 'information_schema', 'GLOBAL_VARIABLES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 61636, 0, 16764992, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=272', ''),
(NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 4637, 0, 16762755, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=3618', ''),
(NULL, 'information_schema', 'PARTITIONS', 'SYSTEM VIEW', 'MyISAM', 10, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2012-11-14 13:42:32', '2012-11-14 13:42:32', NULL, 'utf8_general_ci', NULL, 'max_rows=5612', ''),
(NULL, 'information_schema', 'PLUGINS', 'SYSTEM VIEW', 'MyISAM', 10, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2012-11-14 13:42:32', '2012-11-14 13:42:32', NULL, 'utf8_general_ci', NULL, 'max_rows=13025', ''),
(NULL, 'information_schema', 'PROCESSLIST', 'SYSTEM VIEW', 'MyISAM', 10, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2012-11-14 13:42:32', '2012-11-14 13:42:32', NULL, 'utf8_general_ci', NULL, 'max_rows=23763', ''),
(NULL, 'information_schema', 'PROFILING', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 308, 0, 16562084, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=54471', ''),
(NULL, 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 4814, 0, 16767162, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=3485', ''),
(NULL, 'information_schema', 'ROUTINES', 'SYSTEM VIEW', 'MyISAM', 10, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2012-11-14 13:42:32', '2012-11-14 13:42:32', NULL, 'utf8_general_ci', NULL, 'max_rows=4248', ''),
(NULL, 'information_schema', 'SCHEMATA', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 3656, 0, 16755448, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=4588', ''),
(NULL, 'information_schema', 'SCHEMA_PRIVILEGES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 2179, 0, 16767405, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=7699', ''),
(NULL, 'information_schema', 'SESSION_STATUS', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 61636, 0, 16764992, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=272', ''),
(NULL, 'information_schema', 'SESSION_VARIABLES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 61636, 0, 16764992, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=272', ''),
(NULL, 'information_schema', 'STATISTICS', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 2679, 0, 16770540, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=6262', ''),
(NULL, 'information_schema', 'TABLES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 3641, 0, 16763164, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=4607', ''),
(NULL, 'information_schema', 'TABLE_CONSTRAINTS', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 2504, 0, 16749256, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=6700', ''),
(NULL, 'information_schema', 'TABLE_PRIVILEGES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 2372, 0, 16748692, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=7073', ''),
(NULL, 'information_schema', 'TRIGGERS', 'SYSTEM VIEW', 'MyISAM', 10, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2012-11-14 13:42:32', '2012-11-14 13:42:32', NULL, 'utf8_general_ci', NULL, 'max_rows=3587', ''),
(NULL, 'information_schema', 'USER_PRIVILEGES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 1986, 0, 16759854, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=8447', ''),
(NULL, 'information_schema', 'VIEWS', 'SYSTEM VIEW', 'MyISAM', 10, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2012-11-14 13:42:32', '2012-11-14 13:42:32', NULL, 'utf8_general_ci', NULL, 'max_rows=6932', ''),
(NULL, 'dro', 'dp_accommodations', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 0, 0, 2476, 281474976710655, 2048, 2476, 46, '2012-07-10 21:19:47', '2012-11-14 13:38:35', '2012-08-15 18:10:49', 'latin1_swedish_ci', NULL, '', ''),
(NULL, 'dro', 'dp_class_accommodations', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 21, 44, 928, 281474976710655, 2048, 0, 56, '2012-07-26 19:18:24', '2012-07-26 19:18:24', '2012-08-15 18:10:49', 'latin1_swedish_ci', NULL, '', ''),
(NULL, 'dro', 'dp_colleges', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 7, 46, 328, 281474976710655, 2048, 0, 8, '2012-07-10 21:19:47', '2012-07-10 21:19:47', '2012-08-15 18:10:49', 'latin1_swedish_ci', NULL, '', ''),
(NULL, 'dro', 'dp_configs', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 1, 952, 952, 281474976710655, 2048, 0, 2, '2012-11-08 18:52:08', '2012-11-09 13:41:18', NULL, 'latin1_swedish_ci', NULL, '', ''),
(NULL, 'dro', 'dp_contact', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 0, 0, 148, 281474976710655, 2048, 148, 9, '2012-10-03 18:38:30', '2012-11-14 13:32:41', NULL, 'latin1_swedish_ci', NULL, '', ''),
(NULL, 'dro', 'dp_contact_type', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 2, 24, 48, 281474976710655, 2048, 0, 3, '2012-10-03 18:38:30', '2012-10-05 13:56:23', NULL, 'latin1_swedish_ci', NULL, '', ''),
(NULL, 'dro', 'dp_disabilities', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 21, 22, 464, 281474976710655, 2048, 0, 22, '2012-07-10 21:19:47', '2012-07-10 21:19:47', '2012-08-15 18:10:49', 'latin1_swedish_ci', NULL, '', ''),
(NULL, 'dro', 'dp_exam_accommodations', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 12, 34, 412, 281474976710655, 2048, 0, 13, '2012-07-10 21:19:47', '2012-07-10 21:19:47', '2012-08-15 18:10:49', 'latin1_swedish_ci', NULL, '', ''),
(NULL, 'dro', 'dp_history', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 0, 0, 0, 281474976710655, 1024, 0, 1, '2012-07-26 19:18:24', '2012-07-26 19:18:24', '2012-08-15 18:10:49', 'latin1_swedish_ci', NULL, '', ''),
(NULL, 'dro', 'dp_intake', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 0, 0, 1160, 281474976710655, 2048, 1160, 27, '2012-10-03 18:38:30', '2012-11-14 13:32:41', NULL, 'latin1_swedish_ci', NULL, '', ''),
(NULL, 'dro', 'dp_intake_doc_status', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 8, 46, 368, 281474976710655, 2048, 0, 9, '2012-07-10 21:19:47', '2012-07-10 21:19:47', '2012-08-15 18:10:49', 'latin1_swedish_ci', NULL, '', ''),
(NULL, 'dro', 'dp_limitations', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 54, 36, 2028, 281474976710655, 2048, 84, 57, '2012-07-10 21:19:47', '2012-10-05 14:31:09', '2012-08-15 18:10:49', 'latin1_swedish_ci', NULL, '', ''),
(NULL, 'dro', 'dp_log', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 0, 0, 0, 281474976710655, 1024, 0, 1, '2012-07-26 19:18:24', '2012-07-26 19:18:24', '2012-08-15 18:10:49', 'latin1_swedish_ci', NULL, '', ''),
(NULL, 'dro', 'dp_majors', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 117, 32, 3844, 281474976710655, 4096, 0, 118, '2012-07-10 21:19:47', '2012-07-10 21:19:47', '2012-08-15 18:10:49', 'latin1_swedish_ci', NULL, '', ''),
(NULL, 'dro', 'dp_purpose', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 2, 28, 56, 281474976710655, 2048, 0, 3, '2012-10-03 18:38:30', '2012-10-05 13:57:09', NULL, 'latin1_swedish_ci', NULL, '', ''),
(NULL, 'dro', 'dp_services', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 11, 31, 344, 281474976710655, 2048, 0, NULL, '2012-07-10 21:19:47', '2012-09-12 14:18:27', '2012-08-15 18:10:49', 'latin1_swedish_ci', NULL, '', ''),
(NULL, 'dro', 'dp_student', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 0, 0, 44392, 281474976710655, 4096, 44392, 153, '2012-10-03 18:38:30', '2012-11-14 13:38:35', NULL, 'latin1_swedish_ci', NULL, '', ''),
(NULL, 'dro', 'group', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 3, 33, 100, 281474976710655, 2048, 0, 4, '2012-09-12 13:51:14', '2012-11-08 19:10:19', NULL, 'latin1_swedish_ci', NULL, '', ''),
(NULL, 'dro', 'members', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 7, 71, 632, 281474976710655, 3072, 132, 14, '2012-07-10 21:19:47', '2012-10-05 14:35:43', '2012-08-15 18:10:49', 'latin1_swedish_ci', NULL, '', ''),
(NULL, 'dro', 'messages', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 0, 0, 0, 281474976710655, 1024, 0, 182, '2012-07-10 21:19:47', '2012-11-14 13:30:23', '2012-08-15 18:10:49', 'latin1_swedish_ci', NULL, '', ''),
(NULL, 'dro', 'tie_class_accoms', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 0, 0, 0, 281474976710655, 1024, 0, NULL, '2012-11-08 18:52:08', '2012-11-14 13:40:42', NULL, 'latin1_swedish_ci', NULL, '', ''),
(NULL, 'dro', 'tie_exam_accoms', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 0, 0, 0, 281474976710655, 1024, 0, NULL, '2012-11-08 18:52:08', '2012-11-14 13:40:35', NULL, 'latin1_swedish_ci', NULL, '', ''),
(NULL, 'dro', 'tie_limitation_intake', 'BASE TABLE', 'MyISAM', 10, 'Fixed', 0, 0, 0, 2533274790395903, 1024, 0, NULL, '2012-07-10 21:19:47', '2012-11-14 13:40:23', '2012-08-15 18:10:49', 'latin1_swedish_ci', NULL, '', ''),
(NULL, 'dro', 'tie_service_intake', 'BASE TABLE', 'MyISAM', 10, 'Fixed', 0, 0, 0, 2533274790395903, 1024, 0, NULL, '2012-07-10 21:19:47', '2012-11-14 13:40:10', '2012-08-15 18:10:49', 'latin1_swedish_ci', NULL, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `TABLE_CONSTRAINTS`
--

CREATE TEMPORARY TABLE `TABLE_CONSTRAINTS` (
  `CONSTRAINT_CATALOG` varchar(512) DEFAULT NULL,
  `CONSTRAINT_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `CONSTRAINT_NAME` varchar(64) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `CONSTRAINT_TYPE` varchar(64) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `TABLE_CONSTRAINTS`
--

INSERT INTO `TABLE_CONSTRAINTS` (`CONSTRAINT_CATALOG`, `CONSTRAINT_SCHEMA`, `CONSTRAINT_NAME`, `TABLE_SCHEMA`, `TABLE_NAME`, `CONSTRAINT_TYPE`) VALUES
(NULL, 'dro', 'PRIMARY', 'dro', 'dp_accommodations', 'PRIMARY KEY'),
(NULL, 'dro', 'PRIMARY', 'dro', 'dp_class_accommodations', 'PRIMARY KEY'),
(NULL, 'dro', 'PRIMARY', 'dro', 'dp_colleges', 'PRIMARY KEY'),
(NULL, 'dro', 'PRIMARY', 'dro', 'dp_configs', 'PRIMARY KEY'),
(NULL, 'dro', 'PRIMARY', 'dro', 'dp_contact', 'PRIMARY KEY'),
(NULL, 'dro', 'PRIMARY', 'dro', 'dp_contact_type', 'PRIMARY KEY'),
(NULL, 'dro', 'PRIMARY', 'dro', 'dp_disabilities', 'PRIMARY KEY'),
(NULL, 'dro', 'PRIMARY', 'dro', 'dp_exam_accommodations', 'PRIMARY KEY'),
(NULL, 'dro', 'PRIMARY', 'dro', 'dp_history', 'PRIMARY KEY'),
(NULL, 'dro', 'PRIMARY', 'dro', 'dp_intake', 'PRIMARY KEY'),
(NULL, 'dro', 'PRIMARY', 'dro', 'dp_intake_doc_status', 'PRIMARY KEY'),
(NULL, 'dro', 'PRIMARY', 'dro', 'dp_limitations', 'PRIMARY KEY'),
(NULL, 'dro', 'PRIMARY', 'dro', 'dp_log', 'PRIMARY KEY'),
(NULL, 'dro', 'PRIMARY', 'dro', 'dp_majors', 'PRIMARY KEY'),
(NULL, 'dro', 'PRIMARY', 'dro', 'dp_purpose', 'PRIMARY KEY'),
(NULL, 'dro', 'PRIMARY', 'dro', 'dp_services', 'PRIMARY KEY'),
(NULL, 'dro', 'PRIMARY', 'dro', 'dp_student', 'PRIMARY KEY'),
(NULL, 'dro', 'PRIMARY', 'dro', 'group', 'PRIMARY KEY'),
(NULL, 'dro', 'PRIMARY', 'dro', 'members', 'PRIMARY KEY'),
(NULL, 'dro', 'PRIMARY', 'dro', 'messages', 'PRIMARY KEY'),
(NULL, 'dro', 'PRIMARY', 'dro', 'tie_class_accoms', 'PRIMARY KEY'),
(NULL, 'dro', 'PRIMARY', 'dro', 'tie_exam_accoms', 'PRIMARY KEY');

-- --------------------------------------------------------

--
-- Table structure for table `TABLE_PRIVILEGES`
--

CREATE TEMPORARY TABLE `TABLE_PRIVILEGES` (
  `GRANTEE` varchar(81) NOT NULL DEFAULT '',
  `TABLE_CATALOG` varchar(512) DEFAULT NULL,
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `PRIVILEGE_TYPE` varchar(64) NOT NULL DEFAULT '',
  `IS_GRANTABLE` varchar(3) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `TABLE_PRIVILEGES`
--


-- --------------------------------------------------------

--
-- Table structure for table `TRIGGERS`
--

CREATE TEMPORARY TABLE `TRIGGERS` (
  `TRIGGER_CATALOG` varchar(512) DEFAULT NULL,
  `TRIGGER_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TRIGGER_NAME` varchar(64) NOT NULL DEFAULT '',
  `EVENT_MANIPULATION` varchar(6) NOT NULL DEFAULT '',
  `EVENT_OBJECT_CATALOG` varchar(512) DEFAULT NULL,
  `EVENT_OBJECT_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `EVENT_OBJECT_TABLE` varchar(64) NOT NULL DEFAULT '',
  `ACTION_ORDER` bigint(4) NOT NULL DEFAULT '0',
  `ACTION_CONDITION` longtext,
  `ACTION_STATEMENT` longtext NOT NULL,
  `ACTION_ORIENTATION` varchar(9) NOT NULL DEFAULT '',
  `ACTION_TIMING` varchar(6) NOT NULL DEFAULT '',
  `ACTION_REFERENCE_OLD_TABLE` varchar(64) DEFAULT NULL,
  `ACTION_REFERENCE_NEW_TABLE` varchar(64) DEFAULT NULL,
  `ACTION_REFERENCE_OLD_ROW` varchar(3) NOT NULL DEFAULT '',
  `ACTION_REFERENCE_NEW_ROW` varchar(3) NOT NULL DEFAULT '',
  `CREATED` datetime DEFAULT NULL,
  `SQL_MODE` longtext NOT NULL,
  `DEFINER` longtext NOT NULL,
  `CHARACTER_SET_CLIENT` varchar(32) NOT NULL DEFAULT '',
  `COLLATION_CONNECTION` varchar(32) NOT NULL DEFAULT '',
  `DATABASE_COLLATION` varchar(32) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `TRIGGERS`
--


-- --------------------------------------------------------

--
-- Table structure for table `USER_PRIVILEGES`
--

CREATE TEMPORARY TABLE `USER_PRIVILEGES` (
  `GRANTEE` varchar(81) NOT NULL DEFAULT '',
  `TABLE_CATALOG` varchar(512) DEFAULT NULL,
  `PRIVILEGE_TYPE` varchar(64) NOT NULL DEFAULT '',
  `IS_GRANTABLE` varchar(3) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `USER_PRIVILEGES`
--

INSERT INTO `USER_PRIVILEGES` (`GRANTEE`, `TABLE_CATALOG`, `PRIVILEGE_TYPE`, `IS_GRANTABLE`) VALUES
('''dro''@''localhost''', NULL, 'USAGE', 'NO');

-- --------------------------------------------------------

--
-- Table structure for table `VIEWS`
--

CREATE TEMPORARY TABLE `VIEWS` (
  `TABLE_CATALOG` varchar(512) DEFAULT NULL,
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `VIEW_DEFINITION` longtext NOT NULL,
  `CHECK_OPTION` varchar(8) NOT NULL DEFAULT '',
  `IS_UPDATABLE` varchar(3) NOT NULL DEFAULT '',
  `DEFINER` varchar(77) NOT NULL DEFAULT '',
  `SECURITY_TYPE` varchar(7) NOT NULL DEFAULT '',
  `CHARACTER_SET_CLIENT` varchar(32) NOT NULL DEFAULT '',
  `COLLATION_CONNECTION` varchar(32) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `VIEWS`
--

