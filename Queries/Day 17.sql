-- 46	Retrieve the names of staff members who have processed payments.
SELECT 
	DISTINCT s.first_name, 
	s.last_name
FROM 
	staff s
JOIN 
	payment p 
ON 
	s.staff_id = p.staff_id;

-- 47	Find the cities with more than 10 customers.
SELECT
	count(c.customer_id) AS total_count, ct.city_id, ct.city
FROM
	customer c
JOIN 
	address a
ON
	a.address_id = c.address_id
JOIN
	city ct
ON
	ct.city_id = a.city_id
GROUP BY 
    ct.city, ct.city_id
HAVING 
    COUNT(c.customer_id) > 10; 
	
-- 48	Get the titles of films with a length less than 60 minutes.
SELECT
	film_id, 
	title,
	length
FROM
	Film
WHERE
	length < 60;

-- 49	List all rental transactions for customer ID 100.
SELECT 
	r.rental_id, 
	r.rental_date
FROM
	rental r
JOIN
	customer c 
ON
	c.customer_id = r.customer_id
WHERE 
	c.customer_id = 100;

-- 50	Retrieve the names of customers who have rented films with a rating of 'G'.
SELECT
	distinct c.customer_id,
	c.first_name
FROM
	customer c
JOIN 
	rental r
ON
	r.customer_id = c.customer_id
JOIN 
	inventory i
ON
	i.inventory_id = r.inventory_id
JOIN 
	film f
ON
	f.film_id = i.film_id
WHERE 
	rating = 'G';