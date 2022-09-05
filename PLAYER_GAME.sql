CREATE TABLE fantasy.PLAYER_GAME AS (
SELECT
a.playerId,
a.name,
a.gameId,
a.gameDate,
SUM(a.I_F_goals) AS GOALS,
SUM(a.I_F_primaryAssists) + SUM(a.I_F_secondaryAssists) AS ASSISTS,
SUM(a.I_F_points) AS PTS,
SUM(a.I_F_penalityMinutes) AS PIM,
SUM(b.PKPP_PTS) AS PKPP_PTS,
SUM(a.I_F_faceOffsWon) AS FOW,
SUM(a.I_F_shotsOnGoal) AS SOG,
SUM(a.I_F_hits) as HITS,
SUM(a.shotsBlockedByPlayer) AS BLK
FROM fantasy.game_level a
LEFT JOIN pkpp_data b
ON CONCAT(a.playerId,a.gameId) = b.PLAYER_GAME_ID

GROUP BY 1,2,3,4
)

CREATE TABLE fantasy.PLAYER_GAME_FPTS AS (
SELECT
*,
(GOALS*3)+(ASSISTS*2)+(PTS)+(PIM*0.2)+(PKPP_PTS)+(FOW*0.05)+(SOG*0.1)+(HITS*0.3)+(BLK*0.3) AS FPTS,
CONCAT(LEFT(gameDate,4),'-',MID(gameDate,5,2),'-',RIGHT(gameDate,2)) AS GM_DT,
LEFT(gameDate,4) AS SEASON,
DATE(gameDate - INTERVAL(DAYOFWEEK(gameDate) - 2) DAY) AS WEEK
FROM fantasy.PLAYER_GAME
)
