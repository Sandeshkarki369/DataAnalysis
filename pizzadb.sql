SELECT *
FROM pizza_sales_excel_file

SELECT SUM(total_price) 
AS total_revenue from pizza_sales_excel_file

SELECT SUM(total_price)/ COUNT(DISTINCT order_id) 
AS avg_order_value FROM pizza_sales_excel_file

SELECT SUM(quantity) 
AS total_pizza_old FROM pizza_sales_excel_file

SELECT COUNT(DISTINCT order_id) 
AS total_orders FROM 

--(Nest Decimal query)

SELECT CAST(CAST(SUM(quantity) AS decimal(10,2))/ CAST(COUNT(DISTINCT order_id)AS DECIMAL(10,2))AS DECIMAL(10,2)) 
AS avg_pizza_per_order FROM pizza_sales_excel_file

SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales_excel_file
GROUP BY DATENAME(DW, order_date)
ORDER BY total_orders ASC

select DATENAME(MONTH, order_date) as Month_Name, COUNT(DISTINCT order_id) as Total_Orders
from pizza_sales_excel_file
GROUP BY DATENAME(MONTH, order_date)
ORDER BY total_orders DESC

SELECT pizza_category, SUM(total_price) AS total_sales, SUM(total_price) * 100 / (SELECT SUM(total_price)
FROM pizza_sales_excel_file) --WHERE MONTH(order_date)= 1) 
AS total_sales_pct
FROM pizza_sales_excel_file
--WHERE MONTH(order_date)= 1
GROUP BY pizza_category

SELECT *
FROM pizza_sales_excel_file


SELECT pizza_size, CAST(SUM(total_price)AS DECIMAL(10,2)) AS total_sales, CAST(SUM(total_price) * 100 / (SELECT SUM(total_price)
FROM pizza_sales_excel_file) --WHERE DATEPART( QUARTER, order_date)= 1) 
AS DECIMAL(10,2))AS total_sales_pct
FROM pizza_sales_excel_file
--WHERE DATEPART( QUARTER, order_date)= 1
GROUP BY pizza_size
ORDER BY total_sales_pct ASC

-- with price
SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales_excel_file
GROUP BY pizza_name
ORDER BY Total_Revenue DESC

-- with quantity
SELECT Top 5 pizza_name, SUM(quantity) AS Total_quanity 
FROM pizza_sales_excel_file
GROUP BY pizza_name
ORDER BY Total_quanity DESC



 


