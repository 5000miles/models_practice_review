SELECT customer more_than_80000
FROM transactions
GROUP BY customer
HAVING sum(unit_price * quantity) > 80000
ORDER BY sum(unit_price * quantity) DESC;
