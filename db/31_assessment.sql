-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 24, 2024 at 02:43 PM
-- Server version: 10.6.18-MariaDB-0ubuntu0.22.04.1
-- PHP Version: 8.1.2-1ubuntu2.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `31_assessment`
--

-- --------------------------------------------------------

--
-- Table structure for table `majors`
--

CREATE TABLE `majors` (
  `id` int(11) NOT NULL,
  `name` varchar(75) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `fill` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `majors`
--

INSERT INTO `majors` (`id`, `name`, `capacity`, `fill`) VALUES
(4, 'Tata Busana', 20, 11),
(5, 'Fotogradi dan Videografi', 20, 12),
(6, 'Teknik Komputer dan Jaringan', 20, 15),
(26, 'Aplikasi Perkantoran', 20, 15),
(27, 'Desain Grafis', 20, 11),
(28, 'Kuliner', 20, 10),
(29, 'Otomotif', 20, 13),
(31, 'Sastra Jepang', 20, 10),
(32, 'Sastra Inggris', 20, 10);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `nis` varchar(10) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `pob` varchar(75) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `major_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `nis`, `name`, `gender`, `pob`, `dob`, `major_id`) VALUES
(5, '000001', 'hana', 'Perempuan', 'bumi', '2024-10-01', 31),
(7, '00000233', 'hanaa', 'Perempuan', 'bumi', '2024-10-01', 32),
(9, '000003', 'jana', 'Laki-laki', 'bumi', '2024-10-01', 6);

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `subject` varchar(75) NOT NULL,
  `hours` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `subject`, `hours`) VALUES
(1, 'SCC ', 1111);

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` int(11) NOT NULL,
  `nip` varchar(10) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `pob` varchar(75) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `subject_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `majors`
--
ALTER TABLE `majors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nis` (`nis`),
  ADD KEY `major_id` (`major_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nis` (`nip`),
  ADD KEY `subject_id` (`subject_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `majors`
--
ALTER TABLE `majors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`major_id`) REFERENCES `majors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
