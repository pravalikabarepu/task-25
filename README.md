# Northwind Business Analysis

## Project Overview

This project combines customer, order, product, and category data from the Northwind dataset to perform end-to-end business analysis.

SQL was used to validate relationships, combine tables, calculate business metrics, and analyze sales performance. Power BI was used to create an interactive dashboard for presenting the results.

## Objective

The main objectives of this project are:

* Combine related Northwind tables for business analysis
* Validate table relationships and joins
* Avoid double counting in sales calculations
* Analyze sales by customer, product, category, and country
* Calculate key business metrics
* Create a Power BI dashboard
* Identify important business insights

## Tools Used

* MySQL
* SQL
* Power BI
* Northwind Dataset

## Data Used

The analysis uses the following Northwind entities:

* Customers
* Orders
* Products
* Categories
* Order Details

The tables were connected using their related primary and foreign keys.

## SQL Analysis

SQL was used for:

* Validating customer and order relationships
* Checking unmatched records
* Combining orders with customers and products
* Calculating total sales
* Calculating total orders
* Calculating total customers
* Calculating average order value
* Analyzing sales by customer
* Analyzing sales by product
* Analyzing sales by category
* Analyzing sales by country
* Identifying top customers
* Identifying top products
* Analyzing monthly sales trends
* Checking for potential double counting

## Power BI Dashboard

The Power BI dashboard contains four KPI cards:

* Total Sales
* Total Orders
* Total Customers
* Average Order Value

The dashboard contains four main visuals:

* Sales by Category
* Top 10 Products by Sales
* Sales by Country
* Monthly Sales Trend

## Key Insights

1. Sales performance varies across product categories, allowing categories with higher contribution to be identified.

2. A relatively small group of products contributes a significant portion of overall sales.

3. Sales contribution differs across countries, showing variation in customer markets.

4. Monthly sales trends help identify periods of higher and lower sales activity.

5. Customer and order-level analysis helps identify important customers and understand their contribution to overall business performance.

## Data Quality and Validation

The SQL analysis includes join validation and distinct counting to reduce the risk of duplicate records affecting business metrics.

Order-level metrics use distinct order identification, while sales calculations are performed at the appropriate order-line level.

## Project Files

* SQL script containing business analysis queries
* Power BI dashboard file
* Dashboard screenshot
* README 

## Conclusion

This project demonstrates an end-to-end relational business analysis workflow using SQL and Power BI. SQL was used for data combination, validation, and analysis, while Power BI was used to transform the results into an interactive business dashboard.
