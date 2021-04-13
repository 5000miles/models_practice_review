SELECT
STRFTIME('%Y',date) year,
STRFTIME('%m',date) month,
SUM(SUM(volume)) OVER(ORDER BY STRFTIME('%Y',date),STRFTIME('%m',date)) cumulative_volume
FROM yum
GROUP BY year,month;
