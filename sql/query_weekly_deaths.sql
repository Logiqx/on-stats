-- List all weeks
SELECT *
FROM weekly_deaths
ORDER BY report_year, report_week;

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
