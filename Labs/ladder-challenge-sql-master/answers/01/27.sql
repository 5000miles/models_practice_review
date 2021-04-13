SELECT ID,firstname,lastname,firstname|| ' ' || lastname AS fullname, job,
cast((salary * 1.1) AS INT) AS salary_eu, STRFTIME('%Y',startdate) startyear
FROM employees;
