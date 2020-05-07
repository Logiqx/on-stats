/*
    Create table containing the number of deaths for each month, plus average for previous 5 years and the number of "excess deaths".
*/

DROP TABLE IF EXISTS monthly_deaths;

CREATE TABLE monthly_deaths AS
SELECT actual_year, actual_month, report_years, report_month, start_date, end_date, num_days, num_deaths,
    IF(num_known_5yrs = 5, avg_deaths_5yr, NULL) AS avg_deaths_5yr,
    IF(num_known_5yrs = 5, num_deaths - avg_deaths_5yr, NULL) AS excess_deaths,
    IF(num_known_5yrs = 5, ROUND(100 * (num_deaths - avg_deaths_5yr) / avg_deaths_5yr, 1), NULL) AS excess_deaths_pct
FROM
(
    SELECT actual_year, actual_month, report_years, report_month, start_date, end_date, num_days, num_deaths,
        COUNT(*) OVER (PARTITION BY actual_month ORDER BY actual_year RANGE BETWEEN 5 PRECEDING AND 1 PRECEDING) AS num_known_5yrs,
        ROUND(AVG(num_deaths) OVER (PARTITION BY actual_month ORDER BY actual_year RANGE BETWEEN 5 PRECEDING AND 1 PRECEDING), 0) AS avg_deaths_5yr
    FROM
    (
        SELECT actual_year, actual_month, report_years, report_month, 
            MIN(the_date) AS start_date, MAX(the_date) AS end_date, COUNT(*) AS num_days, SUM(num_deaths) AS num_deaths
        FROM daily_deaths
        GROUP BY actual_year, actual_month
        HAVING num_days >= 28
    ) AS t
) AS t;

