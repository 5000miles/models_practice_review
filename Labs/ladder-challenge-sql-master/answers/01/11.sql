SELECT *
FROM pets
WHERE (species='dog' and sex='M') or
      (species='cat' and sex='F');
