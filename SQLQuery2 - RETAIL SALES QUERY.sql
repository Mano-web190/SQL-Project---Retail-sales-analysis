SELECT TOP (1000) [transactions_id]
      ,[sale_date]
      ,[sale_time]
      ,[customer_id]
      ,[gender]
      ,[age]
      ,[category]
      ,[quantiy]
      ,[price_per_unit]
      ,[cogs]
      ,[total_sale]
  FROM [Portfolio].[dbo].[SQL - Retail Sales Analysis]
 SELECT TOP 10 * 
FROM [Portfolio].[dbo].[SQL - Retail Sales Analysis];

-- Count of rows
SELECT COUNT(*) 
FROM [Portfolio].[dbo].[SQL - Retail Sales Analysis];
 
 -- Data Cleaning Checks
SELECT * FROM [Portfolio].[dbo].[SQL - Retail Sales Analysis] WHERE [transactions_id] IS NULL;
SELECT * FROM [Portfolio].[dbo].[SQL - Retail Sales Analysis] WHERE [sale_date] IS NULL;
SELECT * FROM [Portfolio].[dbo].[SQL - Retail Sales Analysis] WHERE [sale_time] IS NULL;

SELECT *
FROM [Portfolio].[dbo].[SQL - Retail Sales Analysis]
WHERE [transactions_id] IS NULL
   OR [sale_date] IS NULL
   OR [sale_time] IS NULL
   OR [gender] IS NULL
   OR [category] IS NULL
   OR [quantiy] IS NULL
   OR [cogs] IS NULL
   OR [total_sale] IS NULL;


-- Delete NULLs
DELETE FROM [Portfolio].[dbo].[SQL - Retail Sales Analysis]
WHERE [transactions_id] IS NULL
   OR [sale_date] IS NULL
   OR [sale_time] IS NULL
   OR [gender] IS NULL
   OR [category] IS NULL
   OR [quantiy] IS NULL
   OR [cogs] IS NULL
   OR [total_sale] IS NULL;


-- Data Exploration
SELECT COUNT(*) AS total_sales 
FROM [Portfolio].[dbo].[SQL - Retail Sales Analysis];

SELECT COUNT(DISTINCT customer_id) AS unique_customers 
FROM [Portfolio].[dbo].[SQL - Retail Sales Analysis];

SELECT DISTINCT category 
FROM [Portfolio].[dbo].[SQL - Retail Sales Analysis];


-- Q1: Sales on a specific date
SELECT *
FROM [Portfolio].[dbo].[SQL - Retail Sales Analysis]
WHERE sale_date = '2022-11-05';


-- Q2: Clothing transactions in Nov-2022 with quantity > 4
SELECT *
FROM [Portfolio].[dbo].[SQL - Retail Sales Analysis]
WHERE category = 'Clothing'
  AND FORMAT(sale_date, 'yyyy-MM') = '2022-11'
  AND quantiy > 4;


-- Q3: Total sales per category
SELECT 
    category,
    SUM(total_sale) AS net_sale,
    COUNT(*) AS total_orders
FROM [Portfolio].[dbo].[SQL - Retail Sales Analysis]
GROUP BY category;


-- Q4: Average age for Beauty category
SELECT
    ROUND(AVG(age), 2) AS avg_age
FROM [Portfolio].[dbo].[SQL - Retail Sales Analysis]
WHERE category = 'Beauty';


-- Q5: Transactions where total_sale > 1000
SELECT *
FROM [Portfolio].[dbo].[SQL - Retail Sales Analysis]
WHERE total_sale > 1000;


-- Q6: Transaction count by gender and category
SELECT 
    category,
    gender,
    COUNT(*) AS total_trans
FROM [Portfolio].[dbo].[SQL - Retail Sales Analysis]
GROUP BY category, gender
ORDER BY category;


-- Q7: Best selling month by year (based on avg total sale)
WITH MonthlySales AS (
    SELECT 
        YEAR(sale_date) AS year,
        MONTH(sale_date) AS month,
        AVG(total_sale) AS avg_sale
    FROM [Portfolio].[dbo].[SQL - Retail Sales Analysis]
    GROUP BY YEAR(sale_date), MONTH(sale_date)
),
RankedSales AS (
    SELECT *,
           RANK() OVER (PARTITION BY year ORDER BY avg_sale DESC) AS rank
    FROM MonthlySales
)
SELECT year, month, avg_sale
FROM RankedSales
WHERE rank = 1;


-- Q8: Top 5 customers by total sales
SELECT TOP 5
    customer_id,
    SUM(total_sale) AS total_sales
FROM [Portfolio].[dbo].[SQL - Retail Sales Analysis]
GROUP BY customer_id
ORDER BY total_sales DESC;


-- Q9: Unique customers per category
SELECT 
    category,    
    COUNT(DISTINCT customer_id) AS cnt_unique_cs
FROM [Portfolio].[dbo].[SQL - Retail Sales Analysis]
GROUP BY category;


-- Q10: Shift-wise transaction count
WITH hourly_sale AS (
    SELECT *,
        CASE
            WHEN DATEPART(HOUR, sale_time) < 12 THEN 'Morning'
            WHEN DATEPART(HOUR, sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
            ELSE 'Evening'
        END AS shift
    FROM [Portfolio].[dbo].[SQL - Retail Sales Analysis]
)
SELECT 
    shift,
    COUNT(*) AS total_orders
FROM hourly_sale
GROUP BY shift;
