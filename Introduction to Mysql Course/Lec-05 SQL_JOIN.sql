-- SQL JOIN : SQL JOIN is used to Combine rows of data from two or more tables based on a Common Column(field) between them.
-- For example :You have two tables Order(order_id, order_date,Quantity) and Customers(order_id, Customer_id, Customer_name) So the problem is (1)Find the customer names who have ordered a product in last 30 days.In this case we Join both the table. 
------------------------  Types of Join --------------------------------------- 
# 1.  INNER JOIN : It returns all the rows from multiple tables as long as the condition are met. 
-- SYNTAX : SELECT <field lis> FROM Table A inner join Table B on A.key = B.key
create database sql_join; 
show databases;
use sql_join;
create table Cricket (cricket_id int auto_increment , name varchar(30), primary key(cricket_id));
create table Football (football_id int auto_increment , name varchar(30), primary key(football_id));

insert into Cricket(name) values ('Nehru'),('Komal'),('Jphn'), ('Kali'),('Geeta'),('Chandan');
select *from Cricket;
insert into Football(name) values ('Rajat'),('Komal'),('John'), ('Rokky'),('Geeta'),('Chandan');
select*from Football;

# Find all the students that parts of both the Teams
select *from Cricket as c inner join 
Football as f on c.name =f.name;

#Also indivisually select name from both the tables
select c.Cricket_id ,c.name, f.Football_id ,f.name 
from Cricket as c inner join Football as f on c.name =f.name;
 
 use classicmodels;
 show tables;
 
 select*from products;
 select*from productlines;
 # find product_code,Product_name and text_desc of each product for this join both the Tables.
 select product_code, produuct_name ,text_desc
 from products
 inner join productlines using (productlines);
 
# find revenue genereted from each product order and status of product 
-- Now join all these 3 tables
 select * from orders;
 select * from orderdetails;
 select*from products;

 select o.ordernumber, o.status, p.productname,
 sum(quantityordered * each_price) as revenue
 from orders as o
 inner join orderdetails as od on
 o.ordernumber = od.ordernumber inner join
 products as p on p.productcode = od.productcode group by ordernumber;
 
 # 1.  LEFT JOIN : It returns all the rows from Left tables and matching rows from the Right tables. 
-- SYNTAX : SELECT <field list> FROM Table A Left join Table B on A.key = B.key.

select *from customers;
select *from orders;

# Find customer_name and orderNumber
select c.customernumber , c.customer_name ,ordernumber, status
from customers as c left join orders as o
on c.customernumber = o.customernumber
where ordernumber is null;

# 3.  RIGHt JOIN : It returns all the rows from Right table and matching rows from the Left tables. 
-- SYNTAX : SELECT <field list> FROM Table A Right join Table B on A.key = B.key.

select *from customers;
select *from employees;

# Join both the tables
select c.customername ,c.phone ,e.employeenumber, e.email
from customers as c right join employees as e
on e.employeenumber = c.selesrepemployeenumber
order by employeenumber;

# 4. -------- SELF JOIN--------------

# Find who is the reportig manager for each Employee for this we use Self Join
select concat(m.lastname, ',' ,m.firstname) as manager,
concat(e.lastname, ',', e.firstname) as employee from employees as e 
inner join employees as m on 
m.employeenumber = e.reportsto
order by manager;

# 5. FULL JOIN : Sql full outer join statement return all the rows when there is a match in either left of right table.
# Note: Mysql workbanch does not support full join by default but there is a way to do it. SYNTAX: select <field list> from Table A full outer join Table B on A.key =B.key;

select c.customername ,o.ordernumber from customers as c
left join orders as o on c.customernumber = o.customernumber
union
select c.customername ,o.ordernumber from customers as c
right join orders as o on c.customernumber = o.customernumber;
