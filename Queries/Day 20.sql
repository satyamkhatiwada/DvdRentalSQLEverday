--53	Find the films that have 'Subtitles' as a special feature.
SELECT 
	title
FROM
	film
WHERE
	special_features @>Array['Subtitles'];
    
--54	List the staff members who have worked at both store locations.
--55	Retrieve the details of all customers who have made payments greater than $50.