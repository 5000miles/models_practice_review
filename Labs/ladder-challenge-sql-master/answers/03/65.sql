CREATE VIEW trans_by_month
AS
SELECT
STRFTIME('%Y', orderdate) Year,
STRFTIME('%m', orderdate) Month,
sum(unit_price * quantity) total_sales
FROM transactions
GROUP BY Year,Month;
