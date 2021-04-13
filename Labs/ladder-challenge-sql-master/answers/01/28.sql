SELECT ID,firstname|| ' ' || lastname AS fullname, job,
PRINTF('$%,.2d',salary) AS salary, STRFTIME('%Y',startdate) startyear
FROM employees;
