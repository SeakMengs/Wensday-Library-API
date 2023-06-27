/*
 Navicat Premium Data Transfer

 Source Server         : yato
 Source Server Type    : MySQL
 Source Server Version : 80031 (8.0.31)
 Source Host           : localhost:3306
 Source Schema         : library_system

 Target Server Type    : MySQL
 Target Server Version : 80031 (8.0.31)
 File Encoding         : 65001

 Date: 27/06/2023 07:43:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for active_borrows
-- ----------------------------
DROP TABLE IF EXISTS `active_borrows`;
CREATE TABLE `active_borrows`  (
  `active_borrow_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `book_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `borrow_date` timestamp NOT NULL,
  `date_to_be_return` timestamp NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`active_borrow_id`) USING BTREE,
  INDEX `book_id`(`book_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of active_borrows
-- ----------------------------
INSERT INTO `active_borrows` VALUES (1, 2, 1, '2023-06-26 03:20:27', '2023-06-27 03:20:27', '2023-06-26 03:20:27', '2023-06-27 06:28:13');
INSERT INTO `active_borrows` VALUES (2, 1, 1, '2023-06-26 03:20:27', '2023-07-03 03:20:27', '2023-06-26 03:20:27', '2023-06-27 07:32:46');
INSERT INTO `active_borrows` VALUES (3, 1, 3, '2023-06-26 03:20:27', '2023-07-03 03:20:27', '2023-06-26 03:20:27', '2023-06-27 07:30:37');

-- ----------------------------
-- Table structure for admins
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins`  (
  `admin_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES (1, 'admin1', 'password1', '2023-06-26 03:20:27', '2023-06-27 06:04:40');
INSERT INTO `admins` VALUES (2, 'admin2', 'password2', '2023-06-26 03:20:27', '2023-06-26 03:20:27');
INSERT INTO `admins` VALUES (3, 'admin3', 'password3', '2023-06-26 03:20:27', '2023-06-26 03:20:27');

-- ----------------------------
-- Table structure for authors
-- ----------------------------
DROP TABLE IF EXISTS `authors`;
CREATE TABLE `authors`  (
  `author_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `admin_id` bigint NOT NULL,
  PRIMARY KEY (`author_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of authors
-- ----------------------------
INSERT INTO `authors` VALUES (1, 'Author 1', '2023-06-26 03:20:27', '2023-06-27 06:05:23', 1);
INSERT INTO `authors` VALUES (2, 'Author 2', '2023-06-26 03:20:27', '2023-06-27 06:05:24', 1);
INSERT INTO `authors` VALUES (3, 'Author 3', '2023-06-26 03:20:27', '2023-06-27 06:05:25', 1);
INSERT INTO `authors` VALUES (4, 'Jimmy', '2023-06-27 06:05:12', '2023-06-27 06:05:12', 1);

-- ----------------------------
-- Table structure for balance_histories
-- ----------------------------
DROP TABLE IF EXISTS `balance_histories`;
CREATE TABLE `balance_histories`  (
  `balance_history_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `paid_to_admin_id` bigint NOT NULL,
  `paid_amount` bigint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`balance_history_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `paid_to_admin_id`(`paid_to_admin_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of balance_histories
-- ----------------------------
INSERT INTO `balance_histories` VALUES (2, 5, 2, 500, '2023-06-26 08:01:23', '2023-06-27 07:10:26');
INSERT INTO `balance_histories` VALUES (1, 5, 1, 555, '2023-06-27 06:47:33', '2023-06-27 07:10:28');
INSERT INTO `balance_histories` VALUES (3, 5, 1, 500, '2023-06-27 06:48:59', '2023-06-27 06:48:59');
INSERT INTO `balance_histories` VALUES (4, 5, 1, 5, '2023-06-27 06:49:52', '2023-06-27 06:49:52');
INSERT INTO `balance_histories` VALUES (5, 1, 1, 55, '2023-06-27 06:51:03', '2023-06-27 06:51:03');
INSERT INTO `balance_histories` VALUES (6, 1, 1, 100, '2023-06-27 06:53:03', '2023-06-27 06:53:03');
INSERT INTO `balance_histories` VALUES (7, 1, 1, 50, '2023-06-27 06:53:54', '2023-06-27 06:53:54');
INSERT INTO `balance_histories` VALUES (8, 1, 1, 50, '2023-06-27 06:53:59', '2023-06-27 06:53:59');
INSERT INTO `balance_histories` VALUES (16, 1, 1, -500, '2023-06-27 07:36:46', '2023-06-27 07:36:46');

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books`  (
  `book_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cover_image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `language` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `has_active_borrow_requests` tinyint(1) NOT NULL DEFAULT 0,
  `user_borrow_count` bigint NOT NULL DEFAULT 0,
  `publish_year` bigint NOT NULL,
  `category_id` bigint NOT NULL,
  `add_by_admin_id` bigint NOT NULL,
  `active_borrow_id` bigint NOT NULL,
  `publication_id` bigint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `author_id` bigint NOT NULL,
  PRIMARY KEY (`book_id`) USING BTREE,
  INDEX `publication_id`(`publication_id`) USING BTREE,
  INDEX `category_id`(`category_id`) USING BTREE,
  INDEX `add_by_admin_id`(`add_by_admin_id`) USING BTREE,
  INDEX `active_borrow_id`(`active_borrow_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES (1, 'Book 1', 'Description of Book 1', 'https://i.imgur.com/NXpbs1N.jpg', 'English', 1, 0, 2000, 2, 2, 1, 1, '2023-06-26 03:20:27', '2023-06-27 05:50:38', 1);
INSERT INTO `books` VALUES (2, 'Book 2', 'Description of Book 2', 'https://i.imgur.com/n3J4wnm.png', 'English', 0, 0, 2005, 2, 2, 2, 2, '2023-06-26 03:20:27', '2023-06-27 05:50:39', 2);
INSERT INTO `books` VALUES (3, 'Book 3', 'Description of Book 3', 'https://i.imgur.com/Z5ZhMop.jpg', 'English', 0, 0, 2010, 3, 3, 3, 3, '2023-06-26 03:20:27', '2023-06-27 05:50:39', 1);
INSERT INTO `books` VALUES (4, 'Book 55', 'Description of Book 4', 'https://i.imgur.com/Z5ZhMop.jpg', 'English', 0, 0, 2010, 3, 3, 3, 3, '2023-06-26 07:41:55', '2023-06-27 05:50:41', 1);
INSERT INTO `books` VALUES (5, 'Book 5', 'Description of Book 5', 'https://i.imgur.com/Z5ZhMop.jpg', 'English', 0, 0, 2010, 3, 3, 3, 3, '2023-06-26 07:42:02', '2023-06-27 05:50:40', 1);

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `category_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `add_by_admin_id` bigint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`category_id`) USING BTREE,
  INDEX `add_by_admin_id`(`add_by_admin_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, 'Fiction', 1, '2023-06-26 03:20:27', '2023-06-26 03:20:27');
INSERT INTO `categories` VALUES (2, 'Non-Fiction', 1, '2023-06-26 03:20:27', '2023-06-26 03:20:27');
INSERT INTO `categories` VALUES (3, 'Science Fiction', 2, '2023-06-26 03:20:27', '2023-06-26 03:20:27');
INSERT INTO `categories` VALUES (4, 'Fantasy', 1, '2023-06-26 07:30:51', '2023-06-26 07:30:51');
INSERT INTO `categories` VALUES (5, 'Science Fiction', 1, '2023-06-26 07:30:51', '2023-06-26 07:30:51');
INSERT INTO `categories` VALUES (6, 'Dystopian', 1, '2023-06-26 07:30:51', '2023-06-26 07:30:51');
INSERT INTO `categories` VALUES (7, 'Romance', 1, '2023-06-26 07:30:51', '2023-06-26 07:30:51');
INSERT INTO `categories` VALUES (8, 'Mystery', 1, '2023-06-26 07:30:51', '2023-06-26 07:30:51');
INSERT INTO `categories` VALUES (9, 'Thriller', 1, '2023-06-26 07:30:51', '2023-06-26 07:30:51');
INSERT INTO `categories` VALUES (10, 'Horror', 1, '2023-06-26 07:30:51', '2023-06-26 07:30:51');
INSERT INTO `categories` VALUES (11, 'Historical Fiction', 1, '2023-06-26 07:30:51', '2023-06-26 07:30:51');
INSERT INTO `categories` VALUES (12, 'Biography', 1, '2023-06-26 07:30:51', '2023-06-26 07:30:51');
INSERT INTO `categories` VALUES (13, 'Computer', 1, '2023-06-27 05:30:34', '2023-06-27 05:30:34');

-- ----------------------------
-- Table structure for publication
-- ----------------------------
DROP TABLE IF EXISTS `publication`;
CREATE TABLE `publication`  (
  `publication_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `year` bigint NOT NULL,
  `series_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `volume` tinyint NULL DEFAULT NULL,
  `edition` tinyint NULL DEFAULT NULL,
  `number_of_volumes` tinyint NULL DEFAULT NULL,
  `number_of_pages` tinyint NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`publication_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of publication
-- ----------------------------
INSERT INTO `publication` VALUES (1, 2000, NULL, NULL, NULL, NULL, NULL, '2023-06-26 03:20:27', '2023-06-26 03:20:27');
INSERT INTO `publication` VALUES (2, 2005, NULL, NULL, NULL, NULL, NULL, '2023-06-26 03:20:27', '2023-06-26 03:20:27');
INSERT INTO `publication` VALUES (3, 2010, NULL, NULL, NULL, NULL, NULL, '2023-06-26 03:20:27', '2023-06-26 03:20:27');

-- ----------------------------
-- Table structure for publisher
-- ----------------------------
DROP TABLE IF EXISTS `publisher`;
CREATE TABLE `publisher`  (
  `publisher_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `city` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `publication_id` bigint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`publisher_id`) USING BTREE,
  INDEX `publication_id`(`publication_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of publisher
-- ----------------------------

-- ----------------------------
-- Table structure for user_borrow_history
-- ----------------------------
DROP TABLE IF EXISTS `user_borrow_history`;
CREATE TABLE `user_borrow_history`  (
  `user_borrow_history_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `book_id` bigint NOT NULL,
  `borrow_date` timestamp NOT NULL,
  `return_date` timestamp NOT NULL,
  `date_to_be_return` timestamp NOT NULL,
  `total_borrow_day` bigint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_borrow_history_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `book_id`(`book_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of user_borrow_history
-- ----------------------------
INSERT INTO `user_borrow_history` VALUES (1, 1, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '2023-06-26 08:01:40', '2023-06-26 09:23:26');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `user_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `profile_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `balance` bigint NOT NULL DEFAULT 0,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `gender` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `email` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `contact_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'user1', 'password1', 'https://pbs.twimg.com/profile_images/557797323569250304/zpGjrYwi_400x400.png', 815, 'sohphomore', 'Male', 'user1@example.com', '0123456', '2023-06-26 03:20:27', '2023-06-27 07:36:46');
INSERT INTO `users` VALUES (2, 'user2', 'password2', 'https://pbs.twimg.com/profile_images/557797323569250304/zpGjrYwi_400x400.png', 0, NULL, NULL, 'user2@example.com', NULL, '2023-06-26 03:20:27', '2023-06-27 06:18:10');
INSERT INTO `users` VALUES (3, 'user3', 'password3', 'https://pbs.twimg.com/profile_images/557797323569250304/zpGjrYwi_400x400.png', 0, NULL, NULL, 'user3@example.com', NULL, '2023-06-26 03:20:27', '2023-06-27 06:18:11');
INSERT INTO `users` VALUES (4, 'test1', 'test1', 'https://pbs.twimg.com/profile_images/557797323569250304/zpGjrYwi_400x400.png', 0, NULL, 'Other', 'test1@gmail.com', NULL, '2023-06-26 06:51:36', '2023-06-26 06:51:36');
INSERT INTO `users` VALUES (12, 'test', '123', 'https://pbs.twimg.com/profile_images/557797323569250304/zpGjrYwi_400x400.png', 0, NULL, 'Female', 'test@gmail.com', NULL, '2023-06-26 07:09:08', '2023-06-26 07:09:08');
INSERT INTO `users` VALUES (9, 'test2', 'test', 'https://pbs.twimg.com/profile_images/557797323569250304/zpGjrYwi_400x400.png', 0, NULL, 'Male', 'test2@gmail.com', NULL, '2023-06-26 07:01:37', '2023-06-26 07:01:37');

SET FOREIGN_KEY_CHECKS = 1;
