CREATE DATABASE Flipkart_db;

CREATE TABLE Flipkart
	(
	product_id varchar (15) PRIMARY KEY,
	product_name varchar (30),
	category varchar (20),
	brand varchar (15),
	seller varchar (15),
	seller_city varchar (15),
	price float,
	discount_percent int,
	final_price float,
	rating float,
	review_count int,
	stock_available int,
	units_sold int,
	listing_date date,
	delivery_days int,
	weight_g float,
	warranty_months int,
	color varchar (10),
	size_ varchar (5),
	return_policy_days int,
	is_returnable varchar (7),
	payment_modes varchar (10),
	payment_modes2 varchar (10),
	payment_mode3 varchar (10),
	shipping_weight_g float,
	product_score float,
	seller_rating float
	);

DROP TABLE IF EXISTS Flipkart;
CREATE TABLE Flipkart
	(
	product_id varchar (15) PRIMARY KEY,
	product_name varchar (30),
	category varchar (20),
	brand varchar (15),
	seller varchar (15),
	seller_city varchar (15),
	price float,
	discount_percent int,
	final_price float,
	rating float,
	review_count int,
	stock_available int,
	units_sold int,
	listing_date date,
	delivery_days int,
	weight_g float,
	warranty_months int,
	color varchar (10),
	size_ varchar (10),
	return_policy_days int,
	is_returnable varchar (7),
	payment_modes varchar (10),
	payment_modes2 varchar (10),
	payment_mode3 varchar (10),
	shipping_weight_g float,
	product_score float,
	seller_rating float
	);

SELECT * FROM Flipkart;

SELECT
	DISTINCT category
FROM flipkart;

SELECT
	DISTINCT seller
FROM flipkart;

SELECT
	COUNT(product_id) AS total_products
FROM flipkart;

--What are the highest-revenue products by total revenue and by units sold?--

SELECT
	product_name,
	SUM(units_sold) AS total_units_sold,
	SUM(final_price * units_sold) AS net_revenue
FROM flipkart
GROUP BY 1
ORDER BY 3 DESC
LIMIT 10;

--What are the highest-revenue brands by total revenue and by units sold?--

SELECT
	brand,
	SUM(units_sold) AS total_units_sold,
	SUM(final_price * units_sold) AS net_revenue
FROM flipkart
GROUP BY 1
ORDER BY 3 DESC;

--What are the highest-revenue category by total revenue and by units sold?--

SELECT
	category,
	SUM(units_sold) AS total_units_sold,
	SUM(final_price * units_sold) AS net_revenue
FROM flipkart
GROUP BY 1
ORDER BY 3 DESC;

--Which sellers contribute the most/least to revenue?-- 

SELECT
	seller,
	SUM(units_sold) AS total_units_sold,
	SUM(final_price * units_sold) AS net_revenue
FROM flipkart
GROUP BY 1
ORDER BY 3 DESC;

--Which seller cities contribute the most/least to revenue?-- 

SELECT
	seller_city,
	SUM(units_sold) AS total_units_sold,
	SUM(final_price * units_sold) AS net_revenue
FROM flipkart
GROUP BY 1
ORDER BY 3 DESC;

--How do price, discount_percent, and final_price impact units_sold and product scores?--

SELECT
    CORR(price, units_sold)            AS price_vs_units,
    CORR(discount_percent, units_sold) AS discount_vs_units,
    CORR(final_price, units_sold)      AS final_price_vs_units,

    CORR(price, product_score)            AS price_vs_product_score,
    CORR(discount_percent, product_score) AS discount_vs_product_score,
    CORR(final_price, product_score)      AS final_price_vs_product_score
FROM flipkart;

 
--Are there seasonal or listing-age effects on sales (listing_date → sales trend)?

SELECT
	EXTRACT (YEAR FROM listing_date) AS Year_,
	EXTRACT (MONTH FROM listing_date) AS Month_,
	SUM(final_price * units_sold) AS net_revenue
FROM flipkart
GROUP BY 1, 2
ORDER BY 1,2,3 DESC;

--Which products show early warning signs of underperformance (low product_score and high delivery_days)?--

SELECT
	product_name,
	product_score,
	delivery_days
FROM flipkart
WHERE 
	product_score < 40
	AND delivery_days > 5 
ORDER BY 2 DESC;

--Which sellers show early warning signs of underperformance (high delivery_days and low seller_rating)?--

SELECT
	seller,
	seller_rating,
	delivery_days
FROM flipkart
WHERE 
	seller_rating < 3.5
	AND delivery_days > 5 
ORDER BY 1;


--If we group products into segments (High Price–High Rating, Low Price–High 
--Velocity, Low Price–Low Rating), what operational actions should the marketplace 
--take for each segment?

WITH percentiles AS (
    SELECT
        PERCENTILE_CONT(0.33) WITHIN GROUP (ORDER BY price) AS p33,
        PERCENTILE_CONT(0.66) WITHIN GROUP (ORDER BY price) AS p66
    FROM flipkart
)
SELECT
    price_category,
    product_count
FROM (
    SELECT
        CASE
            WHEN f.price <= p.p33 THEN 'Low Price'
            WHEN f.price <= p.p66 THEN 'Medium Price'
            ELSE 'High Price'
        END AS price_category,
        COUNT(*) AS product_count
    FROM flipkart f
    CROSS JOIN percentiles p
    GROUP BY price_category
) t
ORDER BY product_count DESC;

--What is the discount loss by year?

SELECT
	EXTRACT(YEAR FROM listing_date) AS year_,
	SUM(price * units_sold) AS gross_sales,
	SUM(final_price * units_sold) AS net_revenue,
	SUM((price - final_price) * units_sold) AS discount_loss
FROM flipkart
GROUP BY 1
ORDER BY 1 DESC;

--What is the average discount by category?--

SELECT
	category,
	AVG(discount_percent) AS avg_discount
FROM flipkart
GROUP BY 1;

--What products generated no revenue?--

SELECT
	product_name,
	units_sold
FROM flipkart
WHERE units_sold = 0
ORDER BY 1;

--What are the top 10 products by net revenue?--

SELECT
	product_name,
	SUM(units_sold) AS total_units_sold,
	SUM(final_price * units_sold) AS net_revenue
FROM flipkart
GROUP BY 1
ORDER BY 3 DESC
LIMIT 10;
