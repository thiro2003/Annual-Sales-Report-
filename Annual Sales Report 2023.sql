-- Basic Data Retrieval
-- Retrieve all records from the table.
-- Retrieve all records where the gender is 'Male.'
-- Retrieve all transactions where the total amount is greater than $100.
-- Retrieve the records for a specific customer using their Customer ID.
-- Retrieve the total number of transactions in the table.
-- Retrieve the total quantity of items sold for each product category.
-- Retrieve the total amount for each product category.
-- Retrieve the unique product categories from the table.
-- Retrieve all transactions where the quantity is more than 5.
-- Retrieve the transaction details for a specific date range (e.g., January 1, 2025, to January 31, 2025).
-- Aggregation and Grouping
-- Find the total sales revenue (Total Amount) for all transactions.
-- Calculate the average price per unit for each product category.
-- Find the total quantity of items sold by each customer.
-- Find the total amount spent by each customer.
-- Find the highest sale amount in the table.
-- Find the lowest sale amount in the table.
-- Calculate the total amount of sales per gender.
-- Find the average quantity sold per transaction.
-- Group the data by gender and find the total amount for each gender.
-- Group the data by age range (e.g., 18-25, 26-35, etc.) and calculate the total sales for each age group.
-- Date and Time Analysis
-- Find the number of transactions that took place in each month.
-- Find the total sales for each month.
-- Find the total sales for each year.
-- Retrieve the sales data for the last 7 days.
-- Retrieve the total sales for each day of the week (e.g., Monday, Tuesday, etc.).
-- Find the average sales amount per day for the last month.
-- Find the day with the highest total sales.
-- Find the number of transactions by month.
-- Retrieve the sales data for the first quarter of the year (January to March).
-- Retrieve all transactions from last year.

-- Customer Insights
-- Find the total amount spent by each customer.
select customer_id,sum(total_amount) from retail group by customer_id;
-- Find the number of distinct customers who made purchases.
select distinct(count(customer_id)) from retail;
-- Retrieve the top 5 customers with the highest total spend.
select customer_id,sum(total_amount) from retail group by customer_id order by sum(total_amount) desc limit 5;
-- Retrieve the transactions for a specific customer ID and product category.
select product_category,count(customer_id) as Total_Customer from retail group by product_category order by count(customer_id) desc ;
-- Find the most frequent customer (based on the number of transactions).
select transaction_id,count(customer_id) from retail group by transaction_id order by count(customer_id) desc limit 1;
-- Retrieve the total sales for each customer by gender.
select Gender,sum(total_amount) from retail group by Gender;
-- Find the average age of customers who purchased a specific product category.
select product_category,round(avg(Age),1) from retail group by product_category;

-- Retrieve all customers who have purchased a specific product category.
select product_category,count(customer_id)  from retail group by product_category;
-- Retrieve the total sales for customers above the age of 40.
select sum(total_amount) from retail where Age>40;
-- Retrieve all customers who have made more than 10 transactions.
select customer_id,count(transaction_id) from retail group by customer_id order by count(transaction_id) desc limit 10;
-- Product Insights
-- Find the top 5 products (based on quantity sold).
select product_category,sum(Quantity) as Total_Quantity from retail group by product_category order by sum(Quantity) limit 5;
-- Find the most expensive product category by price per unit.
select max(price_per_unit) from retail;
-- Find the least expensive product category by price per unit.
select min(price_per_unit) from retail;
-- Find the total quantity sold for each product category.
select product_category,sum(Quantity) Total_Quantity from retail group by product_category order by sum(Quantity) desc;
-- Retrieve the transactions for a specific product category.
select product_category,sum(transaction_id) from retail group by product_category; 
-- Find the product category with the highest sales in terms of total amount.
select product_category,sum(total_amount) from retail group by product_category;
-- Retrieve all transactions for products with price per unit above 50.
select * from retail where price_per_unit>50;
-- Find the total sales for products with a quantity sold greater than 10.
select product_category,sum(total_amount)as Total_sales,sum(Quantity) as Total_Quantity from retail group by product_category;
-- Retrieve the average price per unit for all products in a specific category.
select product_category,avg(price_per_unit) from retail group by product_category;
-- Find the total sales revenue for the top 3 product categories.
select product_category,sum(total_amount) from retail group by product_category;