-- Hello World of SQL - SELECT ALL FROM table
SELECT *
FROM film;

-- Select title, description, rating from film
SELECT title, description, rating
FROM film;

SELECT rating, description, title
FROM film;


-- WHERE clause to limit ROWS
SELECT *
FROM film
WHERE rating = 'R';

SELECT film_id, title, rating
FROM film
WHERE rating = 'PG';


-- Using WHERE clause with LIKE
SELECT film_id, title, rating
FROM film
WHERE title LIKE 'Academy Dinosaur';

-- WHERE clause with LIKE and WILDCARD (%) - 0+ characters
SELECT title, rating
FROM film
WHERE title LIKE '%e';

SELECT *
FROM actor
WHERE first_name LIKE 'T%';

-- Undescore for 'strict' wildcard - 1 and only 1 character
SELECT *
FROM actor
WHERE first_name LIKE 'T__';


-- Comparing Operators:
-- Greater Than (>) Greater Than or Equal (>=)
-- Less Than (<) Less Than or Equal (<=)
-- Not Equal (<>)

SELECT *
FROM payment
WHERE amount <= '1.99';

-- Compare Between 2 numbers
SELECT *
FROM payment
WHERE amount >= 1.99 AND amount <= 6.99;

SELECT *
FROM payment
WHERE amount BETWEEN 1.99 AND 6.99;


-- Order query results
SELECT customer_id, amount
FROM payment
WHERE amount > 4.99
ORDER BY customer_id ASC;
-- DESC for descending, ASC for ascending


SELECT *
FROM film
ORDER BY title DESC;


-- To limit the number of rows returned, use the LIMIT keyword
SELECT *
FROM film
WHERE title LIKE 'S%'
ORDER BY rental_rate DESC
LIMIT 5;


-- SQL AGGREGATIONS => SUM(), AVG(), COUNT(), MIN(), MAX()

-- Query to display the sum of amount payed that are greater than $5.99
SELECT SUM(amount)
FROM payment
WHERE amount > 5.99;

-- QUERY to count the amount of payments greater than $5.99
SELECT COUNT(*)
FROM payment
WHERE amount > 5.99;

SELECT *
FROM payment
WHERE amount > 5.99;


-- Find the number of unique amounts about 5.99
SELECT COUNT(DISTINCT amount)
FROM payment
WHERE amount > 5.99;


SELECT DISTINCT amount
FROM payment
WHERE amount > 5.99;


-- Min
SELECT MIN(amount)
FROM payment;

-- Max
SELECT MAX(amount)
FROM payment;

-- Average
SELECT AVG(amount)
FROM payment;


SELECT amount
FROM payment
WHERE amount = 6.99;


SELECT COUNT(*)
FROM payment
WHERE amount = 6.99;


-- GROUP BY clause to run aggregations on common row values in a COLUMN
SELECT amount, COUNT(*)
FROM payment
GROUP BY amount;


SELECT customer_id, SUM(amount) AS total
FROM payment
GROUP BY customer_id
ORDER BY total DESC;



-- Query to display the customer with the lowest amount of payments more than 10
SELECT customer_id, COUNT(*) as number_of_payments
FROM payment
GROUP BY customer_id
HAVING COUNT(*) > 10
ORDER BY COUNT(*) ASC;

-- SELECT *column_names or aggregations*
-- FROM table_name
-- WHERE column_name *meets a condition =, Like, >, <, etc.COLUMN
-- GROUP BY column_to_group_by_distint_values
-- HAVING aggregation meets condition
-- ORDER BY column_name (Default is ASC, DESC for descending)
-- LIMIT number_to_limit