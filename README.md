**Retail Sales Analysis - SQL Project**

**Project Overview**
This project involves a comprehensive analysis of a retail dataset to uncover key business insights. By performing Exploratory Data Analysis (EDA) and solving specific business problems using SQL, I identified trends in customer behavior, peak shopping hours, and high-performing product categories.

**Objectives**
-Data Cleaning: Identify and handle missing or null values.
-Exploratory Data Analysis (EDA): Understand the dataset’s structure and basic statistics.
-Business Analysis: Use SQL to answer critical business questions regarding sales, demographics, and operations.

**Dataset Structure**
The dataset includes 2,000 rows of retail transactions with the following columns:
-transactions_id: Unique ID for each transaction.
-sale_date: Date of the transaction.
-sale_time: Time of the transaction.
-customer_id: Unique ID for each customer.
-gender: Gender of the customer.
-age: Age of the customer.
-category: Product category (Electronics, Clothing, Beauty).
-quantity: Number of units sold.
-price_per_unit: Unit price of the product.
-cogs: Cost of Goods Sold.
-total_sale: Total revenue from the transaction.

**Key Insights & Findings**
1. Sales Performance
Total Revenue by Category:
-Electronics: $313,810 (Top Performer)
-Clothing: $311,070
-Beauty: $286,840

Seasonality: December was the peak sales month in both 2022 and 2023, suggesting high holiday demand.

2. Customer Demographics
-Target Audience: The average age of customers in the Beauty category is 40 years, helping refine marketing efforts.
-Gender Distribution: While gender distribution is relatively balanced, Clothing and Electronics lean slightly toward male shoppers, while Beauty has higher female engagement.
-High-Value Customers: The top 5 customers contributed significantly, with the leading customer spending over $38,000.

3. Operational Trends
-Peak Shopping Hours: Most orders occur during the Evening shift (over 1,000 orders), followed by the Morning and Afternoon shifts.
-Bulk Purchases: Noted 17 instances in November 2022 where customers purchased 4 or more units of Clothing in a single trip.

**Technical Skills Demonstrated**
-Database Management: Creating databases, tables, and handling data types.
-Data Cleaning: Using IS NULL and UPDATE statements to ensure data integrity.

**Advanced SQL Queries:**
-Aggregations: SUM, AVG, COUNT.
-Window Functions: DENSE_RANK() to find the best-selling month per year.
-Conditional Logic: CASE statements to categorize time into "Shifts" (Morning, Afternoon, Evening).
-Subqueries/CTEs: For complex data grouping and filtering.

**How to Run This Project**
1.Clone the Repository
2.Import the SQL - Retail Sales Analysis_utf .csv into your SQL environment (MySQL/PostgreSQL).
3.Run the queries provided in retail_sales.sql.

**Conclusion**
This project provides actionable insights for a retail business, such as optimizing staffing during evening shifts and targeting holiday promotions in December. 
