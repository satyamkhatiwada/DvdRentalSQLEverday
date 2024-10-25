--15	Find the staff members who processed the highest number of rentals.--
SELECT s.staff_id, s.first_name, s.last_name, COUNT(r.rental_id) AS total_rentals
FROM staff s
JOIN rental r ON s.staff_id = r.staff_id
GROUP BY s.staff_id, s.first_name, s.last_name
ORDER BY total_rentals DESC
LIMIT 5;

--16	Retrieve the details of films that cost less than $10 to rent.--
SELECT f.film_id, f.title, f.rental_rate
FROM film f
WHERE rental_rate < 10;

--17	Find all customers who registered in the last 12 months.--
SELECT customer_id, first_name, create_date
FROM customer
WHERE create_date > (CURRENT_DATE - INTERVAL '1' YEAR);