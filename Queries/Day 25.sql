--81	List all actors who have worked in more than 3 films in the 'Drama' category.
SELECT a.actor_id, a.first_name, a.last_name, COUNT(f.film_id) AS film_count
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE c.name = 'Drama'
GROUP BY a.actor_id, a.first_name, a.last_name
HAVING COUNT(f.film_id) > 3;

--82	Retrieve the number of rentals made by customer ID 50.
SELECT COUNT(rental_id) AS rental_count
FROM rental
WHERE customer_id = 50;

--83	Find all customers who live in the same city as store ID 1.
SELECT c.customer_id, c.first_name, c.last_name, c.email, c.address_id, c.active
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN store s ON ci.city_id = s.store_id
WHERE s.store_id = 1;

--84	List the staff members who have processed more than $500 in total payments.
SELECT s.staff_id, s.first_name, s.last_name, SUM(amount) AS total_payments
FROM staff s
JOIN payment p ON s.staff_id = p.staff_id
GROUP BY s.staff_id, s.first_name, s.last_name
HAVING SUM(amount) > 500;

--85	Retrieve the details of all films with a replacement cost greater than $50.
SELECT f.film_id, f.title, f.replacement_cost
FROM film f
WHERE f.replacement_cost > 50;

--86	Find the customers who have rented films from both store ID 1 and store ID 2.
SELECT c.customer_id, c.first_name, c.last_name, c.email, c.address_id, c.active
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN store s ON i.store_id = s.store_id
WHERE s.store_id IN (1, 2)
GROUP BY c.customer_id, c.first_name, c.last_name, c.email, c.address_id, c.active
HAVING COUNT(DISTINCT s.store_id) = 2;