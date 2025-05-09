--SQL Exercise 6
--1-5 Tennis query



--NAME, INITIALS and number of sets won for each player

SELECT NAME, INITIALS, (
    SELECT SUM(WON)
    FROM MATCHES
    WHERE MATCHES.PLAYERNO = PLAYERS.PLAYERNO
    ) AS Sets_Won
FROM PLAYERS;



--NAME, PEN_DATE and AMOUNT sorted in descending order by AMOUNT

SELECT (
    SELECT DISTINCT NAME
    FROM PLAYERS
    WHERE PENALTIES.PLAYERNO = PLAYERNO
    ) AS PLAYER_NAME,
    PEN_DATE, AMOUNT
FROM PENALTIES
Order By AMOUNT DESC;



--TEAMNO, NAME (of the captain) per team

SELECT TEAMNO, (
       SELECT DISTINCT NAME
       FROM PLAYERS
       WHERE PLAYERS.PLAYERNO = TEAMS.PLAYERNO
       ) AS CAPTAIN
FROM TEAMS;



--NAME (player name), WON, LOST of all won matches

SELECT (
    SELECT Distinct NAME
    FROM PLAYERS
    WHERE PLAYERS.PLAYERNO = MATCHES.PLAYERNO
           ) AS PLAYER_NAME,
    WON, LOST
FROM MATCHES;



--PLAYERNO, NAME and penalty amount for each team player. If a player has not yet received a penalty,
--it should still be issued. Sorting should be done in ascending order of penalty amount

SELECT PLAYERNO, NAME, (
    SELECT SUM(AMOUNT)
    FROM PENALTIES
    WHERE PLAYERS.PLAYERNO = PENALTIES.PLAYERNO
    ) as PENALTY_AMOUNT
FROM PLAYERS
ORDER BY PENALTY_AMOUNT DESC
;























