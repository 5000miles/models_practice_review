SELECT
COUNT(*) num_pets,
ROUND(AVG(age),1) average_age, 
MIN(age) minimum_age,
MAX(age) maximum_age
FROM pets;
