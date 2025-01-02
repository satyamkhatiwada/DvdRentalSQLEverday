--99	Find the actor who has worked in the most films in the 'Action' category.
SELECT a.actor_id, a.first_name, a.last_name, COUNT(f.film_id) AS film_count
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE c.name = 'Action'
GROUP BY a.actor_id, a.first_name, a.last_name
ORDER BY film_count DESC
LIMIT 1;

--100	List the titles of films that have a rental duration of 5 days or more.
SELECT f.film_id, f.title, f.rental_duration
FROM film f
WHERE f.rental_duration >= 5;