# Pizza-Sales-Analysis

## Project Overview
This Data analysis project aims to provide insights into the sales performance of pizza sales company. By analyzing various aspects of the sales data, wee seek to identify trends, make data driven recommendation, and gain deeper understanding of the company's performance.

## Data Sources
Sales Data : The primary data set is used for this analysis is the "pizza_sales.csv" file, containing detailed information about each sale made by the company.

## Tools
- MySQL - Data Analysis
- Power BI - Creating Report

## Data Cleaning / Preparation
In the intial data preparation phase, we performed the following task

- Data loading and inspection
- Data cleaning and formatting

## Exploratory Data Analysis
EDA involved exploring the sales data to answer the key questions, such as :

- What is the total revenue, total orders and total pizza sold ?
- What is daily and monthly trend for total orders ?
- What is the percentage of sales by pizza category ?
- What is the percentage of sales by pizza size ?
- What is the Top 5 and Bottom 5 pizzas ?

### Result / Findings

The analysis results are summarised as follows  :
1.  The Thai Chicken Pizza Contributes to maximum revenue
2.  The Classic Pizza Contributes to maximum total quantities.
3.  The Classic Deluxe Pizza Contributes to maximum total Orders.
4.  The Brie Pizza Contribute to minimum Revenue.


### Recommendations

Based on the analysis, we recommend the following actions :
- Focus on expanding and promting products in " Brie Pizza".
  
## Data Analysis
Include some intersting code/feature worked with
```SQL
SELECT
                ROUND(SUM(total_price)) AS Total_Revenue
 FROM sales;
```
