/*
    Create table containing the number of deaths for each week, plus average for previous 5 years and the number of "excess deaths".
*/

DROP TABLE IF EXISTS weekly_deaths;

CREATE TABLE weekly_deaths AS
SELECT calendar_year, calendar_week,
	IF(calendar_week < 53, IF(calendar_week < 32, CONCAT(calendar_year - 1, "-", calendar_year), CONCAT(calendar_year, "-", calendar_year + 1)), NULL) AS flu_season,
	IF(calendar_week < 53, IF(calendar_week < 32, calendar_week + 21, calendar_week - 31), NULL) AS flu_week,
	start_date, end_date, num_days, num_deaths,
    IF(num_known_3w = 3, avg_deaths_3w, NULL) AS avg_deaths_3w,
    IF(num_known_5yrs = 5, avg_deaths_5yr, NULL) AS avg_deaths_5yr,
    IF(num_known_5yrs = 5, num_deaths - avg_deaths_5yr, NULL) AS excess_deaths,
    IF(num_known_5yrs = 5, ROUND(100 * (num_deaths - avg_deaths_5yr) / avg_deaths_5yr, 1), NULL) AS excess_deaths_pct
FROM
(
    SELECT calendar_year, calendar_week, start_date, end_date, num_days, num_deaths,
        COUNT(*) OVER (ORDER BY calendar_year, calendar_week ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS num_known_3w,
        ROUND(AVG(num_deaths) OVER (ORDER BY calendar_year, calendar_week ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING), 0) AS avg_deaths_3w,
        COUNT(*) OVER (PARTITION BY calendar_week ORDER BY calendar_year RANGE BETWEEN 5 PRECEDING AND 1 PRECEDING) AS num_known_5yrs,
        ROUND(AVG(num_deaths) OVER (PARTITION BY calendar_week ORDER BY calendar_year RANGE BETWEEN 5 PRECEDING AND 1 PRECEDING), 0) AS avg_deaths_5yr
    FROM
    (
        SELECT CAST(LEFT(ons_week, 4) AS UNSIGNED) AS calendar_year, CAST(RIGHT(ons_week, 2) AS UNSIGNED) AS calendar_week,
            MIN(the_date) AS start_date, MAX(the_date) AS end_date, COUNT(*) AS num_days, SUM(num_deaths) AS num_deaths
        FROM daily_deaths
        GROUP BY ons_week
        HAVING num_days = 7
        ORDER BY ons_week
    ) AS t
) AS t;
