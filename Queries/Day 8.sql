
-- 21A. Find all sotres located in same city with any customer --
SELECT s.store_id, cus.customer_id, c.city_id, c.city
FROM customer cus
JOIN address a_cus ON cus.address_id = a_cus.address_id
JOIN city c ON c.city_id = a_cus.city_id
JOIN address a_store ON a_store.city_id = c.city_id
JOIN store s ON s.address_id = a_store.address_id;

--21B. Find all stores located in the same city as customer ID 5.--
SELECT s.store_id, cus.customer_id, c.city_id, c.city
FROM customer cus
JOIN address a_cus ON cus.address_id = a_cus.address_id
JOIN city c ON c.city_id = a_cus.city_id
JOIN address a_store ON a_store.city_id = c.city_id
JOIN store s ON s.address_id = a_store.address_id
WHERE cus.customer_id = 5;


--22	Retrieve the details of all payments made on the current date.--
SELECT *
FROM Payment p
WHERE DATE(payment_date) = CURRENT_DATE;

--23	Get the names of all staff members who have email addresses that end in '.org'.--
SELECT staff_id, first_name, email
FROM staff
WHERE email LIKE '%.org';