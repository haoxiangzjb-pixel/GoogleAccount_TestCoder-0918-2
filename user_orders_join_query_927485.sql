-- SQL Query to join Users and Orders tables
-- This query joins the Users and Orders tables based on user_id

SELECT 
    u.id AS user_id,
    u.name AS user_name,
    u.email AS user_email,
    o.id AS order_id,
    o.order_date,
    o.total_amount,
    o.status
FROM 
    users u
INNER JOIN 
    orders o ON u.id = o.user_id
ORDER BY 
    u.name, o.order_date DESC;