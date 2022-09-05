SELECT
*,
(wkly_fpts / (SELECT MAX(wkly_fpts) FROM fantasy.draft_metrics)) * 0.25 
+
(wkly_cnst / (SELECT MAX(wkly_cnst) FROM fantasy.draft_metrics)) * 0.1
+
(FPTS / (SELECT MAX(FPTS) FROM fantasy.draft_metrics)) * 0.2
+
(SEASON_CNST / (SELECT MAX(SEASON_CNST) FROM fantasy.draft_metrics)) * 0.1
+
(wkly_gp / (SELECT MAX(wkly_gp) FROM fantasy.draft_metrics)) * 0.1
+
(GP / (SELECT MAX(GP) FROM fantasy.draft_metrics)) * 0.1
+
(PFP * 0.05)
AS SCORE
FROM fantasy.draft_metrics

ORDER BY SCORE DESC

LIMIT 100
