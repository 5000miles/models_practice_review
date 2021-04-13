SELECT species, ROUND(AVG(age),2) avg_age
FROM pets
GROUP BY species;
