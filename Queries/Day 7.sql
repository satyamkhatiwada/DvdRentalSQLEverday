--18	Get the list of actors who have not acted in any films.--
SELECT a.actor_id, a.first_name
FROM actor a
LEFT JOIN film_actor fa on fa.actor_id = a.actor_id
WHERE fa.actor_id is null;

--19 Find the country with the highest number of customers.--
SELECT count(cus.customer_id) as total_customer, cou.country_id, cou.country
FROM country cou
JOIN city c on c.country_id = cou.country_id
JOIN address a on a.city_id = c.city_id
JOIN customer cus on cus.address_id = a.address_id
GROUP BY cou.country_id, cou.country
ORDER BY total_customer DESC;

--20	Retrieve the titles of all films with a rental rate greater than $5.--
