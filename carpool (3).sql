-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 27, 2023 at 07:17 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `carpool`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `UserName`, `Password`, `updationDate`) VALUES
(1, 'admin', '5c428d8875d2948607f3e3fe134d71b4', '2017-06-18 12:22:38');

-- --------------------------------------------------------

--
-- Table structure for table `tblbooking`
--

CREATE TABLE `tblbooking` (
  `id` int(11) NOT NULL,
  `BookingNumber` bigint(12) DEFAULT NULL,
  `userEmail` varchar(100) DEFAULT NULL,
  `VehicleId` int(11) DEFAULT NULL,
  `fDate` varchar(20) DEFAULT NULL,
  `fTime` varchar(20) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `LastUpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblbooking`
--

INSERT INTO `tblbooking` (`id`, `BookingNumber`, `userEmail`, `VehicleId`, `fDate`, `fTime`, `message`, `Status`, `PostingDate`, `LastUpdationDate`) VALUES
(21, 570825501, 'john1@gmail.com', 2, '2023-11-10', '11:36', 'hello', 1, '2023-02-22 20:34:38', '2023-02-27 17:08:33'),
(22, 999931506, 'john1@gmail.com', 4, '2023-03-02', '11:37', 'hello', 0, '2023-02-22 20:37:04', NULL),
(23, 306656348, 'john1@gmail.com', 2, '2023-02-23', '11:42', 'hello', 0, '2023-02-22 20:39:28', NULL),
(24, 995600373, 'john1@gmail.com', 4, '2023-03-16', '11:48', 'hello', 0, '2023-02-22 20:47:03', NULL),
(25, 978050681, 'john1@gmail.com', 2, '2023-02-23', '01:49', 'kfkff', 0, '2023-02-22 20:47:42', NULL),
(43, 861506202, 'john34@gmail.com', 2, '2023-02-02', '17:48', 'hello, am booking this seat', 0, '2023-02-27 14:43:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblbrands`
--

CREATE TABLE `tblbrands` (
  `id` int(11) NOT NULL,
  `BrandName` varchar(120) NOT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblbrands`
--

INSERT INTO `tblbrands` (`id`, `BrandName`, `CreationDate`, `UpdationDate`) VALUES
(2, 'BMW', '2017-06-18 16:24:50', NULL),
(3, 'Audi', '2017-06-18 16:25:03', NULL),
(4, 'Nissan', '2017-06-18 16:25:13', NULL),
(5, 'Toyota', '2017-06-18 16:25:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblcontactusinfo`
--

CREATE TABLE `tblcontactusinfo` (
  `id` int(11) NOT NULL,
  `Address` tinytext DEFAULT NULL,
  `EmailId` varchar(255) DEFAULT NULL,
  `ContactNo` char(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcontactusinfo`
--

INSERT INTO `tblcontactusinfo` (`id`, `Address`, `EmailId`, `ContactNo`) VALUES
(1, '00100 Northern Bypass Road, Intersection, Kenya', 'wenbusale383@gmail.com', '0769525570');

-- --------------------------------------------------------

--
-- Table structure for table `tblcontactusquery`
--

CREATE TABLE `tblcontactusquery` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `EmailId` varchar(120) DEFAULT NULL,
  `ContactNumber` char(11) DEFAULT NULL,
  `Message` longtext DEFAULT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblpages`
--

CREATE TABLE `tblpages` (
  `id` int(11) NOT NULL,
  `PageName` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL DEFAULT '',
  `detail` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblpages`
--

INSERT INTO `tblpages` (`id`, `PageName`, `type`, `detail`) VALUES
(1, 'Terms and Conditions', 'terms', '										<p align=\"justify\"><font size=\"2\"><strong><font color=\"#990000\">ACCEPTANCE OF TERMS</font></strong></font></p><p align=\"justify\"><font size=\"2\"><strong><span style=\"color: rgb(153, 0, 0);\">Work under drivers instructions<br></span><br></strong><br></font></p>\r\n										'),
(2, 'Privacy Policy', 'privacy', '<div style=\"text-align: justify;\"><span style=\"font-size: 1em; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">We are here for you. Find the best service.</span></div>'),
(3, 'About Us ', 'aboutus', '<div><span style=\"color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13.3333px;\">My name is Winslause Shioso.</span></div><div><span style=\"color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13.3333px;\">I am a software engineer.&nbsp;</span><span style=\"font-size: 1em;\">I am completing my Bachelor’s degree in software engineering by April 2023. I aim to obtain \r\nskills in my career line and be effective in all my responsibilities. I am passionate about learning \r\nand gaining more experience. I love working with people. I always believe in my path to success. \r\nIn my entire life, I have always tried to invest in my good side, helping others achieve their goals \r\nwhile building my skills. Ambition is part of me.</span></div><div><span style=\"color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13.3333px;\">phone: +254769525570</span></div><div><span style=\"color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13.3333px;\">email: wenbusale383@gmail.com</span></div><div><span style=\"color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13.3333px;\">Contact me for the best software services in: php, python&nbsp;</span></div><div><span style=\"color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13.3333px;\"><br></span></div>\r\n										'),
(11, 'FAQs', 'faqs', '<span style=\"color: rgb(24, 24, 24); font-family: Merriweather, Georgia, serif;\">“In every moment a choice exists. We can cling to the past or embrace the inevitability of change and allow a brighter future to unfold before us. Such an uncertain future may call for even more uncertain allies. Either way, a new day is coming whether we like it or not. The question is will you control it, or will it control you?”</span><br style=\"color: rgb(24, 24, 24); font-family: Merriweather, Georgia, serif;\"><span style=\"color: rgb(24, 24, 24); font-family: Merriweather, Georgia, serif;\">?&nbsp;</span><span class=\"authorOrTitle\" style=\"font-family: Lato, &quot;Helvetica Neue&quot;, Helvetica, sans-serif; font-weight: bold; color: rgb(51, 51, 51);\">klaus mikaelson</span><br>');

-- --------------------------------------------------------

--
-- Table structure for table `tblroutes`
--

CREATE TABLE `tblroutes` (
  `id` int(11) NOT NULL,
  `routeName` varchar(200) NOT NULL,
  `CreationDate` datetime NOT NULL,
  `UpdationDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblroutes`
--

INSERT INTO `tblroutes` (`id`, `routeName`, `CreationDate`, `UpdationDate`) VALUES
(3, 'kasarani - cbd', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'embakasi-cbd', '2023-02-16 00:00:00', '0000-00-00 00:00:00'),
(5, 'juja - cbd', '2023-02-17 00:00:00', '0000-00-00 00:00:00'),
(6, 'cbd - ruaka', '2023-02-17 00:00:00', '0000-00-00 00:00:00'),
(7, 'kutus - Nairobi', '2023-02-17 00:00:00', '0000-00-00 00:00:00'),
(8, 'Ruiru - cbd', '2023-02-17 00:00:00', '0000-00-00 00:00:00'),
(9, 'cbd - ruaka', '2023-02-17 00:00:00', '0000-00-00 00:00:00'),
(10, 'cbd - embakasi', '2023-02-17 00:00:00', '0000-00-00 00:00:00'),
(11, 'cbd - juja', '2023-02-18 00:00:00', '0000-00-00 00:00:00'),
(12, 'nairobi - kirinyaga', '2023-02-22 00:00:00', '0000-00-00 00:00:00'),
(13, 'cbd - ruiru', '2023-02-20 00:00:00', '0000-00-00 00:00:00'),
(14, 'cbd - ruiru', '2023-02-20 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tblsubscribers`
--

CREATE TABLE `tblsubscribers` (
  `id` int(11) NOT NULL,
  `SubscriberEmail` varchar(120) DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblsubscribers`
--

INSERT INTO `tblsubscribers` (`id`, `SubscriberEmail`, `PostingDate`) VALUES
(6, 'wenbusale383@gmail.cm', '2023-02-12 15:04:33');

-- --------------------------------------------------------

--
-- Table structure for table `tbltestimonial`
--

CREATE TABLE `tbltestimonial` (
  `id` int(11) NOT NULL,
  `UserEmail` varchar(100) NOT NULL,
  `Testimonial` mediumtext NOT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbltestimonial`
--

INSERT INTO `tbltestimonial` (`id`, `UserEmail`, `Testimonial`, `PostingDate`, `status`) VALUES
(1, 'test@gmail.com', 'I am satisfied with their service great job', '2020-07-07 14:30:12', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblusers`
--

CREATE TABLE `tblusers` (
  `id` int(11) NOT NULL,
  `FullName` varchar(120) DEFAULT NULL,
  `EmailId` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `ContactNo` char(11) DEFAULT NULL,
  `dob` varchar(100) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `Country` varchar(100) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblusers`
--

INSERT INTO `tblusers` (`id`, `FullName`, `EmailId`, `Password`, `ContactNo`, `dob`, `Address`, `City`, `Country`, `RegDate`, `UpdationDate`) VALUES
(4, 'winslause Shioso', 'wenbusale383@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '0769525570', '26/02/2000', '00100 Northern Bypass Road, Intersection, Kenya', 'Nairobi', 'Nairobi', '2023-02-05 07:36:30', '2023-02-05 07:41:28'),
(5, 'winslause Busale +254724233630', 'john1@gmail.com', 'e2d44fb765430399442d1a8dac7c94ec', '0769525570', '26/02/1999', '00100 Northern Bypass Road, Intersection, Kenya', 'Nairobi', 'Kenya', '2023-02-07 06:59:46', '2023-02-07 07:09:11'),
(6, 'Malanga', 'mnk@xyz', '827ccb0eea8a706c4c34a16891f84e7b', 'qqqqqqdgdd', NULL, NULL, NULL, NULL, '2023-02-14 08:07:03', NULL),
(7, 'John', 'john34@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '0723456676', NULL, NULL, NULL, NULL, '2023-02-16 11:36:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblvehicles`
--

CREATE TABLE `tblvehicles` (
  `id` int(11) NOT NULL,
  `VehicleTitle` varchar(200) NOT NULL,
  `routename` varchar(100) NOT NULL,
  `seats` int(100) NOT NULL,
  `drivername` varchar(200) NOT NULL,
  `drivercontacts` int(50) NOT NULL,
  `drivermessage` varchar(150) NOT NULL,
  `price` int(10) NOT NULL,
  `freeseats` int(11) NOT NULL,
  `picktime` varchar(10) NOT NULL,
  `Vimage` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblvehicles`
--

INSERT INTO `tblvehicles` (`id`, `VehicleTitle`, `routename`, `seats`, `drivername`, `drivercontacts`, `drivermessage`, `price`, `freeseats`, `picktime`, `Vimage`) VALUES
(2, 'Nissan', '5', 4, 'George Mwangi', 712345678, 'Hello, i will be travelling from Juja To Nairobi CBD tomorrow morning at 7 am. If you need  a ride book your seat on time.', 150, 3, '14:28', 'nissan3.jpg'),
(3, 'Toyota Fortuner', '9', 4, 'Wenslause Shioso', 769525570, 'Hello, i will be travelling today at 4 pm from job. 4 pm. Book your seats earlier so we can take a ride. I will be at East Mart Bestlady Tea Room. kee', 150, 3, '16:00', 'zw-toyota-fortuner-2020-2.jpg'),
(4, 'toyota', '8', 5, 'George njenga', 736473282, 'i will be travelling from ruiru to cbd at 7 am. lets meet at the stage. keep time.', 100, 4, '07:00', 'toyota1.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `random` varchar(100) NOT NULL,
  `hash` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `contactno` varchar(100) NOT NULL,
  `description` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblbooking`
--
ALTER TABLE `tblbooking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblbrands`
--
ALTER TABLE `tblbrands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcontactusinfo`
--
ALTER TABLE `tblcontactusinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcontactusquery`
--
ALTER TABLE `tblcontactusquery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblpages`
--
ALTER TABLE `tblpages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblroutes`
--
ALTER TABLE `tblroutes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblsubscribers`
--
ALTER TABLE `tblsubscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbltestimonial`
--
ALTER TABLE `tbltestimonial`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblusers`
--
ALTER TABLE `tblusers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `EmailId` (`EmailId`);

--
-- Indexes for table `tblvehicles`
--
ALTER TABLE `tblvehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblbooking`
--
ALTER TABLE `tblbooking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `tblbrands`
--
ALTER TABLE `tblbrands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tblcontactusinfo`
--
ALTER TABLE `tblcontactusinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblcontactusquery`
--
ALTER TABLE `tblcontactusquery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblpages`
--
ALTER TABLE `tblpages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tblroutes`
--
ALTER TABLE `tblroutes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tblsubscribers`
--
ALTER TABLE `tblsubscribers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbltestimonial`
--
ALTER TABLE `tbltestimonial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblusers`
--
ALTER TABLE `tblusers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tblvehicles`
--
ALTER TABLE `tblvehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
