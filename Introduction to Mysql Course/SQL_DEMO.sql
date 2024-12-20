-- show databases;
-- use company;
-- show tables;
-- select *from employee;
-- describe employee;

-- Create DataBase using command
create database sql_intro;
show databases;
create table Emp_details(Name varchar(30), Age int , Sex char(1), Dob date, City varchar(15) ,Salary float);
describe Emp_details;
-- Now Insert Some Data in Table 
insert into Emp_details
values("Chandan", 20, "M", "2005-04-20", "Bihar", 50000),("Ansh", 20, "M", "2003-12-03", "Delhi", 50000),
("Raju", 22, "M", "2005-02-24", "Patna", 60000) ,("Shivani", 23, "F", "2005-02-06", "Bihar", 40000),
("Saumya", 22, "F", "2002-01-30", "Bihar", 70000), ("Soni", 27, "F", "1995-01-05", "Lucknow", 65000),
("Harry", 30, "M", "2005-02-20", "Delhi", 80000), ("Kartik", 35, "M", "1992-10-10", "Mumbai", 90000);

show tables;
select *from Emp_details;
select distinct City from Emp_details; -- Show the Unique City from table

-- Different Aggrigate built in Function Use
select count(Name) as Count_Name from Emp_details;
select sum(Salary) from Emp_details;

select Name ,Age ,City from Emp_details;  -- Disply only these 3 columns
select *from Emp_details where age > 25;
select Name ,Sex ,City from Emp_details where Sex = "F";

-- Display All Employees who belongs to Delhi and Lucknow
select *from Emp_details where City = "Delhi" or City = "Lucknow";
select *from Emp_details where City in( "Mumbai" , "Lucknow");  -- 2nd Method

select *from Emp_details where Dob between '2004-12-03' and '2005-02-20' ;

-- Group by clause : Suppose we Find Total salary of employee based on Gender 
select Sex ,avg(Salary) as Tot_salary from Emp_details 
group by Sex;

-- order by clause : Suppose we find emp_details Salary in Decending Order
select * from Emp_details order by Salary desc;

-- Now Perform Some Arthmatics and String operation using Select
select(10+2) as addition ;
select length('INDIA') as total_len;
select repeat('@', 10);   -- Dispaly @ 10times
select lower('AMERICA');
SELECT curdate();  -- Display the Current Date
select day(curdate());
select now() ;    -- Display current Date and Time

--  String Functions
select ucase('india') AS upper_case;
select Name, char_length(Name) as total_lenn from Emp_details; 

select concat('India',' is', ' Our', ' Country') as merged; -- Display 'India is Our Country'

-- Reverse and Replace function 
select reverse('INDIA');
select replace('Orange is a vegetable', 'vegetable' ,'Fruit') as result;
select length(trim("		 India	 "));
select position('fruit' in "orange is a fruit") as Name ;
select ascii('4');

