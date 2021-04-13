SELECT
employee_id top_5
FROM transactions
GROUP BY employee_id
ORDER BY sum(unit_price * quantity) DESC
LIMIT 5;
