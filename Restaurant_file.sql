##Aggregate Functions##

Q:1 Average price of food?
Select avg(price) from managment_restaurnt.menu_items;

Q:2 Find total orders?
Select count(order_id)
from managment_restaurnt.order_details; 

Q:3 most expensive and cheep dish?
  Ans:1
  ###Expensive###
  SELECT item_name, 
    price
FROM 
    managment_restaurnt.menu_items
WHERE 
    price = (SELECT MAX(price) FROM managment_restaurnt.menu_items);
    
   Ans:2 
   
   SELECT 
    item_name, 
    price
FROM 
    managment_restaurnt.menu_items
ORDER BY 
    price DESC
LIMIT 1;

 -- Get the cheapest dish
Ans:1

 SELECT 
    item_name, 
    price
FROM 
    managment_restaurnt.menu_items
WHERE 
    price = (SELECT MIN(price) FROM managment_restaurnt.menu_items);
    
 Ans:2
 
SELECT 
    item_name, 
    price
FROM 
    managment_restaurnt.menu_items
ORDER BY 
    price ASC
LIMIT 1;

Q:4 Identify top-performing and underperforming menu items?
SELECT
    item_name, price,
    COUNT(item_id) AS total_orders,
    SUM(price) AS total_revenue
FROM
    menu_items
JOIN
    order_details on item_id = item_id
GROUP BY
    item_name, price
ORDER BY
    total_revenue asc limit 5;

Q:5 Analyse the profitablitiy of different food categories.
Ans: select
category,
count(item_id) as total_orders,
sum(price) as total_revenue
from 
menu_items
join 
order_details on item_id
group by
category
order by
total_revenue desc
limit 4; 

Q:6 Which Month have highest revenue?
select
format(order_date, "mm/dd/yyy", "mm/yyyy") as order_month,
sum(price) as total_revenue
from
managment_restaurnt.order_details
join 
managment_restaurnt.menu_items on item_id = item_id
group by
order_month
order by
total_revenue desc;

Q:7 What are the rush hours of the restarunt?
Ans: 

SELECT 
    DATE_FORMAT(STR_TO_DATE(order_time, '%h:%i:%s %p'), '%h %p') AS order_hour_12hr, 
    COUNT(order_id) AS total_orders
FROM 
    managment_restaurnt.order_details
GROUP BY 
    order_hour_12hr
ORDER BY 
    total_orders DESC;
    
   Q: 8 Analyse ordering patterns based on the week days. 
    Ans: 
SELECT 
    DAYNAME(STR_TO_DATE(order_date, '%d-%m-%Y')) AS day_of_week,
    COUNT(order_id) AS order_count
FROM 
    managment_restaurnt.order_details
WHERE 
    STR_TO_DATE(order_date, '%d-%m-%Y') IS NOT NULL
GROUP BY 
    day_of_week
ORDER BY 
    FIELD(day_of_week, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');

Q:9 Analyze the impact of pricing on order volume.

Select
price, 
count(order_id) as total_orders
from
order_details
join
managment_restaurnt.menu_items on item_id = item_id
group by
price
order by
total_orders desc;

