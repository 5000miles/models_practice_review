WITH temp_table
(full_name, job, salary, year)
AS
(
  SELECT
  firstname || ' ' || lastname,
  CASE
  WHEN job='IT' THEN 'IT'
  ELSE lower(job)
  END,
  salary,
  STRFTIME('%Y', startdate)
  FROM employees
)
SELECT
full_name || ' started in ' || year || ' and makes '
|| PRINTF('$%,d',salary) || ' working in ' || job || '.'
FROM temp_table;
