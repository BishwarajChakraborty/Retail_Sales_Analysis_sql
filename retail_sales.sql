drop database if exists retail_sales_analysis_db;
create database retail_sales_analysis_db;
use retail_sales_analysis_db;
select * from retail_sales;
select count(*) from retail_sales;

select * from retail_sales
where
	ï»¿transactions_id is null or
    sale_date is null or
    sale_time is null or
    customer_id is null or
    gender is null or
    age is null or
    category is null or
    quantiy is null or
    price_per_unit is null or
    cogs is null or
    total_sale is null;
    
    -- Number of transactions
    select count(*) as Total_txn from retail_sales;
    -- Number of unique customers
    select count(distinct customer_id) as unique_customers from retail_sales;
    -- Distinct Category
    select distinct category from retail_sales;
    
    -- Convert sale_date column from text to date
  UPDATE retail_sales
SET sale_date = STR_TO_DATE(sale_date, '%d-%m-%Y');
alter table retail_sales
modify sale_date date;
    
  -- Convert sale_time column from text to time
  UPDATE retail_sales
SET sale_time = CAST(sale_time AS TIME);
alter table retail_sales
modify sale_time time;

select * from retail_sales;

-- Q1. Write a sql query to retrive all columns for sales made on '2022-11-05'
select * from retail_sales 
where sale_date='2022-11-05';

/* Q2. Write a sql query to retrieve all transactions where the category is 'Clothing' and the quantity
	   sold is more than 3 in the month of 'Nov-2022'*/
select * from retail_sales
where category='Clothing' and
year(sale_date)='2022' and
month(sale_date)='11' and
quantiy>3;

-- Q3. Write a sql query to calculate the total sale and total order for each category
select category, sum(total_sale) as net_sale, count(*) as total_order
from retail_sales
group by category;

-- Q4. Write a sql query to find the average age of customers who purchased items from the 'Beauty' category
select category, round(avg(age),2) as average_age
from retail_sales
where category= 'Beauty';

-- Q5. Write a sql query to find all transactions where the total_sale is greater than 1000
select * from retail_sales 
where total_sale>1000;

-- Q6. Write a sql query to find the total number of transactions made by each gender in each category
select category, gender, count(*) as total_txn
from retail_sales 
group by category, gender
order by category;

-- Q7. Write a sql query to calculate average sale for each month. Find out best selling month in each year
select * from
(
select year(sale_date) as year, month(sale_date) as month, round(avg(total_sale),2) as average_sale,
dense_rank() over(partition by year(sale_date) order by avg(total_sale) desc) as d_rank
from retail_sales 
group by year, month
) as t
where d_rank=1;

-- Q8. Write a sql query to find the top 5 customers based on the highest total sales
select customer_id, sum(total_sale) as net_sale
from retail_sales
group by customer_id
order by net_sale desc
limit 5;

-- Q9. Write a sql query to find the number of unique customers who purchased items from each category
select category, count(distinct customer_id) as unq_customer
from retail_sales
group by category;

/*Q10. Write a sql query to create each shift and number of orders (Example: Morning<=12, Afternoon 
between 12 & 17, Evening>17)*/
-- Using sub-query
select shift, count(*) no_of_orders from
(
select *,
case 
	when hour(sale_time)<12 then 'Morning'
    when hour(sale_time) between 12 and 17 then 'Afternoon'
    else 'Evening'
end as Shift
from retail_sales
) as t
group by shift;

-- OR Using CTE
with shift_order As
(
select *,
case 
	when hour(sale_time)<12 then 'Morning'
    when hour(sale_time) between 12 and 17 then 'Afternoon'
    else 'Evening'
end as Shift
from retail_sales
)
select shift, count(*) no_of_orders 
from shift_order
group by shift;

-- End