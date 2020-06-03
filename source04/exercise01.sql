/*
Подсчитайте средний возраст пользователей в таблице users
*/

SELECT AVG(TIMESTAMPDIFF(YEAR, birthday_at, NOW())) AS avg_name FROM users;