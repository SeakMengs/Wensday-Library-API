INSERT INTO `users` (`username`, `password`, `email`) VALUES
('user1', 'password1', 'user1@example.com'),
('user2', 'password2', 'user2@example.com'),
('user3', 'password3', 'user3@example.com');

INSERT INTO `admins` (`username`, `password`) VALUES
('admin1', 'password1'),
('admin2', 'password2'),
('admin3', 'password3');

INSERT INTO `categories` (`name`, `add_by_admin_id`) VALUES
('Fiction', 1),
('Non-Fiction', 1),
('Science Fiction', 2);

INSERT INTO `publication` (`year`) VALUES
(2000),
(2005),
(2010);

INSERT INTO `books` (`title`, `description`, `cover_image`, `language`, `publish_year`, `category_id`, `add_by_admin_id`, `publication_id`, `active_borrow_id`) VALUES
('Book 1', 'Description of Book 1', 'image1.jpg', 'English', 2000, 1, 1, 1, 1),
('Book 2', 'Description of Book 2', 'image2.jpg', 'English', 2005, 2, 2, 2, 2),
('Book 3', 'Description of Book 3', 'image3.jpg', 'English', 2010, 3, 3, 3, 3);


INSERT INTO `authors` (`name`, `book_id`) VALUES
('Author 1', 1),
('Author 2', 2),
('Author 3', 3);

INSERT INTO `active_borrows` (`book_id`, `user_id`, `borrow_date`, `date_to_be_return`) VALUES
(1, 1, NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY)),
(2, 2, NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY)),
(3, 3, NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY));
