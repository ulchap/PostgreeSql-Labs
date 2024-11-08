SELECT name, email FROM users;

SELECT * FROM products;

SELECT * FROM orders WHERE userid = 4;

UPDATE products SET price = 279.99 WHERE Id = 1;
UPDATE products SET description = NULL WHERE Id = 4;

SELECT 
	name AS product_name,
	price * quantity AS total_sum
FROM products
ORDER BY total_sum DESC;

SELECT productid, content, rating FROM reviews
WHERE productid = 3 AND rating > 8 OR productid = 1;

SELECT * FROM products WHERE description IS NULL;

SELECT * FROM carts 
WHERE productid = (SELECT id FROM products WHERE name = 'Наушники');

--последние 3 заказа
SELECT *
FROM (
    SELECT * FROM orders
    ORDER BY id DESC
    LIMIT 3)
ORDER BY id;

SELECT 
	AVG(price::numeric)::money AS average_price,
	MIN(price::numeric)::money AS min_price,
	MAX(price::numeric)::money AS max_price
FROM products;

SELECT COUNT(DISTINCT productid) FROM reviews;

SELECT SUM(price * quantity) FROM products;
	
--товар
--all products for customer
SELECT 
	p.id AS product_id,
	p.name AS product_name,
	p.description AS product_description,
	p.price AS product_price,
	c.name AS category_name
FROM 
	products p
JOIN 
	categories c ON p.categoryid = c.id;

--all products for admin/stuff
SELECT 
	p.id AS product_id,
	p.name AS product_name,
	p.description AS product_description,
	p.price AS product_price,
	c.name AS category_name,
	p.quantity AS product_quantity
FROM 
	products p
JOIN 
	categories c ON p.categoryid = c.id;

--product rating
SELECT 
	p.id AS product_id,
	p.name AS product_name,
	AVG(r.rating) AS product_rating
FROM products p
LEFT JOIN
	reviews r ON p.id = r.productid
GROUP BY 
    p.Id, p.Name
ORDER BY 
	p.id;



	








