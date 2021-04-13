SELECT firstname, lastname, total_sales
FROM trans_by_employee a
LEFT JOIN
employees b
ON a.employee_id = b.ID
ORDER BY total_sales DESC
LIMIT 1;
