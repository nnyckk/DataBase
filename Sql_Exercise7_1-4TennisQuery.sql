--SQL Exercise 7
--1-4 Tennis query



--output of players' names who played for both team 1 and team 2.

SELECT NAME
FROM PLAYERS
WHERE PLAYERNO IN (
    SELECT PLAYERNO
    FROM MATCHES
    WHERE TEAMNO = 1
)
AND PLAYERNO IN (
    SELECT PLAYERNO
    FROM MATCHES
    WHERE TEAMNO = 2
);



--output the NAME and INITIALS of the players who did not receive a penalty in 1980

SELECT NAME, INITIALS
FROM PLAYERS
WHERE PLAYERNO NOT IN (
    SELECT DISTINCT PLAYERNO
    FROM PENALTIES
    WHERE EXTRACT(Year from PEN_DATE) = 1980
    );



--output of players who received at least one penalty over $80

SELECT PLAYERNO, NAME, INITIALS
FROM PLAYERS
WHERE PLAYERNO IN (
    SELECT PLAYERNO
    FROM PENALTIES
    WHERE AMOUNT > 80
    );



--output of players who had all penalties over $80. (no penalties under $80)

SELECT PLAYERNO, NAME, INITIALS
FROM PLAYERS
WHERE PLAYERNO IN (
    SELECT PLAYERNO
    FROM PENALTIES
    GROUP BY PLAYERNO
    HAVING MIN(AMOUNT) > 80
);


















