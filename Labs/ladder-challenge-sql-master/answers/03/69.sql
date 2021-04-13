WITH temp_table
AS
(
SELECT *,
CASE
WHEN customer LIKE '%Inc' THEN 'Inc'
WHEN customer LIKE '%LLC' THEN 'LLC'
WHEN customer LIKE '%Ltd' THEN 'Ltd'
WHEN customer LIKE '%PLC' THEN 'PLC'
ELSE 'Other'
END AS company_type
FROM transactions
)
SELECT company_type, sum(unit_price * quantity) total_sales
FROM temp_table
GROUP BY company_type;
