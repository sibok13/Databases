/*
Таблица users была неудачно спроектирована.
Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения в формате "20.10.2017 8:10".
Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.
*/

--Проверяем типы полей в таблице users
DESC users;

--Преобразуем текстовую дату к нужному формату
UPDATE users
SET
created_at = STR_TO_DATE(created_at,'%d.%m.%Y %H:%i'),
updated_at = STR_TO_DATE(updated_at,'%d.%m.%Y %H:%i');

--Меняем тип данных столбцов
ALTER TABLE users CHANGE created_at created_at DATETIME;
ALTER TABLE users CHANGE updated_at updated_at DATETIME;