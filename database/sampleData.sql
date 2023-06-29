INSERT INTO `active_borrows` (`book_id`, `user_id`, `borrow_date`, `date_to_be_return`) VALUES
(1, 1, '2023-05-26 03:20:27', '2023-05-27 03:20:27'),
(2, 2, '2023-05-26 03:20:27', '2023-05-27 03:20:27'),
(3, 3, NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY));
