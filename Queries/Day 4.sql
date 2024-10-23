--Retrieve the details of all films that have a rating of 'R'.--
SELECT * 
FROM FILM
WHERE rating = 'R';

-- List all customers who live in a city with the name 'tabriz'. --
SELECT cst.first_name, cst.last_name, a.address, c.city_id, c.city
FROM customer cst
JOIN address a on a.address_id = cst.address_id
JOIN city c on c.city_id = a.city_id
WHERE c.city = 'Tabriz';
