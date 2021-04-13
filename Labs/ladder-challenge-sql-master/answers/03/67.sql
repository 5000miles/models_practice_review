WITH initials (init)
AS
(
  SELECT SUBSTR(LOWER(name),1,1)
  FROM pets
)
SELECT init most_common_init
FROM initials
GROUP BY init
ORDER BY count(*) DESC
LIMIT 1;
