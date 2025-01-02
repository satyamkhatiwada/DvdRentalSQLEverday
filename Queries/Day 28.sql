--94	List the categories that have less than 10 films.
SELECT c.category_id, c.name, COUNT(f.film_id) AS film_count
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
GROUP BY c.category_id, c.name
HAVING COUNT(f.film_id) < 10;

--95	Retrieve the details of all films that have not been rented in the last 3 months.
SELECT f.film_id, f.title, f.release_year, f.rental_rate
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id
WHERE r.rental_date IS NULL OR r.rental_date < DATE_SUB(NOW(), INTERVAL 3 MONTH)
GROUP BY f.film_id, f.title, f.release_year, f.rental_rate;

--96	Find the customers who have made more than 5 payments in the last 30 days.
SELECT c.customer_id, c.first_name, c.last_name, COUNT(p.payment_id) AS payment_count
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
WHERE p.payment_date > DATE_SUB(NOW(), INTERVAL 30 DAY)
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(p.payment_id) > 5;