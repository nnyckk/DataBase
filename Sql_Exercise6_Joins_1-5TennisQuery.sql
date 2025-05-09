--SQL Exercise 6 Using Joins
--1-5 Tennis query



--NAME, INITIALS and number of sets won for each player

SELECT p.NAME, p.INITIALS, NVL(SUM(m.WON), 0) AS Sets_Won
FROM PLAYERS p
LEFT JOIN MATCHES m ON p.PLAYERNO = m.PLAYERNO
GROUP BY p.NAME, p.INITIALS
ORDER BY Sets_Won DESC;



--NAME, PEN_DATE and AMOUNT sorted in descending order by AMOUNT

SELECT p.NAME, pen.PEN_DATE, pen.AMOUNT
FROM PLAYERS p
JOIN PENALTIES pen ON p.PLAYERNO = pen.PLAYERNO
ORDER BY pen.AMOUNT DESC;



--TEAMNO, NAME (of the captain) per team

SELECT t.TEAMNO, p.NAME AS Captain_Name
FROM TEAMS t
JOIN PLAYERS p ON t.PLAYERNO = p.PLAYERNO;



--NAME (player name), WON, LOST of all won matches

SELECT p.NAME, m.WON, m.LOST
FROM PLAYERS p
JOIN MATCHES m ON p.PLAYERNO = m.PLAYERNO
WHERE m.WON > m.LOST;



--PLAYERNO, NAME and penalty amount for each team player. If a player has not yet received a penalty,
--it should still be issued. Sorting should be done in ascending order of penalty amount

SELECT p.PLAYERNO, p.NAME, NVL(SUM(pe.AMOUNT), 0) AS Total_Penalty
FROM PLAYERS p
LEFT JOIN PENALTIES pe ON p.PLAYERNO = pe.PLAYERNO
--WHERE p.TEAMNO IS NOT NULL
GROUP BY p.PLAYERNO, p.NAME
ORDER BY Total_Penalty ASC;





