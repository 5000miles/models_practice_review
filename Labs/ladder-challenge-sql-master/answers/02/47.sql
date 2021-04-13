SELECT
count(*),
ROUND(AVG(age),2),
MIN(age),
MAX(age)
FROM pets
GROUP BY species;
