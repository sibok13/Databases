/*
Выведите список товаров products и разделов catalogs, который соответствует товару.
*/

SELECT name, price, (SELECT name FROM catalogs WHERE id = catalog_id) AS catalog_name FROM products;