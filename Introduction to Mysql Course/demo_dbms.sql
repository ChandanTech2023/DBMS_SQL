create database dbms;

use dbms;
-- # NUMERIC FUNCTION
select abs(33);
select mod(10,4) as remainder; 
select power(2,3) as power;
select sqrt(144);
select greatest(2,6,4,9);
select least(5,6,9,2);
 
--  #student Table
 create table students(stu_id int primary key, stu_name varchar(34),age int, gender char(6),doa date ,city varchar(30));
 insert into students values
 (1,"chandan",18,'Male',"2023-12-11","Bihar"),
(2,"Raju",19,'Male',"2024-1-11","Delhi"),
(3,"Rima",18,'female',"2023-2-1","Pune"),
(4,"Kartik",20,'Male',"2024-10-11","Delhi");
-- #show all tables 
select *from students;

select stu_name ,age,city from students; #to show particular table
select *from students where city="Delhi";
select *from students where city="pune" and gender="Female";

-- #show students either delhi or bihar
select *from students where city="Delhi" or city="Bihar";

-- #Group By
select city ,count(stu_id) as total_students from students group by city;

-- #Having

select city,count(stu_id) as total_students 
from students group by city
having count(stu_id) <2;

-- #Order by

select *from students order by city; #Show city in  asscending order
select *from students order by city desc;  #Show city in  Decending order

-- #String function 

select upper("pune") as upper_case;
select lcase("HARIYANA") as lower_case;

select stu_name, char_length(stu_name) as total_length
from students;

-- #Concate function 
select concat('India', ' is' " Asia") as merged;
select stu_name,age , concat(stu_name, " ",stu_id) as name_id from students;

-- #Reverse function
select reverse('India');
select reverse(stu_name) from students;

select replace("Orange is a vegetable" ,"vegetable", "fruit")




 