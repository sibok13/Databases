/*
Пусть в таблице users поля created_at и updated_at оказались незаполненными.
Заполните их текущими датой и временем.
*/

--Проверяем данные в таблицеusers
SELECT * FROM users;

--Перезаписываем даты в колонках created_at и updated_at
UPDATE users
SET
	created_at = NOW(),
	updated_at = NOW();