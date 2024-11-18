--51	Find the actor who has appeared in the most films in the 'Comedy' category.
SELECT 
	a.actor_id,
	a.first_name,
	COUNT(f.film_id) AS film_count
FROM 
	actor a
JOIN 
	film_actor fa
ON
	fa.actor_id = a.actor_id
JOIN
	film f
ON
	f.film_id = fa.film_id
JOIN 
	film_category fc
ON
	fc.film_id = f.film_id
JOIN 
	category c
ON
	c.category_id = fc.category_id
WHERE
	c.name = 'Comedy'
GROUP BY
	a.actor_id, a.first_name, a.last_name
ORDER BY
	film_count desc
LIMIT 1;