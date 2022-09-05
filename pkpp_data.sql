CREATE TABLE fantasy.pkpp_data AS (
SELECT
CONCAT(playerId,gameId) AS PLAYER_GAME_ID,
SUM(I_F_points) AS PKPP_PTS
FROM fantasy.alldata
WHERE situation IN ('other','5on4','4on5')
GROUP BY 1
);
