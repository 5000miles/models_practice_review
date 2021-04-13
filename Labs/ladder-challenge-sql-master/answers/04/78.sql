SELECT
date,
SUM(volume) OVER(ORDER BY date) cumulative_volume
FROM yum;
