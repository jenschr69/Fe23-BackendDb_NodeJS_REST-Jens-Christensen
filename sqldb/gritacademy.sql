-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 26, 2024 at 05:35 PM
-- Server version: 8.0.36
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gritacademy`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` bigint NOT NULL,
  `name` text COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `name`, `description`) VALUES
(3, 'Konsultrollen', 'Lär dig hur man skall tänka och agera som konsult.'),
(4, 'HTML och CSS', 'Grunderna för webbutveckling. Lär att skapa sidostruktur och styla dom.'),
(5, 'WordPress Grund', 'Lär dig grunderna i CMS systemet WordPress. Skapa tema från grunden och programmera plugins.'),
(6, 'JavaScript 1 - Grund', 'Grunderna i JavaScript.'),
(7, 'JavaScript 2 - NodeJS', 'Skapa förmulär, skicka och hämnta data från databas.'),
(8, 'Versionshantering', 'Lär dig versionshantering med GIT och GitHub.'),
(9, 'JavaScript 3 - Ramvärk', 'Lär dig JavaScript ramverk som React.js och Vue.js'),
(10, 'Agil Projektledning', 'Koordinering av utvecklingsuppgifter i ett projekt. Lär dig Atlassians verktyg.'),
(11, 'Webanalys - Grund', 'Lär dag att förbereda, sätta upp och implementera webbanalyssytem med Google Analytics och Google Tagmanager.'),
(12, 'Examensprojekt', 'Kombinera alla dina lärdomar, och skapa ett webbprojekt med Node.js där du hämntar data genom API.');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint NOT NULL,
  `fName` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lName` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `town` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `fName`, `lName`, `town`) VALUES
(1, 'Kalle', 'Jönsson', 'Malmö'),
(2, 'Nora', 'Jensen', 'Limhamn'),
(3, 'Lukas', 'Petterson', 'Malmö'),
(4, 'Andrea', 'Nilsson', 'Lund'),
(5, 'Cia', 'Alder', 'Limhamn'),
(6, 'Em', 'Kjellberg', 'Lund'),
(7, 'Andreas', 'Andersson', 'Malmö'),
(8, 'Niklas', 'Andersen', 'Helsingborg'),
(9, 'Mattias', 'Dalby', 'Dalby'),
(10, 'Pernilla', 'Lindblad', 'Malmö'),
(11, 'Amanda', 'Fredriksson', 'Ystad'),
(12, 'Kristoffer', 'Hansson', 'København'),
(13, 'Sofia', 'Willhelmsen', 'Ærø'),
(14, 'Jens', 'Jensen', 'København');

-- --------------------------------------------------------

--
-- Table structure for table `students_courses`
--

CREATE TABLE `students_courses` (
  `id` bigint NOT NULL,
  `students_id` bigint NOT NULL,
  `courses_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students_courses`
--

INSERT INTO `students_courses` (`id`, `students_id`, `courses_id`) VALUES
(4, 1, 3),
(5, 1, 4),
(6, 1, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students_courses`
--
ALTER TABLE `students_courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `courses_id` (`courses_id`),
  ADD KEY `students_id` (`students_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `students_courses`
--
ALTER TABLE `students_courses`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `students_courses`
--
ALTER TABLE `students_courses`
  ADD CONSTRAINT `students_courses_ibfk_1` FOREIGN KEY (`courses_id`) REFERENCES `courses` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `students_courses_ibfk_2` FOREIGN KEY (`students_id`) REFERENCES `students` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
