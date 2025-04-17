-- 1. Combine the menu items and order details table?
SELECT 
    *
FROM
    menu_items m
        LEFT JOIN
    order_details d ON m.menu_item_id = d.item_id;

-- 2. What were the least and most ordered items? What categories they are in?
SELECT 
    item_name, COUNT(order_details_id) AS NUM_PURCHASES, category
FROM
    menu_items m
        LEFT JOIN
    order_details d ON m.menu_item_id = d.item_id
GROUP BY item_name,category
order by num_purchases;

-- 3.What were the top 5 orders that spent the most money?
SELECT 
    order_id,SUM(PRICE) as total_spend
FROM
    menu_items m
        LEFT JOIN
    order_details d ON m.menu_item_id = d.item_id
group by order_id
order by total_spend desc
limit 5;

-- 4. View the details of highest spend order. What insights can you gather from it?
SELECT 
   COUNT(CATEGORY) AS num_purchases,category
FROM
    menu_items m
        LEFT JOIN
    order_details d ON m.menu_item_id = d.item_id
where order_id = 440
GROUP BY CATEGORY;

-- 5. View the details of top 5 highest spend order.What insights can you gather from it?
SELECT  order_id,category, count(category) as num_purchases
FROM
    menu_items m
        LEFT JOIN
    order_details d ON m.menu_item_id = d.item_id
where order_id IN( 440, 2075, 1957,330, 2675)
group by order_id,category;