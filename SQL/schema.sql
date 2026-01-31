-- Creating dimension tables (Schema)

USE superstore;

-- Dim_customer
Create table dim_customer as
Select Distinct customer_id, customer_name, segment
From stg_superstore_clean;


-- Dim_product
DROP TABLE IF EXISTS dim_product;
CREATE TABLE dim_product AS
SELECT
    ROW_NUMBER() OVER (ORDER BY product_id, product_name) AS product_key,
    product_id,
    product_name,
    category,
    sub_category
FROM (
    SELECT DISTINCT
        product_id,
        product_name,
        category,
        sub_category
    FROM stg_superstore_clean
) t;



-- Dim_geography
DROP TABLE IF EXISTS dim_geography;
CREATE TABLE dim_geography AS
SELECT DISTINCT
    CONCAT(postal_code, '_', city, '_', state) AS geo_key,
    postal_code,
    country,
    region,
    state,
    city
FROM stg_superstore_clean;

-- Dim_shipmode
Create table dim_shipmode as 
Select distinct ship_mode
From stg_superstore_clean;

-- Dim_date
DROP TABLE IF EXISTS dim_date;
CREATE TABLE dim_date AS
SELECT DISTINCT
    order_date AS date_key,
    YEAR(order_date) AS year,
    MONTH(order_date) AS month_number,
    MONTHNAME(order_date) AS month_name,
    QUARTER(order_date) AS quarter
FROM stg_superstore_clean;


-- fact_sales
DROP TABLE IF EXISTS fact_sales;
CREATE TABLE fact_sales AS
SELECT
    f.row_id,
    f.order_id,
    f.order_date,
    f.ship_date,
    f.customer_id,
    p.product_key,
    g.geo_key,
    f.ship_mode,
    f.sales,
    f.quantity,
    f.discount,
    f.profit
FROM stg_superstore_clean f
JOIN dim_product p
  ON f.product_id   = p.product_id
 AND f.product_name = p.product_name
 AND f.category     = p.category
 AND f.sub_category = p.sub_category
JOIN dim_geography g
  ON CONCAT(f.postal_code, '_', f.city, '_', f.state) = g.geo_key;
