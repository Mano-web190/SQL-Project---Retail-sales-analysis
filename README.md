This project demonstrates SQL skills commonly used by data analysts to explore, clean, and analyze retail sales data. It covers database setup, data exploration, cleaning, and business-focused SQL queries to extract actionable insights.

📁 Project Structure
**Database Setup**
  Create a database p1_retail_db.
  Define the retail_sales table with fields such as:
transactions_id, sale_date, sale_time, customer_id, gender, age, category, quantity, price_per_unit, cogs, total_sale.
**Data Cleaning**
  Check for null values in key columns.
  Remove any incomplete records.
**Exploratory Data Analysis (EDA)**
  Total number of records.
  Unique customer count.
  List of unique product categories.
**Business Analysis (SQL Queries)**
  Daily, monthly, and shift-based sales analysis.
  Customer behavior and product category insights.
  High-value transaction detection.
  Top customers based on total sales.
  
**findings**
  Customer Demographics: The dataset includes customers from various age groups, with sales distributed across different categories such as Clothing and Beauty.
  High-Value Transactions: Several transactions had a total sale amount greater than 1000, indicating premium purchases.
  Sales Trends: Monthly analysis shows variations in sales, helping identify peak seasons.
  Customer Insights: The analysis identifies the top-spending customers and the most popular product categories.
  Reports
  Sales Summary: A detailed report summarizing total sales, customer demographics, and category performance.
  Trend Analysis: Insights into sales trends across different months and shifts.
  Customer Insights: Reports on top customers and unique customer counts per category.

**Conclusion**
  This project serves as a comprehensive introduction to SQL for data analysts, covering database setup, data cleaning, exploratory data analysis, and business-driven SQL queries. The findings from this project can help drive business decisions by understanding sales patterns, customer behavior, and product performance.

**How to Use**
  Clone the Repository: Clone this project repository from GitHub.
  Set Up the Database: Run the SQL scripts provided in the database_setup.sql file to create and populate the database.
  Run the Queries: Use the SQL queries provided in the analysis_queries.sql file to perform your analysis.
  Explore and Modify: Feel free to modify the queries to explore different aspects of the dataset or answer additional business questions.
