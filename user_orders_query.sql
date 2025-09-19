-- SQL查询：连接用户表和订单表
-- 假设用户表为 users，订单表为 orders
-- 连接条件是 users.id = orders.user_id

SELECT 
    users.id AS user_id,
    users.name AS user_name,
    users.email AS user_email,
    orders.id AS order_id,
    orders.order_date,
    orders.total_amount
FROM 
    users
INNER JOIN 
    orders 
ON 
    users.id = orders.user_id
ORDER BY 
    users.id, orders.order_date;
