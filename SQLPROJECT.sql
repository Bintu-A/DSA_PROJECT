CREATE DATABASE KMS_DB
---IMPORTS TABLES

---1. PRODUCT CATEGORY WITH HIGHEST SALES
SELECT TOP 1 
    Product_Category, 
    SUM(Sales) AS TotalSales
FROM ORDERS
GROUP BY Product_Category
ORDER BY TotalSales DESC


    ----PRODUCT CATEGORY WITH THE LEAST
SELECT TOP 1 
    Product_Category, 
    SUM(Sales) AS TotalSales
FROM ORDERS
GROUP BY Product_Category
ORDER BY TotalSales ASC



----2. TOP 3 REGIONS WITH HIGHEST SALES
SELECT TOP 3 Region, SUM(Sales) AS TotalSales
FROM ORDERS
GROUP BY Region
ORDER BY TotalSales DESC

------2B. LEAST 3 REGIONS WITH LOWEST SALES
SELECT TOP 3 Region, SUM(Sales) AS TotalSales
FROM ORDERS
GROUP BY Region
ORDER BY TotalSales ASC



----3. TOTAL APPLIANCES SALES IN ONTARIO
SELECT SUM(Sales) AS TOTALSALES
FROM ORDERS
WHERE  Province = 'Ontario'
    AND Product_Sub_Category = 'Appliances'


    ---4. CUSTOMERS WITH LEAST REVENUE
    ---- THE MANAGEMET can increase revenue from the bottom 10 customers by offering personalized discounts, introducing loyalty programs, analyzing their product interest and needs.
SELECT TOP 10 Customer_Name, SUM(Sales) AS TotalSales,  Product_Category
FROM ORDERS
GROUP BY Customer_Name,  Product_Category
ORDER BY TotalSales ASC


--5. SHIPPING METHOD WITH THE HIGHEST TOTAL COST
SELECT TOP 1 Ship_Mode, SUM (Shipping_Cost) AS TotalShippingCost
FROM ORDERS
GROUP BY Ship_Mode
ORDER BY TotalShippingCost DESC

---LOWEST
SELECT TOP 1 Ship_Mode, SUM (Shipping_Cost) AS TotalShippingCost
FROM ORDERS
GROUP BY Ship_Mode
ORDER BY TotalShippingCost ASC


------CASE SCENARIO 2

--6. Who are the most valuable customers, and what products or services do they typically purchase? 
SELECT TOP 20 
Customer_Name, Product_Category AS ProductCategories, SUM (Sales) AS TotalSales
FROM ORDERS
GROUP BY Customer_Name, Product_Category
ORDER BY TotalSales DESC

--7.Which small business customer had the highest sales? 
SELECT TOP 1 
    Customer_Name, SUM(Sales) AS TotalSales
FROM ORDERS
WHERE Customer_Segment = 'Small Business'
GROUP BY Customer_Name
ORDER BY TotalSales DESC

--8. Which Corporate Customer placed the most number of orders in 2009 – 2012? 
SELECT TOP 1
    Customer_Name, COUNT( DISTINCT Order_Quantity) AS TotalOrders
FROM ORDERS
WHERE Customer_Segment = 'Corporate'
 AND YEAR(Order_Date) BETWEEN 2009 AND 2012
GROUP BY Customer_Name
ORDER BY TotalOrders DESC

--9. Which consumer customer was the most profitable one? 
SELECT TOP 1
Customer_Name, SUM (Profit) AS TOTALPROFIT
FROM ORDERS
WHERE Customer_Segment = 'Consumer'
GROUP BY Customer_Name
ORDER BY TOTALPROFIT

--10. Which customer returned items, and what segment do they belong to? 
SELECT DISTINCT 
    o.Customer_Name,
    o.Customer_Segment
FROM ORDERS o
JOIN ORDER_STATUS s 
ON o.Order_ID = s.Order_ID
WHERE s.Status = 'Returned'

--11
SELECT 
    Order_Priority, Ship_Mode, COUNT(*) AS OrderCount, AVG(Shipping_Cost) AS AvgShippingCost
FROM ORDERS
GROUP BY Order_Priority, Ship_Mode
ORDER BY Order_Priority, AvgShippingCost DESC

--------TOP AND LEAST CUSTOMER SEGMENT BY TOTAL SALES
---HIGHEST
SELECT TOP 1 
    Customer_Segment, 
    SUM(Sales) AS TotalSales
FROM ORDERS
GROUP BY Customer_Segment
ORDER BY TotalSales DESC

---LOWEST
SELECT TOP 1 
    Customer_Segment, 
    SUM(Sales) AS TotalSales
FROM ORDERS
GROUP BY Customer_Segment
ORDER BY TotalSales ASC



SELECT * FROM ORDERS
SELECT * FROM ORDER_STATUS