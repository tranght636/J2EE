-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: traineemanager
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `chapter`
--

DROP TABLE IF EXISTS `chapter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chapter` (
  `id` int NOT NULL AUTO_INCREMENT,
  `stage_id` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `_index` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_chapter_classes` (`stage_id`),
  CONSTRAINT `fk_chapter_classes` FOREIGN KEY (`stage_id`) REFERENCES `stage` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chapter`
--

LOCK TABLES `chapter` WRITE;
/*!40000 ALTER TABLE `chapter` DISABLE KEYS */;
INSERT INTO `chapter` VALUES (1,1,'Chapter 1',NULL,1,NULL,NULL,NULL,NULL,'Query'),(2,3,'Chapter 2',NULL,1,NULL,'2020-06-19 11:59:22',NULL,4,'Excute2'),(3,1,'Chapter 3',NULL,1,NULL,NULL,NULL,NULL,'Performence'),(4,2,'Chapter 2',NULL,1,'2020-06-19 04:53:58','2020-06-19 12:10:42',4,4,'Nâng cao 2'),(5,5,'git2',NULL,-1,'2020-06-19 04:54:38','2020-06-19 12:56:07',4,4,'git nâng cao'),(6,2,'',NULL,1,'2020-06-19 04:55:30','2020-06-19 12:10:45',4,4,''),(7,1,'',NULL,1,'2020-06-19 04:55:33','2020-06-19 04:55:33',4,4,''),(8,4,'',NULL,1,'2020-06-19 04:56:46','2020-06-19 04:56:46',4,4,''),(9,1,'16521128',NULL,1,'2020-06-19 05:22:43','2020-06-19 05:22:43',4,4,'Nâng cao'),(10,2,'Chapter1 + Chapter2',NULL,1,'2020-06-19 05:30:13','2020-06-19 12:00:40',4,4,'trang');
/*!40000 ALTER TABLE `chapter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `course_id` int DEFAULT NULL,
  `is_done` bit(1) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_classes_courses` (`course_id`),
  CONSTRAINT `fk_classes_courses` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (1,'JWAT001',8,_binary '',1,NULL,NULL,NULL,NULL),(3,'JWAT02',8,_binary '\0',1,NULL,NULL,NULL,NULL),(4,'JWAT03',8,_binary '\0',-1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8_bin,
  `reply_to` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comments_notifications` (`reply_to`),
  CONSTRAINT `fk_comments_notifications` FOREIGN KEY (`reply_to`) REFERENCES `notifications` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_bin,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `description` text COLLATE utf8_bin,
  `note` text COLLATE utf8_bin,
  `status` int DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (3,'JWAT05','2020-05-31 17:00:00','2020-06-29 17:00:00','java web application trainning','abc',-1,'2020-06-11 05:23:56','2020-06-16 13:51:02',4,4),(7,'JWAT06','2020-05-31 17:00:00','2020-06-29 17:00:00','duy bui','aij',-1,'2020-06-11 07:01:25','2020-06-16 13:51:05',4,4),(8,'JWAT09','2020-06-01 17:00:00','2020-06-09 17:00:00','java web application trainning','b',1,'2020-06-11 07:01:49','2020-06-19 09:28:31',4,4),(9,'JWAT02','2020-06-17 17:00:00','2020-06-18 17:00:00','Training java','web trainee',1,'2020-06-18 05:47:12','2020-06-18 05:48:46',4,4),(10,'JWAT01','2020-06-17 17:00:00','2020-07-11 17:00:00','Training SQL','Training SQL',1,'2020-06-18 07:57:36','2020-06-18 07:58:02',4,4),(11,'android1','2020-05-31 17:00:00','2020-06-11 17:00:00','Training android','abc',-1,'2020-06-18 17:14:16','2020-06-19 06:08:39',4,4);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deadline`
--

DROP TABLE IF EXISTS `deadline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deadline` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `content` text COLLATE utf8_bin,
  `to_classes` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `due_date` timestamp NULL DEFAULT NULL,
  `is_register` bit(1) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `week_in_year` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deadline`
--

LOCK TABLES `deadline` WRITE;
/*!40000 ALTER TABLE `deadline` DISABLE KEYS */;
INSERT INTO `deadline` VALUES (1,'Đăng ký lịch học 2020-W25','<p><br />\nC&aacute;c bạn đăng k&yacute; lịch học cho tuần 2020-W25<br />\nLink đăng k&yacute;: <a href=\"/web/dangkylichhoc?action=dang-ky-lich-hoc&amp;id=2020-W25\"> Đăng k&yacute; lịch học tuần 2020-W25</a></p>\n','Tất cả','2020-06-19 00:00:00',_binary '',1,'2020-06-19 02:50:58','2020-06-19 02:50:58',4,4,'2020-W25'),(2,'Đăng ký lịch học 2020-W25','<p><br />\nC&aacute;c bạn đăng k&yacute; lịch học cho tuần 2020-W25<br />\nLink đăng k&yacute;: <a href=\"/web/dangkylichhoc?action=dang-ky-lich-hoc&amp;id=2020-W25\"> Đăng k&yacute; lịch học tuần 2020-W25</a></p>\n','Tất cả','2020-06-19 00:00:00',_binary '',1,'2020-06-19 02:51:23','2020-06-19 02:51:23',4,4,'2020-W25'),(3,'Đăng ký lịch học 2020-W25','<p><br />\nC&aacute;c bạn đăng k&yacute; lịch học cho tuần 2020-W25<br />\nLink đăng k&yacute;: <a href=\"/web/dangkylichhoc?action=dang-ky-lich-hoc&amp;id=2020-W25\"> Đăng k&yacute; lịch học tuần 2020-W25</a></p>\n','Tất cả','2020-06-20 00:00:00',_binary '',1,'2020-06-19 18:22:07','2020-06-19 18:22:07',4,4,'2020-W25'),(4,'Bài tập thực hành','<p>C&aacute;c bạn l&agrave;m demo Spring Framework</p>\n','Tất cả','2020-06-20 00:00:00',_binary '\0',1,'2020-06-19 20:26:48','2020-06-19 20:26:48',4,4,'');
/*!40000 ALTER TABLE `deadline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson`
--

DROP TABLE IF EXISTS `lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lesson` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `stage_id` int DEFAULT NULL,
  `num_of_student` int DEFAULT NULL,
  `room_id` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_lesson_stage` (`stage_id`),
  KEY `fk_lesson_room` (`room_id`),
  CONSTRAINT `fk_lesson_room` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`),
  CONSTRAINT `fk_lesson_stage` FOREIGN KEY (`stage_id`) REFERENCES `stage` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson`
--

LOCK TABLES `lesson` WRITE;
/*!40000 ALTER TABLE `lesson` DISABLE KEYS */;
INSERT INTO `lesson` VALUES (1,'chapter1 + 1/2 chapter2',4,14,1,1,NULL,'2020-06-19 12:49:14',NULL,4),(2,'Chapter1 + Chapter2',2,15,1,1,'2020-06-19 05:32:51','2020-06-19 05:32:51',4,4),(3,'mtos',12,3,1,1,'2020-06-19 05:33:22','2020-06-19 05:33:22',4,4),(4,'',1,0,1,-1,'2020-06-19 05:37:48','2020-06-19 12:55:50',4,4),(5,'Chapter1 + Chapter2',2,20,NULL,1,'2020-06-19 12:49:34','2020-06-19 12:49:34',4,4),(6,'abc',1,20,NULL,1,'2020-06-19 12:56:29','2020-06-19 12:56:29',4,4);
/*!40000 ALTER TABLE `lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_schedules`
--

DROP TABLE IF EXISTS `main_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_schedules` (
  `id` int NOT NULL AUTO_INCREMENT,
  `room_id` int DEFAULT NULL,
  `lesson_id` int DEFAULT NULL,
  `trainer_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `week_in_year` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `day` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `note` text COLLATE utf8_bin,
  `status` int DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_main_schedules_rooms` (`room_id`),
  KEY `fk_main_schedules_lesson` (`lesson_id`),
  CONSTRAINT `fk_main_schedules_lesson` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`id`),
  CONSTRAINT `fk_main_schedules_rooms` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_schedules`
--

LOCK TABLES `main_schedules` WRITE;
/*!40000 ALTER TABLE `main_schedules` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_bin,
  `content` text COLLATE utf8_bin,
  `to_classes` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `status` int DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,'Tuần sau trainer bận, được nghỉ','<p style=\"text-align:center\"><span style=\"color:#c0392b\"><strong>abcn</strong></span></p>\n\n<p style=\"text-align:center\"><strong><span style=\"color:#e74c3c\">zya</span></strong></p>\n',NULL,-1,'2020-05-28 02:52:38','2020-06-18 16:15:36',NULL,4),(2,'abc','<p><strong>abc</strong></p>\n',NULL,-1,'2020-06-10 15:18:22','2020-06-18 16:11:19',NULL,4),(3,'Thông báo tất cả các lớp nghỉ ngày 2020-06-18 tới ngày 2020-06-26','<p>Th&ocirc;ng b&aacute;o tất cả c&aacute;c lớp nghỉ từ ng&agrave;y 2020-06-18 tới ng&agrave;y 2020-06-26</p>\n',NULL,-1,'2020-06-18 16:07:44','2020-06-18 16:08:08',4,4),(4,'Thông báo tất cả các lớp nghỉ ngày 2020-06-18 tới ngày 2020-06-25','<p>Th&ocirc;ng b&aacute;o tất cả c&aacute;c lớp nghỉ từ ng&agrave;y 2020-06-18 tới ng&agrave;y 2020-06-26</p>\n','Tất cả',-1,'2020-06-18 16:07:44','2020-06-18 16:08:24',4,4),(5,'Thông báo tất cả các lớp nghỉ ngày 2020-06-20','<p>Th&ocirc;ng b&aacute;o tất cả c&aacute;c lớp nghỉ ng&agrave;y 2020-06-18</p>\n','Tất cả',1,'2020-06-18 16:15:45','2020-06-18 16:15:55',4,4),(6,'abc','<p>abc</p>\n','Tất cả',1,'2020-06-18 17:15:13','2020-06-18 17:15:13',4,4),(7,'Thông báo về việc thu học phí đối với sinh viên hệ đại học chính quy từ học kỳ I năm học 2020-2021','<p>&nbsp;Ch&agrave;o c&aacute;c bạn sinh vi&ecirc;n</p>\n\n<p>&nbsp; &nbsp;Căn cứ quyết định số 116/QĐ-ĐHCNTT ng&agrave;y 17-3-2020, từ học kỳ 1 năm học 2020 &ndash; 2021, Trường Đại học CNTT &aacute;p dụng quy tr&igrave;nh thu học ph&iacute; (HP) mới đối với sinh vi&ecirc;n hệ ch&iacute;nh quy (SV). Ph&ograve;ng Đ&agrave;o tạo Đại học (P.ĐTĐH) th&ocirc;ng b&aacute;o để SV theo d&otilde;i v&agrave; thực hiện như sau:</p>\n\n<p>1) Đầu học kỳ, P.ĐTĐH th&ocirc;ng b&aacute;o c&aacute;c thời điểm bắt đầu đăng k&yacute; học phần (ĐKHP) đợt 1, kết th&uacute;c ĐKHP đợt 2, kết th&uacute;c ĐKHP đợt 3 (d&agrave;nh cho c&aacute;c trường hợp hiệu chỉnh ĐKHP c&oacute; l&yacute; do đặc biệt) v&agrave; thời điểm thi cuối kỳ. Đ&acirc;y l&agrave; 4 thời điểm quan trọng m&agrave; SV cần ch&uacute; &yacute;.</p>\n\n<p>2) Mỗi học kỳ, SV đ&oacute;ng HP theo 2 đợt:&nbsp;<strong><em>đợt 1</em></strong>&nbsp;đ&oacute;ng HP học kỳ hoặc HP gia hạn (theo quy chế đ&agrave;o tạo, SV c&ograve;n trong thời gian học theo thiết kế chương tr&igrave;nh đ&agrave;o tạo phải đ&oacute;ng HP học kỳ, SV đ&atilde; qu&aacute; thời gian học theo thiết kế chương tr&igrave;nh đ&agrave;o tạo phải đ&oacute;ng HP gia hạn);&nbsp;<strong><em>đợt 2</em></strong>&nbsp;đ&oacute;ng HP c&ograve;n lại (HP học lại, cải thiện, hoặc phần ch&ecirc;nh lệch do điều chỉnh HP nếu c&oacute;).</p>\n\n<p><strong><em>Lưu &yacute;</em></strong>: SV chỉ đăng k&yacute; c&aacute;c m&ocirc;n trả nợ, cải thiện vẫn phải đ&oacute;ng HP học kỳ (nếu chưa đủ số học kỳ quy định) hoặc HP gia hạn. SV đ&atilde; ho&agrave;n th&agrave;nh chương tr&igrave;nh đ&agrave;o tạo nhưng c&ograve;n nợ chứng chỉ GDQP&amp;AN, ngoại ngữ phải đ&oacute;ng HP gia hạn.</p>\n\n<p>3) Ph&ograve;ng Kế hoạch-T&agrave;i ch&iacute;nh (P.KHTC) th&ocirc;ng b&aacute;o thu HP &iacute;t nhất 15 ng&agrave;y trước thời điểm ĐKHP đợt 1. Việc th&ocirc;ng b&aacute;o v&agrave; x&eacute;t cho SV gia hạn HP / miễn giảm HP của Ph&ograve;ng C&ocirc;ng t&aacute;c Sinh vi&ecirc;n (P.CTSV) cũng bắt đầu từ thời điểm n&agrave;y.</p>\n\n<p>4) 02 ng&agrave;y sau khi kết th&uacute;c thu HP đợt 1 th&igrave; P.ĐTĐH thực hiện hủy to&agrave;n bộ ĐKHP đối với c&aacute;c SV nợ HP kh&ocirc;ng thuộc diện được gia hạn HP. Đồng thời P.KHTC tiến h&agrave;nh thu HP đợt 2.</p>\n\n<p>5) 15 ng&agrave;y trước thời điểm bắt đầu thi cuối học kỳ, P.CTSV kết th&uacute;c việc x&eacute;t gia hạn HP / miễn giảm HP. Đồng thời P.KHTC kết th&uacute;c thu HP đợt 2.</p>\n\n<p>6) 10 ng&agrave;y trước thời điểm bắt đầu thi cuối học kỳ, P.ĐTĐH th&ocirc;ng b&aacute;o danh s&aacute;ch SV bị cấm thi cuối kỳ v&agrave; tiến h&agrave;nh x&oacute;a t&ecirc;n SV bị cấm thi cuối kỳ khỏi danh s&aacute;ch thi.</p>\n\n<p>&nbsp; &nbsp; Tất cả c&aacute;c trường hợp SV đ&oacute;ng HP trễ hoặc sau thời điểm kết th&uacute;c thu HP c&aacute;c đợt đều kh&ocirc;ng được cứu x&eacute;t. HP đ&atilde; đ&oacute;ng v&agrave;o t&agrave;i khoản của trường sau thời gian quy định sẽ được trường giữ lại v&agrave; cấn trừ cho HP học kỳ tiếp theo. SV kh&ocirc;ng đ&oacute;ng HP đợt 2 hoặc đ&oacute;ng HP sau thời điểm kết th&uacute;c thu HP đợt 2 th&igrave; c&aacute;c m&ocirc;n học lại, cải thiện được g&aacute;n điểm thi cuối kỳ bằng 0 v&agrave; điểm tổng kết m&ocirc;n học cũng bằng 0.&nbsp;&nbsp;&nbsp;&nbsp;</p>\n\n<p>Đề nghị tất cả c&aacute;c SV nghi&ecirc;n cứu th&ocirc;ng b&aacute;o v&agrave; thực hiện.</p>\n\n<p>C&aacute;c file đ&iacute;nh k&egrave;m:&nbsp;</p>\n\n<p><img alt=\"Tập tin\" src=\"https://daa.uit.edu.vn/modules/file/icons/x-office-document.png\" title=\"application/vnd.openxmlformats-officedocument.wordprocessingml.document\" />&nbsp;<a href=\"https://daa.uit.edu.vn/sites/daa/files/202006/02-tb-dtdh-thong_bao_thu_hoc_phi_doi_voi_sv_cq.docx\" type=\"application/vnd.openxmlformats-officedocument.wordprocessingml.document; length=30576\">02-tb-dtdh-thong_bao_thu_hoc_phi_doi_voi_sv_cq.docx</a></p>\n','Tất cả',1,'2020-06-20 02:18:33','2020-06-20 02:18:33',18,18);
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `process`
--

DROP TABLE IF EXISTS `process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `process` (
  `user_id` int NOT NULL,
  `lesson_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`lesson_id`),
  KEY `fk_process_lesson` (`lesson_id`),
  CONSTRAINT `fk_process_lesson` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`id`),
  CONSTRAINT `fk_process_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process`
--

LOCK TABLES `process` WRITE;
/*!40000 ALTER TABLE `process` DISABLE KEYS */;
/*!40000 ALTER TABLE `process` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reset_password`
--

DROP TABLE IF EXISTS `reset_password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reset_password` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `token` text COLLATE utf8_bin,
  `status` int DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reset_password`
--

LOCK TABLES `reset_password` WRITE;
/*!40000 ALTER TABLE `reset_password` DISABLE KEYS */;
/*!40000 ALTER TABLE `reset_password` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `code` varchar(255) COLLATE utf8_bin NOT NULL,
  `status` int DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'quan-tri','admin',NULL,NULL,NULL,NULL,NULL),(2,'user','user',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_bin,
  `maximum_seat` int DEFAULT NULL,
  `description` text COLLATE utf8_bin,
  `note` text COLLATE utf8_bin,
  `status` int DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (1,'7A',10,NULL,NULL,1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stage`
--

DROP TABLE IF EXISTS `stage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stage` (
  `id` int NOT NULL AUTO_INCREMENT,
  `courses_id` int DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `description` text COLLATE utf8_bin,
  `note` text COLLATE utf8_bin,
  `_index` int DEFAULT NULL,
  `num_of_lesson` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stage_courses` (`courses_id`),
  CONSTRAINT `fk_stage_courses` FOREIGN KEY (`courses_id`) REFERENCES `courses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stage`
--

LOCK TABLES `stage` WRITE;
/*!40000 ALTER TABLE `stage` DISABLE KEYS */;
INSERT INTO `stage` VALUES (1,8,'SQL','Training about basic SQL','ghiafi',NULL,NULL,1,'2020-06-16 16:09:21','2020-06-19 12:56:44',4,4),(2,8,'SQL2','Training about basic SQL','abc',NULL,NULL,1,'2020-06-16 16:12:44','2020-06-19 12:49:42',4,4),(3,8,'Java','Training java','abc',NULL,NULL,1,'2020-06-17 15:54:20','2020-06-19 10:34:57',4,4),(4,8,'web','spring framework','web trainee',NULL,NULL,1,'2020-06-18 05:43:42','2020-06-19 11:22:55',4,4),(5,8,'git','git','git',NULL,NULL,1,'2020-06-18 05:45:33','2020-06-19 10:08:28',4,4),(6,8,'abc','abc','abc',NULL,NULL,1,'2020-06-18 05:46:16','2020-06-18 05:46:16',4,4),(7,9,'WEB','ABC','XYZ',NULL,NULL,1,'2020-06-18 05:47:39','2020-06-18 05:47:39',4,4),(8,9,'ABC','BC','DDE',NULL,NULL,1,'2020-06-18 05:47:49','2020-06-18 05:47:49',4,4),(9,9,'WEB','ABC','XYZ',NULL,NULL,1,'2020-06-18 05:48:03','2020-06-18 05:48:03',4,4),(10,10,'SQL','SQL basic','dễ òm',NULL,NULL,1,'2020-06-18 07:58:47','2020-06-18 07:58:47',4,4),(11,11,'Giai đoạn frontend','frontend','abc',NULL,NULL,1,'2020-06-18 17:14:47','2020-06-18 17:14:47',4,4),(12,8,'onjob','onjob','onjob',NULL,NULL,1,'2020-06-19 05:13:35','2020-06-19 05:13:35',4,4),(13,8,'SQL3','SQL3','SQL3',NULL,NULL,1,'2020-06-19 09:44:32','2020-06-19 09:44:32',4,4);
/*!40000 ALTER TABLE `stage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_do_homework`
--

DROP TABLE IF EXISTS `user_do_homework`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_do_homework` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `deadline_id` int DEFAULT NULL,
  `is_register` bit(1) DEFAULT NULL,
  `url_homework` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `status` int DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_do_homework_users` (`user_id`),
  KEY `fk_user_do_homework_deadline` (`deadline_id`),
  CONSTRAINT `fk_user_do_homework_deadline` FOREIGN KEY (`deadline_id`) REFERENCES `deadline` (`id`),
  CONSTRAINT `fk_user_do_homework_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_do_homework`
--

LOCK TABLES `user_do_homework` WRITE;
/*!40000 ALTER TABLE `user_do_homework` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_do_homework` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_in_class`
--

DROP TABLE IF EXISTS `user_in_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_in_class` (
  `class_id` int NOT NULL,
  `user_id` int NOT NULL,
  `status` int DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  PRIMARY KEY (`class_id`,`user_id`),
  KEY `fk_user_in_class_users` (`user_id`),
  CONSTRAINT `fk_user_in_class_classes` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  CONSTRAINT `fk_user_in_class_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_in_class`
--

LOCK TABLES `user_in_class` WRITE;
/*!40000 ALTER TABLE `user_in_class` DISABLE KEYS */;
INSERT INTO `user_in_class` VALUES (1,3,1,NULL,NULL,NULL,NULL),(1,4,1,NULL,NULL,NULL,NULL),(1,18,1,NULL,NULL,NULL,NULL),(1,19,1,NULL,NULL,NULL,NULL),(1,21,1,NULL,NULL,NULL,NULL),(1,22,1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user_in_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_register_schedule`
--

DROP TABLE IF EXISTS `user_register_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_register_schedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `deadline_id` int DEFAULT NULL,
  `week_in_year` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `schedule` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `status` int DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_register_schedule_users` (`user_id`),
  KEY `fk_user_register_schedule_deadline` (`deadline_id`),
  CONSTRAINT `fk_user_register_schedule_deadline` FOREIGN KEY (`deadline_id`) REFERENCES `deadline` (`id`),
  CONSTRAINT `fk_user_register_schedule_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_register_schedule`
--

LOCK TABLES `user_register_schedule` WRITE;
/*!40000 ALTER TABLE `user_register_schedule` DISABLE KEYS */;
INSERT INTO `user_register_schedule` VALUES (1,18,1,'2020-W25','S2-C2-S3-C3-S4-C4-S5-C5-S6-C6-S7-C7-S8-C8',1,'2020-06-19 19:58:14','2020-06-19 19:58:14',18,18),(2,18,1,'2020-W25','S2-C2-S3-C3-S4-C4-S5-C5-S6-S8-C8',1,'2020-06-19 20:32:47','2020-06-19 20:32:47',18,18),(3,18,3,'2020-W25','S4',1,'2020-06-20 03:50:32','2020-06-20 03:50:32',18,18);
/*!40000 ALTER TABLE `user_register_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_seen_notification`
--

DROP TABLE IF EXISTS `user_seen_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_seen_notification` (
  `notification_id` int NOT NULL,
  `user_id` int NOT NULL,
  `seen_status` bit(1) DEFAULT NULL,
  `seen_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`notification_id`,`user_id`),
  KEY `fk_user_seen_notification_users` (`user_id`),
  CONSTRAINT `fk_user_seen_notification_notifications` FOREIGN KEY (`notification_id`) REFERENCES `notifications` (`id`),
  CONSTRAINT `fk_user_seen_notification_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_seen_notification`
--

LOCK TABLES `user_seen_notification` WRITE;
/*!40000 ALTER TABLE `user_seen_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_seen_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) COLLATE utf8_bin NOT NULL,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8_bin NOT NULL,
  `phone_number` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `address` text COLLATE utf8_bin,
  `dob` timestamp NULL DEFAULT NULL,
  `university` text COLLATE utf8_bin,
  `role_id` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `deactived_at` timestamp NULL DEFAULT NULL,
  `class_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_user_role` (`role_id`),
  CONSTRAINT `fk_user_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (3,'duybui@gmail.com','Bùi Tấn Duy','123','0777933595','q.12','1998-02-10 17:00:00','uit',1,1,NULL,NULL,NULL,NULL,NULL,1),(4,'nvt@gmail.com','Nguyễn Vũ Thanh','456','0777933595','40b','1998-02-02 17:00:00','cntt',1,1,NULL,NULL,NULL,NULL,NULL,1),(18,'vuthanh3298@gmail.com','Vũ Thanh','123','0777933595','ktx','1998-02-02 17:00:00','uit',2,1,NULL,NULL,NULL,NULL,NULL,1),(19,'uit@gmail.com','thanh','123','0777933595','40b, An Dương Vương','2020-06-18 17:00:00','cntt',2,-1,NULL,NULL,NULL,NULL,NULL,1),(21,'nguyenvuthanh3298@gmail.com','Tấn Duy','123','0777933595','40b, An Dương Vương',NULL,'cntt',2,1,NULL,NULL,NULL,NULL,NULL,1),(22,'nvt2@gmail.com','Hoàng Phúc','123','0777933595','40b, An Dương Vương',NULL,'cntt',2,1,NULL,NULL,NULL,NULL,NULL,1),(24,'duy@gmail.com','duy','123','0777933595','quận 12','2020-05-31 17:00:00','uit',2,0,NULL,NULL,NULL,NULL,NULL,1),(25,'Phuc@gmail.com','Phúc','123','0123456579','ktx','2020-06-19 17:00:00','uit',2,1,NULL,NULL,NULL,NULL,NULL,NULL);
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

-- Dump completed on 2020-07-27 19:20:59
