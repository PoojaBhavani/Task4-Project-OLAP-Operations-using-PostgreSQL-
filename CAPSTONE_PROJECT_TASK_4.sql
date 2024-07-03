/*Database Creation*/
CREATE DATABASE SalesAnalysis;

/*Create a table named "sales_sample"*/
CREATE TABLE sales_sample (
    Product_Id INT,
    Region VARCHAR(50),
    Date DATE,
    Sales_Amount NUMERIC
); 

SELECT * FROM sales_sample;

/*Data Creation-inserting 10 sample data for sales_sample table representing sales data*/
INSERT INTO sales_sample (Product_Id, Region, Date, Sales_Amount) VALUES
(1, 'West', '2024-04-04', 250),
(2, 'East', '2024-05-01', 550),
(3, 'South', '2024-06-12', 1000),
(4, 'East', '2024-03-04', 7500),
(5, 'North', '2024-05-25', 1100),
(1, 'South', '2024-07-01', 2512),
(2, 'North', '2024-03-22', 362),
(3, 'South', '2024-02-27', 499),
(4, 'West', '2024-04-14', 586),
(5, 'East', '2024-04-13', 1235);

SELECT * FROM sales_sample;

/*Drill Down-Analyze sales data at a more detailed level. Write a query to perform drill down
from region to product level to understand sales performance*/

SELECT 'Drill Down' AS Operation, Region, Product_Id, SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
GROUP BY Region, Product_Id
ORDER BY Region, Product_Id;


/*Rollup- To summarize sales data at different levels of granularity. Write a query to perform
roll up from product to region level to view total sales by region*/

SELECT 'Roll Up' AS Operation, Region, SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
GROUP BY Region
ORDER BY Region;

/*Cube - To analyze sales data from multiple dimensions simultaneously. Write a query to
Explore sales data from different perspectives, such as product, region, and date*/

SELECT 'Cube' AS Operation, Product_Id, Region, Date, SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
GROUP BY CUBE (Product_Id, Region, Date)
ORDER BY Product_Id, Region, Date;

/*Slice- To extract a subset of data based on specific criteria. Write a query to slice the data to
view sales for a particular region or date range*/

SELECT 'Slice' AS Operation, *
FROM sales_sample
WHERE Region = 'East';

SELECT 'Slice' AS Operation, *
FROM sales_sample
WHERE Date BETWEEN '2024-03-01' AND '2024-05-31';

/*Dice - To extract data based on multiple criteria. Write a query to view sales for specific
combinations of product, region, and date*/

SELECT 'Dice' AS Operation, *
FROM sales_sample
WHERE Product_Id IN (2, 3) AND Region IN ('East', 'South') AND 
	Date BETWEEN '2024-04-01' AND '2024-06-30';