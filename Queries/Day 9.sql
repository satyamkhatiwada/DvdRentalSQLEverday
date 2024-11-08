--24	Find the total number of rentals made by customer with ID 100.--
SELECT c.customer_id, c.first_name, r.rental_id, r.rental_date, r.staff_id
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
WHERE c.customer_id = 100;

--25	List the films that have a title containing the word 'Love'.--
SELECT *
FROM film
where LOWER(title) like '%love%';