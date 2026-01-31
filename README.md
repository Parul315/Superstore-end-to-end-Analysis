# Superstore End-to-End Data Analytics Project (SQL | Python | Power BI)

## Problem Statement
Analyze Superstore sales data to identify revenue trends, profitability drivers, customer behavior, and the impact of discounting on profit.

## Dataset
- Superstore sales dataset
- Time period: 2014–2017
- Cleaned and validated using Python

## Tech Stack
- Python (Pandas, Matplotlib, Seaborn)
- MySQL
- Power BI (DAX, Data Modeling)

## Data Modeling
- Star schema design
- Fact table: fact_sales
- Dimensions: product, customer, geography, date, ship mode
- Surrogate keys used for product and geography

## KPIs
- Revenue
- Profit
- Orders
- Customers
- AOV
- MoM Revenue %

## Key Insights
- High discounts (>30%) frequently lead to negative profit
- Technology category and West region drive profitability
- Furniture shows weak margins despite strong sales
- ~98% customers are repeat buyers

## Dashboard Preview
<img>

## How to Run the Project
1. Run Python notebooks for data cleaning & EDA
2. Load cleaned data into MySQL
3. Execute SQL scripts to create schema
4. Open Power BI file and refresh data
