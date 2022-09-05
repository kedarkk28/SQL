create database Day2
use Day2
create table Dept
(
deptno int primary key,
dname varchar(20),
loc varchar(20)
)
create table Emp
(
empno int primary key,
ename varchar(25),
job varchar(25),
mgr_id int,
hiredate date,
sal int,
comm int,
deptno int references Dept(deptno)
)
insert into Dept values(10,'ACCOUNTING','NEW YORK'),
(20,'RESEARCH','DALLAS'), 
(30,'SALES','CHICAGO'), 
(40,'OPERATIONS','BOSTON')
select * from Dept
insert into Emp values
(7369,'SMITH','CLERK',7902,'1980-12-17',800,null,20),
(7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30),
(7521,'WARD','SALESMAN',7698,'1981-02-22',1250,500,30),
(7566,'JONES','MANAGER',7839,'1981-04-02',2975,null,20),
(7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,1400,30),
(7698,'BLAKE','MANAGER',7839,'1981-05-01',2850,null,30),
(7782,'CLARK','MANAGER',7839,'1981-06-09',2450,null,10),
(7788,'SCOTT','ANALYST',7566,'1987-04-19',3000,null,20),
(7839,'KING','PRESIDENT',null,'1981-11-17',5000,null,10),
(7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,30),
(7876,'ADAMS','CLERK',7788,'1981-05-23',1100,null,20),
(7900,'JAMES','CLERK',7698,'1981-12-03',950,null,30),
(7902,'FORD','ANALYST',7566,'1981-12-03',3000,null,20),
(7934,'MILLER','CLERK',7782,'1982-01-23',1300,null,10)
select * from Emp