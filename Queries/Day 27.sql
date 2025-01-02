-- 91	Retrieve the details of the most expensive rental made by customer ID 100.
SELECT r.rental_id, r.rental_date, r.return_date, r.customer_id, r.staff_id, r.last_update
FROM rental r
WHERE r.customer_id = 100
ORDER BY r.rental_rate DESC
LIMIT 1;

-- 92	Get the titles of all films with a replacement cost of exactly $20.
SELECT f.film_id, f.title, f.replacement_cost
FROM film f
WHERE f.replacement_cost = 20.00;

-- 93	Find the customers who have rented films with a rating of 'NC-17'.
SELECT c.customer_id, c.first_name, c.last_name
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
WHERE f.rating = 'NC-17'
GROUP BY c.customer_id, c.first_name, c.last_name;