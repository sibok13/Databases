/*
Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
Следует учесть, что необходимы дни недели текущего года, а не года рождения.
*/

SELECT COUNT(*), DATE_FORMAT(CONCAT(DATE_FORMAT(NOW(), '%Y'), '-', DATE_FORMAT(DATE(birthday_at), '%m-%d')), '%W') FROM users GROUP BY birthday_at;