/*
В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0, если товар закончился и выше нуля, если на складе имеются запасы. Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. Однако, нулевые запасы должны выводиться в конце, после всех записей.
*/

--Вариант 1
select value from storehouses_products order by if(value = 0, 1,0), value;

--Вариант 2
select value from storehouses_products order by value = 0, value;