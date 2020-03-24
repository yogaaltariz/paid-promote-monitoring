-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.29-0ubuntu0.18.04.1 - (Ubuntu)
-- Server OS:                    Linux
-- HeidiSQL Version:             10.3.0.5771
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table infest.pp_admin
CREATE TABLE IF NOT EXISTS `pp_admin` (
  `id_admin` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table infest.pp_admin: ~0 rows (approximately)
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table infest.pp_group_target: ~2 rows (approximately)
/*!40000 ALTER TABLE `pp_group_target` DISABLE KEYS */;
INSERT INTO `pp_group_target` (`id_group`, `group_name`, `created_date`) VALUES
	(1, 'test', '2020-03-22'),
	(2, 'paid_promote', '2020-03-22');
/*!40000 ALTER TABLE `pp_group_target` ENABLE KEYS */;

-- Dumping structure for table infest.pp_hashtag
CREATE TABLE IF NOT EXISTS `pp_hashtag` (
  `id_hashtag` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_hashtag`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table infest.pp_hashtag: ~0 rows (approximately)
/*!40000 ALTER TABLE `pp_hashtag` DISABLE KEYS */;
INSERT INTO `pp_hashtag` (`id_hashtag`, `text`) VALUES
	(1, 'covid19'),
	(3, 'infestpp'),
	(4, 'UP3AI_UNSYIAH_2017');
/*!40000 ALTER TABLE `pp_hashtag` ENABLE KEYS */;

-- Dumping structure for table infest.pp_target
CREATE TABLE IF NOT EXISTS `pp_target` (
  `id_target` int(11) NOT NULL AUTO_INCREMENT,
  `id_group` int(11) NOT NULL DEFAULT '0',
  `username` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `useruid` varchar(60) DEFAULT NULL,
  `is_public` tinyint(1) DEFAULT NULL,
  `total_absence` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_target`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Dumping data for table infest.pp_target: ~3 rows (approximately)
/*!40000 ALTER TABLE `pp_target` DISABLE KEYS */;
INSERT INTO `pp_target` (`id_target`, `id_group`, `username`, `name`, `useruid`, `is_public`, `total_absence`) VALUES
	(5, 1, 'hasrianihsn', 'has.', '1207632229', 1, NULL),
	(8, 1, 'pipin_elfia', 'Vinni Elfia Rosa', '6030604762', 1, NULL),
	(9, 1, 'aldinovian_viscal', 'Aldi Novian Viscal', '5355801080', 1, NULL),
	(10, 1, 'hilalinfinity90', 'Hilal Bin Rabbah', '5893312399', 1, NULL);
/*!40000 ALTER TABLE `pp_target` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
