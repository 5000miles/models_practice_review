SELECT COUNT(*) sales_missing_salary
FROM employees_null
WHERE job='Sales' AND salary IS NULL;
