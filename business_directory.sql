-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 20, 2023 at 07:13 PM
-- Server version: 8.0.31
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `business_directory`
--

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
CREATE TABLE IF NOT EXISTS `company` (
  `id` int NOT NULL AUTO_INCREMENT,
  `companyuser_id` int NOT NULL,
  `name` text NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `companyuser_id` (`companyuser_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `companyuser_id`, `name`, `create_at`) VALUES
(1, 1, 'Amazon', '2023-04-26 15:47:21'),
(3, 2, 'amazon2', '2023-05-11 16:46:39');

-- --------------------------------------------------------

--
-- Table structure for table `companyuser`
--

DROP TABLE IF EXISTS `companyuser`;
CREATE TABLE IF NOT EXISTS `companyuser` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `companyuser`
--

INSERT INTO `companyuser` (`id`, `name`, `create_at`) VALUES
(1, 'jack', '2023-04-26 15:01:37'),
(2, 'tom', '2023-04-26 15:01:37');

-- --------------------------------------------------------

--
-- Table structure for table `downvote`
--

DROP TABLE IF EXISTS `downvote`;
CREATE TABLE IF NOT EXISTS `downvote` (
  `id` int NOT NULL AUTO_INCREMENT,
  `downvote` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `downvote`
--

INSERT INTO `downvote` (`id`, `downvote`, `company_id`) VALUES
(3, 1, 1),
(4, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
CREATE TABLE IF NOT EXISTS `feedback` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `feedback` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `company_id`, `feedback`, `create_at`) VALUES
(1, 1, 'i like this company', '2023-04-26 15:58:04'),
(2, 3, 'i dislike this company', '2023-04-26 15:58:04');

-- --------------------------------------------------------

--
-- Table structure for table `feedbackstar`
--

DROP TABLE IF EXISTS `feedbackstar`;
CREATE TABLE IF NOT EXISTS `feedbackstar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `star` int DEFAULT NULL,
  `feedback_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `feedback_id` (`feedback_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `feedbackstar`
--

INSERT INTO `feedbackstar` (`id`, `star`, `feedback_id`) VALUES
(1, 3, 1),
(2, 3, 1),
(3, 5, 2),
(4, 5, 2),
(5, 5, 2),
(6, 5, 1),
(7, 5, 2),
(8, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
CREATE TABLE IF NOT EXISTS `service` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `service` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`id`, `company_id`, `service`, `create_at`) VALUES
(1, 1, 'online shop', '2023-04-26 15:58:26'),
(2, 1, 'drop shipping', '2023-04-26 15:58:26');

-- --------------------------------------------------------

--
-- Table structure for table `upvote`
--

DROP TABLE IF EXISTS `upvote`;
CREATE TABLE IF NOT EXISTS `upvote` (
  `id` int NOT NULL AUTO_INCREMENT,
  `upvote` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `upvote`
--

INSERT INTO `upvote` (`id`, `upvote`, `company_id`) VALUES
(3, 1, 1),
(4, 1, 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
