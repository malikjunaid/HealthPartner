-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 04, 2016 at 09:03 PM
-- Server version: 5.6.24
-- PHP Version: 5.5.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `healthpartnerapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE IF NOT EXISTS `appointment` (
  `apt_id` int(20) NOT NULL,
  `date` date NOT NULL,
  `timing` time NOT NULL,
  `user_id` int(11) NOT NULL,
  `pmdc_id` varchar(20) NOT NULL,
  `c_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `appointment_status`
--

CREATE TABLE IF NOT EXISTS `appointment_status` (
  `ap_st_id` int(20) NOT NULL,
  `appointment_status` tinyint(1) NOT NULL,
  `apt_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `clinics`
--

CREATE TABLE IF NOT EXISTS `clinics` (
  `c_id` int(20) NOT NULL,
  `clinic_name` varchar(30) NOT NULL,
  `address` varchar(100) NOT NULL,
  `timings` time NOT NULL,
  `pmdc_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE IF NOT EXISTS `doctor` (
  `pmdc_id` varchar(20) NOT NULL,
  `speclization` varchar(20) NOT NULL,
  `user_id` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `health_history`
--

CREATE TABLE IF NOT EXISTS `health_history` (
  `hh_id` int(20) NOT NULL,
  `medicine` varchar(20) NOT NULL,
  `useage` varchar(10) NOT NULL,
  `user_id` int(13) NOT NULL,
  `pmdc_id` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `pre_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `order_medicine`
--

CREATE TABLE IF NOT EXISTS `order_medicine` (
  `ord_no` int(20) NOT NULL,
  `hh_id` int(13) NOT NULL,
  `ph_id` int(13) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE IF NOT EXISTS `order_status` (
  `os_id` int(20) NOT NULL,
  `order_status` tinyint(1) NOT NULL,
  `ord_no` int(20) NOT NULL,
  `date_and_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pharamacist`
--

CREATE TABLE IF NOT EXISTS `pharamacist` (
  `phar_lic` varchar(20) NOT NULL,
  `user_id` int(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pharamacy`
--

CREATE TABLE IF NOT EXISTS `pharamacy` (
  `ph_id` int(10) NOT NULL,
  `pharmacy_name` varchar(20) NOT NULL,
  `location` varchar(30) NOT NULL,
  `phar_lic` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE IF NOT EXISTS `prescription` (
  `pre_id` int(20) NOT NULL,
  `medicine` varchar(100) NOT NULL,
  `condition` varchar(100) NOT NULL,
  `pmdc_id` varchar(20) NOT NULL,
  `user_id` int(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE IF NOT EXISTS `rating` (
  `rate_id` int(20) NOT NULL,
  `rating-points` int(5) NOT NULL,
  `user_id` int(13) NOT NULL,
  `pmdc_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(13) NOT NULL,
  `first_name` varchar(10) NOT NULL,
  `last_name` varchar(10) NOT NULL,
  `password` varchar(16) NOT NULL,
  `sex` varchar(6) NOT NULL,
  `phoneno` int(9) NOT NULL,
  `address` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`apt_id`), ADD KEY `user_id` (`user_id`), ADD KEY `pmdc_id` (`pmdc_id`), ADD KEY `c_id` (`c_id`);

--
-- Indexes for table `appointment_status`
--
ALTER TABLE `appointment_status`
  ADD PRIMARY KEY (`ap_st_id`), ADD UNIQUE KEY `apt_id` (`apt_id`);

--
-- Indexes for table `clinics`
--
ALTER TABLE `clinics`
  ADD PRIMARY KEY (`c_id`), ADD KEY `pmdc_id` (`pmdc_id`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`pmdc_id`), ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `health_history`
--
ALTER TABLE `health_history`
  ADD PRIMARY KEY (`hh_id`), ADD KEY `user_id` (`user_id`), ADD KEY `pmdc_id` (`pmdc_id`), ADD KEY `pre_id` (`pre_id`);

--
-- Indexes for table `order_medicine`
--
ALTER TABLE `order_medicine`
  ADD PRIMARY KEY (`ord_no`), ADD KEY `hh_id` (`hh_id`), ADD KEY `ph_id` (`ph_id`), ADD KEY `ph_id_2` (`ph_id`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`os_id`), ADD KEY `o_id` (`ord_no`);

--
-- Indexes for table `pharamacist`
--
ALTER TABLE `pharamacist`
  ADD PRIMARY KEY (`phar_lic`), ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `pharamacy`
--
ALTER TABLE `pharamacy`
  ADD PRIMARY KEY (`ph_id`), ADD KEY `phar_lic` (`phar_lic`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`pre_id`), ADD KEY `pmdc_id` (`pmdc_id`), ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`rate_id`), ADD KEY `user_id` (`user_id`), ADD KEY `pmdc_id` (`pmdc_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `apt_id` int(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `appointment_status`
--
ALTER TABLE `appointment_status`
  MODIFY `ap_st_id` int(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `clinics`
--
ALTER TABLE `clinics`
  MODIFY `c_id` int(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `health_history`
--
ALTER TABLE `health_history`
  MODIFY `hh_id` int(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `order_medicine`
--
ALTER TABLE `order_medicine`
  MODIFY `ord_no` int(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `os_id` int(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pharamacy`
--
ALTER TABLE `pharamacy`
  MODIFY `ph_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `prescription`
--
ALTER TABLE `prescription`
  MODIFY `pre_id` int(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `rate_id` int(20) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
ADD CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`pmdc_id`) REFERENCES `doctor` (`pmdc_id`),
ADD CONSTRAINT `appointment_ibfk_3` FOREIGN KEY (`c_id`) REFERENCES `clinics` (`c_id`);

--
-- Constraints for table `appointment_status`
--
ALTER TABLE `appointment_status`
ADD CONSTRAINT `appointment_status_ibfk_1` FOREIGN KEY (`apt_id`) REFERENCES `appointment` (`apt_id`);

--
-- Constraints for table `clinics`
--
ALTER TABLE `clinics`
ADD CONSTRAINT `clinics_ibfk_1` FOREIGN KEY (`pmdc_id`) REFERENCES `doctor` (`pmdc_id`);

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `health_history`
--
ALTER TABLE `health_history`
ADD CONSTRAINT `health_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
ADD CONSTRAINT `health_history_ibfk_2` FOREIGN KEY (`pmdc_id`) REFERENCES `doctor` (`pmdc_id`),
ADD CONSTRAINT `health_history_ibfk_3` FOREIGN KEY (`pre_id`) REFERENCES `prescription` (`pre_id`);

--
-- Constraints for table `order_medicine`
--
ALTER TABLE `order_medicine`
ADD CONSTRAINT `order_medicine_ibfk_1` FOREIGN KEY (`hh_id`) REFERENCES `health_history` (`hh_id`),
ADD CONSTRAINT `order_medicine_ibfk_2` FOREIGN KEY (`ph_id`) REFERENCES `pharamacy` (`ph_id`);

--
-- Constraints for table `order_status`
--
ALTER TABLE `order_status`
ADD CONSTRAINT `order_status_ibfk_1` FOREIGN KEY (`ord_no`) REFERENCES `order_medicine` (`ord_no`);

--
-- Constraints for table `pharamacist`
--
ALTER TABLE `pharamacist`
ADD CONSTRAINT `pharamacist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `pharamacy`
--
ALTER TABLE `pharamacy`
ADD CONSTRAINT `pharamacy_ibfk_1` FOREIGN KEY (`phar_lic`) REFERENCES `pharamacist` (`phar_lic`);

--
-- Constraints for table `prescription`
--
ALTER TABLE `prescription`
ADD CONSTRAINT `prescription_ibfk_1` FOREIGN KEY (`pmdc_id`) REFERENCES `doctor` (`pmdc_id`),
ADD CONSTRAINT `prescription_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
ADD CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`pmdc_id`) REFERENCES `doctor` (`pmdc_id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `doctor` (`user_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
