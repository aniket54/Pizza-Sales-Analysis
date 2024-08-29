SELECT * FROM pizzadb.sales;


ALTER TABLE sales
MODIFY COLUMN pizza_name_id VARCHAR(50);

ALTER TABLE sales
MODIFY COLUMN order_date DATE;

UPDATE sales
SET order_date = date_format(str_to_date(order_date,'%m-%d-%Y'),'%Y-%m-%d');
SET sql_safe_updates = 0; 
rollback;

UPDATE sales
	SET order_date = CASE 
	WHEN order_date LIKE '%-%' THEN date_format(str_to_date(order_date,'%d-%m-%Y'),'%Y-%m-%d')
    ELSE NULL
    END; 
    
    ALTER TABLE sales
	MODIFY COLUMN order_time TIME;
    
    DESC sales;
    
    ALTER TABLE sales
	MODIFY COLUMN pizza_size VARCHAR(50);
    
      ALTER TABLE sales
	  MODIFY COLUMN pizza_ingredients VARCHAR(200);
      
        ALTER TABLE sales
		MODIFY COLUMN pizza_name VARCHAR(50);
        
-- ----------------------------------------------------------------------------------------------
SELECT * FROM pizzadb.sales;

 /* ---------KPI REQUIREMENT ------------*/
 
 -- 1. TOTAL REVENUE -- The sum of all the total price of all pizza orders 
 
 SELECT ROUND(SUM(total_price)) AS Total_Revenue FROM sales;
 
 -- 2. Average Order Value -- The average amount spent per order, calculated by dividing the total revenue by the total number of orders.
      
      SELECT SUM(total_price) / COUNT(DISTINCT(order_id))AS Avg_order_value from sales;
      
-- 3. Total Pizzas Sold -- The sum of the quantities of all pizzas sold

SELECT 
		SUM(quantity) AS Total_Pizzas_sold
FROM sales;
 
-- 4. Total Orders -- The total numbers of orders placed       

SELECT 
	COUNT(DISTINCT(order_id)) AS Total_orders_placed 
FROM sales;

-- 5. Average Pizzas Per Order -- The averge number of pizzas sold per order, calculated by dividing the total number of pizzas sold by the total number of orders.

SELECT 
		ROUND(SUM(quantity) / COUNT(DISTINCT(order_id)),2) AS Average_Pizzas_Per_Order
FROM sales;


-- Daily Trend for Total orders -- Create a bar chart that displays the daily trend of total orders over specific time period. This chart will help us to identify any patterns or fluctuations in order volumes on daily basis. 

SELECT 
		DAYNAME(order_date) AS order_day, COUNT(DISTINCT(order_id)) AS Total_orders
FROM sales
GROUP BY order_day
ORDER BY day(order_day);

-- Monthly trend for total orders -- 

SELECT 
	MONTHNAME(order_date) AS Month_name, COUNT(DISTINCT(order_id)) as Total_monthly_orders
FROM sales
GROUP BY Month_name
ORDER BY Total_monthly_orders DESC;
-- Percentage of sales by pizza category

SELECT 
		pizza_category, SUM(total_price) * 100/ (SELECT SUM(total_price) FROM sales) as Percentage_sales_Pizza
 FROM sales
 GROUP BY pizza_category;
 
  -- top 5 best sellers by revenue, by total quantity and total orders
  
  SELECT pizza_name, SUM(total_price) AS Total_revenue
  FROM sales
  GROUP BY pizza_name
  ORDER BY Total_revenue DESC LIMIT 5;
  
   -- top 5 worst sellers by revenue, by total quantity and total orders
  SELECT pizza_name, SUM(total_price) AS Total_revenue
  FROM sales
  GROUP BY pizza_name
  ORDER BY Total_revenue ASC LIMIT 5;
  
   -- top 5 best BY total quantity
   
   
  SELECT pizza_name, SUM(quantity) AS Total_quantity
  FROM sales
  GROUP BY pizza_name
  ORDER BY Total_quantity DESC LIMIT 5;
  
   -- top 5 worst BY total quantity
   
   
  SELECT pizza_name, SUM(quantity) AS Total_quantity
  FROM sales
  GROUP BY pizza_name
  ORDER BY Total_quantity ASC LIMIT 5;
  
     -- top 5 best BY total orders
     
  
  SELECT pizza_name, COUNT(DISTINCT(order_id)) AS Total_orders
  FROM sales
  GROUP BY pizza_name
  ORDER BY Total_orders DESC LIMIT 5;
  
  -- top 5 worst BY total orders
  
  SELECT pizza_name, COUNT(DISTINCT(order_id)) AS Total_orders
  FROM sales
  GROUP BY pizza_name
  ORDER BY Total_orders ASC LIMIT 5;
  