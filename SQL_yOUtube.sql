
-- Q1. Write a SQL query to find the top 5 customers with the highest total purchase amount. Assume you have two tables: Customers (CustomerID, Name) and Orders (OrderID, CustomerID, Amount).
```
SELECT c.CustomerID, c.Name, SUM(o.Amount) AS TotalPurchase
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.Name
ORDER BY TotalPurchase DESC
LIMIT 5;
```
-- Q2. Write a query to find the nth highest salary from a table Employees with columns EmployeeID, Name, and Salary.
```
SELECT DISTINCT Salary
FROM Employees
ORDER BY Salary DESC
LIMIT 1 OFFSET n-1;
```
-- Replace 'n' with the desired rank (e.g., 3 for the third highest).

-- Q3. Given a table Sales with columns SaleID, ProductID, SaleDate, and Quantity, write a query to find the total quantity sold for each product per month.
```
SELECT ProductID, DATE_TRUNC('month', SaleDate) AS Month, SUM(Quantity) AS TotalQuantity
FROM Sales
GROUP BY ProductID, Month
ORDER BY ProductID, Month;
```
-- Q4. Write a SQL query to find all employees with multiple managers. Assume you have a table Employees (EmployeeID, Name, ManagerID).
```
SELECT EmployeeID, Name
FROM Employees
GROUP BY EmployeeID, Name
HAVING COUNT(DISTINCT ManagerID) > 1;
```
-- Q5. Given a table Orders with columns OrderID, CustomerID, OrderDate, and a table OrderDetails with columns OrderID, ProductID, Quantity, write a query to find the top 3 products with the highest sales quantity.
```
SELECT ProductID, SUM(Quantity) AS TotalQuantity
FROM OrderDetails
GROUP BY ProductID
ORDER BY TotalQuantity DESC
LIMIT 3;
```
-- Q6. Write a SQL query to find the second most recent order date for each customer from a table Orders (OrderID, CustomerID, OrderDate).
```
SELECT CustomerID, MAX(OrderDate) AS SecondRecentOrderDate
FROM Orders
WHERE OrderDate < (SELECT MAX(OrderDate) FROM Orders o2 WHERE o2.CustomerID = Orders.CustomerID)
GROUP BY CustomerID;
```
-- Q7. Given a table Employees with columns EmployeeID, Name, DepartmentID, Salary, write a query to find the highest paid employee in each department.
```
SELECT DepartmentID, EmployeeID, Name, Salary
FROM Employees e1
WHERE Salary = (SELECT MAX(Salary) FROM Employees e2 WHERE e2.DepartmentID = e1.DepartmentID);
```
-- Q8. Write a SQL query to calculate the cumulative sales for each day in a table Sales with columns SaleID, SaleDate, and Amount.
```
SELECT SaleDate, SUM(Amount) OVER (ORDER BY SaleDate ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS CumulativeSales
FROM Sales
ORDER BY SaleDate;
```
-- Q9. Given a table Products with columns ProductID, Name, Price, and a table Sales with columns SaleID, ProductID, Quantity, write a query to find the product with the highest revenue.
```
SELECT p.ProductID, p.Name, SUM(p.Price * s.Quantity) AS Revenue
FROM Products p
JOIN Sales s ON p.ProductID = s.ProductID
GROUP BY p.ProductID, p.Name
ORDER BY Revenue DESC
LIMIT 1;
```
