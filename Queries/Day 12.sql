-- 31	Find the top 3 cities with the most staff members.
SELECT c.city_id, c.city, count(s.staff_id) as total_staffs
FROM city c 
JOIN address a ON a.city_id = c.city_id
JOIN staff s ON s.address_id = a.address_id
GROUP BY c.city_id, c.city
ORDER BY total_staffs desc LIMIT 3;

-- 32	List the films that have both 'Deleted Scenes' and 'Behind the Scenes' as special features.
SELECT special_features, title
FROM Film
WHERE special_features @>ARRAY['Deleted Scenes', e'Behind the Scenes'];

-- 33	Find all customers who rented films from store ID 2.
SELECT customer_id, store_id, first_name
FROM customer
WHERE store_id = 2;