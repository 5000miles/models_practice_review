SELECT
firstname, lastname, sum(unit_price * quantity) as total_sales
FROM transactions a
LEFT JOIN
employees b
ON a.employee_id = b.ID
GROUP BY a.employee_id
ORDER BY total_sales DESC
LIMIT 1;
