--Get a list of all films that have not been rented out in the last 30 days. --
SELECT f.title, r.rental_date
FROM Film f
JOIN Inventory i on f.film_id = i.film_id
JOIN rental r on r.inventory_id = i.inventory_id
WHERE rental_date < (CURRENT_DATE - interval '30' DAY );

--List the top 5 highest-grossing films based on total rental payments. --
SELECT f.title, f.film_id, sum(p.amount) as revenue 
FROM film f
JOIN inventory i on i.film_id = f.film_id
JOIN rental r on r.inventory_id = i.inventory_id
JOIN payment p on p.rental_id = r.rental_id
GROUP  BY f.film_id, f.title
ORDER BY revenue desc
LIMIT 5;

--Find the staff members who have processed rentals for more than 50 different customers.--
SELECT s.staff_id, s.first_name, count(DISTINCT r.customer_id) as total_sales_staff 
FROM staff s
JOIN rental r on r.staff_id = s.staff_id
GROUP BY s.staff_id, s.first_name
HAVING count(DISTINCT r.customer_id) >50;