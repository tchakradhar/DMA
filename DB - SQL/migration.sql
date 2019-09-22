-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 07, 2019 at 09:02 AM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `migration`
--

-- --------------------------------------------------------

--
-- Table structure for table `configuration`
--

CREATE TABLE `configuration` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `hosturl` varchar(1000) NOT NULL,
  `port` varchar(200) NOT NULL,
  `userid` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `database_id` int(11) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `configuration`
--

INSERT INTO `configuration` (`id`, `name`, `hosturl`, `port`, `userid`, `password`, `database_id`, `status`) VALUES
(1, 'Demo99', 'localhost', '77', 'admin123', 'admin', 3, 0),
(2, 'Demo88', 'localhost', '23', 'admin124', 'admin', 2, 0),
(3, 'Demo77', 'localhost', '45', 'admin1236', 'admin', 4, 0),
(5, 'Demo345', 'localhost', '43', 'admin11576', 'zxfvads', 8, 0),
(6, 'Demo55', 'localhost', '56', 'admin1155', 'admin', 5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `create_job`
--

CREATE TABLE `create_job` (
  `id` int(150) NOT NULL,
  `job_name` varchar(150) NOT NULL,
  `status` enum('process','completed','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `create_job`
--

INSERT INTO `create_job` (`id`, `job_name`, `status`) VALUES
(1, 'Job44', 'completed');

-- --------------------------------------------------------

--
-- Table structure for table `job_config`
--

CREATE TABLE `job_config` (
  `id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `config_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job_config`
--

INSERT INTO `job_config` (`id`, `job_id`, `config_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `job_schema`
--

CREATE TABLE `job_schema` (
  `id` int(150) NOT NULL,
  `schema_id` int(150) NOT NULL,
  `job_id` int(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job_schema`
--

INSERT INTO `job_schema` (`id`, `schema_id`, `job_id`) VALUES
(1, 9, 1),
(2, 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `job_source`
--

CREATE TABLE `job_source` (
  `id` int(150) NOT NULL,
  `source_id` int(150) NOT NULL,
  `job_id` int(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job_source`
--

INSERT INTO `job_source` (`id`, `source_id`, `job_id`) VALUES
(1, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `job_table`
--

CREATE TABLE `job_table` (
  `id` int(150) NOT NULL,
  `table_id` int(150) NOT NULL,
  `job_id` int(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job_table`
--

INSERT INTO `job_table` (`id`, `table_id`, `job_id`) VALUES
(1, 34, 1),
(2, 35, 1),
(3, 36, 1),
(4, 37, 1),
(5, 38, 1),
(6, 39, 1);

-- --------------------------------------------------------

--
-- Table structure for table `job_target`
--

CREATE TABLE `job_target` (
  `id` int(150) NOT NULL,
  `target_id` int(150) NOT NULL,
  `job_id` int(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job_target`
--

INSERT INTO `job_target` (`id`, `target_id`, `job_id`) VALUES
(1, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `schemas`
--

CREATE TABLE `schemas` (
  `id` int(11) NOT NULL,
  `schema_list` varchar(400) NOT NULL,
  `database_id` int(11) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schemas`
--

INSERT INTO `schemas` (`id`, `schema_list`, `database_id`, `status`) VALUES
(1, 'schema11', 1, 0),
(2, 'schema12', 1, 0),
(3, 'schema13', 1, 0),
(4, 'schema14', 1, 0),
(5, 'schema21', 2, 0),
(6, 'schema22', 2, 0),
(7, 'schema23', 2, 0),
(8, 'schema24', 2, 0),
(9, 'schema31', 3, 1),
(10, 'schema32', 3, 1),
(11, 'schema33', 3, 0),
(12, 'schema34', 3, 0),
(13, 'schema41', 4, 0),
(14, 'schema42', 4, 0),
(15, 'schema43', 4, 0),
(16, 'schema44', 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `source`
--

CREATE TABLE `source` (
  `id` int(11) NOT NULL,
  `database_list` varchar(400) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `source`
--

INSERT INTO `source` (`id`, `database_list`, `status`) VALUES
(1, 'Amazon RedShift\r\n', 0),
(2, 'Greenplum', 0),
(3, 'PostgreSQL', 1),
(4, 'Oracle', 0),
(5, 'MS SQL Server', 0),
(6, 'MySQL', 0),
(7, 'Netezza', 0),
(8, 'ParAccel', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tables`
--

CREATE TABLE `tables` (
  `id` int(11) NOT NULL,
  `table_list` varchar(400) NOT NULL,
  `schema_id` int(11) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tables`
--

INSERT INTO `tables` (`id`, `table_list`, `schema_id`, `status`) VALUES
(1, 'table11', 1, 0),
(2, 'table12', 1, 0),
(3, 'table13', 1, 0),
(4, 'table14', 1, 0),
(5, 'table21', 2, 0),
(6, 'table22', 2, 0),
(7, 'table23', 2, 0),
(8, 'table24', 2, 0),
(9, 'table31', 3, 0),
(10, 'table32', 3, 0),
(11, 'table33', 3, 0),
(12, 'table34', 3, 0),
(13, 'table41', 4, 0),
(14, 'table42', 4, 0),
(15, 'table43', 4, 0),
(16, 'table44', 4, 0),
(17, 'table51', 5, 0),
(18, 'table52', 5, 0),
(19, 'table53', 5, 0),
(20, 'table54', 5, 0),
(21, 'table61', 6, 0),
(22, 'table62', 6, 0),
(23, 'table63', 6, 0),
(24, 'table64', 6, 0),
(25, 'table71', 7, 0),
(26, 'table72', 7, 0),
(27, 'table73', 7, 0),
(28, 'table74', 7, 0),
(29, 'table81', 8, 0),
(30, 'table82', 8, 0),
(31, 'table83', 8, 0),
(32, 'table84', 8, 0),
(33, 'table91', 9, 0),
(34, 'table92', 9, 1),
(35, 'table93', 9, 1),
(36, 'table94', 9, 1),
(37, 'table101', 10, 1),
(38, 'table102', 10, 1),
(39, 'table103', 10, 1),
(40, 'table104', 10, 0),
(41, 'table111', 11, 0),
(42, 'table112', 11, 0),
(43, 'table113', 11, 0),
(44, 'table114', 11, 0),
(45, 'table121', 12, 0),
(46, 'table122', 12, 0),
(47, 'table123', 12, 0),
(48, 'table124', 12, 0),
(49, 'table131', 13, 0),
(50, 'table132', 13, 0),
(51, 'table133', 13, 0),
(52, 'table134', 13, 0),
(53, 'table141', 14, 0),
(54, 'table142', 14, 0),
(55, 'table143', 14, 0),
(56, 'table144', 14, 0),
(57, 'table151', 15, 0),
(58, 'table152', 15, 0),
(59, 'table153', 15, 0),
(60, 'table154', 15, 0),
(61, 'table161', 16, 0),
(62, 'table162', 16, 0),
(63, 'table163', 16, 0),
(64, 'table164', 16, 0);

-- --------------------------------------------------------

--
-- Table structure for table `target`
--

CREATE TABLE `target` (
  `id` int(11) NOT NULL,
  `snow_flake` varchar(200) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `target`
--

INSERT INTO `target` (`id`, `snow_flake`, `status`) VALUES
(1, 'SnowFlake Dev', 0),
(2, 'SnowFlake SIT', 0),
(3, 'SnowFlake UAT', 1),
(4, 'NeSnowFlake PROD', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `configuration`
--
ALTER TABLE `configuration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `create_job`
--
ALTER TABLE `create_job`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_config`
--
ALTER TABLE `job_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_schema`
--
ALTER TABLE `job_schema`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_source`
--
ALTER TABLE `job_source`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_table`
--
ALTER TABLE `job_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_target`
--
ALTER TABLE `job_target`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schemas`
--
ALTER TABLE `schemas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `source`
--
ALTER TABLE `source`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `target`
--
ALTER TABLE `target`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `configuration`
--
ALTER TABLE `configuration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `create_job`
--
ALTER TABLE `create_job`
  MODIFY `id` int(150) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `job_config`
--
ALTER TABLE `job_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `job_schema`
--
ALTER TABLE `job_schema`
  MODIFY `id` int(150) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `job_source`
--
ALTER TABLE `job_source`
  MODIFY `id` int(150) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `job_table`
--
ALTER TABLE `job_table`
  MODIFY `id` int(150) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `job_target`
--
ALTER TABLE `job_target`
  MODIFY `id` int(150) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `schemas`
--
ALTER TABLE `schemas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `source`
--
ALTER TABLE `source`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tables`
--
ALTER TABLE `tables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `target`
--
ALTER TABLE `target`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
