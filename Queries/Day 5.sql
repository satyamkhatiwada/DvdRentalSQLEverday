--11	Find the film with the longest runtime. --
SELECT f.title, f.length
FROM film f
ORDER BY length DESC
LIMIT 1;
--12	Get the average rental rate for films in the 'Horror' category.--
SELECT f.film_id, f.title, AVG(f.rental_rate) AS Average_Rate
FROM film f
JOIN film_category fc ON fc.film_id = f.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE c.name = 'Horror'
GROUP BY f.film_id, f.title;
--13	Retrieve the list of all unique postal codes from the address table.--
SELECT DISTINCT(postal_code)
FROM address;
--14	List all films that have never been rented.--
select f.film_id, f.title, i.inventory_id, r.rental_id from film f
left join inventory i on f.film_id = i.film_id
left join rental r on r.inventory_id = i.inventory_id
where r.rental_id is null;
