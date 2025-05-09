--SQL Exercise 6 Using Joins
--6-9 EmpDept query



--in which city does the employee Allen work?

SELECT d.LOC AS City
FROM EMP e
JOIN DEPT d ON e.DEPTNO = d.DEPTNO
WHERE e.ENAME = 'ALLEN';



--search for all employees who earn more than their supervisor

SELECT e.ENAME AS Employee, e.SAL AS Employee_Salary, m.ENAME AS Manager, m.SAL AS Manager_Salary
FROM EMP e
JOIN EMP m ON e.MGR = m.EMPNO
WHERE e.SAL > m.SAL;



--output the number of hires in each year

SELECT EXTRACT(YEAR FROM HIREDATE) AS Hire_Year, COUNT(*) AS Number_of_Hires
FROM EMP
GROUP BY EXTRACT(YEAR FROM HIREDATE)
ORDER BY Hire_Year;



--output all employees who have a job like an employee from CHICAGO.

SELECT e.ENAME, e.JOB, e.DEPTNO
FROM EMP e
WHERE e.JOB IN (
  SELECT DISTINCT e2.JOB
  FROM EMP e2
  JOIN DEPT d ON e2.DEPTNO = d.DEPTNO
  WHERE d.LOC = 'CHICAGO'
);

















