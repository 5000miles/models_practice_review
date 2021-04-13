SELECT
order_id, sum(unit_price * quantity) total_cost
FROM transactions
GROUP BY order_id;
