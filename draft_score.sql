SELECT
dm.*,
(dm.wkly_fpts / (SELECT MAX(wkly_fpts) FROM fantasy.draft_metrics)) * 0.25 
+
(dm.wkly_cnst / dm.wkly_fpts) * 0.1
+
(dm.FPTS / (SELECT MAX(FPTS) FROM fantasy.draft_metrics)) * 0.2
+
(dm.SEASON_CNST / dm.FPTS) * 0.1
+
(dm.wkly_gp / (SELECT MAX(wkly_gp) FROM fantasy.draft_metrics)) * 0.1
+
(dm.GP / (SELECT MAX(GP) FROM fantasy.draft_metrics)) * 0.1
+
(dm.PFP * 0.05)
+
(1 - ((COALESCE(dm.player_rank,346)-1) / (SELECT MAX(player_rank) FROM fantasy.draft_metrics))) * 0.1
AS SCORE,
pred.seas_diff,
pred.wkly_diff

FROM fantasy.draft_metrics dm
LEFT JOIN fantasy.pred_diff pred
ON dm.playerId = pred.playerId

ORDER BY SCORE DESC

LIMIT 200








