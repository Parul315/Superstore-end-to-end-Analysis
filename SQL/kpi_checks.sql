-- KPIs validation queries

-- Total Revenue
Select sum(sales) as total_revenue
From fact_sales;

-- Total orders
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM fact_sales;

-- Total Customers
SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM fact_sales;

-- Total Profit
SELECT SUM(profit) AS total_profit
FROM fact_sales;

Select * from fact_sales;

-- Top products
Select p.product_name, sum(f.sales) as revenue
from dim_product p
join fact_sales f
on p.product_key = f.product_key
group by p.product_name
order by revenue desc
limit 5;

-- Top customers
Select c.customer_name, sum(f.sales) as total_spending
from dim_customer c
join fact_sales f
on c.customer_id = f.customer_id
group by c.customer_name
order by total_spending desc
limit 5;

-- Profit by category
Select p.category, sum(f.profit) as total_profit
from dim_product p
join fact_sales f
on p.product_key = f.product_key
group by p.category
order by total_profit desc;

-- Profit by region
Select g.region, sum(f.profit) as total_profit
from dim_geography g
join fact_sales f
on g.geo_key = f.geo_key
group by g.region
order by total_profit desc;

-- MOM revenue %
with base as (
Select 
	DATE_FORMAT(order_date, '%Y-%m') as order_month,
    sum(sales) as revenue,
    lag(sum(sales)) over (order by DATE_FORMAT(order_date, '%Y-%m')) as prev_revenue
from fact_sales
group by DATE_FORMAT(order_date, '%Y-%m') 
)

Select order_month, revenue, prev_revenue, (revenue-prev_revenue)/prev_revenue as mom_change_pct
from base;

-- revenue by month
select date_format(order_date, '%Y-%m') as yearmonth, sum(sales) as revenue
from fact_sales
group by date_format(order_date, '%Y-%m')
order by yearmonth;
