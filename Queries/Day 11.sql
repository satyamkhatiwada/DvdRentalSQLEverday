--28	Get the titles of films that have a rental duration of exactly 3 days.
SELECT film_id, title
FROM Film
WHERE rental_duration = 3;

--29	List all actors whose first name starts with 'M'.
SELECT actor_id, first_name
FROM actor
WHERE first_name LIKE 'M%';

--30	Retrieve the addresses of all customers who live in 'Texas'.
SELECT c.customer_id, c.first_name
FROM customer c
JOIN address a on a.address_id = c.address_id
JOIN city ct on ct.city_id = a.city_id
WHERE ct.city = 'Texas';