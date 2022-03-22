-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 13, 2022 at 09:40 PM
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
-- Database: `book_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
CREATE TABLE IF NOT EXISTS `book` (
  `Book_No` int(11) NOT NULL,
  `ISBN` char(17) NOT NULL,
  `Book_Name` varchar(25) NOT NULL,
  `Author` varchar(25) NOT NULL,
  `Price` double NOT NULL,
  PRIMARY KEY (`Book_No`),
  UNIQUE KEY `uc_ISBN` (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `customer_NO` int(11) NOT NULL,
  `forename` varchar(30) DEFAULT NULL,
  `surname` varchar(30) DEFAULT NULL,
  `street` varchar(50) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `postcode` char(10) DEFAULT NULL,
  `contact_phone` char(12) DEFAULT NULL,
  PRIMARY KEY (`customer_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `Order_No` int(11) NOT NULL,
  `customer_NO` int(11) NOT NULL,
  `Book_No` int(11) NOT NULL,
  PRIMARY KEY (`Order_No`),
  KEY `customer_NO` (`customer_NO`),
  KEY `Book_No` (`Book_No`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
CREATE TABLE IF NOT EXISTS `review` (
  `review_NO` int(11) NOT NULL,
  `customer_NO` int(11) NOT NULL,
  `Book_NO` int(11) NOT NULL,
  `review` text NOT NULL,
  KEY `Book_NO` (`Book_NO`),
  KEY `customer_NO` (`customer_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
CREATE TABLE IF NOT EXISTS `staff` (
  `Staff_NO` varchar(4) NOT NULL,
  `Forename` varchar(10) DEFAULT NULL,
  `Surname` varchar(25) DEFAULT NULL,
  `ADDRESS` varchar(30) DEFAULT NULL,
  `TEL` varchar(14) DEFAULT NULL,
  `SEX` char(1) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `SALARY` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Staff_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`customer_NO`) REFERENCES `customer` (`customer_NO`),
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`Book_No`) REFERENCES `book` (`Book_No`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`Book_NO`) REFERENCES `book` (`Book_No`),
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`customer_NO`) REFERENCES `customer` (`customer_NO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
