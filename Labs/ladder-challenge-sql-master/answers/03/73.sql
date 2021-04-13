WITH temp_table(id,total_sales)
AS
(
  SELECT employee_id, sum(unit_price * quantity) total_sales
  FROM transactions
  GROUP BY employee_id
  ORDER BY total_sales DESC
  LIMIT 1
)
SELECT firstname, lastname, total_sales
FROM employees a
INNER JOIN
temp_table b
on a.ID = b.id;
