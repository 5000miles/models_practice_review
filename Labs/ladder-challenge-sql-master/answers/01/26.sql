SELECT ID,firstname,lastname,firstname|| ' ' || lastname AS fullname, job,
cast((salary * 1.1) AS INT) AS salary_eu, SUBSTR(startdate,1,4) startyear
FROM employees;
