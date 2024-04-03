-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 03, 2024 at 07:41 PM
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
(5606, 880, 1, 1, 1348194),
(5607, 880, 1, 1, 1348195),
(5608, 880, 0, 1, 1348197),
(5609, 880, 0, 1, 1348198),
(5610, 880, 0, 1, 1348199),
(5611, 880, 0, 1, 1348200),
(5612, 880, 0, 1, 1348201),
(5613, 880, 0, 1, 1348202),
(5614, 880, 0, 1, 1348203),
(5615, 880, 0, 1, 1348204),
(5616, 880, 0, 1, 1348205),
(5617, 880, 0, 1, 1348206),
(5618, 880, 0, 1, 1348207),
(5619, 880, 0, 1, 1348208),
(5620, 880, 0, 1, 1348209),
(5621, 880, 0, 1, 1348210),
(5622, 880, 0, 1, 1348211);

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
(223, 1348196, 2),
(224, 1348197, 1),
(225, 1348198, 1),
(226, 1348199, 1),
(227, 1348200, 1),
(228, 1348201, 1),
(229, 1348202, 1),
(230, 1348203, 1),
(231, 1348204, 1),
(232, 1348205, 1),
(233, 1348206, 1),
(234, 1348207, 1),
(235, 1348208, 1),
(236, 1348209, 1),
(237, 1348210, 1),
(238, 1348211, 1);

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
(1348196, 'as1232@gre.ac.uk', 'Adnan Shaik'),
(1348197, 'student1@example.com', 'John Doe'),
(1348198, 'student2@example.com', 'Jane Smith'),
(1348199, 'student3@example.com', 'Michael Johnson'),
(1348200, 'student4@example.com', 'Emily Davis'),
(1348201, 'student5@example.com', 'David Brown'),
(1348202, 'student6@example.com', 'Sarah Wilson'),
(1348203, 'student7@example.com', 'James Taylor'),
(1348204, 'student8@example.com', 'Olivia Martinez'),
(1348205, 'student9@example.com', 'Daniel Anderson'),
(1348206, 'student10@example.com', 'Sophia Thomas'),
(1348207, 'student11@example.com', 'Matthew White'),
(1348208, 'student12@example.com', 'Emma Garcia'),
(1348209, 'student13@example.com', 'Christopher Lee'),
(1348210, 'student14@example.com', 'Ava Rodriguez'),
(1348211, 'student15@example.com', 'Andrew Hernandez');

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `AttendanceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5623;

--
-- AUTO_INCREMENT for table `enrollment`
--
ALTER TABLE `enrollment`
  MODIFY `EnrollmentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=239;

--
-- AUTO_INCREMENT for table `lecturer`
--
ALTER TABLE `lecturer`
  MODIFY `LectureID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `module`
--
ALTER TABLE `module`
  MODIFY `ModuleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `ScheduleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=883;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `StudentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1348212;

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
