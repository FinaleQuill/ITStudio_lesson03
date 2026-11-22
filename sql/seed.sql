USE lesson3_bookshop;

-- 只在空表中导入一次，先插作者，再插图书。
INSERT INTO authors (name, bio) VALUES
('老舍', '小说家、剧作家'),
('朱自清', '散文家'),
('冰心', '诗人、作家'),
('汪曾祺', '小说家、散文家');

-- 价格、库存是练习数据；未填写出版日期，保留为 NULL。
-- 通过作者姓名查找 id，不把作者编号写死。
INSERT INTO books (title, author_id, price, stock) VALUES
('骆驼祥子', (SELECT id FROM authors WHERE name = '老舍'), 32.00, 6),
('茶馆', (SELECT id FROM authors WHERE name = '老舍'), 20.00, 0),
('背影', (SELECT id FROM authors WHERE name = '朱自清'), 18.00, 4),
('荷塘月色', (SELECT id FROM authors WHERE name = '朱自清'), 40.00, 3),
('繁星', (SELECT id FROM authors WHERE name = '冰心'), 40.00, 0),
('春水', (SELECT id FROM authors WHERE name = '冰心'), 40.00, 5),
('受戒', (SELECT id FROM authors WHERE name = '汪曾祺'), 52.00, 2),
('人间草木', (SELECT id FROM authors WHERE name = '汪曾祺'), 28.50, 7);
