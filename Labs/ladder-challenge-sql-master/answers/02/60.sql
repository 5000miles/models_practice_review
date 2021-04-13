SELECT
customer
FROM transactions
GROUP BY customer
ORDER BY COUNT(DISTINCT employee_id) DESC
LIMIT 5;
