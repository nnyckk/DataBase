--SQL Exercise 6
--6-9 EmpDept query



--in which city does the employee Allen work?
SELECT ENAME, (
    SELECT LOC
    FROM DEPT
    WHERE DEPT.DEPTNO = EMP.DEPTNO
    ) AS CITY
FROM EMP
WHERE ENAME = 'ALLEN';



--search for all employees who earn more than their supervisor

SELECT e.EMPNO ,e.ENAME, e.SAL
FROM EMP e
WHERE e.SAL > (
    SELECT m.SAL
    FROM EMP m
    WHERE m.EMPNO = e.MGR
    );



--output the number of hires in each year

SELECT COUNT(*) AS HIRES, extract(YEAR FROM HIREDATE) AS YEAR
FROM EMP
GROUP BY extract(YEAR FROM HIREDATE);



--output all employees who have a job like an employee from CHICAGO.

SELECT EMPNO, ENAME, JOB, DEPTNO
FROM EMP
WHERE JOB IN (SELECT DISTINCT e.JOB
              FROM EMP e
              WHERE e.DEPTNO IN (SELECT d.DEPTNO
                                 FROM DEPT d
                                 WHERE d.LOC = 'CHICAGO'));




















