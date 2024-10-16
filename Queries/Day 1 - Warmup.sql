-- 1. Retrieve all the details of films that belong to the comedy category.--
SELECT f.* 
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE c.name = 'Comedy';

-- 2. List the titles of all films that have a rental duration of more than 5 days. --
SELECT title 
FROM film 
WHERE rental_duration > 5;
