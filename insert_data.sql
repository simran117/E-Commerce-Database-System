INSERT INTO Categories (category_name) VALUES
('Electronics'),
('Fashion'),
('Home & Kitchen'),
('Books'),
('Sports'),
('Beauty'),
('Toys'),
('Furniture'),
('Groceries'),
('Automotive');

INSERT INTO Suppliers (supplier_name, email, phone) VALUES
('Tech World', 'techworld@gmail.com', '9876500001'),
('Fashion Hub', 'fashionhub@gmail.com', '9876500002'),
('Home Essentials', 'home@gmail.com', '9876500003'),
('Book Palace', 'books@gmail.com', '9876500004'),
('Sports Arena', 'sports@gmail.com', '9876500005'),
('Beauty Store', 'beauty@gmail.com', '9876500006'),
('Toy House', 'toy@gmail.com', '9876500007'),
('Furniture Mart', 'furniture@gmail.com', '9876500008'),
('Fresh Grocery', 'grocery@gmail.com', '9876500009'),
('Auto Parts', 'auto@gmail.com', '9876500010');

INSERT INTO Customers
(first_name,last_name,email,phone,address,city,state,pincode)
VALUES

('Rahul','Sharma','rahul@gmail.com','9876543210','Street 1','Delhi','Delhi','110001'),

('Priya','Verma','priya@gmail.com','9876543211','Street 2','Mumbai','Maharashtra','400001'),

('Amit','Singh','amit@gmail.com','9876543212','Street 3','Chandigarh','Punjab','160001'),

('Sneha','Kapoor','sneha@gmail.com','9876543213','Street 4','Jaipur','Rajasthan','302001'),

('Rohit','Kumar','rohit@gmail.com','9876543214','Street 5','Lucknow','UP','226001'),

('Anjali','Gupta','anjali@gmail.com','9876543215','Street 6','Pune','Maharashtra','411001'),

('Karan','Malhotra','karan@gmail.com','9876543216','Street 7','Jalandhar','Punjab','144001'),

('Neha','Arora','neha@gmail.com','9876543217','Street 8','Amritsar','Punjab','143001'),

('Vikas','Mehta','vikas@gmail.com','9876543218','Street 9','Ludhiana','Punjab','141001'),

('Pooja','Bansal','pooja@gmail.com','9876543219','Street 10','Noida','UP','201301');

INSERT INTO Products
(product_name,category_id,supplier_id,price,stock,description)
VALUES

('Samsung Galaxy S25',1,1,79999,30,'5G Smartphone'),

('Apple iPhone 17',1,1,99999,25,'Latest iPhone'),

('HP Laptop',1,1,65999,20,'Intel Core i7'),

('Men T-Shirt',2,2,799,120,'Cotton T-Shirt'),

('Women Jeans',2,2,1499,90,'Blue Denim'),

('Mixer Grinder',3,3,3499,40,'Kitchen Appliance'),

('Cooking Pan',3,3,999,60,'Non-stick Pan'),

('Java Programming',4,4,799,70,'Programming Book'),

('Football',5,5,1199,50,'FIFA Quality'),

('Cricket Bat',5,5,2499,35,'English Willow');

INSERT INTO Cart
(customer_id,product_id,quantity)
VALUES

(1,2,1),

(2,5,2),

(3,1,1),

(4,8,3),

(5,6,2);

INSERT INTO Orders
(customer_id,order_date,total_amount,status)
VALUES

(1,'2026-07-01',99999,'Delivered'),

(2,'2026-07-01',2998,'Shipped'),

(3,'2026-07-02',79999,'Pending'),

(4,'2026-07-02',2397,'Delivered'),

(5,'2026-07-03',6998,'Processing');

INSERT INTO Order_Items
(order_id,product_id,quantity,subtotal)
VALUES

(1,2,1,99999),

(2,5,2,2998),

(3,1,1,79999),

(4,8,3,2397),

(5,6,2,6998);

INSERT INTO Payments
(order_id,payment_method,payment_status,payment_date)
VALUES

(1,'Credit Card','Paid','2026-07-01'),

(2,'UPI','Paid','2026-07-01'),

(3,'Net Banking','Pending','2026-07-02'),

(4,'Debit Card','Paid','2026-07-02'),

(5,'Cash on Delivery','Pending','2026-07-03');

INSERT INTO Shipping
(order_id,shipping_address,delivery_date,shipping_status)
VALUES

(1,'Delhi','2026-07-04','Delivered'),

(2,'Mumbai','2026-07-05','In Transit'),

(3,'Chandigarh','2026-07-06','Processing'),

(4,'Jaipur','2026-07-05','Delivered'),

(5,'Lucknow','2026-07-07','Packed');

INSERT INTO Reviews
(customer_id,product_id,rating,comment)
VALUES

(1,2,5,'Excellent product'),

(2,5,4,'Very comfortable'),

(3,1,5,'Amazing phone'),

(4,8,4,'Helpful book'),

(5,6,5,'Works perfectly');

