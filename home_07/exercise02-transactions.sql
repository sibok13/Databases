/*
Создайте представление, которое выводит название name товарной позиции из таблицы products и соответствующее название каталога name из таблицы catalogs.
*/

use shop;

CREATE OR REPLACE VIEW prod AS SELECT name AS product, (SELECT name FROM catalogs WHERE id=products.catalog_id) AS catalog FROM products;

SELECT * FROM prod;