SELECT *,
        CASE
          WHEN job='Sales' THEN 'Yes'
          ELSE 'No'
        END AS bonus
FROM employees;
