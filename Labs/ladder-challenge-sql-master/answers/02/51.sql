SELECT
job,
AVG(salary) mean_salary
FROM employees
GROUP BY job
ORDER BY mean_salary DESC;
