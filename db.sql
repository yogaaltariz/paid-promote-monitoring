-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.30-0ubuntu0.18.04.1 - (Ubuntu)
-- Server OS:                    Linux
-- HeidiSQL Version:             10.3.0.5771
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table infest.klik_postmeta
CREATE TABLE IF NOT EXISTS `klik_postmeta` (
  `meta_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) NOT NULL,
  `meta_value` longtext NOT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `FK_klik_postmeta_klik_posts` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin2;

-- Dumping data for table infest.klik_postmeta: ~0 rows (approximately)
/*!40000 ALTER TABLE `klik_postmeta` DISABLE KEYS */;
INSERT INTO `klik_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
	(1, 17, 'banner_attachment', 'uploads/2020/02/circle-cropped5.png');
/*!40000 ALTER TABLE `klik_postmeta` ENABLE KEYS */;

-- Dumping structure for table infest.klik_posts
CREATE TABLE IF NOT EXISTS `klik_posts` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `author` bigint(20) DEFAULT NULL,
  `content` text NOT NULL,
  `title` text NOT NULL,
  `excerpt` text,
  `status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'closed',
  `slug` text NOT NULL,
  `guid` text,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` bigint(20) NOT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) DEFAULT NULL,
  `post_parent` bigint(20) NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `mime_type` varchar(100) DEFAULT NULL,
  `menu_order` smallint(3) DEFAULT '0',
  `deleted_on` datetime DEFAULT NULL,
  `comments` int(5) DEFAULT '0',
  `viewer` int(6) DEFAULT '0',
  `like` int(6) DEFAULT '0',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin2;

-- Dumping data for table infest.klik_posts: ~8 rows (approximately)
/*!40000 ALTER TABLE `klik_posts` DISABLE KEYS */;
INSERT INTO `klik_posts` (`post_id`, `author`, `content`, `title`, `excerpt`, `status`, `comment_status`, `slug`, `guid`, `created_on`, `created_by`, `modified_on`, `modified_by`, `post_parent`, `post_type`, `mime_type`, `menu_order`, `deleted_on`, `comments`, `viewer`, `like`) VALUES
	(1, NULL, '', 'Academy', NULL, 'publish', 'closed', 'academy', '#', '2020-02-14 18:00:29', 0, NULL, NULL, 0, 'menu', NULL, 1, NULL, 0, 0, 0),
	(4, NULL, '', 'COINS', NULL, 'publish', 'closed', 'coins', '#', '2020-02-14 17:48:54', 0, NULL, NULL, 2, 'menu', NULL, 1, NULL, 0, 0, 0),
	(8, NULL, '', 'Web Development Academy', NULL, 'publish', 'closed', 'web-development-academy', 'http://localhost/infest/index.php/academy/web-development-academy', '2020-02-14 18:00:31', 0, NULL, NULL, 1, 'menu', NULL, 0, NULL, 0, 0, 0),
	(11, NULL, '', 'Web Development Academy', NULL, 'publish', 'closed', 'web-development-academy', 'http://localhost/infest/index.php/academy/web-development-academy', '2020-02-14 17:49:27', 0, NULL, NULL, 4, 'menu', NULL, 4, NULL, 0, 0, 0),
	(12, NULL, '', 'Home', NULL, 'publish', 'closed', 'home', '/', '2020-02-14 18:00:29', 0, NULL, NULL, 0, 'menu', NULL, 0, NULL, 0, 0, 0),
	(13, NULL, '', 'Competition', NULL, 'publish', 'closed', 'competition', '#', '2020-02-14 18:00:31', 0, NULL, NULL, 0, 'menu', NULL, 2, NULL, 0, 0, 0),
	(14, NULL, '', 'Main Events', NULL, 'publish', 'closed', 'main-events', '#', '2020-02-14 18:00:42', 0, NULL, NULL, 0, 'menu', NULL, 5, NULL, 0, 0, 0),
	(15, NULL, '', 'About', NULL, 'publish', 'closed', 'about', '#', '2020-02-14 18:00:50', 0, NULL, NULL, 0, 'menu', NULL, 6, NULL, 0, 0, 0),
	(16, NULL, '', 'Computer Olympic of Infest (COINS)', NULL, 'publish', 'closed', 'computer-olympic-of-infest-coins', '#', '2020-02-14 18:01:17', 0, NULL, NULL, 13, 'menu', NULL, 7, NULL, 0, 0, 0),
	(17, NULL, '#', 'Highcharts Demo', NULL, 'publish', 'closed', '', NULL, '2020-02-16 21:55:09', 0, '2020-02-16 21:55:09', NULL, 1, 'banner', 'image/png', 0, NULL, 0, 0, 0);
/*!40000 ALTER TABLE `klik_posts` ENABLE KEYS */;

-- Dumping structure for table infest.klik_settings
CREATE TABLE IF NOT EXISTS `klik_settings` (
  `setting_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `setting_name` varchar(225) NOT NULL,
  `setting_value` text NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin2;

-- Dumping data for table infest.klik_settings: ~4 rows (approximately)
/*!40000 ALTER TABLE `klik_settings` DISABLE KEYS */;
INSERT INTO `klik_settings` (`setting_id`, `setting_name`, `setting_value`) VALUES
	(32, 'site_name', 'INFEST 6.0'),
	(33, 'site_instagram', 'https://www.instagram.com/infest_unsyiah/'),
	(34, 'site_email', ''),
	(35, 'site_youtube', '#'),
	(36, 'site_logo', 'uploads/2020/02/circle-cropped_(2).png');
/*!40000 ALTER TABLE `klik_settings` ENABLE KEYS */;

-- Dumping structure for table infest.klik_users
CREATE TABLE IF NOT EXISTS `klik_users` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(70) NOT NULL,
  `password` varchar(60) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `token` varchar(50) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `level` tinyint(4) DEFAULT NULL,
  `avatar` varchar(300) NOT NULL,
  `description` varchar(400) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin2;

-- Dumping data for table infest.klik_users: ~3 rows (approximately)
/*!40000 ALTER TABLE `klik_users` DISABLE KEYS */;
INSERT INTO `klik_users` (`user_id`, `username`, `password`, `fullname`, `email`, `token`, `last_login`, `level`, `avatar`, `description`) VALUES
	(1, 'yogaaltariz', '$2y$10$Ui5q24aFq5nSUWnrV7bupuIfdOHwYGRP9wwICib5YyRqCHh4qs0XC', 'Yoga Altariz', 'yoga.altariz@gmail.com', NULL, NULL, 0, 'uploads/2020/02/circle-cropped2.png', ''),
	(4, 'hilalmubarak', '$2y$10$979Q8DOigOhm.9r/228Bf.Sn5bZMcJ7XVHDZ8.vRTzqXB8gGEmhmy', 'Hilal Mantap jiwa', 'hilal@gmail.com', NULL, NULL, NULL, '', '');
/*!40000 ALTER TABLE `klik_users` ENABLE KEYS */;

-- Dumping structure for table infest.pp_absent
CREATE TABLE IF NOT EXISTS `pp_absent` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(100) NOT NULL,
  `hastag` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table infest.pp_absent: ~114 rows (approximately)
/*!40000 ALTER TABLE `pp_absent` DISABLE KEYS */;
INSERT INTO `pp_absent` (`id`, `user_id`, `hastag`) VALUES
	(15, '2208149602', 'paidpromoteinfest3'),
	(16, '2659004940', 'paidpromoteinfest3'),
	(17, '1382882078', 'paidpromoteinfest3'),
	(18, '5655084151', 'paidpromoteinfest3'),
	(19, '1973903009', 'paidpromoteinfest3'),
	(20, '3025207077', 'paidpromoteinfest3'),
	(21, '2400764754', 'paidpromoteinfest3'),
	(22, '5725179875', 'paidpromoteinfest3'),
	(23, '1338206706', 'paidpromoteinfest3'),
	(24, '4596952376', 'paidpromoteinfest3'),
	(25, '7730510561', 'paidpromoteinfest3'),
	(26, '2219128338', 'paidpromoteinfest3'),
	(27, '1431573507', 'paidpromoteinfest3'),
	(28, '3310089795', 'paidpromoteinfest3'),
	(29, '1683187024', 'paidpromoteinfest3'),
	(30, '1530888298', 'paidpromoteinfest3'),
	(31, '5006229396', 'paidpromoteinfest3'),
	(32, '2938442556', 'paidpromoteinfest3'),
	(33, '1624185441', 'paidpromoteinfest3'),
	(34, '1626449954', 'paidpromoteinfest3'),
	(35, '1607225531', 'paidpromoteinfest3'),
	(36, '3587402856', 'paidpromoteinfest3'),
	(37, '2204632207', 'paidpromoteinfest3'),
	(38, '3000250299', 'paidpromoteinfest3'),
	(39, '49847302', 'paidpromoteinfest3'),
	(40, '2035287101', 'paidpromoteinfest3'),
	(41, '1565490519', 'paidpromoteinfest3'),
	(42, '1427741128', 'paidpromoteinfest3'),
	(43, '3024371968', 'paidpromoteinfest3'),
	(44, '6701604246', 'paidpromoteinfest3'),
	(45, '2039063878', 'paidpromoteinfest3'),
	(46, '1500845530', 'paidpromoteinfest3'),
	(47, '1615635694', 'paidpromoteinfest3'),
	(48, '5909373285', 'paidpromoteinfest3'),
	(49, '6288127261', 'paidpromoteinfest3'),
	(50, '1555371747', 'paidpromoteinfest3'),
	(51, '2989018957', 'paidpromoteinfest3'),
	(52, '1599558226', 'paidpromoteinfest3'),
	(53, '1495799430', 'paidpromoteinfest3'),
	(54, '1547529630', 'paidpromoteinfest3'),
	(55, '6873506322', 'paidpromoteinfest3'),
	(56, '5326103571', 'paidpromoteinfest3'),
	(57, '29126280551', 'paidpromoteinfest3'),
	(58, '6935425976', 'paidpromoteinfest3'),
	(59, '1709355464', 'paidpromoteinfest3'),
	(60, '2110640431', 'paidpromoteinfest3'),
	(61, '727090741', 'paidpromoteinfest3'),
	(62, '2753780500', 'paidpromoteinfest3'),
	(63, '1486773402', 'paidpromoteinfest3'),
	(64, '4530650130', 'paidpromoteinfest3'),
	(65, '1565457534', 'paidpromoteinfest3'),
	(66, '3324233072', 'paidpromoteinfest3'),
	(67, '32029862767', 'paidpromoteinfest3'),
	(68, '1207632229', 'paidpromoteinfest3'),
	(69, '1651992034', 'paidpromoteinfest3'),
	(70, '5893312399', 'paidpromoteinfest3'),
	(71, '1365345433', 'paidpromoteinfest3'),
	(72, '2152910434', 'paidpromoteinfest3'),
	(73, '5890124162', 'paidpromoteinfest3'),
	(74, '1740413433', 'paidpromoteinfest3'),
	(75, '1366209666', 'paidpromoteinfest3'),
	(76, '770503954', 'paidpromoteinfest3'),
	(77, '1729781705', 'paidpromoteinfest3'),
	(78, '5884014050', 'paidpromoteinfest3'),
	(79, '4073719413', 'paidpromoteinfest3'),
	(80, '1760364426', 'paidpromoteinfest3'),
	(81, '8125555032', 'paidpromoteinfest3'),
	(82, '2220082028', 'paidpromoteinfest3'),
	(83, '1386144408', 'paidpromoteinfest3'),
	(84, '13767870175', 'paidpromoteinfest3'),
	(85, '7308040128', 'paidpromoteinfest3'),
	(86, '393156641', 'paidpromoteinfest3'),
	(87, '6810677220', 'paidpromoteinfest3'),
	(88, '18515775470', 'paidpromoteinfest3'),
	(89, '2323854859', 'paidpromoteinfest3'),
	(90, '3785917895', 'paidpromoteinfest3'),
	(91, '4865660115', 'paidpromoteinfest3'),
	(92, '8026833487', 'paidpromoteinfest3'),
	(93, '7036472150', 'paidpromoteinfest3'),
	(94, '1464551753', 'paidpromoteinfest3'),
	(95, '7318826757', 'paidpromoteinfest3'),
	(96, '4632524618', 'paidpromoteinfest3'),
	(97, '1808094618', 'paidpromoteinfest3'),
	(98, '1976455095', 'paidpromoteinfest3'),
	(99, '8179921112', 'paidpromoteinfest3'),
	(100, '6819588131', 'paidpromoteinfest3'),
	(101, '2194012370', 'paidpromoteinfest3'),
	(102, '2088461731', 'paidpromoteinfest3'),
	(103, '6479772767', 'paidpromoteinfest3'),
	(104, '3434748187', 'paidpromoteinfest3'),
	(105, '9876262589', 'paidpromoteinfest3'),
	(106, '8407789945', 'paidpromoteinfest3'),
	(107, '1631280165', 'paidpromoteinfest3'),
	(108, '3208853647', 'paidpromoteinfest3'),
	(109, '1621822793', 'paidpromoteinfest3'),
	(110, '1563179165', 'paidpromoteinfest3'),
	(111, '1198749343', 'paidpromoteinfest3'),
	(112, '5429661272', 'paidpromoteinfest3'),
	(113, '3625804280', 'paidpromoteinfest3'),
	(114, '9186288614', 'paidpromoteinfest3'),
	(115, '4309208867', 'paidpromoteinfest3'),
	(116, '5355801080', 'paidpromoteinfest3'),
	(117, '1702507992', 'paidpromoteinfest3'),
	(118, '4271992923', 'paidpromoteinfest3'),
	(119, '5903505598', 'paidpromoteinfest3'),
	(120, '1408706872', 'paidpromoteinfest3'),
	(121, '1817774269', 'paidpromoteinfest3'),
	(122, '1997033750', 'paidpromoteinfest3'),
	(123, '2268326555', 'paidpromoteinfest3'),
	(124, '5516496876', 'paidpromoteinfest3'),
	(125, '6030604762', 'paidpromoteinfest3'),
	(126, '3196047019', 'paidpromoteinfest3'),
	(127, '9136480280', 'paidpromoteinfest3'),
	(128, '', 'paidpromoteinfest3'),
	(129, '2133335599', 'paidpromoteinfest3'),
	(130, '1315236383', 'paidpromoteinfest3'),
	(131, '5594833720', 'paidpromoteinfest3'),
	(132, '616429662', 'paidpromoteinfest3'),
	(133, '2020971182', 'paidpromoteinfest3'),
	(134, '896278908', 'paidpromoteinfest3');
/*!40000 ALTER TABLE `pp_absent` ENABLE KEYS */;

-- Dumping structure for table infest.pp_admin
CREATE TABLE IF NOT EXISTS `pp_admin` (
  `id_admin` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table infest.pp_admin: ~1 rows (approximately)
/*!40000 ALTER TABLE `pp_admin` DISABLE KEYS */;
INSERT INTO `pp_admin` (`id_admin`, `username`, `password`) VALUES
	(1, 'admin', '$2y$10$FKHWeuBagHzcPdzkCjtCSewzdSlmlIX/Ln6hw0wuZfDuZymnjbTrC');
/*!40000 ALTER TABLE `pp_admin` ENABLE KEYS */;

-- Dumping structure for table infest.pp_group_target
CREATE TABLE IF NOT EXISTS `pp_group_target` (
  `id_group` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(50) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  PRIMARY KEY (`id_group`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table infest.pp_group_target: ~2 rows (approximately)
/*!40000 ALTER TABLE `pp_group_target` DISABLE KEYS */;
INSERT INTO `pp_group_target` (`id_group`, `group_name`, `created_date`) VALUES
	(3, 'test', '2020-03-23'),
	(4, 'paid_promote', '2020-03-23');
/*!40000 ALTER TABLE `pp_group_target` ENABLE KEYS */;

-- Dumping structure for table infest.pp_hashtag
CREATE TABLE IF NOT EXISTS `pp_hashtag` (
  `id_hashtag` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(50) DEFAULT NULL,
  `deadline` datetime DEFAULT NULL,
  PRIMARY KEY (`id_hashtag`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- Dumping data for table infest.pp_hashtag: ~0 rows (approximately)
/*!40000 ALTER TABLE `pp_hashtag` DISABLE KEYS */;
INSERT INTO `pp_hashtag` (`id_hashtag`, `text`, `deadline`) VALUES
	(12, 'paidpromoteinfest3', '2020-06-17 20:32:26');
/*!40000 ALTER TABLE `pp_hashtag` ENABLE KEYS */;

-- Dumping structure for table infest.pp_target
CREATE TABLE IF NOT EXISTS `pp_target` (
  `id_target` int(11) NOT NULL AUTO_INCREMENT,
  `id_group` int(11) NOT NULL DEFAULT '0',
  `username` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `useruid` varchar(60) DEFAULT NULL,
  `is_public` tinyint(1) DEFAULT '0',
  `total_absence` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_target`)
) ENGINE=InnoDB AUTO_INCREMENT=265 DEFAULT CHARSET=latin1;

-- Dumping data for table infest.pp_target: ~115 rows (approximately)
/*!40000 ALTER TABLE `pp_target` DISABLE KEYS */;
INSERT INTO `pp_target` (`id_target`, `id_group`, `username`, `name`, `useruid`, `is_public`, `total_absence`) VALUES
	(1, 3, 'thariannisa', 'tari', '2208149602', 0, 0),
	(2, 3, 'liaasmaliza19_', 'liaasmaliza19_', '2659004940', 1, 0),
	(5, 3, 'farahanisabalqis', '', '1382882078', 1, 0),
	(6, 3, 'ahmadfzi20', 'jii', '5655084151', 1, 0),
	(7, 3, 'sulthanzdn', 'zed', '1973903009', 1, 0),
	(8, 3, 'rizkynahda97', 'Daa', '3025207077', 1, 0),
	(9, 3, 'nazlaameliaa', 'Nazla Amelia', '2400764754', 0, 0),
	(10, 3, 'rayhan.amar.52', 'rayhan.amar.52', '5725179875', 1, 0),
	(11, 3, 'desinthazhr', 'Desintha Zahara Azmi', '1338206706', 1, 0),
	(12, 3, 'fikrul_akhyar18', '', '4596952376', 1, 0),
	(13, 3, 'fadhilah20s', 'Fadhilah Syafa', '7730510561', 1, 0),
	(14, 3, 'rizkinabila05', 'Rizki Nabila', '2219128338', 1, 0),
	(15, 3, 'aghiffari', 'aghiffari', '1431573507', 1, 0),
	(100, 3, 'lizamaiyuni', 'Liza', '3310089795', 1, 0),
	(101, 3, 'cutmeutiahaura', '', '1683187024', 0, 0),
	(142, 3, 'hsnlssn', 'husnulsausam', '1530888298', 1, 0),
	(143, 3, 'shariefhilmi', 'Kibo', '5006229396', 1, 0),
	(144, 3, 'mirandafasyaramadhan', 'mirandafasyaramadhan', '2938442556', 0, 0),
	(145, 3, 'muhammadalifaljundri', 'MOHD ALIF AL-JUNDRI', '1624185441', 1, 0),
	(146, 3, 'aisyaem', 'Aisyah Muthmainnah', '1626449954', 1, 0),
	(154, 3, 'hyhills', 'Hilyatul Ula', '1607225531', 1, 0),
	(155, 3, 'rezaanggaputra', 'Reza Angga Putra', '3587402856', 1, 0),
	(156, 3, 'alfarisirizky', '', '', 0, 0),
	(157, 3, 'hafadfurqani', 'Ad', '3000250299', 1, 0),
	(158, 3, 'nafladiva', 'Nafla Diva Syafia', '49847302', 1, 0),
	(159, 3, 'ariemaulanaa', '', '2035287101', 1, 0),
	(160, 3, 'afdhlm', 'Muhammad Afdhal', '1565490519', 1, 0),
	(161, 3, 'aqilfiqran', 'Aqil Fiqran', '1427741128', 1, 0),
	(162, 3, 'a.ndistwn', 'a.ndistwn', '3024371968', 1, 0),
	(163, 3, 'nisafakhira161', 'Nisa Fakhira', '6701604246', 1, 0),
	(164, 3, 'mhdnafiis', '//', '2039063878', 1, 0),
	(165, 3, 'mfarhananfasa', 'mfarhananfasa', '1500845530', 1, 0),
	(166, 3, 'nadyanadhitaa', 'Nadya Nadhita', '1615635694', 0, 0),
	(167, 3, 'ervansufi', 'Ervan Sufi', '5909373285', 1, 0),
	(169, 3, 'dinda.oktaviaaa', '', '6288127261', 1, 0),
	(171, 3, 'cutgeubrinarizky', 'Gebilyas', '1555371747', 1, 0),
	(172, 3, 'shidqi.rabbani', 'shidqi rabbani', '2989018957', 0, 0),
	(173, 3, 'ridhaniara', 'ridhaniara', '1599558226', 1, 0),
	(174, 3, 'ayumlna', 'Ayu Maulina', '1495799430', 1, 0),
	(175, 3, 'putriisnaaa', '', '1547529630', 1, 0),
	(176, 3, 'arcofb', 'Arco', '6873506322', 1, 0),
	(177, 3, 'mayaamanda3958', 'Maya Amanda', '5326103571', 1, 0),
	(178, 3, 'zulfia_261', 'Zulfia_26', '29126280551', 1, 0),
	(179, 3, 'Hfizulakbr', 'hafizul akbar', '6935425976', 1, 0),
	(180, 3, 'kakakiky.id', 'kakakiky.id', '1709355464', 1, 0),
	(181, 3, 'daffaq43', 'daffaqsp', '2110640431', 1, 0),
	(182, 3, 'zulfidiana.m', 'zulfidiana.m', '727090741', 1, 0),
	(183, 3, 'nisssm', 'Muhammad Syauqi Sofyan', '2753780500', 1, 0),
	(184, 3, 'muammar_yasir', 'Muammar Yasir', '1486773402', 1, 0),
	(185, 3, 'furqanhrmwn', 'f  u  r  q  a  n  n  n', '4530650130', 1, 0),
	(186, 3, 'megaindrie', 'Mega Indrie', '1565457534', 1, 0),
	(187, 3, 'sfratulrina', 'sfratulrina', '3324233072', 1, 0),
	(189, 3, 'hasrianihsn', 'has.', '1207632229', 1, 0),
	(190, 3, 'arndafbryla', 'Arinda', '1651992034', 1, 0),
	(191, 3, 'hilalinfinity90', 'Hilal Bin Rabbah', '5893312399', 1, 0),
	(192, 3, 'ricqo_', '', '1365345433', 1, 0),
	(193, 3, 'rahmaatillahh', 'Rahma', '2152910434', 1, 0),
	(194, 3, 'putri_mahela', 'PUTRI MAHELA', '5890124162', 1, 0),
	(195, 3, 'waliammursyida', '_', '1740413433', 1, 0),
	(197, 3, 'yunrl._', 'Nurul izzati', '1366209666', 1, 0),
	(198, 3, 'sausannabilah18', 'sausannabilah18', '770503954', 1, 0),
	(199, 3, 'mraufa_', 'mraufa_', '1729781705', 1, 0),
	(200, 3, 'sofiasafiraa', 'sofias', '5884014050', 1, 0),
	(201, 3, 'say_full02', '', '4073719413', 1, 0),
	(202, 3, 'tmzahirsyah', 'A I N', '1760364426', 1, 0),
	(203, 3, 'stnaisha_', 'Rifa', '8125555032', 1, 0),
	(204, 3, 'nailulfthry', 'N a i l u l  F i t h r i y a', '2220082028', 1, 0),
	(205, 3, 'maurizahumaira', 'mori', '1386144408', 1, 0),
	(207, 3, 'sayidatul_sufur', 'sufur', '13767870175', 1, 0),
	(208, 3, 'nrhmd_11', 'nurhamidah', '7308040128', 1, 0),
	(209, 3, 'nazirarezky', 'Nazira Rezky Afifah', '393156641', 1, 0),
	(210, 3, 'asdar4472', 'Asdar Rasyid', '6810677220', 1, 0),
	(211, 3, 'auliarizki712', 'Aulia Rizki', '18515775470', 1, 0),
	(212, 3, 'zulfaa_nabila', 'zulfa_nabila', '2323854859', 1, 0),
	(213, 3, 'sriulinarft__', '', '3785917895', 1, 0),
	(214, 3, 'bayuramaddhan', 'Bayu Ramadhan', '4865660115', 1, 0),
	(216, 3, 'fazillbsry', 'Fazil Basri', '7036472150', 1, 0),
	(217, 3, 'zakiasafara', 'zakiatus safara', '1464551753', 1, 0),
	(218, 3, 'linnnarr', 'linnnarr', '7318826757', 1, 0),
	(219, 3, 'srhariyt.i', '', '4632524618', 1, 0),
	(220, 3, 'ridha_arlian', 'Ridha Arlian Alhaqie', '1808094618', 1, 0),
	(221, 3, 'natasyazzhra', 'A C H A', '1976455095', 1, 0),
	(223, 3, 'mszhabibie21', 'M. syah zichrullah habibie', '8179921112', 1, 0),
	(224, 3, 'rapanamaizelena04', 'Rapana maizelena', '6819588131', 1, 0),
	(226, 3, 'hizbullahmaulana', 'Hizbullah Maulana', '2194012370', 1, 0),
	(227, 3, 'sitimawaddah23', 'Siti Mawaddah', '2088461731', 1, 0),
	(228, 3, 'choirunisa_rmd', 'Choirunisa Romadoni', '6479772767', 1, 0),
	(230, 3, 'fernandozhahirsyah', 'Fernando Zhahirsyah', '3434748187', 1, 0),
	(231, 3, 'ridhamln', 'Muhammad Ridha Maulana', '9876262589', 1, 0),
	(232, 3, 'munawarah0801', 'munawarah', '8407789945', 1, 0),
	(233, 3, 'fiyayfta', 'FiyaYufita', '1631280165', 1, 0),
	(234, 3, 'kausarszz', 'Muhammad Kausar', '3208853647', 1, 0),
	(235, 3, 'hokkychandrawiguna', '', '', 0, 0),
	(236, 3, 'rifthamuzilla', 'Mumud', '1563179165', 1, 0),
	(237, 3, 'jihanmawaddah00', 'Jihan mawaddah', '1198749343', 1, 0),
	(238, 3, 'm.fadhil_007', 'Muhammad Fadhil', '5429661272', 1, 0),
	(239, 3, 'mulqanmegaman', 'Mulqan Megaman', '3625804280', 1, 0),
	(241, 3, 'Inggrittmara__', '', '', 0, 0),
	(242, 3, 'lifeofrifai', 'Muhammad Nurifai', '4309208867', 1, 0),
	(243, 3, 'aldinovian_viscal', 'Aldi Novian Viscal', '5355801080', 1, 0),
	(244, 3, 'fathinshaffa', 'fathin shaffa anwar', '1702507992', 1, 0),
	(245, 3, 'barri_faiz', 'Khairul Barri Faiz', '4271992923', 1, 0),
	(246, 3, 'abifarhan04', 'Abi Farhan', '5903505598', 1, 0),
	(248, 3, 'alf_wdya', 'Alifia', '1817774269', 1, 0),
	(249, 3, 'Izzatihusnna', 'Izzati Husna', '1997033750', 1, 0),
	(250, 3, 'raihankarunaa', 'rey', '2268326555', 1, 0),
	(251, 3, 'dickyrizkig', 'dicky rizki giatama', '2133335599', 0, 0),
	(252, 3, 'pipin_elfia', 'Vinni Elfia Rosa', '6030604762', 1, 0),
	(253, 3, 'adikaksr', 'Adika Nuraga Kanaka Stamba R.', '3196047019', 1, 0),
	(254, 3, 'liarindiany', 'LiaRindiany', '9136480280', 1, 0),
	(255, 3, 'rismakurniawaty_ ', '', '', 0, 0),
	(256, 3, 'naufaladhaa', 'Naufal Mas Adha', '1315236383', 1, 0),
	(257, 3, 'srh.adila', 'srh.adila', '5594833720', 1, 0),
	(258, 3, 'fitidjawahir', 'Fitria wardaliza', '616429662', 1, 0),
	(259, 3, 'indra4zhari', 'IndraAzhari', '2020971182', 1, 0),
	(260, 3, 'izzanudiyafachri', 'Izza nudiya fachri', '896278908', 1, 0),
	(262, 3, 'by_yogaa', 'yoga', '32029862767', 1, 0),
	(263, 4, 'sittyalmaaa', 'Almaaa', '7936990698', 0, 0),
	(264, 3, 'imanda.23', 'Imanda Putri', '1408706872', 1, 0);
/*!40000 ALTER TABLE `pp_target` ENABLE KEYS */;

-- Dumping structure for table infest.tbl_agenda_event
CREATE TABLE IF NOT EXISTS `tbl_agenda_event` (
  `id_agenda` int(11) NOT NULL AUTO_INCREMENT,
  `id_event` int(11) DEFAULT NULL,
  `agenda_title` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `date_agenda` date DEFAULT NULL,
  PRIMARY KEY (`id_agenda`),
  KEY `FK_tbl_agenda_event_tbl_event` (`id_event`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- Dumping data for table infest.tbl_agenda_event: ~1 rows (approximately)
/*!40000 ALTER TABLE `tbl_agenda_event` DISABLE KEYS */;
INSERT INTO `tbl_agenda_event` (`id_agenda`, `id_event`, `agenda_title`, `caption`, `date_agenda`) VALUES
	(13, 1, 'Pendaftaran', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et volutpat nibh. Proin vel convallis tellus. In id orci posuere, placerat lorem nec, dignissim felis. Nam bibendum erat id nisi consequat aliquam. Duis elementum nulla ac purus facilisis semp', '2020-02-02'),
	(14, 2, 'Pendaftaran', 'aaaaaaaaaaaa', '2020-02-02');
/*!40000 ALTER TABLE `tbl_agenda_event` ENABLE KEYS */;

-- Dumping structure for table infest.tbl_event
CREATE TABLE IF NOT EXISTS `tbl_event` (
  `id_event` int(11) NOT NULL AUTO_INCREMENT,
  `category` tinyint(1) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `description` longtext,
  `cp_name` varchar(255) DEFAULT NULL,
  `cp_number` varchar(13) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `guidebook` varchar(255) DEFAULT NULL,
  `featured_icon` varchar(255) DEFAULT NULL,
  `register_link` varchar(255) DEFAULT NULL,
  `status_register` tinyint(1) DEFAULT NULL,
  `qualification` tinyint(1) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  PRIMARY KEY (`id_event`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table infest.tbl_event: ~0 rows (approximately)
/*!40000 ALTER TABLE `tbl_event` DISABLE KEYS */;
INSERT INTO `tbl_event` (`id_event`, `category`, `title`, `slug`, `caption`, `description`, `cp_name`, `cp_number`, `location`, `guidebook`, `featured_icon`, `register_link`, `status_register`, `qualification`, `created_date`, `modified_date`) VALUES
	(1, 1, 'Web Development Academy', 'web-development-academy', 'aaaaaaaaaaaaaaa', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et volutpat nibh. Proin vel convallis tellus. In id orci posuere, placerat lorem nec, dignissim felis. Nam bibendum erat id nisi consequat aliquam. Duis elementum nulla ac purus facilisis semper. Vivamus at nulla magna. Sed eu rhoncus urna, et eleifend nulla. Morbi nibh erat, hendrerit non quam a, ultrices sollicitudin mi. Ut quis justo rhoncus, interdum mauris at, viverra enim. Proin a lacus ut risus maximus pharetra. Aliquam quam mauris, vulputate eget efficitur ac, tempus tincidunt mi. Fusce fermentum pulvinar facilisis. Aliquam volutpat est et erat aliquam elementum. Sed augue nisi, consequat nec quam eget, facilisis ultrices augue. Curabitur maximus velit id diam rhoncus placerat. Donec nec interdum turpis. Vivamus consectetur est et mauris facilisis, nec finibus ligula pellentesque. Donec imperdiet ultricies ipsum et molestie. Donec maximus sapien ac maximus condimentum. Praesent nec nunc ut nisi consequat dictum. Quisque vitae dui velit. Phasellus egestas luctus fermentum. Donec non molestie ex. Fusce consequat libero id convallis vestibulum. Donec placerat enim a purus ultrices, vitae porta dolor tempus. Pellentesque finibus quam dapibus, tempor sem at, vulputate libero.</p>\n\n<h3>sdasd</h3>\n\n<ul>\n	<li>Vivamus egestas felis id neque aliquam malesuada.</li>\n</ul>\n', 'sdssd', '4343434', 'Banda Aceh', 'uploads/2020/02/Destini-Story-Plan.pdf', 'uploads/2020/02/circle-cropped.png', '#', 0, 1, '2020-02-10', '2020-02-10'),
	(2, 1, 'Data Science Academy', 'data-science-academy', 'kaskasdkakdlkasklasd', '<p>alalwlawkawkawkakkawakwklawkdjaskdjasdjaksldsadadsad</p>\n\n<p>asdsadasdsadsadsa</p>\n\n<p>dsa</p>\n\n<p>das</p>\n\n<p>dasd</p>\n', 'sdssd', '4343434', 'Fakultas MIPA', 'uploads/2020/02/Destini-Story-Plan1.pdf', 'uploads/2020/02/circle-cropped4.png', '#', 0, 3, '2020-02-15', '2020-02-15');
/*!40000 ALTER TABLE `tbl_event` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
