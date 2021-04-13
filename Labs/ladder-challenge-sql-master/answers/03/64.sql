CREATE VIEW yum_by_month
AS
SELECT
STRFTIME('%Y', date) Year,
STRFTIME('%m', date) Month,
PRINTF('$%,.2f',AVG(open)) avg_open,
PRINTF('$%,.2f',AVG(high)) avg_high,
PRINTF('$%,.2f',AVG(low)) avg_low,
PRINTF('$%,.2f',AVG(close)) avg_close,
PRINTF('$%,.2f',SUM(volume)) total_vol
FROM yum
GROUP BY Year,Month
ORDER BY Year,Month;
