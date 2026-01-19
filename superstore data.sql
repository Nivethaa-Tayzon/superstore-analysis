SELECT * FROM stores_db.storesales;

-- total sales
select count(distinct order_id) numorder 
from stores_db.storesales;select sum(sales) as totalsales from stores_db.storesales;

-- average profit per order
select avg(profit) as avgprofitperorder
from (select order_id, sum(profit)as profit
from stores_db.storesales
group by order_id
) t;

-- top 10 selling products
select product_name, sum(sales) as totalsales
from stores_db.storesales
group by product_name
order by totalsales desc
limit 10;

-- total profit and sales region wise
select region, sum(sales) as totalsales, sum(profit) as totalprofit from stores_db.storesales
group by region;

-- average order size by quantity
select avg(quantity) as avgordersize from(
select order_id, sum(quantity) as quantity
from stores_db.storesales
group by order_id
)t;

-- top 5 customer by total spending
select customer_name , sum(sales) as totalspending
from stores_db.storesales
group by customer_name
order by customer_name desc
limit 5;

-- top 5 sub-categories by profit
select sub_category, sum(profit) as totalprofit
from stores_db.storesales 
group by sub_category 
order by totalprofit desc
limit 5;

-- profit margin for product category
select category, avg(profit/sales) as avgprofitmargin
from stores_db.storesales
group by category 
