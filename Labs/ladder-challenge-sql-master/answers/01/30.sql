SELECT *,
        CASE
          WHEN job='Sales' AND salary >= 100000 THEN 'Yes'
          ELSE 'No'
        END AS bonus
FROM employees;
