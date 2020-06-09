/*
Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). Поля from, to и label содержат английские названия городов, поле name — русское. Выведите список рейсов flights с русскими названиями городов.
*/

SELECT (SELECT name FROM cities WHERE lable = from_city) AS from_city, (SELECT name FROM cities WHERE lable = to_city) AS to_city FROM flights;

CREATE TABLE flights (
  id SERIAL PRIMARY KEY,
  from_city VARCHAR(255),
  to_city VARCHAR(255)
 );

INSERT INTO flights
  (from_city, to_city)
VALUES
  ('moskow', 'omsk'),
  ('novgorod', 'kazan'),
  ('irkutsk', 'moskow'),
  ('omsk', 'irkutsk'),
  ('moskow', 'kazan');
  
 CREATE TABLE cities  (
  id SERIAL PRIMARY KEY,
  lable VARCHAR(255),
  name VARCHAR(255)
 );

INSERT INTO cities 
  (lable, name)
VALUES
  ('moskow', 'москва'),
  ('irkutsk', 'иркутск'),
  ('novgorod', 'новгород'),
  ('kazan', 'казань'),
  ('omsk', 'омск');