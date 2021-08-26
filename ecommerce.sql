CREATE TABLE users (
	id SERIAL PRIMARY KEY,
    name VARCHAR(80),
    email VARCHAR(120)
);


CREATE TABLE products (
	id SERIAL PRIMARY KEY,
    name VARCHAR(120),
    price NUMERIC
);


CREATE TABLE cart (
	id SERIAL PRIMARY KEY,
    users_id INTEGER NOT NULL REFERENCES users(id),
	product_id INTEGER NOT NULL REFERENCES products(id),
	quantity INTEGER
);


INSERT INTO users (name, email)
VALUES('Cade', 'cadesemail@g.com'),
('John', 'johnsemail@g.com'),
('Braydon', 'braydonsemail@g.com');


INSERT INTO products (price, name)
VALUES (99.99, 'Case'),
(299.99, 'Nintendo Switch'),
(49.99, 'Switch Case'),
(9.99, 'Beef Jerky'),
(999.99, 'Iphone');


-- I was in a hurry and I'm not sure if this is the best way to do this
INSERT INTO cart (users_id, product_id, quantity)
VALUES ((SELECT id FROM users WHERE name = 'Cade'), (SELECT id FROM products WHERE name = 'Iphone'), 1),
((SELECT id FROM users WHERE name = 'Cade'), (SELECT id FROM products WHERE name = 'Case'), 1),
((SELECT id FROM users WHERE name = 'John'), (SELECT id FROM products WHERE name = 'Nintendo Switch'), 1),
((SELECT id FROM users WHERE name = 'John'), (SELECT id FROM products WHERE name = 'Switch Case'), 1),
((SELECT id FROM users WHERE name = 'Braydon'), (SELECT id FROM products WHERE name = 'Beef Jerky'), 1),
((SELECT id FROM users WHERE name = 'Braydon'), (SELECT id FROM products WHERE name = 'Iphone'), 1);


SELECT * FROM products
WHERE id IN (
	SELECT product_id
  FROM cart
  WHERE users_id = 1
);


SELECT u.name, u.email, p.name AS in_cart 
FROM cart c
	JOIN users u
		ON u.id = c.users_id
  JOIN products p
  	ON p.id = c.product_id
ORDER BY u.id


SELECT SUM(price) FROM products
WHERE id IN (
	SELECT product_id
  FROM cart
  WHERE users_id = 1
);


UPDATE cart
SET quantity = 2
WHERE user_id = 2 AND product_id = 2;