SELECT c.country_name, COUNT(*) as total_invoices, ROUND(AVG(i.total_price), 6) as average_amount
FROM invoice i
JOIN customer cu ON i.customer_id = cu.id
JOIN city ci ON cu.city_id = ci.id
JOIN country c ON ci.country_id = c.id
GROUP BY c.country_name
HAVING AVG(i.total_price) > (SELECT AVG(total_price) FROM invoice)
---------------------------------------------------------------------------------------------------------
SELECT c.customer_name, ROUND(SUM(i.total_price), 6) as amount_spent
FROM invoice i
JOIN customer c ON i.customer_id = c.id
WHERE i.total_price <= 0.25 * (SELECT AVG(total_price) FROM invoice)
GROUP BY c.customer_name
ORDER BY amount_spent DESC
--------------------------------------------------------------------------------------------------
