--71	List all actors who have worked in more than 5 films in the last year.
SELECT a.actor_id, a.first_name, a.last_name, COUNT(fa.film_id) AS film_count
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
WHERE f.release_year = YEAR(CURDATE()) - 1
GROUP BY a.actor_id, a.first_name, a.last_name
HAVING COUNT(fa.film_id) > 5;


--72	Retrieve the details of all payments made in the last 30 days.
SELECT *
FROM payment
WHERE payment_date >= CURDATE() - INTERVAL 30 DAY;

--73	Find the staff members who have processed more than 100 rentals.
SELECT s.staff_id, s.first_name, s.last_name, COUNT(r.rental_id) AS rental_count
FROM staff s
JOIN rental r ON s.staff_id = r.staff_id
GROUP BY s.staff_id, s.first_name, s.last_name
HAVING COUNT(r.rental_id) > 100;

--74	List the cities where both a store and customers are located.
SELECT DISTINCT city
FROM address
WHERE city IN (
    SELECT city
    FROM store
    JOIN address ON store.address_id = address.address_id
)
AND city IN (
    SELECT city
    FROM customer
    JOIN address ON customer.address_id = address.address_id
);

--75	Retrieve the details of films that have a rental rate between $2 and $4.
SELECT *
FROM film
WHERE rental_rate BETWEEN 2 AND 4;

--76	Find the customers who live in a country that has only one store location.
SELECT c.customer_id, c.first_name, c.last_name, a.country_id
FROM customer c
JOIN address a ON c.address_id = a.address_id
WHERE a.country_id IN (
    SELECT country_id
    FROM address
    GROUP BY country_id
    HAVING COUNT(DISTINCT city) = 1
);

--77	Get the names of customers who have rented more than 20 films.
SELECT c.customer_id, c.first_name, c.last_name, COUNT(r.rental_id) AS rental_count
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(r.rental_id) > 20;
--78	Retrieve the details of all films that have been rented by customer ID 200.
SELECT f.*
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
WHERE r.customer_id = 200;

--79	Find the total number of payments made by each customer.
SELECT customer_id, COUNT(payment_id) AS payment_count
FROM payment
GROUP BY customer_id;

--80	Get the details of all customers who have rented films with a rental duration of 7 days.
SELECT c.*
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
WHERE f.rental_duration = 7;