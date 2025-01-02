-- 87	Get the list of films that have a title containing the word 'War'.
SELECT f.film_id, f.title
FROM film f
WHERE f.title LIKE '%War%';

-- 88	Retrieve the total number of rentals made by customer ID 10 in the last 6 months.
SELECT COUNT(rental_id) AS rental_count
FROM rental
WHERE customer_id = 10
AND rental_date >= DATE_SUB(NOW(), INTERVAL 6 MONTH);

-- 89	Find the films that have been rented more than 50 times.
SELECT f.film_id, f.title, COUNT(r.rental_id) AS rental_count
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.film_id, f.title
HAVING COUNT(r.rental_id) > 50;

-- 90	List all films that have 'Trailers' as a special feature.
SELECT f.film_id, f.title
FROM film f
WHERE f.special_features LIKE '%Trailers%';