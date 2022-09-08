CREATE TABLE fantasy.actuals AS (
SELECT
'2021' AS SEASON,
seas.playerId,
seas.name,
seas.seas_fpts AS seas_pr,
wkly.wkly_fpts AS wkly_pr,
wkly.wkly_cnst AS cnst_pr
FROM
	(
	SELECT
	playerId,
	name,
	AVG(seas_fpts) AS seas_fpts
	FROM
		(
		SELECT
		playerId,
		name,
		season,
		sum(fpts) AS seas_fpts
		FROM fantasy.player_game_fpts
		WHERE SEASON = 2021
		GROUP BY 1,2,3
		) b
	GROUP BY 1,2
	) seas
LEFT JOIN
	(
	SELECT
	playerId,
	name,
	AVG(wkly_fpts) AS wkly_fpts,
	SUM(wkly_cnst) AS wkly_cnst
	FROM
		(
		SELECT
		playerId,
		name,
		week,
		sum(fpts) AS wkly_fpts,
		CASE WHEN NAME = LAG(NAME) OVER (ORDER BY PLAYERID, WEEK) THEN
			CASE WHEN FPTS > LAG(FPTS) OVER (ORDER BY PLAYERID, WEEK) THEN 1 ELSE -1 END
		ELSE 0 
		END AS WKLY_CNST
		FROM fantasy.player_game_fpts
		WHERE SEASON = 2021
		GROUP BY 1,2,3
		) a
	GROUP BY 1,2
	) wkly
ON seas.playerId = wkly.playerId

UNION ALL

SELECT
'2020' AS SEASON,
seas.playerId,
seas.name,
seas.seas_fpts AS seas_pr,
wkly.wkly_fpts AS wkly_pr,
wkly.wkly_cnst AS cnst_pr
FROM
	(
	SELECT
	playerId,
	name,
	AVG(seas_fpts) AS seas_fpts
	FROM
		(
		SELECT
		playerId,
		name,
		season,
		sum(fpts) AS seas_fpts
		FROM fantasy.player_game_fpts
		WHERE SEASON = 2020
		GROUP BY 1,2,3
		) b
	GROUP BY 1,2
	) seas
LEFT JOIN
	(
	SELECT
	playerId,
	name,
	AVG(wkly_fpts) AS wkly_fpts,
	SUM(wkly_cnst) AS wkly_cnst
	FROM
		(
		SELECT
		playerId,
		name,
		week,
		sum(fpts) AS wkly_fpts,
		CASE WHEN NAME = LAG(NAME) OVER (ORDER BY PLAYERID, WEEK) THEN
			CASE WHEN FPTS > LAG(FPTS) OVER (ORDER BY PLAYERID, WEEK) THEN 1 ELSE -1 END
		ELSE 0 
		END AS WKLY_CNST
		FROM fantasy.player_game_fpts
		WHERE SEASON = 2020
		GROUP BY 1,2,3
		) a
	GROUP BY 1,2
	) wkly
ON seas.playerId = wkly.playerId

UNION ALL

SELECT
'2019' AS SEASON,
seas.playerId,
seas.name,
seas.seas_fpts AS seas_pr,
wkly.wkly_fpts AS wkly_pr,
wkly.wkly_cnst AS cnst_pr
FROM
	(
	SELECT
	playerId,
	name,
	AVG(seas_fpts) AS seas_fpts
	FROM
		(
		SELECT
		playerId,
		name,
		season,
		sum(fpts) AS seas_fpts
		FROM fantasy.player_game_fpts
		WHERE SEASON = 2019
		GROUP BY 1,2,3
		) b
	GROUP BY 1,2
	) seas
LEFT JOIN
	(
	SELECT
	playerId,
	name,
	AVG(wkly_fpts) AS wkly_fpts,
	SUM(wkly_cnst) AS wkly_cnst
	FROM
		(
		SELECT
		playerId,
		name,
		week,
		sum(fpts) AS wkly_fpts,
		CASE WHEN NAME = LAG(NAME) OVER (ORDER BY PLAYERID, WEEK) THEN
			CASE WHEN FPTS > LAG(FPTS) OVER (ORDER BY PLAYERID, WEEK) THEN 1 ELSE -1 END
		ELSE 0 
		END AS WKLY_CNST
		FROM fantasy.player_game_fpts
		WHERE SEASON = 2019
		GROUP BY 1,2,3
		) a
	GROUP BY 1,2
	) wkly
ON seas.playerId = wkly.playerId
)
