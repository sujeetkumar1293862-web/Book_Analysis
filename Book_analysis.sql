CREATE DATABASE Books;
USE Books;

SELECT * FROM books;
SELECT * FROM customers;
SELECT * FROM orders;

DESC  books;
DESC customers;
DESC orders;

-- 1....Retrieve all books in the Fiction genre

SELECT * FROM books
WHERE genre = "Fiction";

-- 2....Find books published after the year 1950

SELECT * FROM books
WHERE published_year  > 1950;

-- 3...list all customers from the canada-- 

SELECT * FROM customers
WHERE country = "canada";

-- 4...show orders placed in november 2023

SELECT * FROM orders
WHERE order_date BETWEEN "2023-11-01" AND "2023-11-30";

-- --5... retrieve the total stock of books available

SELECT SUM(stock) As Total_Stock
FROM books;

-- 6... find the details of the most expensive book

SELECT * FROM books 
ORDER BY price DESC 
LIMIT 1;

-- --7... show all customers who orderd more then 1 quantity of a book

SELECT * FROM orders
WHERE quantity > 1;

-- 8...retrieve all orders where the total amount exceeds $20-- 

SELECT * FROM orders
WHERE total_amount > 20;

-- 9.... list all genres available in the books table

SELECT DISTINCT genre FROM books;

-- 10.... find the books with the lowest stock

SELECT * FROM books 
ORDER BY stock ASC
LIMIT 1;

-- 11....calculate the total revenue generated from all orders

SELECT SUM(Total_amount) As Revenue FROM orders;

-- 12....Retrieve the total number of books sold for each genre

SELECT b.genre, SUM(o.quantity) As Total_books_sold  FROM orders o 
JOIN books b 
ON o.book_id = b.book_id
GROUP BY b.genre;

-- 13....find the average price of books in the fantasy genre

SELECT AVG(price) As AVG_price FROM books
WHERE genre = "fantasy";

-- 14....list customers who have placed at least 2 orders

SELECT customer_id, COUNT(order_id) As order_count FROM orders
GROUP BY customer_id
HAVING order_count >=2;

-- 15....find the most frequently orderd book

SELECT book_id, COUNT(order_id) As order_count FROM orders 
GROUP BY book_id
ORDER BY order_count DESC
LIMIT 1;

-- 16....show the top 3 most expensive books of Fantasy genre

SELECT * FROM books 
WHERE genre = "fantasy"
ORDER BY price DESC
LIMIT 3;

-- 17....retrieve the total quantity of books sold by each outhor 

SELECT b.author, SUM(o.quantity) As total_book_sold FROM orders o
JOIN books b
ON o.book_id = b.book_id
GROUP BY b.author;

-- 18....Find orders where Total_Amount is equal to the maximum Total_Amount in the table.

SELECT Order_ID, Total_Amount
FROM Orders
WHERE Total_Amount = (
    SELECT MAX(Total_Amount) FROM Orders
);

-- 19....find the customer who spent the most on orders

SELECT c.customer_id, c.name, SUM(o.total_amount) As total_spent FROM orders o 
JOIN customers c  
ON o.customer_id = c.customer_id
GROUP BY c.customer_id , c.name
ORDER BY total_spent DESC;


-- 20....Find all orders where the Total_Amount is greater than the average Total_Amount.

SELECT Order_ID, Total_Amount
FROM Orders
WHERE Total_Amount > (
    SELECT AVG(Total_Amount) FROM Orders
);