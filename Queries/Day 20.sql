--53	Find the films that have 'Subtitles' as a special feature.
SELECT 
	title
FROM
	film
WHERE
	special_features @>Array['Subtitles'];

--54	List the staff members who have worked at both store locations.
--Since staff_id is the primary key in the staff table, it means each staff member is linked to exactly one store, indicated by the store_id field.

--55	Retrieve the details of all customers who have made payments greater than $50.
SELECT
	c.customer_id, c.first_name, p.amount
FROM
	customer c
JOIN
	payment p
ON
	c.customer_id = p.customer_id
WHERE 
	p.amount > 50;