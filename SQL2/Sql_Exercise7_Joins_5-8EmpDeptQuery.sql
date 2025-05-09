--SQL Exercise 7 Using Joins
--5-8 EmpDept query



--find all employees whose salary is higher than the average salary of their department

SELECT e.ENAME, e.SAL, e.DEPTNO
FROM EMP e
WHERE e.SAL > (
    SELECT AVG(e2.SAL)
    FROM EMP e2
    WHERE e2.DEPTNO = e.DEPTNO
  );



--identify all departments that have at least one employee

SELECT d.DEPTNO, d.DNAME
FROM DEPT d
WHERE EXISTS (
  SELECT 1
  FROM EMP e
  WHERE e.DEPTNO = d.DEPTNO
);



--output of all departments that have at least one employee earning over $1000

SELECT DISTINCT d.DEPTNO, d.DNAME
FROM DEPT d
JOIN EMP e ON d.DEPTNO = e.DEPTNO
WHERE e.SAL > 1000;



--output of all departments in which each employee earns at least 1000,-.

SELECT d.DEPTNO, d.DNAME
FROM DEPT d
WHERE NOT EXISTS (
  SELECT 1
  FROM EMP e
  WHERE e.DEPTNO = d.DEPTNO
    AND e.SAL < 1000
);





















