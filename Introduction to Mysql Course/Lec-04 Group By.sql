show databases;
use sql_intro;
show tables;
select *from employees;
describe employees; 
-- Group By in Sql : This statement groups records into summary rows and returns one record for each group .
-- Syntax : SELECT column_names
--                   FROM table_name where condition
--                   GROUP BY column_names
--                   ORDER BY column_names
-- Exapmles : Find the Aveage salary of employees in each department.
 SELECT dept, avg(Salary) as average_salary  FROM Employees GROUP BY dept; 
 -- Insert new Row with value in table 
 insert into employees (Emp_Id,Emp_name, Age, Gender, Doj, Dept, City, Salary) values (108,'Fan',25,'M','2020-06-17','Science','Pune',80000);
 select distinct Dept from employees;  #Show only uniq Dept in table
 select Dept ,avg(age) as average_age from employees group by Dept;   #Average age in each department
 select Dept ,sum(Salary) as total_salary from employees group by dept;  # Find Total Salary in each department
 
 # find total no of working employee in each city and group it order of emp_id
 select count(emp_id) ,city from employees
 group by city
 order by count(emp_id) desc;
 
 # find total employee that join company each year
 select year(doj) as year ,count(emp_id) from employees
 group by year(doj);
 
 ## Join two or more tables using Group by 
 # For this we create another table Sales 
 create table slaes (product_id int, sell_price float ,quantity int,state varchar(25));
 insert into slaes values (121 , 320.0 , 3, 'Pune'), (121 , 310.0 , 2, 'Delhi'),(123 , 420.0 , 1, 'Pune'),(121 , 320.1 , 3, 'Texes'),(125 , 520.3 , 6, 'Texes');
 select *from slaes;
 select distinct product_id from slaes; # show all unique product_id in table
 
 # Find the Revenue generated by all the product_id
 select product_id, sum(sell_price *quantity) as revenue 
 from slaes group by product_id;
 
 # Find total profit made from all the products using Join
 create table c_product (product_id int, cost_price float);
 insert into c_product values (121, 280.0),(122, 260.2),(125, 320.0);
 
 select c.product_id ,sum((s.sell_price - c.cost_price) * s.quantity ) as profit #Here c and s are Alis name
 from slaes as s 
 inner join c_product as c
 where s.product_id = c.product_id 
 group by c.product_id;
 
---------------------------  HAVING CLAUSE IN SQL ----------------------------------------------------
-- It operates on groupped records and return rows where aggregate funcion results matched with given conditions only.  
-- Syntax: 		 select column_names
-- 		         from table_name where condition
--                group by column_names 
--                having condition
--                order by column_names

# Find the cities where there are more then 1 employees. 
select count(Emp_Id) ,city 
from employees group by city 
having count(Emp_Id)>1;

select *from employees;
# Find department where average salary is > 50,000
select dept ,avg(salary) as avg_salary
from employees group by dept
having avg(salary) > 50000;

# Find deprtment where more then 1 employees
select dept , count(*) as emp_count 
from employees group by dept
having count(*) > 1;

-- We can also do same work like this 
select city ,count(*) as emp_count 
from employees
where city!= 'Pune'
group by city having count(*);
 
 ## Using aggrigate fun()
 select dept ,count(*) as emp_count from employees
 group by dept
 having avg(salary) >50000;