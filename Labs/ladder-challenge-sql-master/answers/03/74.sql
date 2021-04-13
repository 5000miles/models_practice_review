WITH temp_table(id,total_sales)
AS
(
  SELECT employee_id,
  sum(unit_price * quantity) total_sales
  FROM transactions
  GROUP BY employee_id
)
SELECT firstname,lastname,total_sales, salary
FROM employees a
INNER JOIN
temp_table b
ON a.ID = b.id
WHERE total_sales > 1.5 * salary;
