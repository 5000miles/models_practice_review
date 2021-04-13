SELECT distinct order_id erroneous_rows,firstname, lastname
FROM transactions a
LEFT JOIN
employees b
ON a.employee_id = b.ID
WHERE orderdate < startdate;
