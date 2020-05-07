-- List all days
SELECT *
FROM daily_deaths
ORDER BY the_date;

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
