CREATE TABLE fantasy.PLAYER_WEEKLY_FPTS AS (
SELECT
playerId,
name,
WEEK,
SUM(FPTS) AS FPTS
FROM fantasy.PLAYER_GAME_FPTS
WHERE SEASON <= 2021
GROUP BY 1,2,3
ORDER BY 1,2,3
)
