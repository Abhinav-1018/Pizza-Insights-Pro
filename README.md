# Pizzeria Sales Analysis
## Project Overview
This project was designed to help a new Pizzeria, focusing on takeout and delivery, manage its operations efficiently through data-driven insights. By leveraging SQL and Power BI, we created a comprehensive system to track customer orders, monitor inventory, and manage staff schedules and costs.

## Problem Statement
Ben, the Pizzeria owner, required a tailor-made relational database to capture and store business data for real-time performance tracking. The main areas of focus were:

Customer Orders: Track order details and analyze sales trends.
Stock Levels: Monitor inventory and calculate the cost of goods.
Staff Management: Manage shifts, hourly rates, and total payroll costs.

## Solution Approach
### 1. Database Design and SQL Operations
Schema: Designed a schema of 10 tables, including relationships and data types.
Data Ingestion: Imported data from 10 CSV files into MS SQL Server, creating tables for Orders, Inventory, and Staff.
SQL Queries: Utilized JOINs, subqueries, and VIEWS to organize and access data efficiently.

### 2. Data Transformation and Dashboard Development with Power BI
Data Transformation: Cleaned and prepared data using Power Query.
DAX Measures: Created custom measures with DAX for more insightful visualizations.
Visualizations:
Orders Dashboard:
KPIs: Total orders, items sold, total sales, average order value.
Visuals: Sales by item category, delivery status breakdown, sales by item name, sales over time, and sales by location.
Inventory Dashboard:
KPIs: Total ingredient cost, remaining stock levels.
Visuals: Remaining inventory by item name, cost of goods per item.
Staff Dashboard:
KPIs: Total staff cost, total hours worked.
Visuals: Staff schedule, hourly rates, and salary calculations.

## Key Insights
The Power BI dashboards provided meaningful insights for Ben, helping to:

Identify top-selling items and preferred order types (delivery vs. pickup).
Maintain optimal stock levels to reduce waste and manage costs.
Track labor costs and optimize staffing based on peak hours.

## Tech Stack
Database: MS SQL Server
Data Visualization: Power BI
Languages: SQL, DAX
Data Cleaning & Transformation: Power Query
