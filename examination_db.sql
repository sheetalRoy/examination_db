-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 25, 2021 at 07:44 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `examination_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `class_master`
--

CREATE TABLE `class_master` (
  `pk_id` int(11) NOT NULL,
  `class_name` varchar(250) DEFAULT NULL,
  `status_id` smallint(6) DEFAULT NULL,
  `active_flag` smallint(6) DEFAULT NULL,
  `sys_inserted_by` smallint(6) DEFAULT NULL,
  `sys_inserted_date` datetime DEFAULT NULL,
  `sys_updated_by` smallint(6) DEFAULT NULL,
  `sys_updated_date` datetime DEFAULT NULL,
  `etl_ref_no` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `exam_master`
--

CREATE TABLE `exam_master` (
  `pk_id` int(11) NOT NULL,
  `exam_type_fk` int(11) DEFAULT NULL,
  `exam_name` varchar(250) DEFAULT NULL,
  `exam_code` varchar(10) DEFAULT NULL,
  `exam_date` date DEFAULT NULL,
  `class` int(11) DEFAULT NULL,
  `subject` varchar(250) DEFAULT NULL,
  `topic` varchar(250) DEFAULT NULL,
  `status_id` smallint(6) DEFAULT NULL,
  `active_flag` smallint(6) DEFAULT NULL,
  `sys_inserted_by` smallint(6) DEFAULT NULL,
  `sys_inserted_date` datetime DEFAULT NULL,
  `sys_updated_by` smallint(6) DEFAULT NULL,
  `sys_updated_date` datetime DEFAULT NULL,
  `etl_ref_no` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `exam_type`
--

CREATE TABLE `exam_type` (
  `pk_id` int(11) NOT NULL,
  `exam_type` varchar(250) DEFAULT NULL,
  `status_id` smallint(6) DEFAULT NULL,
  `active_flag` smallint(6) DEFAULT NULL,
  `sys_inserted_by` smallint(6) DEFAULT NULL,
  `sys_inserted_date` datetime DEFAULT NULL,
  `sys_updated_by` smallint(6) DEFAULT NULL,
  `sys_updated_date` datetime DEFAULT NULL,
  `etl_ref_no` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `question_master`
--

CREATE TABLE `question_master` (
  `pk_id` int(11) NOT NULL,
  `question` text DEFAULT NULL,
  `exam_id_fk` int(11) DEFAULT NULL,
  `exam_code` varchar(10) DEFAULT NULL,
  `part` varchar(10) DEFAULT NULL,
  `class` int(11) DEFAULT NULL,
  `subject` int(11) DEFAULT NULL,
  `topic` int(11) DEFAULT NULL,
  `ans1` varchar(250) DEFAULT NULL,
  `ans2` varchar(250) DEFAULT NULL,
  `ans3` varchar(250) DEFAULT NULL,
  `ans4` varchar(250) DEFAULT NULL,
  `ans_flag` varchar(10) DEFAULT NULL,
  `exam_date` date DEFAULT NULL,
  `status_id` smallint(6) DEFAULT NULL,
  `active_flag` smallint(6) DEFAULT NULL,
  `sys_inserted_by` smallint(6) DEFAULT NULL,
  `sys_inserted_date` datetime DEFAULT NULL,
  `sys_updated_by` smallint(6) DEFAULT NULL,
  `sys_updated_date` datetime DEFAULT NULL,
  `etl_ref_no` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `subject_master`
--

CREATE TABLE `subject_master` (
  `pk_id` int(11) NOT NULL,
  `class_fk` int(11) DEFAULT NULL,
  `subject` varchar(250) DEFAULT NULL,
  `status_id` smallint(6) DEFAULT NULL,
  `active_flag` smallint(6) DEFAULT NULL,
  `sys_inserted_by` smallint(6) DEFAULT NULL,
  `sys_inserted_date` datetime DEFAULT NULL,
  `sys_updated_by` smallint(6) DEFAULT NULL,
  `sys_updated_date` datetime DEFAULT NULL,
  `etl_ref_no` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `class_master`
--
ALTER TABLE `class_master`
  ADD PRIMARY KEY (`pk_id`);

--
-- Indexes for table `exam_master`
--
ALTER TABLE `exam_master`
  ADD PRIMARY KEY (`pk_id`);

--
-- Indexes for table `exam_type`
--
ALTER TABLE `exam_type`
  ADD PRIMARY KEY (`pk_id`);

--
-- Indexes for table `question_master`
--
ALTER TABLE `question_master`
  ADD PRIMARY KEY (`pk_id`),
  ADD KEY `fk_question_master_class_idx` (`class`),
  ADD KEY `fk_question_master_subject_idx` (`subject`);

--
-- Indexes for table `subject_master`
--
ALTER TABLE `subject_master`
  ADD PRIMARY KEY (`pk_id`),
  ADD KEY `class_id_fk_idx` (`class_fk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `class_master`
--
ALTER TABLE `class_master`
  MODIFY `pk_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_master`
--
ALTER TABLE `exam_master`
  MODIFY `pk_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_type`
--
ALTER TABLE `exam_type`
  MODIFY `pk_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question_master`
--
ALTER TABLE `question_master`
  MODIFY `pk_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subject_master`
--
ALTER TABLE `subject_master`
  MODIFY `pk_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `question_master`
--
ALTER TABLE `question_master`
  ADD CONSTRAINT `fk_question_master_class` FOREIGN KEY (`class`) REFERENCES `class_master` (`pk_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_question_master_subject` FOREIGN KEY (`subject`) REFERENCES `subject_master` (`pk_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `subject_master`
--
ALTER TABLE `subject_master`
  ADD CONSTRAINT `class_id_fk` FOREIGN KEY (`class_fk`) REFERENCES `class_master` (`pk_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
