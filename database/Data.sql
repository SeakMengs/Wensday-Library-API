-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 09, 2023 at 09:17 AM
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

--
-- Dumping data for table `active_borrows`
--

INSERT INTO `active_borrows` (`active_borrow_id`, `book_id`, `user_id`, `borrow_date`, `date_to_be_return`, `created_at`, `updated_at`) VALUES
(32, 3, 1, '2023-06-29 22:45:53', '2023-07-06 22:45:53', '2023-06-29 22:45:53', '2023-06-29 22:45:53'),
(33, 8, 1, '2023-06-29 22:46:27', '2023-07-06 22:46:27', '2023-06-29 22:46:27', '2023-06-29 22:46:27');

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `username`, `password`, `created_at`, `updated_at`) VALUES
(1, 'admin1', 'password1', '2023-06-25 20:20:27', '2023-06-26 23:04:40'),
(2, 'admin2', 'password2', '2023-06-25 20:20:27', '2023-06-25 20:20:27'),
(3, 'admin3', 'password3', '2023-06-25 20:20:27', '2023-06-25 20:20:27');

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`author_id`, `name`, `created_at`, `updated_at`, `admin_id`) VALUES
(1, 'Author 1', '2023-06-25 20:20:27', '2023-06-26 23:05:23', 1),
(2, 'Author 2', '2023-06-25 20:20:27', '2023-06-26 23:05:24', 1),
(3, 'Author 3', '2023-06-25 20:20:27', '2023-06-26 23:05:25', 1),
(4, 'Jimmy', '2023-06-26 23:05:12', '2023-06-26 23:05:12', 1),
(5, 'Whocare', '2023-06-29 17:43:00', '2023-06-29 17:43:00', 1);

--
-- Dumping data for table `balance_histories`
--

INSERT INTO `balance_histories` (`balance_history_id`, `user_id`, `paid_to_admin_id`, `paid_amount`, `created_at`, `updated_at`) VALUES
(1, 5, 1, 555, '2023-06-26 23:47:33', '2023-06-27 00:10:28'),
(2, 5, 2, 500, '2023-06-26 01:01:23', '2023-06-27 00:10:26'),
(3, 5, 1, 500, '2023-06-26 23:48:59', '2023-06-26 23:48:59'),
(4, 5, 1, 5, '2023-06-26 23:49:52', '2023-06-26 23:49:52'),
(5, 1, 1, 55, '2023-06-26 23:51:03', '2023-06-26 23:51:03'),
(6, 1, 1, 100, '2023-06-26 23:53:03', '2023-06-26 23:53:03'),
(7, 1, 1, 50, '2023-06-26 23:53:54', '2023-06-26 23:53:54'),
(8, 1, 1, 50, '2023-06-26 23:53:59', '2023-06-26 23:53:59'),
(16, 1, 1, -500, '2023-06-27 00:36:46', '2023-06-27 00:36:46'),
(17, 1, 1, -34, '2023-06-29 22:15:03', '2023-06-29 22:15:03'),
(18, 1, 1, -1, '2023-06-29 22:15:14', '2023-06-29 22:15:14'),
(19, 1, 1, -10, '2023-06-29 22:19:23', '2023-06-29 22:19:23'),
(20, 2, 1, 90, '2023-06-29 22:26:16', '2023-06-29 22:26:16'),
(21, 2, 1, 91, '2023-06-29 22:26:28', '2023-06-29 22:26:28'),
(22, 2, 1, 90, '2023-06-29 22:27:37', '2023-06-29 22:27:37'),
(23, 1, 1, 100, '2023-06-29 22:57:45', '2023-06-29 22:57:45'),
(24, 1, 1, 500, '2023-07-02 18:06:29', '2023-07-02 18:06:29'),
(25, 1, 1, -1, '2023-07-02 18:06:47', '2023-07-02 18:06:47');

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_id`, `title`, `description`, `cover_image`, `language_id`, `has_active_borrow_requests`, `user_borrow_count`, `category_id`, `add_by_admin_id`, `active_borrow_id`, `publication_id`, `created_at`, `updated_at`, `author_id`) VALUES
(1, 'Book 1', 'Description of Book 1', 'https://i.imgur.com/NXpbs1N.jpg', 1, 0, 0, 2, 2, 1, 7, '2023-06-25 20:20:27', '2023-07-09 08:53:55', 1),
(2, 'Book 2', 'Description of Book 2', 'https://i.imgur.com/n3J4wnm.png', 1, 0, 0, 2, 2, 2, 7, '2023-06-25 20:20:27', '2023-07-09 08:53:55', 2),
(3, 'Book 3', 'Description of Book 3', 'https://i.imgur.com/Z5ZhMop.jpg', 1, 1, 0, 3, 3, 3, 7, '2023-06-25 20:20:27', '2023-07-09 08:53:55', 1),
(4, 'Book 55', 'Description of Book 4', 'https://i.imgur.com/Z5ZhMop.jpg', 1, 0, 0, 3, 3, 3, 7, '2023-06-26 00:41:55', '2023-07-09 08:53:55', 1),
(5, 'Book 5', 'Description of Book 5', 'https://i.imgur.com/Z5ZhMop.jpg', 1, 0, 0, 3, 3, 3, 7, '2023-06-26 00:42:02', '2023-07-09 08:53:51', 1),
(8, 'How to hack', 'hack 101', 'https://i.imgur.com/tPSBfvy.jpg', 2, 1, 0, 1, 1, NULL, 7, '2023-06-28 06:09:01', '2023-07-02 21:38:22', 1),
(14, 'Title Who', 'Who', 'https://i.imgur.com/vRkartA.jpg', 1, 0, 0, 4, 1, NULL, 18, '2023-06-29 18:44:26', '2023-07-02 21:05:25', 5),
(15, 'Transaction ', 'Transaction ma money yo', 'https://i.imgur.com/T7V2GLk.jpg', 1, 0, 0, 2, 1, NULL, 19, '2023-06-30 23:37:38', '2023-07-02 21:05:26', 5),
(16, 'Transaction2', 'Transaction ma money yo 2', 'https://i.imgur.com/T7V2GLk.jpg', 1, 0, 0, 2, 1, NULL, 20, '2023-06-30 23:37:51', '2023-07-02 21:05:28', 5),
(17, 'Who', 'whoo', 'https://i.imgur.com/IYHdWPz.jpg', 1, 0, 0, 1, 1, NULL, 23, '2023-07-02 18:09:13', '2023-07-02 21:14:42', 1),
(18, 'LanguageShesh', 'LanguageShesh LanguageShesh LanguageShesh LanguageShesh', 'https://i.imgur.com/liNIrRW.jpg', 3, 0, 0, 1, 1, NULL, 26, '2023-07-02 21:45:24', '2023-07-02 21:45:24', 5);

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `add_by_admin_id`, `created_at`, `updated_at`) VALUES
(1, 'Fiction', 1, '2023-06-25 20:20:27', '2023-06-25 20:20:27'),
(2, 'Non-Fiction', 1, '2023-06-25 20:20:27', '2023-06-25 20:20:27'),
(3, 'Science Fiction', 2, '2023-06-25 20:20:27', '2023-06-25 20:20:27'),
(4, 'Fantasy', 1, '2023-06-26 00:30:51', '2023-06-26 00:30:51'),
(6, 'Dystopian', 1, '2023-06-26 00:30:51', '2023-06-26 00:30:51'),
(7, 'Romance', 1, '2023-06-26 00:30:51', '2023-06-26 00:30:51'),
(8, 'Mystery', 1, '2023-06-26 00:30:51', '2023-06-26 00:30:51'),
(9, 'Thriller', 1, '2023-06-26 00:30:51', '2023-06-26 00:30:51'),
(10, 'Horror', 1, '2023-06-26 00:30:51', '2023-06-26 00:30:51'),
(11, 'Historical Fiction', 1, '2023-06-26 00:30:51', '2023-06-26 00:30:51'),
(12, 'Biography', 1, '2023-06-26 00:30:51', '2023-06-26 00:30:51'),
(13, 'Computer', 1, '2023-06-26 22:30:34', '2023-06-26 22:30:34');

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`language_id`, `language`, `admin_id`, `created_at`, `updated_at`) VALUES
(1, 'English', 1, '2023-07-02 21:08:41', '2023-07-02 21:08:41'),
(2, 'French', 1, '2023-07-02 21:35:07', '2023-07-02 21:35:07'),
(3, 'Korean', 1, '2023-07-02 21:36:56', '2023-07-02 21:36:56');

--
-- Dumping data for table `publication`
--

INSERT INTO `publication` (`publication_id`, `publish_year`, `series_title`, `volume`, `edition`, `number_of_volumes`, `number_of_pages`, `created_at`, `updated_at`, `publisher_id`) VALUES
(7, 2002, NULL, NULL, NULL, NULL, NULL, '2023-06-28 06:09:01', '2023-06-28 06:09:01', 1),
(18, 2002, 'Who', 1, 1, 1, 127, '2023-06-29 18:44:26', '2023-06-29 18:44:26', 2),
(19, 2006, 'Transaction ma money', 1, 1, NULL, 127, '2023-06-30 23:37:38', '2023-06-30 23:37:38', 2),
(20, 2006, 'Transaction ma money', 1, 1, NULL, 127, '2023-06-30 23:37:51', '2023-06-30 23:37:51', 2),
(23, 2002, '1111', 127, 127, 111, 127, '2023-07-02 18:09:13', '2023-07-02 18:09:13', 2),
(26, 1090, 'LanguageShesh', 1, 1, 1, 127, '2023-07-02 21:45:24', '2023-07-02 21:45:24', 1);

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`publisher_id`, `name`, `city`, `admin_id`, `created_at`, `updated_at`) VALUES
(1, 'Parag', NULL, 1, '2023-06-28 05:29:11', '2023-06-28 05:29:11'),
(2, 'ParaWho', NULL, 1, '2023-06-29 18:43:38', '2023-06-29 18:43:38');

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `profile_url`, `balance`, `title`, `gender`, `email`, `contact_number`, `created_at`, `updated_at`, `debt`) VALUES
(1, 'user1', 'password1', 'https://pbs.twimg.com/profile_images/557797323569250304/zpGjrYwi_400x400.png', 1369, 'sohphomore', 'Male', 'user1@example.com', '0123456', '2023-06-25 20:20:27', '2023-07-02 18:06:47', 0),
(2, 'user2', 'password2', 'https://pbs.twimg.com/profile_images/557797323569250304/zpGjrYwi_400x400.png', 180, NULL, NULL, 'user2@example.com', NULL, '2023-06-25 20:20:27', '2023-06-29 22:27:37', 91),
(3, 'user3', 'password3', 'https://pbs.twimg.com/profile_images/557797323569250304/zpGjrYwi_400x400.png', 0, NULL, NULL, 'user3@example.com', NULL, '2023-06-25 20:20:27', '2023-06-29 21:15:01', 0),
(4, 'test1', 'test1', 'https://pbs.twimg.com/profile_images/557797323569250304/zpGjrYwi_400x400.png', 0, NULL, 'Other', 'test1@gmail.com', NULL, '2023-06-25 23:51:36', '2023-06-25 23:51:36', 0),
(9, 'test2', 'test', 'https://pbs.twimg.com/profile_images/557797323569250304/zpGjrYwi_400x400.png', 0, NULL, 'Male', 'test2@gmail.com', NULL, '2023-06-26 00:01:37', '2023-06-26 00:01:37', 0),
(12, 'test', '123', 'https://pbs.twimg.com/profile_images/557797323569250304/zpGjrYwi_400x400.png', 0, NULL, 'Female', 'test@gmail.com', NULL, '2023-06-26 00:09:08', '2023-06-26 00:09:08', 0);

--
-- Dumping data for table `user_borrow_history`
--

INSERT INTO `user_borrow_history` (`user_borrow_history_id`, `user_id`, `book_id`, `borrow_date`, `return_date`, `date_to_be_return`, `total_borrow_day`, `created_at`, `updated_at`, `return_late_by_day`) VALUES
(1, 1, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '2023-06-26 01:01:40', '2023-06-26 02:23:26', NULL),
(2, 1, 2, '2023-06-25 20:20:27', '2023-06-29 20:09:25', '2023-06-26 20:20:27', 4, '2023-06-29 20:09:25', '2023-06-29 20:09:25', NULL),
(3, 1, 1, '2023-06-25 20:20:27', '2023-06-29 20:20:49', '2023-07-02 20:20:27', 4, '2023-06-29 20:20:49', '2023-06-29 20:20:49', NULL),
(4, 3, 1, '2023-06-25 20:20:27', '2023-06-29 20:41:09', '2023-07-02 20:20:27', 4, '2023-06-29 20:41:09', '2023-06-29 20:41:09', NULL),
(5, 3, 3, '2023-06-29 20:48:33', '2023-06-29 20:49:12', '2023-07-06 20:48:33', 0, '2023-06-29 20:49:12', '2023-06-29 20:49:12', NULL),
(6, 2, 2, '2023-06-29 20:48:33', '2023-06-29 21:04:09', '2023-07-06 20:48:33', 0, '2023-06-29 21:04:09', '2023-06-29 21:04:09', NULL),
(7, 1, 1, '2023-06-29 20:48:33', '2023-06-29 21:04:55', '2023-07-06 20:48:33', 0, '2023-06-29 21:04:55', '2023-06-29 21:04:55', NULL),
(8, 3, 3, '2023-06-29 21:06:14', '2023-06-29 21:12:51', '2023-07-06 21:06:14', 0, '2023-06-29 21:12:51', '2023-06-29 21:12:51', NULL),
(9, 2, 2, '2023-06-29 21:06:14', '2023-06-29 21:15:03', '2023-07-06 21:06:14', 0, '2023-06-29 21:15:03', '2023-06-29 21:15:03', NULL),
(10, 2, 2, '2023-06-29 21:22:49', '2023-06-29 21:24:15', '2023-07-06 21:22:49', 0, '2023-06-29 21:24:15', '2023-06-29 21:24:15', NULL),
(11, 1, 1, '2023-06-29 21:22:49', '2023-06-29 21:27:49', '2023-07-06 21:22:49', 0, '2023-06-29 21:27:49', '2023-06-29 21:27:49', NULL),
(12, 1, 1, '2023-06-29 21:06:14', '2023-06-29 21:30:01', '2023-07-06 21:06:14', 0, '2023-06-29 21:30:01', '2023-06-29 21:30:01', NULL),
(13, 3, 3, '2023-06-29 21:22:49', '2023-06-29 21:36:15', '2023-06-28 21:22:49', 0, '2023-06-29 21:36:15', '2023-06-29 21:36:15', NULL),
(14, 1, 1, '2023-06-25 20:20:27', '2023-06-29 21:41:07', '2023-06-29 20:09:25', -4, '2023-06-29 21:41:07', '2023-06-29 21:41:07', NULL),
(15, 3, 3, '2023-06-29 21:40:07', '2023-06-29 21:59:03', '2023-07-06 21:40:07', 0, '2023-06-29 21:59:03', '2023-06-29 21:59:03', 0),
(16, 2, 2, '2023-05-29 21:40:07', '2023-06-29 22:00:20', '2023-06-06 21:40:07', 31, '2023-06-29 22:00:20', '2023-06-29 22:00:20', 23),
(17, 2, 2, '2023-05-25 20:20:27', '2023-06-29 22:05:45', '2023-05-26 20:20:27', 35, '2023-06-29 22:05:45', '2023-06-29 22:05:45', 34),
(18, 1, 1, '2023-05-25 20:20:27', '2023-06-29 22:06:13', '2023-05-26 20:20:27', 35, '2023-06-29 22:06:13', '2023-06-29 22:06:13', 34),
(19, 3, 3, '2023-06-29 21:40:07', '2023-06-29 22:06:44', '2023-07-06 21:40:07', 0, '2023-06-29 22:06:44', '2023-06-29 22:06:44', 0),
(20, 3, 3, '2023-06-29 22:05:34', '2023-06-29 22:07:28', '2023-07-06 22:05:34', 0, '2023-06-29 22:07:28', '2023-06-29 22:07:28', 0),
(21, 1, 1, '2023-06-29 21:40:07', '2023-06-29 22:07:53', '2023-07-06 21:40:07', 0, '2023-06-29 22:07:53', '2023-06-29 22:07:53', 0),
(22, 2, 2, '2023-05-25 20:20:27', '2023-06-29 22:08:26', '2023-05-26 20:20:27', 35, '2023-06-29 22:08:26', '2023-06-29 22:08:26', 34),
(23, 1, 2, '2023-06-29 22:47:17', '2023-06-29 23:00:23', '2023-07-06 22:47:17', 0, '2023-06-29 23:00:23', '2023-06-29 23:00:23', 0),
(24, 1, 1, '2023-06-29 22:41:07', '2023-07-02 18:04:58', '2023-07-01 22:41:07', 3, '2023-07-02 18:04:58', '2023-07-02 18:04:58', 1);

-- --------------------------------------------------------

--
-- Structure for view `book_detail`
--
DROP TABLE IF EXISTS `book_detail`;

DROP VIEW IF EXISTS `book_detail`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `book_detail`  AS SELECT `books`.`book_id` AS `book_id`, `books`.`title` AS `title`, `books`.`description` AS `description`, `books`.`cover_image` AS `cover_image`, `books`.`language_id` AS `language_id`, `books`.`has_active_borrow_requests` AS `has_active_borrow_requests`, `books`.`user_borrow_count` AS `user_borrow_count`, `books`.`category_id` AS `category_id`, `books`.`add_by_admin_id` AS `add_by_admin_id`, `books`.`active_borrow_id` AS `active_borrow_id`, `books`.`publication_id` AS `publication_id`, `books`.`created_at` AS `created_at`, `books`.`updated_at` AS `updated_at`, `books`.`author_id` AS `author_id`, `categories`.`name` AS `category_name`, `languages`.`language` AS `language`, `publisher`.`name` AS `publisher_name`, `publication`.`publish_year` AS `publish_year`, `authors`.`name` AS `author_name` FROM (((((`books` join `categories` on((`books`.`category_id` = `categories`.`category_id`))) join `languages` on((`books`.`language_id` = `languages`.`language_id`))) join `publication` on((`books`.`publication_id` = `publication`.`publication_id`))) join `publisher` on((`publication`.`publisher_id` = `publisher`.`publisher_id`))) join `authors` on((`authors`.`author_id` = `books`.`author_id`)))  ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
