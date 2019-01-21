-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 21, 2019 at 11:35 AM
-- Server version: 10.1.23-MariaDB-9+deb9u1
-- PHP Version: 7.0.30-0+deb9u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ITRIProject`
--

-- --------------------------------------------------------

--
-- Table structure for table `AllDeives`
--

CREATE TABLE `AllDeives` (
  `macAddress` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `container`
--

CREATE TABLE `container` (
  `c_index` int(255) NOT NULL,
  `pi_mac` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` datetime NOT NULL,
  `lat` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `lng` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `temperature` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `humidity` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `Id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Contract_Address` varchar(42) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `Transaction_Hash` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `info` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `IdMapContract`
--

CREATE TABLE `IdMapContract` (
  `Id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Contract_Address` varchar(42) COLLATE utf8_unicode_ci NOT NULL,
  `Number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `InvoiceOfTracker`
--

CREATE TABLE `InvoiceOfTracker` (
  `index_invoice` int(7) NOT NULL,
  `mac` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `AllDeives`
--
ALTER TABLE `AllDeives`
  ADD PRIMARY KEY (`macAddress`);

--
-- Indexes for table `container`
--
ALTER TABLE `container`
  ADD PRIMARY KEY (`c_index`);

--
-- Indexes for table `IdMapContract`
--
ALTER TABLE `IdMapContract`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `InvoiceOfTracker`
--
ALTER TABLE `InvoiceOfTracker`
  ADD PRIMARY KEY (`index_invoice`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `container`
--
ALTER TABLE `container`
  MODIFY `c_index` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `InvoiceOfTracker`
--
ALTER TABLE `InvoiceOfTracker`
  MODIFY `index_invoice` int(7) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
