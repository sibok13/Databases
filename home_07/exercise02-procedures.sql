/*
В таблице products есть два текстовых поля: name с названием товара и description с его описанием. Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема. Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены. При попытке присвоить полям NULL-значение необходимо отменить операцию.
*/


DELIMITER //
DROP TRIGGER IF EXISTS check_product_insert;//

CREATE TRIGGER check_product_insert BEFORE INSERT ON products
FOR EACH ROW
BEGIN
	IF (NEW.name = '' AND NEW.description = '') THEN
	    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Error. Хотя бы одно поле name или description не должны быть пустыми";
	END IF;
END;
//
DELIMITER ;