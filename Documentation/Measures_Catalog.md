## Measures Catalog

### Revenue
Definition: Total sales generated.
DAX: SUM('superstore v_fact_sales'[sales])

### Profit
Definition: Net profit earned.
DAX: SUM('superstore v_fact_sales'[profit])

### Orders
Definition: Total distinct orders.
DAX: DISTINCTCOUNT('superstore v_fact_sales'[order_id])

### AOV
Definition: Average Order Value.
DAX: DIVIDE([Revenue], [Orders])

### MoM Revenue %
Definition: Month-over-month revenue growth.
DAX: 
VAR PrevMonthRevenue = CALCULATE ( [Revenue], DATEADD ( 'Date'[Date], -1, MONTH ))
RETURN DIVIDE ( [Revenue] - PrevMonthRevenue, PrevMonthRevenue )
