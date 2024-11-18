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
-- 48	Get the titles of films with a length less than 60 minutes.
-- 49	List all rental transactions for customer ID 100.
-- 50	Retrieve the names of customers who have rented films with a rating of 'G'.
