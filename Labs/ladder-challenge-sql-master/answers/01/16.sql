SELECT *
FROM employees_null
WHERE salary < 35000 OR
      salary IS NULL ;
