-- Creating Views

CREATE OR REPLACE VIEW v_fact_sales AS
SELECT * FROM fact_sales;

CREATE OR REPLACE VIEW v_dim_product AS
SELECT * FROM dim_product;

CREATE OR REPLACE VIEW v_dim_date AS
SELECT * FROM dim_date;

CREATE OR REPLACE VIEW v_dim_geography AS
SELECT * FROM dim_geography;


CREATE OR REPLACE VIEW v_dim_customer AS 
SELECT * FROM dim_customer;

CREATE OR REPLACE VIEW v_dim_shipmode AS 
SELECT * FROM dim_shipmode;
