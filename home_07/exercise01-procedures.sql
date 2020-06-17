/*
Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".
*/


DELIMITER //

DROP FUNCTION IF EXISTS hello;//

CREATE FUNCTION hello()
RETURNS VARCHAR(255) DETERMINISTIC
BEGIN
	DECLARE result varchar(255);
	IF(CURTIME() BETWEEN TIME('06:00:00') AND TIME('11:59:59')) THEN
		SET result = 'Доброе утро';
	END IF;
	IF(CURTIME() BETWEEN TIME('12:00:00') AND TIME('17:59:59')) THEN
		SET result = 'Добрый день';
	END IF;
	IF (CURTIME() BETWEEN TIME('18:00:00') AND TIME('23:59:59')) THEN
		SET result = 'Добрый вечер';
	END IF;
	IF(CURTIME() BETWEEN TIME('00:00:00') AND TIME('05:59:59')) THEN
		SET result = 'Доброй ночи';
	END IF;
	RETURN result;
END;
//
DELIMITER ;