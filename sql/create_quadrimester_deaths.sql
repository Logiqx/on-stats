/*
    Create table containing the number of deaths for each quadrimester, plus average for previous 5 years and the number of "excess deaths".
*/

DROP TABLE IF EXISTS quadrimester_deaths;

CREATE TABLE quadrimester_deaths AS
SELECT report_years, report_quadrimester, start_date, end_date, num_days, num_deaths,
    IF(num_known_5yrs = 5, avg_deaths_5yr, NULL) AS avg_deaths_5yr,
    IF(num_known_5yrs = 5, num_deaths - avg_deaths_5yr, NULL) AS excess_deaths,
    IF(num_known_5yrs = 5, ROUND(100 * (num_deaths - avg_deaths_5yr) / avg_deaths_5yr, 1), NULL) AS excess_deaths_pct
FROM
(
    SELECT report_years, report_quadrimester, start_date, end_date, num_days, num_deaths,
        COUNT(*) OVER (PARTITION BY report_quadrimester ORDER BY actual_year RANGE BETWEEN 5 PRECEDING AND 1 PRECEDING) AS num_known_5yrs,
        ROUND(AVG(num_deaths) OVER (PARTITION BY report_quadrimester ORDER BY actual_year RANGE BETWEEN 5 PRECEDING AND 1 PRECEDING), 0) AS avg_deaths_5yr
    FROM
    (
        SELECT actual_year, report_years, report_quadrimester,
            MIN(the_date) AS start_date, MAX(the_date) AS end_date, COUNT(*) AS num_days, SUM(num_deaths) AS num_deaths
        FROM daily_deaths
        GROUP BY report_years, report_quadrimester
        HAVING num_days IN (121, 122)
    ) AS t
) AS t;
