
WITH stocks
AS(
SELECT
STRFTIME('%Y', date) year,
STRFTIME('%m', date) month,
PRINTF('$%,.2f',MIN(low)) yum_low,
PRINTF('$%,.2f',MAX(high)) yum_high,
PRINTF('$%,.2f',FIRST_VALUE(open) OVER(PARTITION BY STRFTIME('%Y', date),STRFTIME('%m', date))) yum_open,
PRINTF('$%,.2f',LAST_VALUE(close) OVER(PARTITION BY STRFTIME('%Y', date),STRFTIME('%m', date))) yum_close,
PRINTF('%,d', SUM(volume)) yum_volume
FROM yum
GROUP BY year,month),
revenue
AS(
SELECT
STRFTIME('%Y',orderdate) year,
STRFTIME('%m',orderdate) month,
SUM(unit_price * quantity) company_revenue
FROM transactions
GROUP BY year,month
)
SELECT
stocks.year,stocks.month,revenue.company_revenue,stocks.yum_low,stocks.yum_high,
stocks.yum_open,stocks.yum_close,stocks.yum_volume
FROM
stocks
LEFT JOIN
revenue
ON stocks.year = revenue.year AND stocks.month = revenue.month;
