-- 40	Get the names of customers who have rented more than 5 films in the last 30 days.
SELECT 
    c.customer_id, 
    c.first_name, 
    COUNT(r.rental_id) AS count_of_rentals
FROM 
    customer c
JOIN 
    rental r 
ON 
    c.customer_id = r.customer_id
WHERE 
    r.rental_date >= CURRENT_DATE - interval '30' DAY
GROUP BY 
    c.customer_id, c.first_name
HAVING 
    COUNT(r.rental_id) > 5;

-- 41	Find all films that have not been rented in the last 12 months.
SELECT 
	f.film_id, f.title 
FROM 
	film f
LEFT JOIN
	inventory i
ON 
	i.film_id = f.film_id
LEFT JOIN
	rental r
ON
	i.inventory_id = r.inventory_id
GROUP BY 
	f.film_id, f.title
HAVING 
	MAX(r.rental_date) is NULL 
	OR MAX(r.rental_date) < CURRENT_DATE - interval '12' MONTH

-- 42	List all categories that have more than 20 films.
SELECT 
	c.category_id, c.name, 
	count (fc.film_id) AS film_count
FROM
	film_category fc 
JOIN category c 
	ON fc.category_id = c.category_id
GROUP BY 
	c.category_id, c.name
HAVING 
	count(fc.film_id) >20;

-- 43	Retrieve the email addresses of all customers who have made at least one payment.
SELECT 
	r.customer_id, c.email 
FROM
	customer c
JOIN
	payment r 
	ON c.customer_id = r.customer_id
GROUP BY 
	r.customer_id, c.email
HAVING
	count (r.customer_id) > 0;
	
-- 44	Find the country where customer ID 10 lives.
SELECT 
	c.country_id, 
	c.country
FROM
	country c
JOIN 
	city ct
ON 
	ct.country_id = c.country_id
JOIN
	address a 
ON 
	a.city_id = ct.city_id
JOIN 
	customer cus
ON 
	cus.address_id = a.address_id
WHERE 
	cus.customer_id = 10;

-- 45	List all films that cost exactly $2.99 to rent.
SELECT 
	film_id,
	title,
	description
FROM 
	film
WHERE 
	rental_rate = 2.99;
	