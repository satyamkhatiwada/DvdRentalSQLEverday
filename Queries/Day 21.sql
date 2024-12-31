-- 56	Find the total number of rentals processed by each staff member.
SELECT 
    s.staff_id, 
    COUNT(r.rental_id) AS total_rentals
FROM 
    staff s
LEFT JOIN 
    rental r 
ON 
    s.staff_id = r.staff_id
GROUP BY 
    s.staff_id;

-- 57	Get the list of films released after the year 2005.
SELECT
	film_id, title
FROM 
	film
WHERE
	release_year > 2005;