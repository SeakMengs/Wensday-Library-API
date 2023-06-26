-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 26, 2023 at 02:47 AM
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
-- Database: `library_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `active_borrows`
--

DROP TABLE IF EXISTS `active_borrows`;
CREATE TABLE IF NOT EXISTS `active_borrows` (
  `active_borrow_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `book_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `borrow_date` timestamp NOT NULL,
  `date_to_be_return` timestamp NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`active_borrow_id`),
  KEY `book_id` (`book_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `active_borrows`
--

INSERT INTO `active_borrows` (`active_borrow_id`, `book_id`, `user_id`, `borrow_date`, `date_to_be_return`, `created_at`, `updated_at`) VALUES
(1, 2, 1, '2023-06-25 20:20:27', '2023-07-02 20:20:27', '2023-06-25 20:20:27', '2023-06-26 02:02:59'),
(2, 1, 2, '2023-06-25 20:20:27', '2023-07-02 20:20:27', '2023-06-25 20:20:27', '2023-06-26 02:06:04'),
(3, 3, 3, '2023-06-25 20:20:27', '2023-07-02 20:20:27', '2023-06-25 20:20:27', '2023-06-25 20:20:27');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
CREATE TABLE IF NOT EXISTS `admins` (
  `admin_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `username`, `password`, `created_at`, `updated_at`) VALUES
(1, 'admin1', 'password1', '2023-06-25 20:20:27', '2023-06-25 20:20:27'),
(2, 'admin2', 'password2', '2023-06-25 20:20:27', '2023-06-25 20:20:27'),
(3, 'admin3', 'password3', '2023-06-25 20:20:27', '2023-06-25 20:20:27');

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
CREATE TABLE IF NOT EXISTS `authors` (
  `author_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `book_id` bigint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`author_id`),
  KEY `book_id` (`book_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`author_id`, `name`, `book_id`, `created_at`, `updated_at`) VALUES
(1, 'Author 1', 2, '2023-06-25 20:20:27', '2023-06-26 02:30:10'),
(2, 'Author 2', 1, '2023-06-25 20:20:27', '2023-06-26 02:30:21'),
(3, 'Author 3', 3, '2023-06-25 20:20:27', '2023-06-25 20:20:27');

-- --------------------------------------------------------

--
-- Table structure for table `balance_histories`
--

DROP TABLE IF EXISTS `balance_histories`;
CREATE TABLE IF NOT EXISTS `balance_histories` (
  `balance_history_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `paid_to_admin_id` bigint NOT NULL,
  `paid_amount` bigint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`balance_history_id`),
  KEY `user_id` (`user_id`),
  KEY `paid_to_admin_id` (`paid_to_admin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `balance_histories`
--

INSERT INTO `balance_histories` (`balance_history_id`, `user_id`, `paid_to_admin_id`, `paid_amount`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 500, '2023-06-26 01:01:23', '2023-06-26 01:59:56');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
CREATE TABLE IF NOT EXISTS `books` (
  `book_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `cover_image` text NOT NULL,
  `language` text NOT NULL,
  `has_active_borrow_requests` tinyint(1) NOT NULL DEFAULT '0',
  `user_borrow_count` bigint NOT NULL DEFAULT '0',
  `publish_year` bigint NOT NULL,
  `category_id` bigint NOT NULL,
  `add_by_admin_id` bigint NOT NULL,
  `active_borrow_id` bigint NOT NULL,
  `publication_id` bigint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`book_id`),
  KEY `publication_id` (`publication_id`),
  KEY `category_id` (`category_id`),
  KEY `add_by_admin_id` (`add_by_admin_id`),
  KEY `active_borrow_id` (`active_borrow_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_id`, `title`, `description`, `cover_image`, `language`, `has_active_borrow_requests`, `user_borrow_count`, `publish_year`, `category_id`, `add_by_admin_id`, `active_borrow_id`, `publication_id`, `created_at`, `updated_at`) VALUES
(1, 'Book 1', 'Description of Book 1', 'https://i.imgur.com/NXpbs1N.jpg', 'English', 0, 0, 2000, 2, 2, 1, 1, '2023-06-25 20:20:27', '2023-06-26 02:27:52'),
(2, 'Book 2', 'Description of Book 2', 'https://i.imgur.com/n3J4wnm.png', 'English', 0, 0, 2005, 2, 2, 2, 2, '2023-06-25 20:20:27', '2023-06-26 00:39:06'),
(3, 'Book 3', 'Description of Book 3', 'https://i.imgur.com/Z5ZhMop.jpg', 'English', 0, 0, 2010, 3, 3, 3, 3, '2023-06-25 20:20:27', '2023-06-26 00:39:10'),
(4, 'Book 4', 'Description of Book 4', 'https://i.imgur.com/Z5ZhMop.jpg', 'English', 0, 0, 2010, 3, 3, 3, 3, '2023-06-26 00:41:55', '2023-06-26 00:41:55'),
(5, 'Book 5', 'Description of Book 5', 'https://i.imgur.com/Z5ZhMop.jpg', 'English', 0, 0, 2010, 3, 3, 3, 3, '2023-06-26 00:42:02', '2023-06-26 00:42:02');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `category_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `add_by_admin_id` bigint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`category_id`),
  KEY `add_by_admin_id` (`add_by_admin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `add_by_admin_id`, `created_at`, `updated_at`) VALUES
(1, 'Fiction', 1, '2023-06-25 20:20:27', '2023-06-25 20:20:27'),
(2, 'Non-Fiction', 1, '2023-06-25 20:20:27', '2023-06-25 20:20:27'),
(3, 'Science Fiction', 2, '2023-06-25 20:20:27', '2023-06-25 20:20:27'),
(4, 'Fantasy', 1, '2023-06-26 00:30:51', '2023-06-26 00:30:51'),
(5, 'Science Fiction', 1, '2023-06-26 00:30:51', '2023-06-26 00:30:51'),
(6, 'Dystopian', 1, '2023-06-26 00:30:51', '2023-06-26 00:30:51'),
(7, 'Romance', 1, '2023-06-26 00:30:51', '2023-06-26 00:30:51'),
(8, 'Mystery', 1, '2023-06-26 00:30:51', '2023-06-26 00:30:51'),
(9, 'Thriller', 1, '2023-06-26 00:30:51', '2023-06-26 00:30:51'),
(10, 'Horror', 1, '2023-06-26 00:30:51', '2023-06-26 00:30:51'),
(11, 'Historical Fiction', 1, '2023-06-26 00:30:51', '2023-06-26 00:30:51'),
(12, 'Biography', 1, '2023-06-26 00:30:51', '2023-06-26 00:30:51');

-- --------------------------------------------------------

--
-- Table structure for table `publication`
--

DROP TABLE IF EXISTS `publication`;
CREATE TABLE IF NOT EXISTS `publication` (
  `publication_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `year` bigint NOT NULL,
  `series_title` text,
  `volume` tinyint DEFAULT NULL,
  `edition` tinyint DEFAULT NULL,
  `number_of_volumes` tinyint DEFAULT NULL,
  `number_of_pages` tinyint DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`publication_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `publication`
--

INSERT INTO `publication` (`publication_id`, `year`, `series_title`, `volume`, `edition`, `number_of_volumes`, `number_of_pages`, `created_at`, `updated_at`) VALUES
(1, 2000, NULL, NULL, NULL, NULL, NULL, '2023-06-25 20:20:27', '2023-06-25 20:20:27'),
(2, 2005, NULL, NULL, NULL, NULL, NULL, '2023-06-25 20:20:27', '2023-06-25 20:20:27'),
(3, 2010, NULL, NULL, NULL, NULL, NULL, '2023-06-25 20:20:27', '2023-06-25 20:20:27');

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
CREATE TABLE IF NOT EXISTS `publisher` (
  `publisher_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `city` text,
  `publication_id` bigint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`publisher_id`),
  KEY `publication_id` (`publication_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `profile_url` text,
  `balance` bigint NOT NULL DEFAULT '0',
  `title` text,
  `gender` text,
  `email` text NOT NULL,
  `contact_number` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `profile_url`, `balance`, `title`, `gender`, `email`, `contact_number`, `created_at`, `updated_at`) VALUES
(1, 'user1', 'password1', 'https://pbs.twimg.com/profile_images/557797323569250304/zpGjrYwi_400x400.png', 0, 'sohphomore', 'Male', 'user1@example.com', '0123456', '2023-06-25 20:20:27', '2023-06-26 00:51:10'),
(2, 'user2', 'password2', NULL, 0, NULL, NULL, 'user2@example.com', NULL, '2023-06-25 20:20:27', '2023-06-25 20:20:27'),
(3, 'user3', 'password3', NULL, 0, NULL, NULL, 'user3@example.com', NULL, '2023-06-25 20:20:27', '2023-06-25 20:20:27'),
(4, 'test1', 'test1', 'https://pbs.twimg.com/profile_images/557797323569250304/zpGjrYwi_400x400.png', 0, NULL, 'Other', 'test1@gmail.com', NULL, '2023-06-25 23:51:36', '2023-06-25 23:51:36'),
(12, 'test', '123', 'https://pbs.twimg.com/profile_images/557797323569250304/zpGjrYwi_400x400.png', 0, NULL, 'Female', 'test@gmail.com', NULL, '2023-06-26 00:09:08', '2023-06-26 00:09:08'),
(9, 'test2', 'test', 'https://pbs.twimg.com/profile_images/557797323569250304/zpGjrYwi_400x400.png', 0, NULL, 'Male', 'test2@gmail.com', NULL, '2023-06-26 00:01:37', '2023-06-26 00:01:37');

-- --------------------------------------------------------

--
-- Table structure for table `user_borrow_history`
--

DROP TABLE IF EXISTS `user_borrow_history`;
CREATE TABLE IF NOT EXISTS `user_borrow_history` (
  `user_borrow_history_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `book_id` bigint NOT NULL,
  `borrow_date` timestamp NOT NULL,
  `return_date` timestamp NOT NULL,
  `date_to_be_return` timestamp NOT NULL,
  `total_borrow_day` bigint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_borrow_history_id`),
  KEY `user_id` (`user_id`),
  KEY `book_id` (`book_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_borrow_history`
--

INSERT INTO `user_borrow_history` (`user_borrow_history_id`, `user_id`, `book_id`, `borrow_date`, `return_date`, `date_to_be_return`, `total_borrow_day`, `created_at`, `updated_at`) VALUES
(1, 1, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '2023-06-26 01:01:40', '2023-06-26 02:23:26');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
