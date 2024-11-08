--26	Retrieve the names of all countries where the store is located.
SELECT DISTINCT(country.country), s.store_id FROM 
store s
JOIN Address a on a.address_id = s.address_id
JOIN city c on c.city_id = a.city_id
JOIN country on country.country_id = c.country_id;

--27	Find the average replacement cost of films in the 'Drama' category.
--28	Get the titles of films that have a rental duration of exactly 3 days.
--29	List all actors whose first name starts with 'M'.
--30	Retrieve the addresses of all customers who live in 'Texas'.
