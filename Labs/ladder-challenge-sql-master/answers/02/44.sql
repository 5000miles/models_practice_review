SELECT
PRINTF('$%,d', AVG(salary)) avg_salary_USD,
PRINTF('%,d', AVG(salary)*0.97)||' '|| 'Fr.' avg_salary_CHF 
FROM employees;
