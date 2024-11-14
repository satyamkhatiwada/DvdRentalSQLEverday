-- 35	List all cities that do not have any customers.
SELECT c.city
FROM city c
LEFT JOIN address ON c.city_id = address.city_id
LEFT JOIN customer ON address.address_id = customer.address_id
WHERE customer.customer_id IS NULL;

-- 36	Get the list of all films with a rating of 'PG' and a length over 120 minutes.
SELECT film_id, title 
FROM film
WHERE LOWER(rating::TEXT) = 'pg' AND length > 120;