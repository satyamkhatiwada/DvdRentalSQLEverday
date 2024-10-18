-- Find the customers who paid 0  payment.--
SELECT c.* 
from customer c
JOIN payment p ON p.customer_id = c.customer_id
WHERE p.amount = 0;

-- Find the customers who have never made a payment.--
SELECT c.* 
FROM customer c
LEFT JOIN payment p ON p.customer_id = c.customer_id
WHERE p.payment_id IS NULL;

--Retrieve the names of all actors who have acted in more than 10 films. --
SELECT a.first_name, a.last_name
FROM actor a
JOIN film_actor fa ON fa.actor_id = a.actor_id
GROUP BY a.first_name, a.last_name
HAVING COUNT(fa.actor_id) > 10;