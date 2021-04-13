CREATE VIEW trans_by_employee
AS
SELECT
employee_id,
sum(unit_price * quantity) total_sales
FROM transactions
GROUP BY employee_id;
