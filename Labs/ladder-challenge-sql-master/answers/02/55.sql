SELECT order_id, customer,
sum(quantity) total_items
FROM transactions
GROUP BY order_id
ORDER BY total_items DESC
LIMIT 3;
