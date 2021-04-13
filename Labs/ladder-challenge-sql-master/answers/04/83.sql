WITH temp_table
AS
(
SELECT
date,
close,
MAX(high) OVER(ORDER BY date ROWS BETWEEN 7 PRECEDING AND 1 PRECEDING) h7,
MIN(low) OVER(ORDER BY date ROWS BETWEEN 7 PRECEDING AND 1 PRECEDING) l7
FROM yum
)
SELECT date,
(h7-close)/(h7-l7) william_r
FROM temp_table;
