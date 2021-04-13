WITH sales_by_month
AS
(
  SELECT
  STRFTIME('%Y', orderdate) year,
  STRFTIME('%m', orderdate) month,
  SUM(unit_price * quantity) total_sales_month
  FROM transactions
  GROUP BY year,month
),
volumes_by_month
AS
(
  SELECT
  STRFTIME('%Y', date) year,
  STRFTIME('%m', date) month,
  SUM(volume) total_volume_month,
  MIN(low) lowest,
  MAX(high) highest
  FROM yum
  GROUP BY year,month
)
SELECT
sales.year,
sales.month,
PRINTF('$%,.2d',total_sales_month) company_revenue,
PRINTF('$%,.2d',total_volume_month) yum_trade_volume,
PRINTF('$%,.2f',ROUND(lowest,2)) lowest,
PRINTF('$%,.2f',ROUND(highest,2)) highest
FROM sales_by_month sales
INNER JOIN
volumes_by_month volume
on
sales.year = volume.year AND
sales.month = volume.month;
