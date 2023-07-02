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

 Date: 03/07/2023 05:26:58
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
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books`  (
  `book_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cover_image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
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
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
  INDEX `add_by_admin_id`(`add_by_admin_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for languages
-- ----------------------------
DROP TABLE IF EXISTS `languages`;
CREATE TABLE `languages`  (
  `language_id` bigint NOT NULL AUTO_INCREMENT,
  `language` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `admin_id` bigint NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`language_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for publication
-- ----------------------------
DROP TABLE IF EXISTS `publication`;
CREATE TABLE `publication`  (
  `publication_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `publish_year` bigint NOT NULL,
  `series_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `volume` tinyint NULL DEFAULT NULL,
  `edition` tinyint NULL DEFAULT NULL,
  `number_of_volumes` tinyint NULL DEFAULT NULL,
  `number_of_pages` tinyint NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `publisher_id` bigint NOT NULL,
  PRIMARY KEY (`publication_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for publisher
-- ----------------------------
DROP TABLE IF EXISTS `publisher`;
CREATE TABLE `publisher`  (
  `publisher_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `city` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `admin_id` bigint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`publisher_id`) USING BTREE,
  INDEX `publication_id`(`admin_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
  `debt` bigint NULL DEFAULT 0,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
