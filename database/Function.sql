-- ------------------------------ Function ------------------------------
DELIMITER //
CREATE FUNCTION total_borrow_day(borrow_date DATE, return_date DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total_day INT;
    SET total_day = DATEDIFF(return_date, borrow_date);
    RETURN total_day;
END //
DELIMITER ;

-- ------------------------------ Function ------------------------------
CREATE FUNCTION return_late_by_day(return_date DATE, date_to_be_return DATE)
RETURNS INT
BEGIN
    RETURN GREATEST(0, DATEDIFF(return_date, date_to_be_return));
END;


-- ------------------------------ Procedure ------------------------------

DELIMITER //
CREATE PROCEDURE insert_user_borrow_history(IN activeBorrowId BIGINT)
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
END //
DELIMITER ;

-- ------------------------------ TRIGGER ------------------------------

DELIMITER //
CREATE TRIGGER update_user_debt
AFTER INSERT ON user_borrow_history
FOR EACH ROW
BEGIN
    IF NEW.return_late_by_day > 0 THEN
        UPDATE users
        SET debt = debt + NEW.return_late_by_day
        WHERE user_id = NEW.user_id;
    END IF;
END //
DELIMITER ;
