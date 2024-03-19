-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 19, 2024 at 02:34 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `attendancedb`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `AttendanceID` int(11) NOT NULL,
  `ScheduleID` int(11) NOT NULL,
  `Attended` tinyint(1) NOT NULL,
  `ModuleID` int(11) NOT NULL,
  `StudentID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`AttendanceID`, `ScheduleID`, `Attended`, `ModuleID`, `StudentID`) VALUES
(5555, 880, 0, 1, 1348194),
(5557, 881, 0, 2, 1348196);

-- --------------------------------------------------------

--
-- Table structure for table `enrollment`
--

CREATE TABLE `enrollment` (
  `EnrollmentID` int(11) NOT NULL,
  `StudentID` int(11) NOT NULL,
  `ModuleID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enrollment`
--

INSERT INTO `enrollment` (`EnrollmentID`, `StudentID`, `ModuleID`) VALUES
(221, 1348194, 1),
(222, 1348195, 1),
(223, 1348196, 2);

-- --------------------------------------------------------

--
-- Table structure for table `lecturer`
--

CREATE TABLE `lecturer` (
  `LectureID` int(11) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `NAME` varchar(30) NOT NULL,
  `ModuleID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lecturer`
--

INSERT INTO `lecturer` (`LectureID`, `Email`, `NAME`, `ModuleID`) VALUES
(111, 'john.doe@example.com', 'John Doe', 1),
(112, 'jane.smith@example.com', 'Jane Smith', 2),
(113, 'michael.johnson@example.com', 'Michael Johnson', 3);

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE `module` (
  `ModuleID` int(11) NOT NULL,
  `ShortCode` varchar(50) NOT NULL,
  `LongName` varchar(255) NOT NULL,
  `TotalStudents` int(11) NOT NULL,
  `LectureID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `module`
--

INSERT INTO `module` (`ModuleID`, `ShortCode`, `LongName`, `TotalStudents`, `LectureID`) VALUES
(1, 'COMP1610', 'Programming Enterprise Components', 50, 111),
(2, 'COMP2010', 'Big Data', 45, 112),
(3, 'COMP3112', 'Data Visulisation', 60, 113),
(4, 'Test Data', 'Big module', 60, 111),
(5, 'COmp12w', 'Test Name', 20, 111),
(6, 'CS101', 'Introduction to Computer Science', 30, 111),
(7, 'ENG102', 'English Composition', 25, 111),
(8, 'MATH103', 'Calculus I', 35, 111),
(9, 'PHY104', 'Physics Fundamentals', 40, 111),
(10, 'CHEM105', 'Chemistry Basics', 28, 111),
(11, 'BIO106', 'Introduction to Biology', 32, 111),
(12, 'HIST107', 'World History', 27, 111),
(13, 'ECON108', 'Principles of Economics', 33, 111),
(14, 'PSYC109', 'Introduction to Psychology', 29, 111),
(15, 'SOC110', 'Sociology Fundamentals', 31, 111),
(16, 'PHIL111', 'Philosophy Essentials', 26, 111),
(17, 'ART112', 'Art Appreciation', 23, 111),
(18, 'MUS113', 'Music Theory', 24, 111),
(19, 'THTR114', 'Theater Arts Introduction', 22, 111),
(20, 'LANG115', 'Language Studies', 21, 111),
(21, 'EDUC116', 'Foundations of Education', 19, 111),
(22, 'GEOL117', 'Geology Basics', 18, 111),
(23, 'ASTR118', 'Introduction to Astronomy', 17, 111),
(24, 'ANTH119', 'Cultural Anthropology', 16, 111);

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `ScheduleID` int(11) NOT NULL,
  `ScheduleDate` date NOT NULL,
  `ScheduleTime` time NOT NULL,
  `Duration` int(11) NOT NULL,
  `ModuleID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`ScheduleID`, `ScheduleDate`, `ScheduleTime`, `Duration`, `ModuleID`) VALUES
(880, '2024-03-10', '09:00:00', 60, 1),
(881, '2024-03-12', '10:00:00', 90, 2),
(882, '2024-03-15', '11:00:00', 60, 3);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `StudentID` int(11) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `NAME` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`StudentID`, `Email`, `NAME`) VALUES
(1348194, 'ms6451k@gre.ac.uk', 'Mahima Shrestha'),
(1348195, 'sc5643@gre.ac.uk', 'Sujata Chand'),
(1348196, 'as1232@gre.ac.uk', 'Adnan Shaik');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`AttendanceID`),
  ADD KEY `ModuleID` (`ModuleID`),
  ADD KEY `ScheduleID` (`ScheduleID`),
  ADD KEY `StudentID` (`StudentID`);

--
-- Indexes for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD PRIMARY KEY (`EnrollmentID`),
  ADD KEY `ModuleID` (`ModuleID`),
  ADD KEY `StudentID` (`StudentID`);

--
-- Indexes for table `lecturer`
--
ALTER TABLE `lecturer`
  ADD PRIMARY KEY (`LectureID`),
  ADD KEY `ModuleID` (`ModuleID`);

--
-- Indexes for table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`ModuleID`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`ScheduleID`),
  ADD KEY `ModuleID` (`ModuleID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`StudentID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`ModuleID`) REFERENCES `module` (`ModuleID`),
  ADD CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`ScheduleID`) REFERENCES `schedules` (`ScheduleID`),
  ADD CONSTRAINT `attendance_ibfk_3` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`);

--
-- Constraints for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD CONSTRAINT `enrollment_ibfk_1` FOREIGN KEY (`ModuleID`) REFERENCES `module` (`ModuleID`),
  ADD CONSTRAINT `enrollment_ibfk_2` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`);

--
-- Constraints for table `lecturer`
--
ALTER TABLE `lecturer`
  ADD CONSTRAINT `lecturer_ibfk_1` FOREIGN KEY (`ModuleID`) REFERENCES `module` (`ModuleID`);

--
-- Constraints for table `schedules`
--
ALTER TABLE `schedules`
  ADD CONSTRAINT `schedules_ibfk_1` FOREIGN KEY (`ModuleID`) REFERENCES `module` (`ModuleID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
