-- ===========================================
-- Question 1: Achieving 1NF (First Normal Form)
-- ===========================================
-- The original ProductDetail table violates 1NF because the Products column contains multiple values.
-- We need to split the Products column so that each row contains only one product per order.

SELECT OrderID, CustomerName, 'Laptop'  AS Product FROM (SELECT 101 AS OrderID, 'John Doe' AS CustomerName) AS t
UNION ALL
SELECT OrderID, CustomerName, 'Mouse'   AS Product FROM (SELECT 101 AS OrderID, 'John Doe' AS CustomerName) AS t
UNION ALL
SELECT OrderID, CustomerName, 'Tablet'  AS Product FROM (SELECT 102 AS OrderID, 'Jane Smith' AS CustomerName) AS t
UNION ALL
SELECT OrderID, CustomerName, 'Keyboard' AS Product FROM (SELECT 102 AS OrderID, 'Jane Smith' AS CustomerName) AS t
UNION ALL
SELECT OrderID, CustomerName, 'Mouse'   AS Product FROM (SELECT 102 AS OrderID, 'Jane Smith' AS CustomerName) AS t
UNION ALL
SELECT OrderID, CustomerName, 'Phone'   AS Product FROM (SELECT 103 AS OrderID, 'Emily Clark' AS CustomerName) AS t;

-- ===========================================
-- Question 2: Achieving 2NF (Second Normal Form)
-- ===========================================
-- The OrderDetails table is in 1NF but not 2NF because CustomerName depends only on OrderID (partial dependency).
-- To achieve 2NF, we split the table into two:
--   1. Orders: (OrderID, CustomerName)
--   2. OrderProducts: (OrderID, Product, Quantity)

-- 1. Orders table (OrderID, CustomerName)
SELECT DISTINCT OrderID, CustomerName
FROM OrderDetails;

-- 2. OrderProducts table (OrderID, Product, Quantity)
SELECT OrderID, Product, Quantity
FROM OrderDetails;