--SQL Exercise 8



--Display the whole hierarchy of those parts that make up P3 and P9

SELECT LPAD('>', (LEVEL -1) *3, '-') || SUB AS PART_HIERARCHY, LEVEl
FROM PARTS
START WITH SUB IN ('P3', 'P9')
CONNECT BY PRIOR SUB = SUPER;



--At which hierarchy level is P12 used in P1

SELECT SUB, LEVEL
FROM PARTS
WHERE SUB = 'P12'
START WITH SUB = 'P1'
CONNECT BY PRIOR SUB = SUPER;



--How many parts to P1 cost more than $20

SELECT COUNT(*) AS Over_20
FROM PARTS
WHERE PRICE > 20
START WITH SUB = 'P1'
CONNECT BY PRIOR SUB = SUPER;



--Output of all direct and indirect employees belonging to JONES
--(without JONES itself, with corresponding indentation per hierarchy)

SELECT
  LPAD('>', (LEVEL - 1) * 3, '-') || ENAME AS employee_name,
  LEVEL
FROM EMP
WHERE ENAME != 'JONES'
START WITH EMPNO = (
    SELECT EMPNO
    FROM EMP
    WHERE ENAME = 'JONES'
    )
CONNECT BY PRIOR EMPNO = MGR;



--Output of all direct and indirect superiors of SMITH (including SMITH itself)

SELECT
  LPAD('>', (LEVEL - 1) * 3, '-') || ENAME AS employee_name,
  LEVEL
FROM EMP
START WITH ENAME = 'SMITH'
CONNECT BY PRIOR MGR = EMPNO;



--Output of the average salary for each hierarchy level

SELECT
  LEVEL AS hierarchy_level,
  ROUND(AVG(SAL),2) AS average_salary
FROM EMP
START WITH MGR IS NULL
CONNECT BY PRIOR EMPNO = MGR
GROUP BY LEVEL
ORDER BY LEVEL;






