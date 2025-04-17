---1.View the menu_items table
SELECT * FROM restaurant_db.menu_items;

---2.Find the number of items in the menu_items table?
SELECT COUNT(menu_item_id) as Items FROM menu_items;

---3.What are the least and most expensive items on the menu?
select item_name,price from menu_items
where price = (SELECT max(PRICE) FROM menu_items);

select item_name,price from menu_items
where price = (SELECT min(PRICE) FROM menu_items);

---4.How many italian dishes are on the menu?
select count(item_name) as count from menu_items
WHERE CATEGORY = 'Italian';

---5.What are the least and most expensive italian dishes on the menu?
SELECT 
    *
FROM
    menu_items
WHERE
    category = 'italian'
        AND price = (SELECT 
            MAX(price)
        FROM
            menu_items
        WHERE
            CATEGORY = 'italian');

SELECT 
    *
FROM
    menu_items
WHERE
    category = 'italian'
        AND price = (SELECT 
            Min(price)
        FROM
            menu_items
        WHERE
            CATEGORY = 'italian');
            
---6.How many dishes are in each category?
SELECT 
    COUNT(*) AS num_dishes, category
FROM
    menu_items
GROUP BY CATEGORY;

---7. What is the average dish price in each category?
SELECT category, avg(price) as Avg_price from menu_items
GROUP BY category;



