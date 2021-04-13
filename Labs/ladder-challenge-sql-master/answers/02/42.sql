SELECT PRINTF('$%,.d',AVG(salary)) avg_salary
FROM employees
WHERE CAST(STRFTIME('%Y',startdate) AS REAL) > 2010;
