use bank_db

alter table pizza_sales_excel_file rename pizza_sales;

select * from pizza_sales_excel_file;

select round(sum(total_price) , 2 ) from pizza_sales;

select round(sum(total_price) / count(distinct order_id) , 2) as avg_order from pizza_sales;

select sum(quantity) as total_quantity from  pizza_sales;

select count(distinct order_id) as total_orders from pizza_sales;

select order_date from pizza_sales;

select cast(cast(sum(quantity)as decimal(10,2 )) / 
cast(count(distinct order_id ) as decimal(10,2)) as decimal(10,2)) as avg_pizzas_per_order from pizza_sales;

select dayname(str_to_date(order_date,"%d-%m-%y")) as day 
, count(distinct order_id) as  daily_total_order from pizza_sales 
group by dayname(str_to_date(order_date,"%d-%m-%y"))  
order by daily_total_order desc;

select monthname(str_to_date(order_date,"%d-%m-%y"))
, count(distinct order_id) as monthly_orders from pizza_sales
group by monthname(str_to_date(order_date,"%d-%m-%y")) 
order by monthly_orders desc;

select monthname(str_to_date(order_date,"%d-%m-%y"))
, round(sum(total_price),2) as revenue from pizza_sales
group by monthname(str_to_date(order_date,"%d-%m-%y"));

select quarter(str_to_date(order_date,"%d-%m-%y"))
, round(sum(total_price),2) as revenue from pizza_sales
group by quarter(str_to_date(order_date,"%d-%m-%y"));

select pizza_size , round(sum(total_price),2) as total_sales, 
round(sum(total_price)*100/(select sum(total_price) from pizza_sales),2) as pct
from pizza_sales 
group by pizza_size;

select pizza_name ,round(sum(total_price),2) as total_sales
from pizza_sales
group by pizza_name
order by total_sales desc limit 5;

select  pizza_name ,round(sum(total_price),2) as total_sales
from pizza_sales
group by pizza_name
order by total_sales limit 5;

select  pizza_name ,count(distinct order_id) as total_qty 
from pizza_sales
group by pizza_name
order by total_qty desc limit 5;

select pizza_name, count(distinct order_id) as total_qty
from pizza_sales
group by pizza_name
order by total_qty limit 5;

