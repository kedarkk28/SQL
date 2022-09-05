use Day2
--1)
select * from Emp where job='MANAGER'
--2)
select ename,sal from Emp where sal > 1000
--3)
select ename,sal from Emp where ename <> 'JAMES'
--4)
select * from Emp where ename like 'S%'
--5)
select * from Emp where ename like '%A%'
--6)
select * from Emp where ename like '__L%'
--7) 
select ename, sal/30 'Daily salary of JONES' from Emp where ename='JONES'
--8)
select sum(sal) as 'Total Monthly Salary' from Emp
--9) 
select (sum(sal * 12)) / count(empno) as 'Average Annual Salary' from emp
--10) 
select ename,job,sal,deptno from Emp where empno not in (select empno from emp where deptno=30 and job='SALESMAN')
--11) 
select deptno,dname from Dept where deptno in (select distinct(deptno) from Emp)
--12) 
select empno,ename, sal from emp where empno in (select empno from emp where sal>1500) and empno in (select empno from Emp where deptno=10 or deptno=30)
--13) 
select ename,job, sal from Emp where job in ('MANAGER', 'ANALYST') and sal not in (1000, 3000,5000)
--14)
select ename,sal,comm from Emp where comm>(sal*1.1) 
--15) 
select ename from Emp where ename like '%L%L%' and (deptno=30 or mgr_id=7782)
--16)
select count(ename) as 'employees with exp btwn 10 and 20' from Emp where ename in (select ename from Emp where DATEDIFF(YEAR, hiredate, GETDATE()) between 10 and 20) 
--17)
select d.dname, e.ename from Emp as e right outer join Dept as d on e.deptno=d.deptno order by d.dname, e.ename desc 
--18)
select empno, ename, DATEDIFF(YEAR, hiredate, GETDATE()) as 'Experience' from Emp where ename='MILLER'