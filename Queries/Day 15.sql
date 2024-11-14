-- 37	Find all rentals made in the year 2020.
SELECT rental_id, rental_date 
FROM rental
WHERE EXTRACT(YEAR FROM rental_date) = 2020; 

-- 38	Retrieve the titles of the top 5 longest films.
SELECT film_id, title, length 
FROM Film
ORDER BY length desc LIMIT 5;

-- 39	Find all staff members who have processed rentals for customer ID 50. 
SELECT DISTINCT r.staff_id, s.first_name
FROM rental r
JOIN staff s ON s.staff_id = r.staff_id
WHERE r.customer_id = 50;
