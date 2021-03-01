-- List all days
SELECT *
FROM daily_deaths
ORDER BY the_date;

SELECT ons_week % 100 AS week_no, ROUND(AVG(MONTH(the_date)))
FROM daily_deaths
GROUP BY week_no
ORDER BY the_date;

SELECT MONTH(the_date), AVG(ons_week % 100) AS week_no
FROM daily_deaths
GROUP BY MONTH(the_date)
ORDER BY the_date;

-- List all days (tabular form) by calendar year
SELECT actual_year, GROUP_CONCAT(IFNULL(num_deaths, "") ORDER BY DAYOFYEAR(the_date)) AS num_deaths
FROM daily_deaths
GROUP BY actual_year
ORDER BY actual_year;

-- Max deaths on a single day for each reporting year
SELECT report_years, MAX(num_deaths) AS max_daily_deaths
FROM daily_deaths
GROUP BY report_years
ORDER BY report_years;

-- Quick check of reporting years / quadrimesters (number of days)
SELECT report_years, report_quadrimester, MIN(the_date) AS min_date, MAX(the_date) AS max_date, COUNT(*) AS num_days
FROM daily_deaths
GROUP BY report_years, report_quadrimester
HAVING NOT (
    report_quadrimester = 1 AND num_days = 122
    OR report_quadrimester = 2 AND num_days IN (121, 122)
    OR report_quadrimester = 3 AND num_days = 122
)
ORDER BY report_years, report_quadrimester;

-- Quick check of reporting weeks (number of days)
SELECT ons_week, MIN(the_date) AS min_date, MAX(the_date) AS max_date, COUNT(*) AS num_days
FROM daily_deaths
GROUP BY ons_week
HAVING num_days != 7
ORDER BY ons_week;

-- Rollup daily deaths to align with ONS weeks in 2020, starting 3 Jan 2010
SELECT YEAR(the_date) AS the_year, GROUP_CONCAT(num_deaths ORDER BY the_date) AS num_deaths
FROM
(
	SELECT the_date, SUM(num_deaths) OVER (ORDER BY the_date ROWS BETWEEN 6 PRECEDING AND 0 FOLLOWING) AS num_deaths
	FROM daily_deaths
) AS t
WHERE the_date BETWEEN '2010-01-03' AND '2019-12-31'
AND DAYOFYEAR(the_date) % 7 = 3
GROUP BY the_year
ORDER BY the_year;

-- List all of the January daily deaths
SELECT YEAR(the_date) AS the_year, GROUP_CONCAT(num_deaths ORDER BY the_date) AS num_deaths
FROM daily_deaths
WHERE MONTH(the_date) = 1
GROUP BY the_year
ORDER BY the_year;