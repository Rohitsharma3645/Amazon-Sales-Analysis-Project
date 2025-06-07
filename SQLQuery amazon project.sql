select * from customers
select * from orders
select * from products
------ total records in customers---10000
select count(*) as total_rows from customers
select * from customers

select distinct * from customers

---identify null values from table name from customers 0

select CustomerID, count(*) as total_null_values from customers
where CustomerID is null
group by CustomerID

select FirstName, count(*) as total_null_values from customers
where FirstName is null
group by FirstName

select LastName, count(*) as total_null_values from customers
where LastName is null
group by lastName

select Email, count(*) as total_null_values from customers
where Email is null
group by Email

select City, count(*) as total_null_values from customers
where city is null
group by city

select * from customers
----  Check for Duplicate Records in 0
select CustomerID,count(*) as duplicate_ids from customers
group by CustomerID
having count(*) > 1 

------ total records in 10000
select * from orders
select count(*) as total_rows from orders

select distinct * from orders

---identify null values from table name from orders  0
select OrderID, count(*) as total_null_values from orders
where OrderID is null
group by OrderID

select CustomerID,count(*) as total_null_values from orders
where CustomerID is null
group by CustomerID

select OrderDate,count(*) as total_null_values from orders
where OrderDate is null
group by OrderDate

select Amount,count(*) as total_null_values from orders
where Amount is null
group by Amount

select Status,count(*) as total_null_values from orders
where Status is null
group by Status

select shippingmethod,count(*) as total_null_values from orders
where ShippingMethod is null
group by ShippingMethod

---identify null values from table name from products --0

select ProductID,count(*) as total_null_values from products
where ProductID is null
group by ProductID

select ProductName,count(*) as total_null_values from products
where ProductName is null
group by ProductName

select Category,count(*) as total_null_values from products
where Category is null
group by Category 

select price,count(*) as total_null_values from products
where price is null 
group by price

select stock,count(*) as total_null_values from products
where stock is null 
group by stock

select Supplier,count(*) as total_nulls_values from products
where supplier is null
group by Supplier

select * from customers
select * from orders
select * from products

---all three tables no null values found ---

select * from customers


ALTER TABLE Customers
ADD FullName VARCHAR(255);

UPDATE Customers
SET FullName = CONCAT(FirstName, ' ', LastName);
/*
SELECT 
    SUBSTRING(FullName, 1, CHARINDEX(' ', FullName) - 1) AS FirstName
FROM customers;

SELECT 
    RIGHT(FullName, LEN(FullName) - CHARINDEX(' ', FullName)) AS LastName
FROM customers;
*/

select * from customers

alter table customers 
drop column FirstName

alter table customers 
drop column LastName

select * from orders

select round(amount,2) from orders

update orders
set Amount = round(Amount,2)

select * from products

update products
set price =round(price,2)

select * from products
---no duplicate customersid from customers tABLES
select CustomerID,count(*) as duplicate_ids from customers
group by CustomerID
having count(*) > 1 
---no duplicate EMAIL from customers tABLES
select Email,count(*) as duplicate_ids from customers
group by email
having count(*) >1

 ---total 5 unique cities 
select distinct city from customers
 select * from customers

 ---start join date and end join date 
select max(joindate) as max_join_date from customers
select min(joindate) as min_join_date from customers
---7 years--
select DATEDIFF(YEAR,min(joindate),max(joindate)) as year_diff from customers
----95months----
select DATEDIFF(month,min(joindate),max(joindate)) as month_diff from customers
----day-2921
select DATEDIFF(day,min(joindate),max(joindate)) as day_diff from customers

select * from orders
--no duplicates orderid found from orders tables
select OrderID,count(*) as duplicate_ids from orders
group by OrderID
having count(*) >1

select CustomerID,count(*) as duplicate_ids from orders
group by customerID
having count(*) >1

---total unique status 4
select distinct status from orders

---total unique shippingmethod 3
select distinct ShippingMethod from orders

---start orderdate and end orderdate

select max(orderdate) as max_order_date from orders
select min(orderdate) as min_order_date from orders
--- 3 yrs
select DATEDIFF(year,max(orderdate),min(orderdate)) as year_diff from orders
---months 47
select datediff(month,max(orderdate),min(orderdate)) as month_diff from orders
---day 1460
 select DATEDIFF(day,max(orderdate),min(orderdate)) as day_diff from orders

 ---no duplicate found productId from products tables
 select productID,count(*) as duplicate_id from products
 group by productID
 having count(*)>1
  
  ---no duplicate found productname from tables
 select ProductName,count(*) as duplicate_product_name from products
 group by ProductName
 having count(*)>1
 ---category unique 4
 select distinct Category from products
 ---supplier unique 3
 select distinct Supplier from products

 select * from customers
 select * from orders
 select * from products

 select * from customers as c
 inner join orders as o
 on c.CustomerID = o.CustomerID

  select * from customers as c
 left join orders as o
 on c.CustomerID = o.CustomerID

  select * from customers as c
 right join orders as o
 on c.CustomerID = o.CustomerID

 select * from customers

 select * from orders

 WITH CTE AS (
    SELECT 
        c.CustomerID,
		c.FullName,
        c.Email,
		c.city,
		c.joinDate,
		o.OrderID,
		o.OrderDate,
		o.Amount,
		o.Status,
		o.ShippingMethod
    FROM Customers as c
    RIGHT join orders as o
	on c.CustomerID = o.CustomerID
)
SELECT * INTO Final_Table FROM CTE;

select * from Final_Table
select customerid,fullname,email from Final_Table
where customerid is null

select customerid,fullname,email from Final_Table
where fullname is null

select customerid,fullname,email from Final_Table
where email is null


select * from Final_Table
where orderid is null

select * from Final_Table

select  distinct * from Final_Table

select customerid,fullname,email,sum(amount) as total_amount from Final_Table
group by customerid,fullname,email
order by sum(amount) desc

SELECT 
    CustomerID,
    Fullname,
	OrderID,
	Amount,
    Dense_Rank() OVER(PARTITION BY orderid order by amount  ) AS orderid_Cumulative_Count

FROM Final_Table

select * from Final_Table

select customerid,fullname,email,sum(amount) as total_amount from Final_Table
group by customerid,fullname,email
order by sum(amount) desc

select city, sum(amount) as total_amount from Final_Table
group by city
order by sum(amount)

select status,count(*) as status_count from Final_Table
group by status
order by count(*)

select shippingMethod,count(*)as shipping_count from Final_Table
group by shippingMethod
order by count(*)

select shippingMethod,round(sum(amount),2) as shipping_sum from Final_Table
group by shippingMethod
order by sum(amount)

select * from Final_Table

select * from products

select ProductID,max(price) as productid_max_price from products
group by ProductID 
order by productid_max_price desc

select ProductID,min(price) as productid_min_price  from products
 group by ProductID
 order by productid_min_price asc

 select * from products
  
select category,round(sum(price),2)as category_price from products
group by Category
order by category_price desc

select category,max(stock)as max_stock from products
group by Category
order by max_stock desc

select category,min(stock)as max_stock from products
group by Category
order by max_stock asc