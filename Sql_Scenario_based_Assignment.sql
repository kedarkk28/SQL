create database Day3

use Day3

--Create Tables
create table Books(
id int primary key,
title varchar(30),
author varchar(20),
isbn varchar(30),
published_date datetime
constraint uni_isbn unique(isbn)
)

create table Reviews
(
id int primary key,
book_id int,
reviewer_name varchar(25),
content varchar(25),
rating int,
published_date date
)

create table Customers
(
id int identity primary key,
name varchar(30),
age int,
address varchar(20),
salary float
)

create table orders
(
Oid int primary key,
dateOrdered datetime,
customerId int references Customers(id),  
amount int
)

create table Employees
(
id int identity primary key,
name varchar(30),
age int,
address varchar(20),
salary float
)

create table Studentdetails
(
registerNo int primary key,
Name varchar(20),
Age int,
Qualification varchar(20),
mobileNo varchar(15),
mailId varchar(25),
location_ varchar(20),
gender char(1)
)

create table Coursedetails
(
C_id varchar(10) primary key,
c_name varchar(20),
start_date date,
end_date date,
Fee int
)

create table Courseregistration
(
RegisterNo int,
cid varchar(10) references Coursedetails(C_id),
batch varchar(3)
)

create table customer2
(
customer_id int primary key,
first_name varchar(15),
last_name varchar(15),
)

create table Order2
(
order_id int primary key,
order_date date,
amount float,
customer_id int references customer2(customer_id)
)

create table orders3
(
id int primary key,
orderDate date,
orderNumber int,
customerId int,
totalAmount int
)

create table Orderitem
(
id int primary key,
orderId int,
productId int,
unitPrice int,
quantity int
)

create table Product
(
id int primary key,
productname varchar(20),
supplierId int,
unitPrice int,
package int,
isDiscontinued varchar(4)
)

--Inserting Data into tables

insert into Books(id,title,author,isbn,published_date) values
(1,'My First SQL book','Mary Parker',981483029127,'2012-02-22 12:08:17'),
(2,'My Second SQL book','Jony Mayer',857300923713,'1972-02-22 12:08:17'),
(3,'My Third SQL book','Cary Flint',523120967812,'2015-02-22 12:08:17')

insert into Reviews(id,book_id,reviewer_name,content,rating,published_date) values
(1,1,'John Smith','My First review',4,'2017-12-10 12:08:17'),
(2,2,'John Smith','My Second review',5,'2017-10-13'),
(3,2,'Alice Walker','Another review',1,'2017-10-22')

insert into Customers(name,age,address,salary) values
('Ramesh',32,'Ahmedabad',2000),
('Khilan',25,'Delhi',1500),
('Kaushik',23,'Kota',2000),
('Chaitali',25,'Mumbai',6500),
('Hardik',27,'Bhopal',8500),
('Komal',22,'MP',4500),
('Muffy',24,'Indore',10000)

insert into orders values
(102,'2009-10-08 00:00:00',3,3000),
(100,'2009-10-08 00:00:00',3,1500),
(101,'2009-11-20 00:00:00',2,1560),
(103,'2008-05-20 00:00:00',4,2060)


insert into Employees(name,age,address,salary) values
('Ramesh',32,'Ahmedabad',2000),
('Khilan',25,'Delhi',1500),
('Kaushik',23,'Kota',2000),
('Chaitali',25,'Mumbai',6500),
('Hardik',27,'Bhopal',8500),
('Komal',22,'MP',null),
('Muffy',24,'Indore',null)

insert into Studentdetails values
(2,'sai',22,'B.E',9952836777,'sai@gmail.com','Chennai','M'),
(3,'Kumar',20,'BSC',7890125648,'kumar@gmail.com','Madurai','M'),
(4,'Selvi',22,'B.Tech',8904567342,'selvi@gmail.com','Selam','F'),
(5,'Nisha',25,'M.E',7904567342,'nisha@gmail.com','Theni','F'),
(6,'SaiSaran',21,'B.A',8904567342,'saran@gmail.com','Madurai','F'),
(7,'Tom',23,'BCA',8604567342,'tom@gmail.com','Pune','M')

insert into Coursedetails values('DN003','DotNet','2018-02-01','2018-02-28',15000),
('DV004','DataVisualization','2018-03-01','2018-04-15',15000),
('JA002','AdvancedJava','2018-01-02','2018-01-20',10000),
('JC001','CoreJava','2018-01-02','2018-01-12',3000)

insert into Courseregistration values
(2,'DN003','FN'),
(3,'DV004','AN'),
(4,'JA002','FN'),
(2,'JA002','AN'),
(5,'JC001','FN')

insert into customer2 values
(1,'George','Washinghton'),
(2,'John','Adams'),
(3,'Thomas','Jefferson'),
(4,'James','Madison'),
(5,'James','Monroe')

insert into Order2 values
(1,'1776-04-07','234.56',1),
(2,'1777-01-04','71.10',3),
(3,'1778-02-04','123.1',2),
(4,'1777-03-02','65.50',3),
(5,'1778-05-01','25.50',null),
(6,'1778-11-27','14.40',null)

select * from Books
select * from Reviews
select * from Customers
select * from orders
select * from Employees
select * from Studentdetails
select * from Coursedetails
select * from customer2 
select * from Order2 

-- 1.
select * from Books where author like '%er'

-- 2.
select Books.id, Books.title, Books.author, Reviews.reviewer_name from Books left join Reviews on Books.id=Reviews.book_id

-- 3.
select reviewer_name,COUNT(reviewer_name) as 'Books Reviewed' from Reviews group by reviewer_name having COUNT(reviewer_name)>1

-- 4.
select * from Customers where address in (select distinct(address) from Customers where address like  '%o%' group by address)

-- 5.
select dateOrdered,count((customerId)) as 'customers placed orders' from orders group by dateOrdered

-- 6.
select name,salary from Employees where salary is null

-- 7.
select gender,count(*) as 'Count' from Studentdetails group by gender

-- 8.
select c_name,COUNT(RegisterNo) as Students_registered from Coursedetails join Courseregistration
on Coursedetails.C_id=Courseregistration.cid group by C_id,c_name
having C_name in (select C_name from Coursedetails c where start_date>='2018-01-02' and end_date<='2018-02-28') order by C_id desc

-- 9.
select first_name,last_name from customer2 
where customer_id in (select customer_id from Order2 group by customer_id having count(customer_id)=2)

-- 10.
select Name,UPPER(location_) as 'LOCATION' from Studentdetails order by Name desc

-- 11.
create view ootp_view as 
select productname,quantity as 'ordered Quantity',orderNumber from orders3 join Orderitem
on orders3.id=Orderitem.orderId join Product
on Orderitem.productId=Product.id

select * from ootp_view

-- 12.
select C_id, c_name as 'CourseName' from Coursedetails where C_id in 
(select cid from Courseregistration where registerno = (select registerNo from Studentdetails where Name='Nisha'))