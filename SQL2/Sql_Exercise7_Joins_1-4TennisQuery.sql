--SQL Exercise 7 Using Joins
--1-4 Tennis query



--output of players' names who played for both team 1 and team 2.

SELECT p.NAME
FROM PLAYERS p
JOIN MATCHES m ON p.PLAYERNO = m.PLAYERNO
WHERE m.TEAMNO IN (1, 2)
GROUP BY p.PLAYERNO, p.NAME
HAVING COUNT(DISTINCT m.TEAMNO) = 2;




--output the NAME and INITIALS of the players who did not receive a penalty in 1980

SELECT p.NAME, p.INITIALS
FROM PLAYERS p
WHERE p.PLAYERNO NOT IN (
    SELECT pe.PLAYERNO
    FROM PENALTIES pe
    WHERE EXTRACT(YEAR FROM pe.PEN_DATE) = 1980
  );



--output of players who received at least one penalty over $80

SELECT DISTINCT p.PLAYERNO, p.NAME
FROM PLAYERS p
JOIN PENALTIES pe ON p.PLAYERNO = pe.PLAYERNO
WHERE pe.AMOUNT > 80;



--output of players who had all penalties over $80. (no penalties under $80)

SELECT p.PLAYERNO, p.NAME
FROM PLAYERS p
WHERE EXISTS (
    SELECT 1
    FROM PENALTIES pe
    WHERE pe.PLAYERNO = p.PLAYERNO
  )
AND NOT EXISTS (
    SELECT 1
    FROM PENALTIES pe
    WHERE pe.PLAYERNO = p.PLAYERNO
      AND pe.AMOUNT <= 80
  );







