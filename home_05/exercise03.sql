/*
Определить кто больше поставил лайков (всего) - мужчины или женщины?
*/

SELECT gender, COUNT(gender) FROM profiles WHERE user_id IN (SELECT user_id FROM likes) GROUP BY gender ORDER BY (COUNT(gender)) DESC LIMIT 1;