SELECT ROUND(AVG(age),2) mean_dog_age
FROM pets
WHERE species='dog' AND sex='M';
