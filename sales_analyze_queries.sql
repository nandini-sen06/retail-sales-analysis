SELECT * FROM cleaned_sales LIMIT 5;

-- Total Revenue by Product Category
SELECT product_category, sum(total_amount) as TotalRevenue 
FROM cleaned_sales 
GROUP BY product_category;

-- Monthly Revenue Trend
SELECT strftime('%Y-%m',Date) as Month, sum(total_amount) as MonthlyRevenue 
From cleaned_sales 
GROUP BY Month 
ORDER BY Month;

-- Top 5 Customers by Spending
SELECT customer_id, sum(total_amount) as CustomerSpending
FROM cleaned_sales
GROUP BY customer_id
ORDER BY CustomerSpending DESC 
LIMIT 5;

-- Average Age of Customers by Product Category
SELECT product_category, avg(age) as AverageAGE
FROM cleaned_sales
GROUP BY product_category;

-- Gender-wise Revenue Contribution
SELECT gender, sum(total_amount) as TotalRevenue
FROM cleaned_sales
GROUP BY gender;

-- Most Popular Product Category (by Quantity Sold)
SELECT product_category, sum(quantity) as TotalQuantity
FROM cleaned_sales
GROUP BY product_category
ORDER BY quantity DESC
LIMIT 1;

-- Average Order Value (AOV)
SELECT avg(total_amount) as AOV
FROM cleaned_sales;

-- Price vs Quantity Analysis
SELECT product_category, avg(price_per_unit) as AvgPrice, avg(quantity) as AvgQuantity
FROM cleaned_sales
GROUP BY product_category;

-- Revenue by age group.
SELECT CASE
	WHEN age BETWEEN 18 AND 25 THEN '18-25'
	WHEN age BETWEEN 26 AND 35 THEN '26-35'
	WHEN age BETWEEN 36 AND 50 THEN '36-50'
	ELSE '50+'
END as AgeGroup,
sum(total_amount) as Revenue
FROM cleaned_sales
GROUP BY AgeGroup
ORDER BY Revenue DESC;

-- Most popular product category by quantity.
SELECT product_category, sum(quantity) as TotalUnits
FROM cleaned_sales
GROUP BY product_category
ORDER BY TotalUnits DESC
LIMIT 1;

-- Average order value per month.
SELECT strftime('%Y-%m',Date) as Month, avg(total_amount) as AvgOrderValue
FROM cleaned_sales
GROUP BY Month
ORDER BY Month;
