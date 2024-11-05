
-- 21A. Find all sotres located in same city with any customer --
SELECT s.store_id, cus.customer_id, c.city_id, c.city
FROM customer cus
JOIN address a_cus ON cus.address_id = a_cus.address_id
JOIN city c ON c.city_id = a_cus.city_id
JOIN address a_store ON a_store.city_id = c.city_id
JOIN store s ON s.address_id = a_store.address_id;

--21	Find all stores located in the same city as customer ID 5.--


--22	Retrieve the details of all payments made on the current date.--


--23	Get the names of all staff members who have email addresses that end in '.org'.--


--24	Find the total number of rentals made by customer with ID 100.--


--25	List the films that have a title containing the word 'Love'.--