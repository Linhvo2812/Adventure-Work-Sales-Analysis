--Discard Data
DELETE FROM vendorproduct WHERE NOT EXISTS (
SELECT 1
FROM product
WHERE product.productid = vendorproduct.productid
);

--Delete column
ALTER TABLE Orderdetail DROP COLUMN salesorderid;

--Update Data
UPDATE employee
SET group_name = 'NorthAmerica'
WHERE jobtitle = 'NorthAmericanSalesManager'; UPDATE employee
SET group_name = 'Europe'
WHERE jobtitle = 'EuropeanSalesManager'; UPDATE employee
SET group_name = 'Pacific'
WHERE jobtitle = 'PacificSalesManager';

--Calculate Repeat Purchase rate 
WITH CustomerPurchases AS (
SELECT
CustomerID,
COUNT(DISTINCT SalesOrderID) AS NumberOfPurchases
FROM Orderdetail
GROUP BY CustomerID
),
RepeatCustomers AS (
SELECT CustomerID
FROM CustomerPurchases
WHERE NumberOfPurchases > 1
) SELECT
CAST(COUNT(DISTINCT rc.CustomerID) AS FLOAT) / CAST(COUNT(DISTINCT cp.CustomerID) AS FLOAT) * 100 AS RepeatPurchaseRate
FROM
CustomerPurchases cp
LEFT JOIN RepeatCustomers rc ON cp.CustomerID = rc.CustomerID