-- List all calendar weeks
SELECT *
FROM weekly_deaths
ORDER BY report_year, report_week;

-- List all flu weeks
SELECT *
FROM weekly_deaths
WHERE flu_season IS NOT NULL
ORDER BY flu_season, flu_week;

-- List all weeks (tabular form) by calendar year
SELECT t.calendar_year, GROUP_CONCAT(IFNULL(num_deaths, "") ORDER BY t.calendar_week) AS num_deaths
FROM
(
	SELECT calendar_year, seq AS calendar_week
	FROM (SELECT DISTINCT calendar_year FROM weekly_deaths) AS d
	JOIN seq_1_to_52
	WHERE calendar_year IS NOT NULL
) AS t
LEFT JOIN weekly_deaths AS w ON t.calendar_year = w.calendar_year AND t.calendar_week = w.calendar_week
GROUP BY calendar_year
ORDER BY calendar_year;

-- List all weeks (tabular form) by flu season
SELECT t.flu_season, GROUP_CONCAT(IFNULL(avg_deaths_3w, "") ORDER BY t.flu_week) AS avg_deaths_3w
FROM
(
	SELECT flu_season, seq AS flu_week
	FROM (SELECT DISTINCT flu_season FROM weekly_deaths) AS d
	JOIN seq_1_to_52
	WHERE flu_season IS NOT NULL
) AS t
LEFT JOIN weekly_deaths AS w ON t.flu_season = w.flu_season AND t.flu_week = w.flu_week
GROUP BY flu_season
ORDER BY flu_season;

-- Max deaths in a single week (reporting year)
SELECT report_year, MAX(num_deaths) AS max_weekly_deaths
FROM weekly_deaths
GROUP BY report_year
ORDER BY report_year;

-- List bad "winter" weeks (excess deaths exceeds 5 year average)
SELECT *
FROM weekly_deaths
WHERE (report_week BETWEEN 1 AND 13 OR report_week BETWEEN 32 AND 52)
AND excess_deaths > 0
ORDER BY report_year, report_week;

-- List bad "non-winter" weeks (excess deaths exceeds 5 year average)
SELECT *
FROM weekly_deaths
WHERE report_week BETWEEN 14 AND 31
AND excess_deaths > 0
ORDER BY report_year, report_week;

-- List worst "non-winter" weeks for each reporting year
SELECT report_year, MAX(num_deaths) AS max_weekly_deaths
FROM weekly_deaths
WHERE report_week BETWEEN 14 AND 31
GROUP BY report_year
ORDER BY report_year;
