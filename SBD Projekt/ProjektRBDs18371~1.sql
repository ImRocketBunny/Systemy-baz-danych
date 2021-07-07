select ename Nazwisko, job Stanowisko, sal "Miesieczna placa", 12*sal + NVL(comm, 0) "Roczny dochod"
from emp;

select 'pracownik ' || ename || ' pracuje na stanowisku ' || job || ' i zarabia miesiecznie ' ||sal
from emp;

select 1, 'Alamakota' from emp;
select 1, 'Alamakota' from dept;
select 1, 'Alamakota' from dummy;

select Sysdate, Systimestamp from dummy;

select ename, deptno, empno, mgr from emp;
select * from emp;
select ename, sal*12 from emp;
select ename, (sal+250)*12 from emp;
select ename, sal*12 as "Roczna" from emp;
select ename, sal*12 as "placa poczna" from emp;
select ename || empno  as "Zatrudniony" from emp;
select 'pracownik ' || ename || ' pracuje w dziale '|| deptno as "Informacje o pracownikach" from emp;
select ename, 12*sal + NVL(comm, 0) from emp;
select deptno from emp;
select distinct deptno from emp;
select distinct deptno, job from emp;
select ename from emp order by ename ASC;
select * from emp order by Hiredate DESC;
select * from emp order by deptno ASC, sal DESC;



select ename, empno, job, sal, deptno from emp where job='CLERK';
select * from emp;
select * from dept;
select dname, deptno from dept where deptno > 20;
select empno, ename from emp where comm>sal;
select * from emp where sal>1000 and sal<2000;
select * from emp where mgr='7902' or mgr='7566' or mgr = '7788';
select * from emp where ename like 'S%';
select * from emp where ename not like 'M%';
select * from emp where length(ename)= 4;
select * from emp where length(mgr)=null;
select ename, deptno, sal, job from emp where (job = 'CLERK') and (sal>1000 and sal < 2000);
select ename, deptno, sal, job from emp where (job = 'CLERK') or (sal>1000 and sal < 2000);
select ename, sal, job from emp where (job = 'MANAGER' and sal>1500) or (job = 'SALESMAN');
select ename, sal , job from emp where job ='MANAGER' or job = 'SALESMAN' and sal>1500;
select ename, job, deptno from emp where (job = 'MANAGER') or (job = 'CLERK' and deptno=10);








