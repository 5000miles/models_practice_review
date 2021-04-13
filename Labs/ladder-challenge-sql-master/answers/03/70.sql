SELECT
order_id, customer, unit_price, quantity, orderdate,
employee_id, firstname, lastname
FROM transactions a
LEFT JOIN
employees b
ON a.employee_id = b.ID;
