--52	Get the details of all customers who live in 'Los Angeles'.
SELECT 
	c.*
FROM
	customer c
JOIN 
	address a
ON
	a.address_id = c.address_id
WHERE
	address = 'Los Angeles';