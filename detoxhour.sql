-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 20, 2022 at 10:35 AM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `detoxhour`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can view log entry', 1, 'view_logentry'),
(20, 'Can view permission', 2, 'view_permission'),
(21, 'Can view group', 3, 'view_group'),
(22, 'Can view user', 4, 'view_user'),
(23, 'Can view content type', 5, 'view_contenttype'),
(24, 'Can view session', 6, 'view_session');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-01-28 06:43:36'),
(2, 'auth', '0001_initial', '2022-01-28 06:43:36'),
(3, 'admin', '0001_initial', '2022-01-28 06:43:36'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-01-28 06:43:36'),
(5, 'contenttypes', '0002_remove_content_type_name', '2022-01-28 06:43:36'),
(6, 'auth', '0002_alter_permission_name_max_length', '2022-01-28 06:43:36'),
(7, 'auth', '0003_alter_user_email_max_length', '2022-01-28 06:43:36'),
(8, 'auth', '0004_alter_user_username_opts', '2022-01-28 06:43:36'),
(9, 'auth', '0005_alter_user_last_login_null', '2022-01-28 06:43:36'),
(10, 'auth', '0006_require_contenttypes_0002', '2022-01-28 06:43:36'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2022-01-28 06:43:36'),
(12, 'auth', '0008_alter_user_username_max_length', '2022-01-28 06:43:36'),
(13, 'auth', '0009_alter_user_last_name_max_length', '2022-01-28 06:43:36'),
(14, 'sessions', '0001_initial', '2022-01-28 06:43:37'),
(15, 'admin', '0003_logentry_add_action_flag_choices', '2022-02-14 03:31:32'),
(16, 'auth', '0010_alter_group_name_max_length', '2022-02-14 03:31:32'),
(17, 'auth', '0011_update_proxy_permissions', '2022-02-14 03:31:32'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2022-02-14 03:31:32');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0r9hf02celo397z8nb6ropuvop88wutc', 'eyJlbWFpbCI6ImFmc2FsQGdtYWlsLmNvbSJ9:1nLf8Z:ycPn-F_T0zxBxxPWDCEEcTDOI4KNhyV_ExT8Zd7IAcU', '2022-03-06 05:51:59'),
('8g1cntfbrtbq3fdodk0esnntpy8b1aig', 'Njg4YTg3NzE5ZjViN2JiMDNjOTliNWVmYTUyOTEyNGZmY2JhMmZlMjp7ImVtYWlsIjoibWluaUBnbWFpbC5jb20ifQ==', '2022-02-17 03:46:36'),
('98llzfixjwg33ec5vx213n6kx6i3hlce', 'Njg4YTg3NzE5ZjViN2JiMDNjOTliNWVmYTUyOTEyNGZmY2JhMmZlMjp7ImVtYWlsIjoibWluaUBnbWFpbC5jb20ifQ==', '2022-02-12 03:46:41'),
('ljezeldouklrtmm0ykb50cvmrcroodgu', 'eyJlbWFpbCI6ImdhbmRoaUBnbWFpbC5jb20ifQ:1nLSrK:TxmFsY5brl6mxG2nowmfxV-w_H8D76xsvt4D_MP8Ugw', '2022-03-05 16:45:23');

-- --------------------------------------------------------

--
-- Table structure for table `doctorregistration`
--

DROP TABLE IF EXISTS `doctorregistration`;
CREATE TABLE IF NOT EXISTS `doctorregistration` (
  `doctorid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `contact` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `licence` varchar(50) NOT NULL,
  `img` varchar(100) NOT NULL,
  PRIMARY KEY (`doctorid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctorregistration`
--

INSERT INTO `doctorregistration` (`doctorid`, `name`, `address`, `contact`, `email`, `licence`, `img`) VALUES
(1, 'Gandhi Sanjay', '79,Lawrence Road, Amritsar -143001\r\n(Punjab)', '7418529632', 'gandhi@gmail.com', '/media/Licence%201_S9t5T3F.jpg', '/media/dr.-sanjay-gandhi.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tblconsultation`
--

DROP TABLE IF EXISTS `tblconsultation`;
CREATE TABLE IF NOT EXISTS `tblconsultation` (
  `cId` int(11) NOT NULL AUTO_INCREMENT,
  `pemail` varchar(50) NOT NULL,
  `demail` varchar(50) NOT NULL,
  `cdate` date NOT NULL,
  `symptoms` varchar(100) NOT NULL,
  `problems` varchar(500) NOT NULL,
  `history` varchar(100) NOT NULL,
  `status` varchar(50) NOT NULL,
  `rId` int(11) NOT NULL,
  PRIMARY KEY (`cId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbllogin`
--

DROP TABLE IF EXISTS `tbllogin`;
CREATE TABLE IF NOT EXISTS `tbllogin` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `usertype` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbllogin`
--

INSERT INTO `tbllogin` (`username`, `password`, `usertype`, `status`) VALUES
('admin@gmail.com', 'admin123', 'admin', '1'),
('afsal@gmail.com', 'Afsal@123', 'patient', '1'),
('gandhi@gmail.com', 'Gandhi@123', 'doctor', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tblprescription`
--

DROP TABLE IF EXISTS `tblprescription`;
CREATE TABLE IF NOT EXISTS `tblprescription` (
  `presId` int(11) NOT NULL AUTO_INCREMENT,
  `cId` int(11) NOT NULL,
  `pdate` datetime NOT NULL,
  `diagnosis` varchar(100) NOT NULL,
  `prescription` varchar(500) NOT NULL,
  PRIMARY KEY (`presId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblquestion`
--

DROP TABLE IF EXISTS `tblquestion`;
CREATE TABLE IF NOT EXISTS `tblquestion` (
  `qId` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(100) NOT NULL,
  PRIMARY KEY (`qId`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblquestion`
--

INSERT INTO `tblquestion` (`qId`, `question`) VALUES
(1, 'You feel rested'),
(2, 'You feel that too many demands are being made on you'),
(3, 'You are irritable or gouchy'),
(4, 'You have too many things to do'),
(5, 'You feel lonely or isolated'),
(6, 'You find yourself in a situation of conflict'),
(7, 'You feel you are doing things you really like'),
(8, 'You feel tired'),
(9, 'You feel you may not manage to attain  your goals'),
(10, 'You feel calm'),
(11, 'You have too many decisions to make'),
(12, 'You feel frustrated'),
(13, 'You are full of energy'),
(14, 'You feel tense'),
(15, 'Your problems seem to be piling up'),
(16, 'You feel you are in a hurry'),
(17, 'You feel safe and protected'),
(18, 'You have many worries'),
(19, 'You are under pressure from other people'),
(20, 'You feel discouraged'),
(21, 'You enjoy yourself'),
(22, 'You are afraid of the future'),
(23, 'You feel you are doing things because you have to not because you want to'),
(24, 'You feel criticized and judged'),
(25, 'You are lighthearted'),
(26, 'You feel mentally exhausted'),
(27, 'You have trouble relaxing'),
(28, 'You feel loaded down with responsibility'),
(29, 'You have enough time for yourself'),
(30, 'You feel under pressure from deadlines');

-- --------------------------------------------------------

--
-- Table structure for table `tblregistration`
--

DROP TABLE IF EXISTS `tblregistration`;
CREATE TABLE IF NOT EXISTS `tblregistration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `address` varchar(50) NOT NULL,
  `contact` bigint(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblregistration`
--

INSERT INTO `tblregistration` (`id`, `name`, `address`, `contact`, `email`) VALUES
(1, 'Afsal', 'Thacharayil House,Laloor,Elthuruth P.O,680611', 7559066998, 'afsal@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `tblresponsechild`
--

DROP TABLE IF EXISTS `tblresponsechild`;
CREATE TABLE IF NOT EXISTS `tblresponsechild` (
  `rcId` int(11) NOT NULL AUTO_INCREMENT,
  `rId` int(11) NOT NULL,
  `question` varchar(500) NOT NULL,
  `resp` varchar(50) NOT NULL,
  PRIMARY KEY (`rcId`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblresponsechild`
--

INSERT INTO `tblresponsechild` (`rcId`, `rId`, `question`, `resp`) VALUES
(1, 1, 'You feel rested', '3'),
(2, 1, 'You feel that too many demands are being made on you', '3'),
(3, 1, 'You are irritable or gouchy', '4'),
(4, 1, 'You have too many things to do', '2'),
(5, 1, 'You feel lonely or isolated', '3'),
(6, 1, 'You find yourself in a situation of conflict', '1'),
(7, 1, 'You feel you are doing things you really like', '2'),
(8, 1, 'You feel tired', '2'),
(9, 1, 'You feel you may not manage to attain  your goals', '3'),
(10, 1, 'You feel calm', '3'),
(11, 1, 'You have too many decisions to make', '1'),
(12, 1, 'You feel frustrated', '3'),
(13, 1, 'You are full of energy', '1'),
(14, 1, 'You feel tense', '2'),
(15, 1, 'Your problems seem to be piling up', '3'),
(16, 1, 'You feel you are in a hurry', '4'),
(17, 1, 'You feel safe and protected', '3'),
(18, 1, 'You have many worries', '1'),
(19, 1, 'You are under pressure from other people', '2'),
(20, 1, 'You feel discouraged', '3'),
(21, 1, 'You enjoy yourself', '3'),
(22, 1, 'You are afraid of the future', '1'),
(23, 1, 'You feel you are doing things because you have to not because you want to', '3'),
(24, 1, 'You feel criticized and judged', '2'),
(25, 1, 'You are lighthearted', '2'),
(26, 1, 'You feel mentally exhausted', '4'),
(27, 1, 'You have trouble relaxing', '3'),
(28, 1, 'You feel loaded down with responsibility', '2'),
(29, 1, 'You have enough time for yourself', '2'),
(30, 1, 'You feel under pressure from deadlines', '2'),
(31, 2, 'You feel rested', '1'),
(32, 2, 'You feel that too many demands are being made on you', '4'),
(33, 2, 'You are irritable or gouchy', '2'),
(34, 2, 'You have too many things to do', '2'),
(35, 2, 'You feel lonely or isolated', '1'),
(36, 2, 'You find yourself in a situation of conflict', '4'),
(37, 2, 'You feel you are doing things you really like', '1'),
(38, 2, 'You feel tired', '2'),
(39, 2, 'You feel you may not manage to attain  your goals', '4'),
(40, 2, 'You feel calm', '3'),
(41, 2, 'You have too many decisions to make', '4'),
(42, 2, 'You feel frustrated', '1'),
(43, 2, 'You are full of energy', '4'),
(44, 2, 'You feel tense', '3'),
(45, 2, 'Your problems seem to be piling up', '4'),
(46, 2, 'You feel you are in a hurry', '4'),
(47, 2, 'You feel safe and protected', '1'),
(48, 2, 'You have many worries', '4'),
(49, 2, 'You are under pressure from other people', '4'),
(50, 2, 'You feel discouraged', '4'),
(51, 2, 'You enjoy yourself', '1'),
(52, 2, 'You are afraid of the future', '4'),
(53, 2, 'You feel you are doing things because you have to not because you want to', '4'),
(54, 2, 'You feel criticized and judged', '4'),
(55, 2, 'You are lighthearted', '1'),
(56, 2, 'You feel mentally exhausted', '4'),
(57, 2, 'You have trouble relaxing', '4'),
(58, 2, 'You feel loaded down with responsibility', '4'),
(59, 2, 'You have enough time for yourself', '1'),
(60, 2, 'You feel under pressure from deadlines', '4'),
(61, 3, 'You feel rested', '1'),
(62, 3, 'You feel that too many demands are being made on you', '1'),
(63, 3, 'You are irritable or gouchy', '2'),
(64, 3, 'You have too many things to do', '2'),
(65, 3, 'You feel lonely or isolated', '3'),
(66, 3, 'You find yourself in a situation of conflict', '4'),
(67, 3, 'You feel you are doing things you really like', '3'),
(68, 3, 'You feel tired', '1'),
(69, 3, 'You feel you may not manage to attain  your goals', '2'),
(70, 3, 'You feel calm', '4'),
(71, 3, 'You have too many decisions to make', '2'),
(72, 3, 'You feel frustrated', '1'),
(73, 3, 'You are full of energy', '4'),
(74, 3, 'You feel tense', '4'),
(75, 3, 'Your problems seem to be piling up', '1'),
(76, 3, 'You feel you are in a hurry', '1'),
(77, 3, 'You feel safe and protected', '3'),
(78, 3, 'You have many worries', '2'),
(79, 3, 'You are under pressure from other people', '2'),
(80, 3, 'You feel discouraged', '1'),
(81, 3, 'You enjoy yourself', '1'),
(82, 3, 'You are afraid of the future', '3'),
(83, 3, 'You feel you are doing things because you have to not because you want to', '2'),
(84, 3, 'You feel criticized and judged', '2'),
(85, 3, 'You are lighthearted', '2'),
(86, 3, 'You feel mentally exhausted', '2'),
(87, 3, 'You have trouble relaxing', '4'),
(88, 3, 'You feel loaded down with responsibility', '1'),
(89, 3, 'You have enough time for yourself', '1'),
(90, 3, 'You feel under pressure from deadlines', '1'),
(91, 4, 'You feel rested', '1'),
(92, 4, 'You feel that too many demands are being made on you', '4'),
(93, 4, 'You are irritable or gouchy', '4'),
(94, 4, 'You have too many things to do', '4'),
(95, 4, 'You feel lonely or isolated', '4'),
(96, 4, 'You find yourself in a situation of conflict', '4'),
(97, 4, 'You feel you are doing things you really like', '1'),
(98, 4, 'You feel tired', '4'),
(99, 4, 'You feel you may not manage to attain  your goals', '3'),
(100, 4, 'You feel calm', '1'),
(101, 4, 'You have too many decisions to make', '4'),
(102, 4, 'You feel frustrated', '4'),
(103, 4, 'You are full of energy', '1'),
(104, 4, 'You feel tense', '3'),
(105, 4, 'Your problems seem to be piling up', '4'),
(106, 4, 'You feel you are in a hurry', '4'),
(107, 4, 'You feel safe and protected', '1'),
(108, 4, 'You have many worries', '4'),
(109, 4, 'You are under pressure from other people', '4'),
(110, 4, 'You feel discouraged', '4'),
(111, 4, 'You enjoy yourself', '1'),
(112, 4, 'You are afraid of the future', '4'),
(113, 4, 'You feel you are doing things because you have to not because you want to', '1'),
(114, 4, 'You feel criticized and judged', '4'),
(115, 4, 'You are lighthearted', '4'),
(116, 4, 'You feel mentally exhausted', '4'),
(117, 4, 'You have trouble relaxing', '1'),
(118, 4, 'You feel loaded down with responsibility', '4'),
(119, 4, 'You have enough time for yourself', '1'),
(120, 4, 'You feel under pressure from deadlines', '4'),
(121, 5, 'You feel rested', '1'),
(122, 5, 'You feel that too many demands are being made on you', '2'),
(123, 5, 'You are irritable or gouchy', '3'),
(124, 5, 'You have too many things to do', '4'),
(125, 5, 'You feel lonely or isolated', '2'),
(126, 5, 'You find yourself in a situation of conflict', '1'),
(127, 5, 'You feel you are doing things you really like', '3'),
(128, 5, 'You feel tired', '3'),
(129, 5, 'You feel you may not manage to attain  your goals', '1'),
(130, 5, 'You feel calm', '2'),
(131, 5, 'You have too many decisions to make', '4'),
(132, 5, 'You feel frustrated', '4'),
(133, 5, 'You are full of energy', '4'),
(134, 5, 'You feel tense', '1'),
(135, 5, 'Your problems seem to be piling up', '1'),
(136, 5, 'You feel you are in a hurry', '1'),
(137, 5, 'You feel safe and protected', '1'),
(138, 5, 'You have many worries', '1'),
(139, 5, 'You are under pressure from other people', '4'),
(140, 5, 'You feel discouraged', '4'),
(141, 5, 'You enjoy yourself', '1'),
(142, 5, 'You are afraid of the future', '4'),
(143, 5, 'You feel you are doing things because you have to not because you want to', '4'),
(144, 5, 'You feel criticized and judged', '4'),
(145, 5, 'You are lighthearted', '4'),
(146, 5, 'You feel mentally exhausted', '2'),
(147, 5, 'You have trouble relaxing', '2'),
(148, 5, 'You feel loaded down with responsibility', '4'),
(149, 5, 'You have enough time for yourself', '1'),
(150, 5, 'You feel under pressure from deadlines', '4');

-- --------------------------------------------------------

--
-- Table structure for table `tblresponsemaster`
--

DROP TABLE IF EXISTS `tblresponsemaster`;
CREATE TABLE IF NOT EXISTS `tblresponsemaster` (
  `rId` int(11) NOT NULL AUTO_INCREMENT,
  `pemail` varchar(50) NOT NULL,
  `rdate` datetime NOT NULL,
  PRIMARY KEY (`rId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblresult`
--

DROP TABLE IF EXISTS `tblresult`;
CREATE TABLE IF NOT EXISTS `tblresult` (
  `rId` int(11) NOT NULL AUTO_INCREMENT,
  `pemail` varchar(50) NOT NULL,
  `date` datetime NOT NULL,
  `psq` float NOT NULL,
  `result` varchar(50) NOT NULL,
  PRIMARY KEY (`rId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
