-- Simple script to investigate effect of SUM(daily SD3) vs weekly SD3
-- https://twitter.com/RealJoelSmalley/status/1334863697588711424/photo/1

-- Weeks in 2020 using SD3 from daily data
WITH cte AS
(
	SELECT MONTH(the_date) AS the_month, DAY(the_date) AS the_day,
		AVG(num_deaths) AS avg_deaths,
		AVG(num_deaths) - STDDEV(num_deaths) * 3 AS lower_bound,
		AVG(num_deaths) + STDDEV(num_deaths) * 3 AS upper_bound
	FROM covid.daily_deaths AS d
	WHERE YEAR(the_date) BETWEEN 2015 AND 2019
	GROUP BY the_month, the_day
	ORDER BY the_month, the_day
)
SELECT 	YEARWEEK(DATE_ADD(DATE_ADD('2020-01-01', INTERVAL seq DAY), INTERVAL 2 DAY), 3) AS ons_week,
    SUM(avg_deaths) AS avg_deaths, SUM(lower_bound) AS lower_bound, SUM(upper_bound) AS upper_bound
FROM seq_0_to_365
JOIN cte ON MONTH(DATE_ADD('2020-01-01', INTERVAL seq DAY)) = the_month AND DAY(DATE_ADD('2020-01-01', INTERVAL seq DAY)) = the_day
GROUP BY ons_week
ORDER BY ons_week;

-- Weeks in 2020 using SD3 from weekly data
SELECT calendar_week,
	AVG(num_deaths) AS avg_deaths,
	AVG(num_deaths) - STDDEV(num_deaths) * 3 AS lower_bound,
	AVG(num_deaths) + STDDEV(num_deaths) * 3 AS upper_bound
FROM covid.weekly_deaths AS d
WHERE calendar_year BETWEEN 2015 AND 2019
AND calendar_week BETWEEN 1 AND 52
GROUP BY calendar_week
ORDER BY calendar_week;

-- PHE baseline
SELECT 	YEARWEEK(DATE_ADD(the_date, INTERVAL 2 DAY), 3) AS ons_week,
    SUM(baseline) AS baseline, SUM(lower_bound) AS lower_bound, SUM(upper_bound) AS upper_bound
FROM phe_baseline
GROUP BY ons_week
ORDER BY ons_week;
