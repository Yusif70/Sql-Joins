--List the names of customers who have ordered products from the 'Beverages' category
select c.ContactName [customers who have ordered beverage] from Customers c 
join Orders o 
on c.CustomerID = o.CustomerID
join [Order Details] od
on o.OrderID = od.OrderID
join Products p 
on od.ProductID = p.ProductID
join Categories ca
on p.CategoryID = ca.CategoryID
where ca.CategoryName = 'Beverages'
--List the names of employees and the number of orders they have handled
select e.FirstName + ' ' + e.LastName [full name], COUNT(o.OrderID) [number of orders] from Employees e
join Orders o 
on e.EmployeeID = o.EmployeeID
group by e.FirstName, e.LastName
--Find the average discount given on orders
select ProductID, AVG(Discount) [average discount] from [Order Details]
group by ProductID
--List all suppliers located in a specific country (e.g., 'USA')
select * from Suppliers
where Country = 'USA'
--Retrieve the top 5 customers who have placed the highest number of orders
select c.ContactName, COUNT(o.OrderID) [number of orders] from Customers c
join Orders o 
on c.CustomerID = o.CustomerID
group by c.ContactName
order by COUNT(o.OrderID) desc
--Retrieve Sales Information for Each Product
----Objective: Write a query to retrieve a list of products along with the total quantity sold and the total sales amount for each product. Sort the results by the total sales amount in descending order.
select p.ProductName, SUM(od.Quantity) [total quantity], SUM(od.UnitPrice*od.Quantity) [total sales amount] from Products p
join [Order Details] od 
on p.ProductID = od.ProductID
group by p.ProductName
order by [total sales amount] desc
--Retrieve Basic Customer Order Information
----Objective: Write a query to retrieve a list of all customers and their most recent order details, including the customer name, order ID, order date, and total order amount. Sort the results by customer name.
select c.ContactName,MAX(o.OrderID) [most recent order], MAX(o.OrderDate) [most recent order date], COUNT(o.OrderID) [total order amount] from Customers c
join Orders o
on c.CustomerID = o.CustomerID
group by c.ContactName
order by c.ContactName
--Retrieve Supplier and Product Order Information
----Objective: Write a query to retrieve a list of suppliers and their products, along with the total number of orders and total sales amount for each product. Sort the results by supplier name(total number of orders) and then by total sales amount in descending order.
select s.CompanyName, COUNT(od.OrderID) [number of orders], SUM(od.UnitPrice*od.Quantity) [total sale amount] from Suppliers s
join Products p
on s.SupplierID = p.SupplierID
join [Order Details] od
on p.ProductID = od.ProductID
group by s.CompanyName
order by [number of orders] desc, [total sale amount] desc