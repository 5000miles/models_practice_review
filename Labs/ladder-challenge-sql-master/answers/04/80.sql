SELECT
STRFTIME('%d',date) day_of_month,
ROW_NUMBER() OVER() nth_trading_day,
PRINTF('$%,.2f',MIN(low) OVER(ORDER BY date)) cumulative_lowest,
PRINTF('$%,.2f',MAX(high) OVER(ORDER BY date)) cumulative_highest,
SUM(volume) OVER(ORDER BY date) cumulative_volume
FROM yum
WHERE
STRFTIME('%Y',date) = '2017'
AND
STRFTIME('%m',date) = '03';
