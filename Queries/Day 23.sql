--61	Find the actor who has appeared in the least number of films.
SELECT actor_id, first_name, last_name, COUNT(film_id) AS film_count
FROM actor
JOIN film_actor USING (actor_id)
GROUP BY actor_id, first_name, last_name
ORDER BY film_count ASC
LIMIT 1;

--62	Get the titles of all films that were released before the year 2000.
SELECT title, release_year
FROM film
WHERE release_year < 2000;

--63	List all films that have the word 'Adventure' in their title.
SELECT title
FROM film
WHERE title LIKE '%Adventure%';

--64	Find the customers who have rented films from both store locations.
SELECT c.customer_id, c.first_name, c.last_name
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN store s ON i.store_id = s.store_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(DISTINCT s.store_id) > 1;

--65	Retrieve the details of all payments made by staff ID 2.
SELECT *
FROM payment
WHERE staff_id = 2;

--66	Get the titles of the top 10 most expensive films to rent.
SELECT title, rental_rate
FROM film
ORDER BY rental_rate DESC
LIMIT 10;

--67	Find the cities with fewer than 5 customers.
SELECT city, COUNT(customer_id) AS customer_count
FROM customer
JOIN address USING (address_id)
JOIN city USING (city_id)
GROUP BY city
HAVING COUNT(customer_id) < 5;

--68	List all films that have a length greater than 180 minutes.
SELECT title, length
FROM film
WHERE length > 180;

--69	Retrieve the names of actors who have appeared in films with a rating of 'PG-13'.
SELECT DISTINCT a.first_name, a.last_name
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
WHERE f.rating = 'PG-13';

--70	Find the customers who have rented films in the 'Action' and 'Adventure' categories.
SELECT c.customer_id, c.first_name, c.last_name
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category cat ON fc.category_id = cat.category_id
WHERE cat.name IN ('Action', 'Adventure')
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(DISTINCT cat.name) = 2;