CREATE TABLE
    `users`(
        `user_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
        `username` TEXT NOT NULL,
        `password` TEXT NOT NULL,
        `profile_url` TEXT NULL,
        `balance` BIGINT NOT NULL DEFAULT '0',
        `title` TEXT NULL,
        `gender` TEXT NULL,
        `email` TEXT NOT NULL,
        `contact_number` TEXT NULL,
        `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    );

CREATE TABLE
    `categories`(
        `category_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
        `name` TEXT NOT NULL,
        `add_by_admin_id` BIGINT NOT NULL,
        FOREIGN KEY(`add_by_admin_id`) REFERENCES `Admins`(`admin_id`),
        `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    );

CREATE TABLE
    `publisher`(
        `publisher_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
        `name` TEXT NOT NULL,
        `city` TEXT NULL,
        `publication_id` BIGINT NOT NULL,
        FOREIGN KEY(`publication_id`) REFERENCES `publication`(`publication_id`),
        `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    );

CREATE TABLE
    `books`(
        `book_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
        `title` TEXT NOT NULL,
        `description` TEXT NOT NULL,
        `cover_image` TEXT NOT NULL,
        `language` TEXT NOT NULL,
        `has_active_borrow_requests` TINYINT(1) NOT NULL DEFAULT '0',
        `user_borrow_count` BIGINT NOT NULL DEFAULT '0',
        `publish_year` BIGINT NOT NULL,
        `category_id` BIGINT NOT NULL,
        `add_by_admin_id` BIGINT NOT NULL,
        `active_borrow_id` BIGINT NOT NULL,
        `publication_id` BIGINT NOT NULL,
        FOREIGN KEY(`publication_id`) REFERENCES `publication`(`publication_id`),
        FOREIGN KEY(`category_id`) REFERENCES `Categories`(`category_id`),
        FOREIGN KEY(`add_by_admin_id`) REFERENCES `Admins`(`admin_id`),
        FOREIGN KEY(`active_borrow_id`) REFERENCES `active_borrows`(`active_borrow_id`),
        `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    );

CREATE TABLE
    `user_borrow_history`(
        `user_borrow_history_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
        `user_id` BIGINT NOT NULL,
        `book_id` BIGINT NOT NULL,
        `borrow_date` TIMESTAMP NOT NULL,
        `return_date` TIMESTAMP NOT NULL,
        `date_to_be_return` TIMESTAMP NOT NULL,
        `total_borrow_day` BIGINT NOT NULL,
        FOREIGN KEY(`user_id`) REFERENCES `Users`(`user_id`),
        FOREIGN KEY(`book_id`) REFERENCES `Books`(`book_id`),
        `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    );

CREATE TABLE
    `admins`(
        `admin_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
        `username` TEXT NOT NULL,
        `password` TEXT NOT NULL,
        `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    );

CREATE TABLE
    `balance_histories`(
        `balance_history_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
        `user_id` BIGINT NOT NULL,
        `paid_to_admin_id` BIGINT NOT NULL,
        `paid_amount` BIGINT NOT NULL,
        FOREIGN KEY(`user_id`) REFERENCES `Users`(`user_id`),
        FOREIGN KEY(`paid_to_admin_id`) REFERENCES `Admins`(`admin_id`),
        `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    );

CREATE TABLE
    `publication`(
        `publication_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
        `year` BIGINT NOT NULL,
        `series_title` TEXT NULL,
        `volume` TINYINT NULL,
        `edition` TINYINT NULL,
        `number_of_volumes` TINYINT NULL,
        `number_of_pages` TINYINT NULL,
        `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    );

CREATE TABLE
    `active_borrows`(
        `active_borrow_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
        `book_id` BIGINT NOT NULL,
        `user_id` BIGINT NOT NULL,
        `borrow_date` TIMESTAMP NOT NULL,
        `date_to_be_return` TIMESTAMP NOT NULL,
        FOREIGN KEY(`book_id`) REFERENCES `Books`(`book_id`),
        FOREIGN KEY(`user_id`) REFERENCES `Users`(`user_id`),
        `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    );

CREATE TABLE
    `authors`(
        `author_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
        `name` TEXT NOT NULL,
        `book_id` BIGINT NOT NULL,
        FOREIGN KEY(`book_id`) REFERENCES `Books`(`book_id`),
        `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    );