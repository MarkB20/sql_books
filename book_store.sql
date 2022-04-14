-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 13, 2022 at 06:13 PM
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
  `Book_Name` varchar(50) NOT NULL,
  `Author` varchar(25) NOT NULL,
  `Price` double NOT NULL,
  PRIMARY KEY (`Book_No`),
  UNIQUE KEY `uc_ISBN` (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`Book_No`, `ISBN`, `Book_Name`, `Author`, `Price`) VALUES
(11, '9781408855706', 'Harry Potter and the Half-Blood Prince', 'J. K. Rowling', 4.67),
(330, '9781408855690', 'Harry Potter and the Order of the Phoenix', 'J. K. Rowling', 4.53),
(461, '1408855682', 'Harry Potter and the Goblet of Fire', 'J. K. Rowling', 4.38),
(631, '9780195798760', 'Harry Potter and the chamber of secrets', 'J. K. Rowling', 4),
(807, '1408855674', 'Harry Potter and the Prisoner of Azkaban', 'J. K. Rowling', 6.53),
(900, '1408855712', 'Harry Potter and the Deathly Hallows', 'J. K. Rowling', 4.46),
(914, '9780001912366', 'Harry Potter and The Sorcerer\'s Stone', 'J. K. Rowling', 4);

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

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_NO`, `forename`, `surname`, `street`, `city`, `postcode`, `contact_phone`) VALUES
(202, 'Beth ', 'MacDonald', '19, Dunnwood Park', 'Derry', 'BT47 2NN', '07837539016'),
(579, 'Aisha ', 'Hanson', '19, Hillview Avenue', 'Derry', 'BT47 2NU', '07056647647'),
(667, 'Eddie ', 'Gibbons', '13, Kensington Road', 'Derry', 'BT47 5TY', '07071275027'),
(678, 'David ', 'Davenport', 'Railway Lane', 'Derry', 'BT47 4AE', '08035352265');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `Order_No` int(11) NOT NULL,
  `customer_NO` int(11) NOT NULL,
  `Book_No` int(11) NOT NULL,
  PRIMARY KEY (`Order_No`),
  KEY `customer_NO` (`customer_NO`),
  KEY `Book_No` (`Book_No`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`Order_No`, `customer_NO`, `Book_No`) VALUES
(102, 202, 11),
(312, 678, 461),
(664, 667, 461),
(675, 579, 914);

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

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`review_NO`, `customer_NO`, `Book_NO`, `review`) VALUES
(444, 579, 11, 'What can you say. Harry Potter is one of the best children\'s book ever written. We originally purchased this book on its initial release. However, the older child wont pass down to the younger child. They want to keep it, although having read and outgrown it.'),
(260, 202, 330, 'This book is quite hefty but I got through it in about 4 days. Very much enjoyed it and makes you care about the characters.'),
(853, 667, 914, 'This was a repurchase for me as my original Harry Potter book is battered from years of reading. I\'ve reread this book since and of course, I loved it. The beginning can be a little slow for younger readers as a lot of it is not in the movies, but the remaining 85% is and can be completely imagined throughout.');

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
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`Staff_NO`, `Forename`, `Surname`, `ADDRESS`, `TEL`, `SEX`, `DOB`, `SALARY`) VALUES
('348', 'Robin ', 'Hodges', '1-21, Muldonagh Road', '07767856767', 'M', '1997-06-19', '20000.00'),
('379', 'Nadine ', 'Barrett', '62, Tullymore Road', '07730770908', 'F', '1996-05-15', '20000.00');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_NO`) REFERENCES `customer` (`customer_NO`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`Book_No`) REFERENCES `book` (`Book_No`);

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
