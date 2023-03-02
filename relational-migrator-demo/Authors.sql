-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 02, 2023 at 05:33 PM
-- Server version: 10.4.27-MariaDB-log
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Authors`
--

-- --------------------------------------------------------

--
-- Table structure for table `Author`
--

CREATE TABLE `Author` (
  `AuthorID` int(11) NOT NULL,
  `First` varchar(255) NOT NULL,
  `Last` varchar(255) NOT NULL,
  `LastSeen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Author`
--

INSERT INTO `Author` (`AuthorID`, `First`, `Last`, `LastSeen`) VALUES
(1, 'John', 'Donne', 1631),
(2, 'Percy', 'Shelley', 1792),
(3, 'John', 'Keats', 1795);

-- --------------------------------------------------------

--
-- Table structure for table `Travel`
--

CREATE TABLE `Travel` (
  `AuthorID` int(11) NOT NULL,
  `Country` varchar(255) NOT NULL,
  `Arrive` date NOT NULL,
  `Depart` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Travel`
--

INSERT INTO `Travel` (`AuthorID`, `Country`, `Arrive`, `Depart`) VALUES
(1, 'Spain', '1590-09-01', '1591-02-01'),
(2, 'Scotland', '1811-09-25', '1811-10-30'),
(3, 'Italy', '1820-09-01', '1820-11-30');

-- --------------------------------------------------------

--
-- Table structure for table `Works`
--

CREATE TABLE `Works` (
  `AuthorID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Works`
--

INSERT INTO `Works` (`AuthorID`, `Name`, `Date`) VALUES
(1, 'The Baite', 1633),
(2, 'Ozymandias', 1818),
(3, 'Ode to A Nightingale', 1819);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Author`
--
ALTER TABLE `Author`
  ADD PRIMARY KEY (`AuthorID`);

--
-- Indexes for table `Travel`
--
ALTER TABLE `Travel`
  ADD PRIMARY KEY (`AuthorID`),
  ADD KEY `AuthorID` (`AuthorID`);

--
-- Indexes for table `Works`
--
ALTER TABLE `Works`
  ADD PRIMARY KEY (`AuthorID`),
  ADD UNIQUE KEY `AuthorID` (`AuthorID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Travel`
--
ALTER TABLE `Travel`
  ADD CONSTRAINT `FK_Author` FOREIGN KEY (`AuthorID`) REFERENCES `Author` (`AuthorID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Works`
--
ALTER TABLE `Works`
  ADD CONSTRAINT `works_ibfk_1` FOREIGN KEY (`AuthorID`) REFERENCES `Author` (`AuthorID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
