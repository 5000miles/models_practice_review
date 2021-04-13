-- SELECT
-- customer, sum(unit_price * quantity) total_cost
-- FROM transactions
-- GROUP BY customer
-- ORDER BY total_cost DESC
-- LIMIT 5;


SELECT
customer
FROM transactions
GROUP BY customer
ORDER BY sum(unit_price * quantity) DESC
LIMIT 5;
