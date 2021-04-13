SELECT
job,
COUNT(*),
AVG(salary),
MIN(salary),
MAX(salary)
FROM employees
GROUP BY job;
