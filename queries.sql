-- 1. Display all customers
SELECT * FROM Shipping;

-- 2. Display all products
SELECT * FROM Products;

-- 3. Display all categories
SELECT * FROM Categories;

-- 4. Display all suppliers
SELECT * FROM Suppliers;

-- 5. Show products costing more than ₹5000
SELECT * FROM Products
WHERE price > 5000;

-- 6. Show products with stock less than 30
SELECT * FROM Products
WHERE stock < 30;

-- 7. Display customers from Punjab
SELECT * FROM Customers
WHERE state = 'Punjab';

-- 8. Display delivered orders
SELECT * FROM Orders
WHERE status = 'Delivered';

-- 9. Display products sorted by price
SELECT * FROM Products
ORDER BY price DESC;

-- 10. Display top 5 expensive products
SELECT * FROM Products
ORDER BY price DESC
LIMIT 5;

-- 11. Add a new customer
INSERT INTO Customers
(first_name,last_name,email,phone,address,city,state,pincode)
VALUES
('Riya','Khanna','riya@gmail.com','9876543299',
'Street 11','Delhi','Delhi','110002');

-- 12. Add a new product
INSERT INTO Products
(product_name,category_id,supplier_id,price,stock,description)
VALUES
('Bluetooth Speaker',1,1,2999,40,'Portable speaker');

-- 13. Update stock
UPDATE Products
SET stock = 100
WHERE product_id = 1;

-- 14. Update order status
UPDATE Orders
SET status = 'Delivered'
WHERE order_id = 3;

-- 15. Update customer city
UPDATE Customers
SET city = 'Mohali'
WHERE customer_id = 3;

-- 16. Delete review
DELETE FROM Reviews
WHERE review_id = 5;

-- 17. Delete cart item
DELETE FROM Cart
WHERE cart_id = 5;

-- 18. Products with category
SELECT
p.product_name,
c.category_name
FROM Products p
INNER JOIN Categories c
ON p.category_id = c.category_id;

-- 19. Products with supplier
SELECT
p.product_name,
s.supplier_name
FROM Products p
INNER JOIN Suppliers s
ON p.supplier_id = s.supplier_id;

-- 20. Customer orders
SELECT
o.order_id,
c.first_name,
o.order_date,
o.status
FROM Orders o
INNER JOIN Customers c
ON o.customer_id = c.customer_id;

-- 21. Payment details
SELECT
o.order_id,
p.payment_method,
p.payment_status
FROM Orders o
INNER JOIN Payments p
ON o.order_id = p.order_id;

-- 22. Shipping details
SELECT
o.order_id,
s.shipping_status
FROM Orders o
INNER JOIN Shipping s
ON o.order_id = s.order_id;

-- 23. Complete order information

SELECT

c.first_name,

p.product_name,

oi.quantity,

o.total_amount,

pay.payment_status

FROM Customers c

JOIN Orders o
ON c.customer_id=o.customer_id

JOIN Order_Items oi
ON o.order_id=oi.order_id

JOIN Products p
ON oi.product_id=p.product_id

JOIN Payments pay
ON o.order_id=pay.order_id;

-- 24. Total products
SELECT COUNT(*) AS TotalProducts
FROM Products;

-- 25. Total customers
SELECT COUNT(*) AS TotalCustomers
FROM Customers;

-- 26. Maximum product price
SELECT MAX(price)
FROM Products;

-- 27. Minimum product price
SELECT MIN(price)
FROM Products;

-- 28. Average product price
SELECT AVG(price)
FROM Products;

-- 29. Total sales
SELECT SUM(total_amount)
FROM Orders;

-- 30. Orders by customer

SELECT

customer_id,

COUNT(order_id) AS TotalOrders

FROM Orders

GROUP BY customer_id;

-- 31. Products per category

SELECT

category_id,

COUNT(product_id)

FROM Products

GROUP BY category_id;

-- 32. Customers having more than one order

SELECT

customer_id,

COUNT(order_id)

FROM Orders

GROUP BY customer_id

HAVING COUNT(order_id)>1;

-- 33. Most expensive product

SELECT *

FROM Products

WHERE price=(

SELECT MAX(price)

FROM Products

);

-- 34. Cheapest product

SELECT *

FROM Products

WHERE price=(

SELECT MIN(price)

FROM Products

);

-- 35. Products with low stock

SELECT *

FROM Products

WHERE stock<20;

-- 36. Pending payments

SELECT *

FROM Payments

WHERE payment_status='Pending';

-- 37. Delivered orders

SELECT *

FROM Shipping

WHERE shipping_status='Delivered';

-- 38. Total revenue

SELECT SUM(total_amount) AS Revenue

FROM Orders;

-- 39. Highest rated products

SELECT *

FROM Reviews

WHERE rating=5;

-- 40. Customer purchase history

SELECT

c.first_name,

o.order_id,

o.total_amount

FROM Customers c

JOIN Orders o

ON c.customer_id=o.customer_id;

-- 41. Products between ₹1000 and ₹10000

SELECT *

FROM Products

WHERE price BETWEEN 1000 AND 10000;

-- 42. Customers whose name starts with R

SELECT *

FROM Customers

WHERE first_name LIKE 'R%';

-- 43. Orders placed after July 1

SELECT *

FROM Orders

WHERE order_date>'2026-07-01';

-- 44. Count reviews for each product

SELECT

product_id,

COUNT(review_id)

FROM Reviews

GROUP BY product_id;

-- 45. Average rating of products

SELECT

product_id,

AVG(rating)

FROM Reviews

GROUP BY product_id;