CREATE TABLE fantasy.draft_metrics AS (
SELECT
a.playerId as playerId,
a.name as name,
a.season_cnst / a.FPTS AS season_cnst,
a.GP AS GP,
a.FPTS as FPTS,
b.FPTS as wkly_fpts,
b.wkly_cnst as wkly_cnst,
b.wkly_gp,
c.PFP,
d.Rank AS player_rank
FROM season_cnst a
LEFT JOIN wkly_cnst b
ON a.playerId = b.playerId
LEFT JOIN player_pfp c
ON a.playerId = c.playerId
LEFT JOIN adp d
ON a.name = d.player
)
