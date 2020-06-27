DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  table_name VARCHAR(255),
  id_key INT(10),
  field_name VARCHAR(255)
) ENGINE=archive;

DELIMITER //
DROP TRIGGER IF EXISTS log_users;//

CREATE TRIGGER log_users AFTER INSERT ON users
FOR EACH ROW
BEGIN
	INSERT INTO logs (table_name, id_key, field_name) VALUES (
	'users', 
	(SELECT MAX(`id`) FROM users), 
	(SELECT name FROM users WHERE id = (SELECT MAX(`id`) FROM users))
	);
END;//

CREATE TRIGGER log_catalogs AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN
	INSERT INTO logs (table_name, id_key, field_name) VALUES (
	'catalogs', 
	(SELECT MAX(`id`) FROM catalogs), 
	(SELECT name FROM catalogs WHERE id = (SELECT MAX(`id`) FROM catalogs))
	);
END;//

CREATE TRIGGER log_products AFTER INSERT ON products
FOR EACH ROW
BEGIN
	INSERT INTO logs (table_name, id_key, field_name) VALUES (
	'products', 
	(SELECT MAX(`id`) FROM products), 
	(SELECT name FROM products WHERE id = (SELECT MAX(`id`) FROM products))
	);
END;//

DELIMITER ;

