DROP DATABASE IF EXISTS db_HW2_1;
create database db_HW2_1;

use db_HW2_1;
-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 28, 2020 at 12:05 PM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_HW2_1`
--

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `Name` varchar(32) NOT NULL,
  `Telephone` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`Name`, `Telephone`) VALUES
('comp', '5432542532'),
('company 1', '213432413'),
('Company 3', '12313'),
('efsdafdfs', '324325');

-- --------------------------------------------------------

--
-- Table structure for table `contract`
--

CREATE TABLE `contract` (
  `Id` char(10) NOT NULL,
  `Text` varchar(1024) DEFAULT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `CompanyName` varchar(32) NOT NULL,
  `PharmacyId` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contract`
--

INSERT INTO `contract` (`Id`, `Text`, `StartDate`, `EndDate`, `CompanyName`, `PharmacyId`) VALUES
('1', '1', '2020-11-02', '2020-11-01', 'comp', '123'),
('2', '2', '2020-11-04', '2020-11-12', 'comp', '456'),
('3', '3', '2020-11-02', '2020-11-10', 'company 1', '456'),
('4', '4', '2020-11-11', '2020-11-19', 'company 1', '789'),
('5', '5', '2020-11-17', '2020-11-09', 'Company 3', '123'),
('6', '6', '2020-11-03', '2020-11-02', 'Company 3', '456'),
('7', '7', '2020-11-23', '2020-11-12', 'Company 3', '789');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `NationalID` char(10) NOT NULL,
  `FirstName` varchar(32) NOT NULL,
  `LastName` varchar(32) NOT NULL,
  `Profession` varchar(32) NOT NULL,
  `Background` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`NationalID`, `FirstName`, `LastName`, `Profession`, `Background`) VALUES
('123456789', 'doc doct or', 'D', 'goosh halgh bini', 12);

-- --------------------------------------------------------

--
-- Table structure for table `drug`
--

CREATE TABLE `drug` (
  `Name` varchar(100) NOT NULL,
  `Formula` varchar(100) NOT NULL,
  `CompanyName` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `drug`
--

INSERT INTO `drug` (`Name`, `Formula`, `CompanyName`) VALUES
('acetaminophen', 'XXXXXX', 'company 1'),
('alchohol 1', 'C2H5OH1', 'company 1'),
('alchohol2', 'C4H15O12H3123', 'comp'),
('drug 1', '1', 'Company 3'),
('drug 2', '2', 'Company 3'),
('drug 3', '3', 'Company 3'),
('drug 4', '4', 'Company 3'),
('drug 5', '5', 'Company 3'),
('med', 'C0H0O0H0', 'comp'),
('super LSD', 'normal LSD', 'Company 3');

-- --------------------------------------------------------

--
-- Table structure for table `drug_prescription`
--

CREATE TABLE `drug_prescription` (
  `PrescriptionId` char(10) NOT NULL,
  `DoctorId` char(10) NOT NULL,
  `PatientId` char(10) NOT NULL,
  `DrugName` varchar(100) NOT NULL,
  `CompanyName` varchar(32) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `drug_prescription`
--

INSERT INTO `drug_prescription` (`PrescriptionId`, `DoctorId`, `PatientId`, `DrugName`, `CompanyName`, `Quantity`) VALUES
('123', '123456789', '0012345678', 'med', 'comp', 14),
('fsdfds', '123456789', '0012345678', 'drug 1', 'Company 3', 1),
('fsdfds', '123456789', '0012345678', 'drug 2', 'Company 3', 2),
('fsdfds', '123456789', '0012345678', 'drug 3', 'Company 3', 3),
('fsdfds', '123456789', '0012345678', 'drug 4', 'Company 3', 4),
('fsdfds', '123456789', '0012345678', 'drug 5', 'Company 3', 5),
('xxx', '123456789', '0012345678', 'super LSD', 'Company 3', 9);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `NationalID` char(10) NOT NULL,
  `FirstName` varchar(32) NOT NULL,
  `LastName` varchar(32) NOT NULL,
  `Address` varchar(256) DEFAULT NULL,
  `BirthYear` year(4) NOT NULL,
  `Password` varchar(256) NOT NULL,
  `MainDoctorId` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`NationalID`, `FirstName`, `LastName`, `Address`, `BirthYear`, `Password`, `MainDoctorId`) VALUES
('0012345678', 'hashem', 'hashem', 'Tehran Azadi ave. Sharif university of technology', 1978, '', '123456789'),
('dsasdfdfa', 'ali', 'alavi', 'tehran', 1999, '123', '123456789');

-- --------------------------------------------------------

--
-- Table structure for table `pharmacy`
--

CREATE TABLE `pharmacy` (
  `Id` char(10) NOT NULL,
  `Name` varchar(32) NOT NULL,
  `Address` varchar(256) DEFAULT NULL,
  `Telephone` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pharmacy`
--

INSERT INTO `pharmacy` (`Id`, `Name`, `Address`, `Telephone`) VALUES
('123', 'drug store 1', 'tehran - right side', '123123'),
('456', 'drug store 2', 'tehran@@ left', 'r341212'),
('789', 'drug store 3', 'birjand-right', '2123');

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `Id` char(10) NOT NULL,
  `PrescriptionDate` date NOT NULL,
  `DoctorId` char(10) NOT NULL,
  `PatientId` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prescription`
--

INSERT INTO `prescription` (`Id`, `PrescriptionDate`, `DoctorId`, `PatientId`) VALUES
('123', '2020-11-02', '123456789', '0012345678'),
('456', '2020-11-01', '123456789', '0012345678'),
('fsdfds', '2020-11-25', '123456789', '0012345678'),
('gdgh', '2020-11-11', '123456789', 'dsasdfdfa'),
('xxx', '2020-11-16', '123456789', '0012345678');

-- --------------------------------------------------------

--
-- Table structure for table `sale`
--

CREATE TABLE `sale` (
  `Price` int(11) NOT NULL,
  `DrugName` varchar(100) NOT NULL,
  `CompanyName` varchar(32) NOT NULL,
  `PharmacyId` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sale`
--

INSERT INTO `sale` (`Price`, `DrugName`, `CompanyName`, `PharmacyId`) VALUES
(100, 'med', 'comp', '123'),
(99, 'med', 'comp', '456'),
(50, 'super LSD', 'Company 3', '789');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`Name`);

--
-- Indexes for table `contract`
--
ALTER TABLE `contract`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `CompanyName` (`CompanyName`),
  ADD KEY `PharmacyId` (`PharmacyId`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`NationalID`);

--
-- Indexes for table `drug`
--
ALTER TABLE `drug`
  ADD PRIMARY KEY (`Name`,`CompanyName`),
  ADD KEY `CompanyName` (`CompanyName`);

--
-- Indexes for table `drug_prescription`
--
ALTER TABLE `drug_prescription`
  ADD PRIMARY KEY (`PrescriptionId`,`DoctorId`,`PatientId`,`DrugName`,`CompanyName`),
  ADD KEY `DrugName` (`DrugName`,`CompanyName`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`NationalID`),
  ADD KEY `MainDoctorId` (`MainDoctorId`);

--
-- Indexes for table `pharmacy`
--
ALTER TABLE `pharmacy`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`Id`,`DoctorId`,`PatientId`),
  ADD KEY `DoctorId` (`DoctorId`),
  ADD KEY `PatientId` (`PatientId`);

--
-- Indexes for table `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`DrugName`,`CompanyName`,`PharmacyId`),
  ADD KEY `PharmacyId` (`PharmacyId`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contract`
--
ALTER TABLE `contract`
  ADD CONSTRAINT `contract_ibfk_1` FOREIGN KEY (`CompanyName`) REFERENCES `company` (`Name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contract_ibfk_2` FOREIGN KEY (`PharmacyId`) REFERENCES `pharmacy` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `drug`
--
ALTER TABLE `drug`
  ADD CONSTRAINT `drug_ibfk_1` FOREIGN KEY (`CompanyName`) REFERENCES `company` (`Name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `drug_prescription`
--
ALTER TABLE `drug_prescription`
  ADD CONSTRAINT `drug_prescription_ibfk_1` FOREIGN KEY (`PrescriptionId`,`DoctorId`,`PatientId`) REFERENCES `prescription` (`Id`, `DoctorId`, `PatientId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `drug_prescription_ibfk_2` FOREIGN KEY (`DrugName`,`CompanyName`) REFERENCES `drug` (`Name`, `CompanyName`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`MainDoctorId`) REFERENCES `doctor` (`NationalID`) ON UPDATE CASCADE;

--
-- Constraints for table `prescription`
--
ALTER TABLE `prescription`
  ADD CONSTRAINT `prescription_ibfk_1` FOREIGN KEY (`DoctorId`) REFERENCES `doctor` (`NationalID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prescription_ibfk_2` FOREIGN KEY (`PatientId`) REFERENCES `patient` (`NationalID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sale`
--
ALTER TABLE `sale`
  ADD CONSTRAINT `sale_ibfk_1` FOREIGN KEY (`DrugName`,`CompanyName`) REFERENCES `drug` (`Name`, `CompanyName`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sale_ibfk_2` FOREIGN KEY (`PharmacyId`) REFERENCES `pharmacy` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
