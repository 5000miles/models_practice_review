SELECT *
FROM employees
WHERE (firstname = 'Robert' OR
      firstname = 'Lisa' OR
      firstname LIKE 'J%') AND
      job != 'Sales';
