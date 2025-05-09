--SQL Exercise 7
--5-8 EmpDept query



--find all employees whose salary is higher than the average salary of their department

SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP e
WHERE SAL > (
    SELECT AVG(SAL)
    FROM EMP
    WHERE DEPTNO = e.DEPTNO
)
ORDER BY SAL DESC ;



--identify all departments that have at least one employee

SELECT DEPTNO, DNAME
FROM DEPT
WHERE DEPTNO IN (
    SELECT DISTINCT DEPTNO
    FROM EMP
    );



--output of all departments that have at least one employee earning over $1000

SELECT DEPTNO, DNAME
FROM DEPT
WHERE DEPTNO IN (
    SELECT DISTINCT DEPTNO
    FROM EMP
    WHERE SAL > 1000
    );



--output of all departments in which each employee earns at least 1000,-.

SELECT DEPTNO, DNAME
FROM DEPT d
WHERE NOT EXISTS (
    SELECT 1
    FROM EMP e
    WHERE e.DEPTNO = d.DEPTNO
      AND e.SAL < 1000
);


















