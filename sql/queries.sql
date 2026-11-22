USE lesson3_bookshop;

-- Q1：零库存；预期茶馆、繁星各为 0。
SELECT title, stock
FROM books
WHERE stock = 0
ORDER BY id;

-- Q2：价格前三名；预期受戒 52.00、荷塘月色 40.00、繁星 40.00。
SELECT id, title, price
FROM books
ORDER BY price DESC, id ASC
LIMIT 3;

-- Q3：价格在 20 到 40 之间（含边界）；预期 6 行。
SELECT title, price
FROM books
WHERE price BETWEEN 20 AND 40
ORDER BY price, id;

-- Q4：书名、作者名和价格；预期 8 行。
SELECT b.title, a.name AS author, b.price
FROM books AS b
JOIN authors AS a ON b.author_id = a.id
ORDER BY b.id;

-- Q5：确认后将骆驼祥子库存减 1，预期从 6 变成 5。
SELECT id, title, stock
FROM books
WHERE id = 1;

UPDATE books
SET stock = stock - 1
WHERE id = 1 AND stock > 0;

SELECT id, title, stock
FROM books
WHERE id = 1;

-- Q6：插入带唯一标记的临时书再删除，预期从 1 行变为 0 行。
INSERT INTO books (id, title, author_id, price, stock)
VALUES (1001, 'Q6临时书_20261123', 1, 1.00, 1);

SELECT id, title, stock
FROM books
WHERE id = 1001 AND title = 'Q6临时书_20261123';

DELETE FROM books
WHERE id = 1001 AND title = 'Q6临时书_20261123';

SELECT id, title, stock
FROM books
WHERE id = 1001 AND title = 'Q6临时书_20261123';
