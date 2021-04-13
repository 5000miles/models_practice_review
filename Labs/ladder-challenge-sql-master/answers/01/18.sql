SELECT * FROM (
SELECT firstname,lastname,
        CASE
        WHEN startdate = min(startdate) over() THEN 'Most Senior'
        WHEN startdate = max(startdate) over() THEN 'Newest'
        END AS 'time'
FROM employees_null
) A
WHERE A.time IS NOT NULL;
