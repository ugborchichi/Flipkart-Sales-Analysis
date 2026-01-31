# Flipkart Sales Analysis

## Project Background

The Flipkart Sales Data Analysis Project focuses on analyzing large-scale retail data using SQL to uncover trends in sales performance, pricing strategy, discount impact, and customer demand. The analysis was conducted on a transactional dataset containing product listings, prices, discounts, units sold, ratings, delivery timelines, and listing dates.

The primary objective was to evaluate how pricing, discounting, and product attributes influence key business outcomes such as units sold, revenue, and customer satisfaction. The primary goal of the Flipkart Sales Data Analysis Project is to uncover actionable insights that can drive management decisions and improve overall performance. The aim is to identify areas of strength and areas that need improvement within the Flipkart marketplace ultimately leading to increased revenue and customer satisfaction.

SQL was used extensively to clean the data, handle date and encoding issues, aggregate metrics over time, and segment products using data-driven techniques such as percentile-based price categorization. Power BI was used to represent the analysis visually for better storytelling. 

Key areas of analysis included:

-  Yearly and monthly trends in gross sales, net revenue, and discount loss

-  Impact of discounting strategies on revenue and sales volume

-  Product segmentation into low, medium, and high price tiers using the 33rd and 66th percentiles

-  Performance comparison across price categories based on units sold and ratings

-  Identification of underperforming products using sales volume, ratings, and delivery metrics

-  Average delivery period of the sellers and regions

The insights generated from this analysis support data-driven pricing decisions, improved discount optimization, and better product portfolio management. This project demonstrates practical application of SQL for business analytics, performance measurement, and strategic insight generation in a retail environment.

## Tools Used

1.  Power BI - Data Visualisation

2.  Postgres SQL - Data Cleaning and Analysis


## Business Questions

1.  What are the highest-revenue products by total revenue and by units sold?
  
2.  What are the highest-revenue brands by total revenue and by units sold?
  
3.  What are the highest-revenue category by total revenue and by units sold?
  
4.  Which sellers contribute the most/least to revenue?

5.  Which seller cities contribute the most/least to revenue?
  
6.  How do price, discount_percent, and final_price impact units_sold and product scores?
  
7.  Are there seasonal or listing-age effects on sales (listing_date → sales trend)?
  
8.  Which products show early warning signs of underperformance (low product_score and high delivery_days)?
  
9.  Which sellers show early warning signs of underperformance (high delivery_days and low seller_rating)?
  
10.  If we group products into segments (High Price–High Rating, Low Price–High Velocity, Low Price–Low Rating), what operational actions should the marketplace take for each segment?
 
11.  What is the discount loss by year?
  
12.  What is the average discount by category?
  
13.  What products generated no revenue?
  
14.  What are the top 10 products by net revenue?

## Key Insights

- Over the six-year period, revenue growth remained largely stagnant, with a notable decline recorded in 2023.

-  Sales trends show no clear seasonality, indicating consistent demand throughout the year.

-  Average discount levels remained uniform across months, suggesting minimal influence on sales performance.

-  Several products generated no revenue during their entire listing period, highlighting portfolio inefficiencies.

-  Products offering longer warranty periods consistently achieved higher customer ratings.

-  Overall business performance showed limited growth momentum over time.

-  Mid-priced products contributed the highest share of revenue, outperforming low- and high-priced items.

-  No sellers recorded persistently low seller ratings, indicating generally stable seller performance.

-  However, over 50% of products received poor customer ratings, pointing to product-level quality or expectation gaps.

-  Product returnability showed no significant impact on customer ratings.

-  Delivery performance varied by location, with 5 out of 8 cities experiencing longer average delivery times, suggesting regional logistics challenges

  ## Recommendation

-  Conduct a root-cause analysis for 2023, (pricing changes, logistics disruption and product mix).
  
-  Shift from seasonal campaigns to always on marketing strategies.
  
-  Replace blanket discount with targeted product level discount. Bundle products instead of discounting single items to increase basket size.
   
-  Bundle products instead of discounting single items to increase basket size.
  
-  Refresh product portfolio phasing out underperforming products and introducing demand-driven products.

-  Delist and redesign products that have not generated revenue.

-  Introduce time-based performance threshold for new products.

-  Implement quarterly performance review with corrective action plan. Introduce performance-based incentives for Sellers.

-  Prioritize medium-priced product expansion.

-  Reduce focus on low-priced products with poor margins.

-  Improve quality control and packaging.

-  Introduce performance-based incentives for Sellers

-  Bundle warranty offers with medium-priced products.

-  Investigate logistics bottlenecks in cities with high delivery periods

-  Optimize warehouse allocation.

-  Introducing city-level delivery SLAs (service level agreement)

-  Display delivery timelines transparently to manage customer expectations.

## Conclusion

To drive growth Flipkart should focus on Product quality, Medium-price optimization, Logistics efficiency and targeted promotions rather than relying on discount or seasonal sales.



**Thank you for your time.**


