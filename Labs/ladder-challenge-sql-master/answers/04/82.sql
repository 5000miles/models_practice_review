SELECT
STRFTIME('%d',date) day_of_month,
ROW_NUMBER() OVER() nth_trading_day,
PRINTF('$%,.2f',MIN(low)
OVER(ORDER BY date ROWS BETWEEN 4 PRECEDING AND CURRENT ROW)) '5_day_moving_low',
PRINTF('$%,.2f',MAX(high)
OVER(ORDER BY date ROWS BETWEEN 4 PRECEDING AND CURRENT ROW)) '5_day_moving_high'
FROM yum
WHERE
STRFTIME('%Y',date) = '2017'
AND
STRFTIME('%m',date) = '03';
