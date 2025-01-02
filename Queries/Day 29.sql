--97	Get the list of films that have 'Commentaries' as a special feature.
SELECT f.film_id, f.title, f.special_features
FROM film f
WHERE f.special_features LIKE '%Commentaries%';

--98	Retrieve the total amount of payments made by each customer.
SELECT c.customer_id, c.first_name, c.last_name, SUM(p.amount) AS total_payments
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;