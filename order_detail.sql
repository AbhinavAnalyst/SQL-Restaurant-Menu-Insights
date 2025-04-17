USE restaurant_db;

-- 1.View the orders_details table
SELECT 
    *
FROM
    order_details;

-- 2.What is the date range of the table?
SELECT 
    MIN(order_date) as Begin_range, MAX(order_date) as End_range
FROM
    order_details;

-- 3.How many orders were made within this date range?
SELECT 
    COUNT(DISTINCT order_id) AS Order_count
FROM
    order_details;
    
-- 4. How many items were ordered within this date range?
SELECT count(*) items_count FROM order_details;

-- 5. Which order had the most number of items?
SELECT order_id, COUNT(ITEM_ID) as Count
FROM order_details
GROUP BY order_id
ORDER BY count;

--  6.How many orders had more than 12 items?
SELECT COUNT(*) as count
FROM (
    SELECT order_id
    FROM order_details
    GROUP BY order_id
    HAVING COUNT(item_id) > 12
) AS count;


