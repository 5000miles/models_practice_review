SELECT ID, firstname,lastname,job,PRINTF('$%,.2d',salary) AS salary,
        CASE
          WHEN job='Sales' AND salary >= 100000 THEN printf('$%,.2d',salary * 1.1)
          WHEN job='Sales' AND salary < 100000 THEN printf('$%,.2d',salary * 1.05)
          WHEN job = 'Administra' THEN salary * 1.05
          ELSE PRINTF('$%,.2d',salary)
        END AS target_comp,startdate
FROM employees;
