SELECT
date,
PRINTF('$%,.2f',AVG(close) OVER(ORDER BY date ROWS BETWEEN 7 PRECEDING AND 1 PRECEDING)) avg_7_day
FROM yum;
