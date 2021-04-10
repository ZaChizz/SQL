-- sudo -u postgres psql
-- psql -U <username>

-- \l - show databases
-- \q - quit database
-- \d - show relations
-- \d+ <tablename> -- show relation info


CREATE USER shop LOGIN CREATEDB PASSWORD 'shop';
CREATE DATABASE shop WITH OWNER=shop ENCODING='UTF8';

CREATE TABLE "category" (
    category_id SERIAL PRIMARY KEY,
    category_title VARCHAR(100) NOT NULL
);

INSERT INTO "category" (category_title) VALUES ('Smartphones'), ('Tablets'), ('Watch');
SELECT * FROM "category";
SELECT category_title FROM "category" WHERE category_id >= 2;

CREATE TABLE "item" (
    item_id SERIAL PRIMARY KEY,
    category_id INTEGER NOT NULL,
    item_title VARCHAR(100) NOT NULL,
    item_price NUMERIC(8, 2) NOT NULL
);


INSERT INTO "item" (category_id, item_title, item_price) VALUES
(1, 'iPhone', 999.99),
(1, 'Xiaomi', 499.99),
(2, 'iPad', 1999.99),
(2, 'Lenovo', 500.00),
(3, 'iWatch', 499.99),
(3, 'Samsung', 700.00);

SELECT * FROM item ORDER BY item_price DESC;
SELECT * FROM item WHERE category_id <= 2 ORDER BY item_price DESC;

-- 1. Создать базу данных shop.
-- 2. Создать юзера shop и дать ему полный доступ к БД shop.
-- 4. Создать таблицу для хранения категорий (хранить название).
-- 5. Добавить несколько категорий.
-- 6. Создать таблицу для хранения товаров (название, категория, цена).
-- 7. Внести несколько товаров по цене 1.00
-- 8. Обновить цену первого товара — 3.50
update item set item_price = 3.50 where item_id = 1;
-- 9. Увеличить цену всех товаров на 10%.
update item set item_price = item_price * 1.1;
-- 10. Удалить товар № 2.
delete from item WHERE item_id = 2;
-- 11. Выбрать все товары с сортировкой по названию.
select item_title from item order by item_title ASC;
-- 12. Выбрать все товары с сортировкой по убыванию цены.
select item_title from item order by item_price DESC;
-- 13. Выбрать 3 самых дорогих товара.
select item_title from item order by item_price DESC limit 3;
-- 14. Выбрать 3 самых дешевых товара.
select item_title from item order by item_price ASC limit 3;
-- 15. Выбрать вторую тройку самых дорогих товаров (с 4 по 6).
select item_title from item order by item_price DESC limit 2 offset 4;
-- 16. Выбрать наименование самого дорогого товара.
select item_title from item order by item_price DESC limit 1;
-- 17. Выбрать наименование самого дешевого товара.
select item_title from item order by item_price ASC limit 1;

-- 18. Выбрать количество всех товаров.
select count(item_id) from item;
-- 19. Выбрать среднюю цену всех товаров.
select avg(item_price) from item;