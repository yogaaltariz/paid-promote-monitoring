-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 26, 2020 at 09:01 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `infest`
--

-- --------------------------------------------------------

--
-- Table structure for table `pp_absent`
--

CREATE TABLE `pp_absent` (
  `id` bigint(20) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `hastag` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pp_admin`
--

CREATE TABLE `pp_admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pp_admin`
--

INSERT INTO `pp_admin` (`id_admin`, `username`, `password`) VALUES
(1, 'admin', '$2y$10$FKHWeuBagHzcPdzkCjtCSewzdSlmlIX/Ln6hw0wuZfDuZymnjbTrC');

-- --------------------------------------------------------

--
-- Table structure for table `pp_group_target`
--

CREATE TABLE `pp_group_target` (
  `id_group` int(11) NOT NULL,
  `group_name` varchar(50) DEFAULT NULL,
  `created_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pp_group_target`
--

INSERT INTO `pp_group_target` (`id_group`, `group_name`, `created_date`) VALUES
(5, 'panitia', '2020-03-26');

-- --------------------------------------------------------

--
-- Table structure for table `pp_hashtag`
--

CREATE TABLE `pp_hashtag` (
  `id_hashtag` int(11) NOT NULL,
  `text` varchar(50) DEFAULT NULL,
  `deadline` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pp_hashtag`
--

INSERT INTO `pp_hashtag` (`id_hashtag`, `text`, `deadline`) VALUES
(10, 'paidpromoteinfest1', 1585316086);

-- --------------------------------------------------------

--
-- Table structure for table `pp_target`
--

CREATE TABLE `pp_target` (
  `id_target` int(11) NOT NULL,
  `id_group` int(11) NOT NULL DEFAULT 0,
  `username` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `useruid` varchar(60) DEFAULT NULL,
  `is_public` tinyint(1) DEFAULT NULL,
  `total_absence` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pp_target`
--

INSERT INTO `pp_target` (`id_target`, `id_group`, `username`, `name`, `useruid`, `is_public`, `total_absence`) VALUES
(201, 5, 'aqilfiqran', '', '1427741128', 1, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pp_absent`
--
ALTER TABLE `pp_absent`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pp_admin`
--
ALTER TABLE `pp_admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `pp_group_target`
--
ALTER TABLE `pp_group_target`
  ADD PRIMARY KEY (`id_group`);

--
-- Indexes for table `pp_hashtag`
--
ALTER TABLE `pp_hashtag`
  ADD PRIMARY KEY (`id_hashtag`);

--
-- Indexes for table `pp_target`
--
ALTER TABLE `pp_target`
  ADD PRIMARY KEY (`id_target`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pp_absent`
--
ALTER TABLE `pp_absent`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `pp_admin`
--
ALTER TABLE `pp_admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pp_group_target`
--
ALTER TABLE `pp_group_target`
  MODIFY `id_group` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pp_hashtag`
--
ALTER TABLE `pp_hashtag`
  MODIFY `id_hashtag` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pp_target`
--
ALTER TABLE `pp_target`
  MODIFY `id_target` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
