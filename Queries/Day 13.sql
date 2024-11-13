-- 34	Retrieve the number of films in each language.
SELECT f.language_id, l.name, COUNT(f.film_id) 
FROM Film f
JOIN Language l ON f.language_id = l.language_id
GROUP BY f.language_id, l.name;
