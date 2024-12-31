-- 58	Find all customers who have rented films in the 'Horror' category. --
SELECT DISTINCT c.customer_id, c.first_name, c.last_name
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category cat ON fc.category_id = cat.category_id
WHERE cat.name = 'Horror';

-- 59	List the countries that have more than one store location.
SELECT country, COUNT(store_id) as store_count
FROM store s
JOIN address a ON s.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id
GROUP BY country
HAVING COUNT(store_id) > 1;

-- 60	Retrieve the email addresses of all customers who have not rented any films. --
SELECT email 
FROM customer c
WHERE NOT EXISTS (
    SELECT 1
    FROM rental r
    WHERE c.customer_id = r.customer_id
);