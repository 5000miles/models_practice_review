SELECT job, AVG(salary) * 1.65 avg_salary_NZD
FROM employees
GROUP BY job;
