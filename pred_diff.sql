CREATE TABLE pred_diff AS (
SELECT
playerId,
name,
AVG(seas_diff) AS seas_diff,
AVG(wkly_diff) AS wkly_diff
FROM
(
SELECT
pred.*,
act.seas_act,
act.wkly_act,
act.cnst_act,
(seas_act-seas_pr) / IF(seas_pr=0,1,seas_pr) AS seas_diff,
(wkly_act-wkly_pr) / IF(wkly_pr=0,1,wkly_pr) AS wkly_diff,
(cnst_act-cnst_pr) / IF(cnst_pr=0,1,cnst_pr) AS cnst_diff
FROM fantasy.predictions pred
LEFT JOIN fantasy.actuals act
ON pred.playerId = act.playerId
AND pred.SEASON = act.SEASON
) a

GROUP BY 1,2
)
