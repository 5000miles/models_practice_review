SELECT
  firstname,COUNT(*) num
  FROM employees
  GROUP BY firstname
  ORDER BY num DESC
  LIMIT 5;
