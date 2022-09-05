CREATE TABLE fantasy.PLAYER_PFP AS (
SELECT
playerId,
name,
( (SUM(GOALS)*3)+(SUM(ASSISTS)*2)+SUM(PTS)+SUM(PKPP_PTS) ) / SUM(FPTS) AS PFP
FROM fantasy.player_game_fpts

GROUP BY 1,2
)
