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

 Date: 09/07/2023 16:15:06
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
  INDEX `book_id`(`book_id` ASC) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of active_borrows
-- ----------------------------
INSERT INTO `active_borrows` VALUES (32, 3, 1, '2023-06-30 05:45:53', '2023-07-07 05:45:53', '2023-06-30 05:45:53', '2023-06-30 05:45:53');
INSERT INTO `active_borrows` VALUES (33, 8, 1, '2023-06-30 05:46:27', '2023-07-07 05:46:27', '2023-06-30 05:46:27', '2023-06-30 05:46:27');

-- ----------------------------
-- Table structure for admins
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins`  (
  `admin_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `admin_id` bigint NOT NULL,
  PRIMARY KEY (`author_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of authors
-- ----------------------------
INSERT INTO `authors` VALUES (1, 'Author 1', '2023-06-26 03:20:27', '2023-06-27 06:05:23', 1);
INSERT INTO `authors` VALUES (2, 'Author 2', '2023-06-26 03:20:27', '2023-06-27 06:05:24', 1);
INSERT INTO `authors` VALUES (3, 'Author 3', '2023-06-26 03:20:27', '2023-06-27 06:05:25', 1);
INSERT INTO `authors` VALUES (4, 'Jimmy', '2023-06-27 06:05:12', '2023-06-27 06:05:12', 1);
INSERT INTO `authors` VALUES (5, 'Whocare', '2023-06-30 00:43:00', '2023-06-30 00:43:00', 1);

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
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  INDEX `paid_to_admin_id`(`paid_to_admin_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of balance_histories
-- ----------------------------
INSERT INTO `balance_histories` VALUES (1, 5, 1, 555, '2023-06-27 06:47:33', '2023-06-27 07:10:28');
INSERT INTO `balance_histories` VALUES (2, 5, 2, 500, '2023-06-26 08:01:23', '2023-06-27 07:10:26');
INSERT INTO `balance_histories` VALUES (3, 5, 1, 500, '2023-06-27 06:48:59', '2023-06-27 06:48:59');
INSERT INTO `balance_histories` VALUES (4, 5, 1, 5, '2023-06-27 06:49:52', '2023-06-27 06:49:52');
INSERT INTO `balance_histories` VALUES (5, 1, 1, 55, '2023-06-27 06:51:03', '2023-06-27 06:51:03');
INSERT INTO `balance_histories` VALUES (6, 1, 1, 100, '2023-06-27 06:53:03', '2023-06-27 06:53:03');
INSERT INTO `balance_histories` VALUES (7, 1, 1, 50, '2023-06-27 06:53:54', '2023-06-27 06:53:54');
INSERT INTO `balance_histories` VALUES (8, 1, 1, 50, '2023-06-27 06:53:59', '2023-06-27 06:53:59');
INSERT INTO `balance_histories` VALUES (16, 1, 1, -500, '2023-06-27 07:36:46', '2023-06-27 07:36:46');
INSERT INTO `balance_histories` VALUES (17, 1, 1, -34, '2023-06-30 05:15:03', '2023-06-30 05:15:03');
INSERT INTO `balance_histories` VALUES (18, 1, 1, -1, '2023-06-30 05:15:14', '2023-06-30 05:15:14');
INSERT INTO `balance_histories` VALUES (19, 1, 1, -10, '2023-06-30 05:19:23', '2023-06-30 05:19:23');
INSERT INTO `balance_histories` VALUES (20, 2, 1, 90, '2023-06-30 05:26:16', '2023-06-30 05:26:16');
INSERT INTO `balance_histories` VALUES (21, 2, 1, 91, '2023-06-30 05:26:28', '2023-06-30 05:26:28');
INSERT INTO `balance_histories` VALUES (22, 2, 1, 90, '2023-06-30 05:27:37', '2023-06-30 05:27:37');
INSERT INTO `balance_histories` VALUES (23, 1, 1, 100, '2023-06-30 05:57:45', '2023-06-30 05:57:45');
INSERT INTO `balance_histories` VALUES (24, 1, 1, 500, '2023-07-03 01:06:29', '2023-07-03 01:06:29');
INSERT INTO `balance_histories` VALUES (25, 1, 1, -1, '2023-07-03 01:06:47', '2023-07-03 01:06:47');

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books`  (
  `book_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cover_image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `language_id` bigint NOT NULL,
  `has_active_borrow_requests` tinyint(1) NOT NULL DEFAULT 0,
  `user_borrow_count` bigint NOT NULL DEFAULT 0,
  `category_id` bigint NOT NULL,
  `add_by_admin_id` bigint NOT NULL,
  `active_borrow_id` bigint NULL DEFAULT NULL,
  `publication_id` bigint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `author_id` bigint NOT NULL,
  PRIMARY KEY (`book_id`) USING BTREE,
  INDEX `publication_id`(`publication_id` ASC) USING BTREE,
  INDEX `category_id`(`category_id` ASC) USING BTREE,
  INDEX `add_by_admin_id`(`add_by_admin_id` ASC) USING BTREE,
  INDEX `active_borrow_id`(`active_borrow_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES (1, 'Book 1', 'Description of Book 1', 'https://i.imgur.com/NXpbs1N.jpg', 1, 0, 0, 2, 2, 1, 7, '2023-06-26 03:20:27', '2023-07-09 15:53:55', 1);
INSERT INTO `books` VALUES (2, 'Book 2', 'Description of Book 2', 'https://i.imgur.com/n3J4wnm.png', 1, 0, 0, 2, 2, 2, 7, '2023-06-26 03:20:27', '2023-07-09 15:53:55', 2);
INSERT INTO `books` VALUES (3, 'Book 3', 'Description of Book 3', 'https://i.imgur.com/Z5ZhMop.jpg', 1, 1, 0, 3, 3, 3, 7, '2023-06-26 03:20:27', '2023-07-09 15:53:55', 1);
INSERT INTO `books` VALUES (4, 'Book 55', 'Description of Book 4', 'https://i.imgur.com/Z5ZhMop.jpg', 1, 0, 0, 3, 3, 3, 7, '2023-06-26 07:41:55', '2023-07-09 15:53:55', 1);
INSERT INTO `books` VALUES (5, 'Book 5', 'Description of Book 5', 'https://i.imgur.com/Z5ZhMop.jpg', 1, 0, 0, 3, 3, 3, 7, '2023-06-26 07:42:02', '2023-07-09 15:53:51', 1);
INSERT INTO `books` VALUES (8, 'How to hack', 'hack 101', 'https://i.imgur.com/tPSBfvy.jpg', 2, 1, 0, 1, 1, NULL, 7, '2023-06-28 13:09:01', '2023-07-03 04:38:22', 1);
INSERT INTO `books` VALUES (14, 'Title Who', 'Who', 'https://i.imgur.com/vRkartA.jpg', 1, 0, 0, 4, 1, NULL, 18, '2023-06-30 01:44:26', '2023-07-03 04:05:25', 5);
INSERT INTO `books` VALUES (15, 'Transaction ', 'Transaction ma money yo', 'https://i.imgur.com/T7V2GLk.jpg', 1, 0, 0, 2, 1, NULL, 19, '2023-07-01 06:37:38', '2023-07-03 04:05:26', 5);
INSERT INTO `books` VALUES (16, 'Transaction2', 'Transaction ma money yo 2', 'https://i.imgur.com/T7V2GLk.jpg', 1, 0, 0, 2, 1, NULL, 20, '2023-07-01 06:37:51', '2023-07-03 04:05:28', 5);
INSERT INTO `books` VALUES (17, 'Who', 'whoo', 'https://i.imgur.com/IYHdWPz.jpg', 1, 0, 0, 1, 1, NULL, 23, '2023-07-03 01:09:13', '2023-07-03 04:14:42', 1);
INSERT INTO `books` VALUES (18, 'LanguageShesh', 'LanguageShesh LanguageShesh LanguageShesh LanguageShesh', 'https://i.imgur.com/liNIrRW.jpg', 3, 0, 0, 1, 1, NULL, 26, '2023-07-03 04:45:24', '2023-07-03 04:45:24', 5);

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `category_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `add_by_admin_id` bigint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`category_id`) USING BTREE,
  INDEX `add_by_admin_id`(`add_by_admin_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, 'Fiction', 1, '2023-06-26 03:20:27', '2023-06-26 03:20:27');
INSERT INTO `categories` VALUES (2, 'Non-Fiction', 1, '2023-06-26 03:20:27', '2023-06-26 03:20:27');
INSERT INTO `categories` VALUES (3, 'Science Fiction', 2, '2023-06-26 03:20:27', '2023-06-26 03:20:27');
INSERT INTO `categories` VALUES (4, 'Fantasy', 1, '2023-06-26 07:30:51', '2023-06-26 07:30:51');
INSERT INTO `categories` VALUES (6, 'Dystopian', 1, '2023-06-26 07:30:51', '2023-06-26 07:30:51');
INSERT INTO `categories` VALUES (7, 'Romance', 1, '2023-06-26 07:30:51', '2023-06-26 07:30:51');
INSERT INTO `categories` VALUES (8, 'Mystery', 1, '2023-06-26 07:30:51', '2023-06-26 07:30:51');
INSERT INTO `categories` VALUES (9, 'Thriller', 1, '2023-06-26 07:30:51', '2023-06-26 07:30:51');
INSERT INTO `categories` VALUES (10, 'Horror', 1, '2023-06-26 07:30:51', '2023-06-26 07:30:51');
INSERT INTO `categories` VALUES (11, 'Historical Fiction', 1, '2023-06-26 07:30:51', '2023-06-26 07:30:51');
INSERT INTO `categories` VALUES (12, 'Biography', 1, '2023-06-26 07:30:51', '2023-06-26 07:30:51');
INSERT INTO `categories` VALUES (13, 'Computer', 1, '2023-06-27 05:30:34', '2023-06-27 05:30:34');

-- ----------------------------
-- Table structure for languages
-- ----------------------------
DROP TABLE IF EXISTS `languages`;
CREATE TABLE `languages`  (
  `language_id` bigint NOT NULL AUTO_INCREMENT,
  `language` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `admin_id` bigint NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`language_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of languages
-- ----------------------------
INSERT INTO `languages` VALUES (1, 'English', 1, '2023-07-03 04:08:41', '2023-07-03 04:08:41');
INSERT INTO `languages` VALUES (2, 'French', 1, '2023-07-03 04:35:07', '2023-07-03 04:35:07');
INSERT INTO `languages` VALUES (3, 'Korean', 1, '2023-07-03 04:36:56', '2023-07-03 04:36:56');

-- ----------------------------
-- Table structure for publication
-- ----------------------------
DROP TABLE IF EXISTS `publication`;
CREATE TABLE `publication`  (
  `publication_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `publish_year` bigint NOT NULL,
  `series_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `volume` tinyint NULL DEFAULT NULL,
  `edition` tinyint NULL DEFAULT NULL,
  `number_of_volumes` tinyint NULL DEFAULT NULL,
  `number_of_pages` tinyint NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `publisher_id` bigint NOT NULL,
  PRIMARY KEY (`publication_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of publication
-- ----------------------------
INSERT INTO `publication` VALUES (7, 2002, NULL, NULL, NULL, NULL, NULL, '2023-06-28 13:09:01', '2023-06-28 13:09:01', 1);
INSERT INTO `publication` VALUES (18, 2002, 'Who', 1, 1, 1, 127, '2023-06-30 01:44:26', '2023-06-30 01:44:26', 2);
INSERT INTO `publication` VALUES (19, 2006, 'Transaction ma money', 1, 1, NULL, 127, '2023-07-01 06:37:38', '2023-07-01 06:37:38', 2);
INSERT INTO `publication` VALUES (20, 2006, 'Transaction ma money', 1, 1, NULL, 127, '2023-07-01 06:37:51', '2023-07-01 06:37:51', 2);
INSERT INTO `publication` VALUES (23, 2002, '1111', 127, 127, 111, 127, '2023-07-03 01:09:13', '2023-07-03 01:09:13', 2);
INSERT INTO `publication` VALUES (26, 1090, 'LanguageShesh', 1, 1, 1, 127, '2023-07-03 04:45:24', '2023-07-03 04:45:24', 1);

-- ----------------------------
-- Table structure for publisher
-- ----------------------------
DROP TABLE IF EXISTS `publisher`;
CREATE TABLE `publisher`  (
  `publisher_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `city` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `admin_id` bigint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`publisher_id`) USING BTREE,
  INDEX `publication_id`(`admin_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of publisher
-- ----------------------------
INSERT INTO `publisher` VALUES (1, 'Parag', NULL, 1, '2023-06-28 12:29:11', '2023-06-28 12:29:11');
INSERT INTO `publisher` VALUES (2, 'ParaWho', NULL, 1, '2023-06-30 01:43:38', '2023-06-30 01:43:38');

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
  `return_late_by_day` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`user_borrow_history_id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  INDEX `book_id`(`book_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_borrow_history
-- ----------------------------
INSERT INTO `user_borrow_history` VALUES (1, 1, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '2023-06-26 08:01:40', '2023-06-26 09:23:26', NULL);
INSERT INTO `user_borrow_history` VALUES (2, 1, 2, '2023-06-26 03:20:27', '2023-06-30 03:09:25', '2023-06-27 03:20:27', 4, '2023-06-30 03:09:25', '2023-06-30 03:09:25', NULL);
INSERT INTO `user_borrow_history` VALUES (3, 1, 1, '2023-06-26 03:20:27', '2023-06-30 03:20:49', '2023-07-03 03:20:27', 4, '2023-06-30 03:20:49', '2023-06-30 03:20:49', NULL);
INSERT INTO `user_borrow_history` VALUES (4, 3, 1, '2023-06-26 03:20:27', '2023-06-30 03:41:09', '2023-07-03 03:20:27', 4, '2023-06-30 03:41:09', '2023-06-30 03:41:09', NULL);
INSERT INTO `user_borrow_history` VALUES (5, 3, 3, '2023-06-30 03:48:33', '2023-06-30 03:49:12', '2023-07-07 03:48:33', 0, '2023-06-30 03:49:12', '2023-06-30 03:49:12', NULL);
INSERT INTO `user_borrow_history` VALUES (6, 2, 2, '2023-06-30 03:48:33', '2023-06-30 04:04:09', '2023-07-07 03:48:33', 0, '2023-06-30 04:04:09', '2023-06-30 04:04:09', NULL);
INSERT INTO `user_borrow_history` VALUES (7, 1, 1, '2023-06-30 03:48:33', '2023-06-30 04:04:55', '2023-07-07 03:48:33', 0, '2023-06-30 04:04:55', '2023-06-30 04:04:55', NULL);
INSERT INTO `user_borrow_history` VALUES (8, 3, 3, '2023-06-30 04:06:14', '2023-06-30 04:12:51', '2023-07-07 04:06:14', 0, '2023-06-30 04:12:51', '2023-06-30 04:12:51', NULL);
INSERT INTO `user_borrow_history` VALUES (9, 2, 2, '2023-06-30 04:06:14', '2023-06-30 04:15:03', '2023-07-07 04:06:14', 0, '2023-06-30 04:15:03', '2023-06-30 04:15:03', NULL);
INSERT INTO `user_borrow_history` VALUES (10, 2, 2, '2023-06-30 04:22:49', '2023-06-30 04:24:15', '2023-07-07 04:22:49', 0, '2023-06-30 04:24:15', '2023-06-30 04:24:15', NULL);
INSERT INTO `user_borrow_history` VALUES (11, 1, 1, '2023-06-30 04:22:49', '2023-06-30 04:27:49', '2023-07-07 04:22:49', 0, '2023-06-30 04:27:49', '2023-06-30 04:27:49', NULL);
INSERT INTO `user_borrow_history` VALUES (12, 1, 1, '2023-06-30 04:06:14', '2023-06-30 04:30:01', '2023-07-07 04:06:14', 0, '2023-06-30 04:30:01', '2023-06-30 04:30:01', NULL);
INSERT INTO `user_borrow_history` VALUES (13, 3, 3, '2023-06-30 04:22:49', '2023-06-30 04:36:15', '2023-06-29 04:22:49', 0, '2023-06-30 04:36:15', '2023-06-30 04:36:15', NULL);
INSERT INTO `user_borrow_history` VALUES (14, 1, 1, '2023-06-26 03:20:27', '2023-06-30 04:41:07', '2023-06-30 03:09:25', -4, '2023-06-30 04:41:07', '2023-06-30 04:41:07', NULL);
INSERT INTO `user_borrow_history` VALUES (15, 3, 3, '2023-06-30 04:40:07', '2023-06-30 04:59:03', '2023-07-07 04:40:07', 0, '2023-06-30 04:59:03', '2023-06-30 04:59:03', 0);
INSERT INTO `user_borrow_history` VALUES (16, 2, 2, '2023-05-30 04:40:07', '2023-06-30 05:00:20', '2023-06-07 04:40:07', 31, '2023-06-30 05:00:20', '2023-06-30 05:00:20', 23);
INSERT INTO `user_borrow_history` VALUES (17, 2, 2, '2023-05-26 03:20:27', '2023-06-30 05:05:45', '2023-05-27 03:20:27', 35, '2023-06-30 05:05:45', '2023-06-30 05:05:45', 34);
INSERT INTO `user_borrow_history` VALUES (18, 1, 1, '2023-05-26 03:20:27', '2023-06-30 05:06:13', '2023-05-27 03:20:27', 35, '2023-06-30 05:06:13', '2023-06-30 05:06:13', 34);
INSERT INTO `user_borrow_history` VALUES (19, 3, 3, '2023-06-30 04:40:07', '2023-06-30 05:06:44', '2023-07-07 04:40:07', 0, '2023-06-30 05:06:44', '2023-06-30 05:06:44', 0);
INSERT INTO `user_borrow_history` VALUES (20, 3, 3, '2023-06-30 05:05:34', '2023-06-30 05:07:28', '2023-07-07 05:05:34', 0, '2023-06-30 05:07:28', '2023-06-30 05:07:28', 0);
INSERT INTO `user_borrow_history` VALUES (21, 1, 1, '2023-06-30 04:40:07', '2023-06-30 05:07:53', '2023-07-07 04:40:07', 0, '2023-06-30 05:07:53', '2023-06-30 05:07:53', 0);
INSERT INTO `user_borrow_history` VALUES (22, 2, 2, '2023-05-26 03:20:27', '2023-06-30 05:08:26', '2023-05-27 03:20:27', 35, '2023-06-30 05:08:26', '2023-06-30 05:08:26', 34);
INSERT INTO `user_borrow_history` VALUES (23, 1, 2, '2023-06-30 05:47:17', '2023-06-30 06:00:23', '2023-07-07 05:47:17', 0, '2023-06-30 06:00:23', '2023-06-30 06:00:23', 0);
INSERT INTO `user_borrow_history` VALUES (24, 1, 1, '2023-06-30 05:41:07', '2023-07-03 01:04:58', '2023-07-02 05:41:07', 3, '2023-07-03 01:04:58', '2023-07-03 01:04:58', 1);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `user_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `profile_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `balance` bigint NOT NULL DEFAULT 0,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `gender` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `email` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `contact_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `debt` bigint NULL DEFAULT 0,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'user1', 'password1', 'https://pbs.twimg.com/profile_images/557797323569250304/zpGjrYwi_400x400.png', 1369, 'sohphomore', 'Male', 'user1@example.com', '0123456', '2023-06-26 03:20:27', '2023-07-03 01:06:47', 0);
INSERT INTO `users` VALUES (2, 'user2', 'password2', 'https://pbs.twimg.com/profile_images/557797323569250304/zpGjrYwi_400x400.png', 180, NULL, NULL, 'user2@example.com', NULL, '2023-06-26 03:20:27', '2023-06-30 05:27:37', 91);
INSERT INTO `users` VALUES (3, 'user3', 'password3', 'https://pbs.twimg.com/profile_images/557797323569250304/zpGjrYwi_400x400.png', 0, NULL, NULL, 'user3@example.com', NULL, '2023-06-26 03:20:27', '2023-06-30 04:15:01', 0);
INSERT INTO `users` VALUES (4, 'test1', 'test1', 'https://pbs.twimg.com/profile_images/557797323569250304/zpGjrYwi_400x400.png', 0, NULL, 'Other', 'test1@gmail.com', NULL, '2023-06-26 06:51:36', '2023-06-26 06:51:36', 0);
INSERT INTO `users` VALUES (9, 'test2', 'test', 'https://pbs.twimg.com/profile_images/557797323569250304/zpGjrYwi_400x400.png', 0, NULL, 'Male', 'test2@gmail.com', NULL, '2023-06-26 07:01:37', '2023-06-26 07:01:37', 0);
INSERT INTO `users` VALUES (12, 'test', '123', 'https://pbs.twimg.com/profile_images/557797323569250304/zpGjrYwi_400x400.png', 0, NULL, 'Female', 'test@gmail.com', NULL, '2023-06-26 07:09:08', '2023-06-26 07:09:08', 0);

-- ----------------------------
-- View structure for book_detail
-- ----------------------------
DROP VIEW IF EXISTS `book_detail`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `book_detail` AS select `books`.`book_id` AS `book_id`,`books`.`title` AS `title`,`books`.`description` AS `description`,`books`.`cover_image` AS `cover_image`,`books`.`language_id` AS `language_id`,`books`.`has_active_borrow_requests` AS `has_active_borrow_requests`,`books`.`user_borrow_count` AS `user_borrow_count`,`books`.`category_id` AS `category_id`,`books`.`add_by_admin_id` AS `add_by_admin_id`,`books`.`active_borrow_id` AS `active_borrow_id`,`books`.`publication_id` AS `publication_id`,`books`.`created_at` AS `created_at`,`books`.`updated_at` AS `updated_at`,`books`.`author_id` AS `author_id`,`categories`.`name` AS `category_name`,`languages`.`language` AS `language`,`publisher`.`name` AS `publisher_name`,`publication`.`publish_year` AS `publish_year`,`authors`.`name` AS `author_name` from (((((`books` join `categories` on((`books`.`category_id` = `categories`.`category_id`))) join `languages` on((`books`.`language_id` = `languages`.`language_id`))) join `publication` on((`books`.`publication_id` = `publication`.`publication_id`))) join `publisher` on((`publication`.`publisher_id` = `publisher`.`publisher_id`))) join `authors` on((`authors`.`author_id` = `books`.`author_id`)));

-- ----------------------------
-- Procedure structure for insert_user_borrow_history
-- ----------------------------
DROP PROCEDURE IF EXISTS `insert_user_borrow_history`;
delimiter ;;
CREATE PROCEDURE `insert_user_borrow_history`(IN activeBorrowId BIGINT)
BEGIN
    DECLARE v_user_id BIGINT;
    DECLARE v_book_id BIGINT;
    DECLARE v_borrow_date TIMESTAMP;
    DECLARE v_return_date TIMESTAMP;
    DECLARE v_date_to_be_return TIMESTAMP;
    DECLARE v_total_borrow_day BIGINT;
    DECLARE v_return_late_by_day BIGINT;

    SELECT user_id, book_id, borrow_date, date_to_be_return
    INTO v_user_id, v_book_id, v_borrow_date, v_date_to_be_return
    FROM active_borrows
    WHERE active_borrow_id = activeBorrowId;

    SET v_return_date = NOW();
    SET v_total_borrow_day = total_borrow_day(v_borrow_date, v_return_date);
    SET v_return_late_by_day = return_late_by_day(v_return_date, v_date_to_be_return);

    INSERT INTO user_borrow_history(user_id, book_id, borrow_date, return_date, date_to_be_return, total_borrow_day, return_late_by_day)
    VALUES(v_user_id, v_book_id, v_borrow_date, v_return_date, v_date_to_be_return, v_total_borrow_day, v_return_late_by_day);
		
    DELETE FROM active_borrows WHERE active_borrow_id = activeBorrowId;

    UPDATE books SET has_active_borrow_requests = FALSE WHERE book_id = v_book_id;
END
;;
delimiter ;

-- ----------------------------
-- Function structure for return_late_by_day
-- ----------------------------
DROP FUNCTION IF EXISTS `return_late_by_day`;
delimiter ;;
CREATE FUNCTION `return_late_by_day`(return_date DATE, date_to_be_return DATE)
 RETURNS int
BEGIN
    RETURN GREATEST(0, DATEDIFF(return_date, date_to_be_return));
END
;;
delimiter ;

-- ----------------------------
-- Function structure for total_borrow_day
-- ----------------------------
DROP FUNCTION IF EXISTS `total_borrow_day`;
delimiter ;;
CREATE FUNCTION `total_borrow_day`(borrow_date DATE, return_date DATE)
 RETURNS int
  DETERMINISTIC
BEGIN
    DECLARE total_day INT;
    SET total_day = DATEDIFF(return_date, borrow_date);
    RETURN total_day;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table user_borrow_history
-- ----------------------------
DROP TRIGGER IF EXISTS `update_user_debt`;
delimiter ;;
CREATE TRIGGER `update_user_debt` AFTER INSERT ON `user_borrow_history` FOR EACH ROW BEGIN
    IF NEW.return_late_by_day > 0 THEN
        UPDATE users
        SET debt = debt + NEW.return_late_by_day
        WHERE user_id = NEW.user_id;
    END IF;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
