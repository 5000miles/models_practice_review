SELECT firstname
FROM employees
GROUP BY firstname
HAVING COUNT(*) = 2;
