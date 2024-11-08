--26	Retrieve the names of all countries where the store is located.
SELECT DISTINCT(country.country), s.store_id FROM 
store s
JOIN Address a on a.address_id = s.address_id
JOIN city c on c.city_id = a.city_id
JOIN country on country.country_id = c.country_id;

--27 a	Find the average replacement cost of each films in the 'Drama' category.
SELECT f.film_id, f.title, avg(f.replacement_cost) as Averge_Replacement_Cost
FROM film f
JOIN film_category fc on fc.film_id = f.film_id
JOIN category c on c.category_id = fc.category_id
WHERE c.name = 'Drama'
GROUP BY f.film_id, f.title
ORDER BY Averge_Replacement_Cost desc;

--27 b	Find the average replacement cost of all films in the 'Drama' category.
SELECT avg(f.replacement_cost) as Averge_Replacement_Cost
FROM film f
JOIN film_category fc on fc.film_id = f.film_id
JOIN category c on c.category_id = fc.category_id
WHERE c.name = 'Drama';
