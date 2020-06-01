--Создал тестовую таблицу
use test;
CREATE TABLE users (
	id SERIAL primary key,
    firstname VARCHAR(50),
    lastname VARCHAR(50) COMMENT 'Фамилия пользователя',
    email VARCHAR(120) UNIQUE,
    phone BIGINT,
    INDEX users_phone_idx(phone), 
    INDEX users_firstname_lastname_idx(firstname, lastname)
);

--Вношу тестовые данные

INSERT INTO test.users VALUES 
('1','Ofelia','Terry','crona.jessica@example.net','89176910439'),
('2','Ceasar','Parker','teresa09@example.org','89621556566'),
('3','Kamryn','Hansen','imetz@example.org','89696313558'),
('4','Giovanni','Morar','lucile35@example.net','89333238806'),
('5','Shad','Bechtelar','vbartell@example.com','89279629341'),
('6','Myrtie','Harvey','nico.mcdermott@example.com','89144965701'),
('7','Hardy','Heidenreich','isaiah82@example.com','89482302765'),
('8','Davion','Towne','carmine28@example.com','89102180835'),
('9','Aliyah','Carter','alek87@example.net','89729844920'),
('10','Rosalyn','Crona','ally32@example.org','89246204190'),
('11','Estel','O\'Reilly','thaddeus61@example.com','89103104948'),
('12','Lori','Brown','mratke@example.net','89356751689'),
('13','Lonie','Gerlach','cassandre.leuschke@example.net','89678036996'),
('14','Victor','Beahan','rpredovic@example.org','89083587255'),
('15','Norberto','Cronin','cfahey@example.org','89153316807'),
('16','Dwight','Veum','kayley90@example.net','89986515290'),
('17','Constance','Johns','grace.mraz@example.net','89028889087'),
('18','Emma','Fisher','kaitlin.kuvalis@example.org','89944238206'),
('19','Dustin','Johnston','ehayes@example.com','89036280171'),
('20','Larry','Thiel','xdickinson@example.net','89569929534');

--Добавляю запись с присвоением данных для конкретных полей

INSERT INTO test.users
SET
	firstname = "Иванов",
	lastname = "Иван",
	email = "ivanov_i@example.net",
	phone = "89569929534"
;

--Добавляю данные из другой базы

INSERT INTO test.users (`firstname`,`lastname`,`email`,`phone`)
SELECT `firstname`,`lastname`,`email`,`phone`
FROM vk.users where vk.users.id > 20 limit 10;

--Делаю выборки

SELECT * FROM vk.users limit 2,10;

SELECT * FROM test.users WHERE firstname = "иванов";

SELECT * FROM test.users WHERE id IN (1,5,10);

--Произвожу обновление строки

UPDATE test.users
SET
	firstname = "Офелия",
	lastname = "Терри"
WHERE
	id = 1;

--Проверяю и потом удаляю строки

SELECT * FROM test.users WHERE id=31;
DELETE FROM test.users WHERE id=31;
DELETE FROM test.users WHERE id>25;

--Вставляю новые строки, чтобы убедится, что счетчик ID продолжает нумерацию с последнего значения до удаления (получился разрыв последовательности)

INSERT INTO test.users (`firstname`,`lastname`,`email`,`phone`)
SELECT `firstname`,`lastname`,`email`,`phone`
FROM vk.users where vk.users.id > 30 limit 10;

--Делаю удаление данных таблицы с обнулением счетчика ID

TRUNCATE test.users;

--Снова добавляю данные, чтобы убедится, что нумерация идет с начала.

INSERT INTO test.users (`firstname`,`lastname`,`email`,`phone`)
SELECT `firstname`,`lastname`,`email`,`phone`
FROM vk.users limit 10;
