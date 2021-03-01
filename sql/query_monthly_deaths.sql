-- List all months
SELECT *
FROM monthly_deaths
ORDER BY actual_year, actual_month;

-- Max deaths in a single month (reporting year)
SELECT report_years, MAX(num_deaths) AS max_monthly_deaths
FROM monthly_deaths
GROUP BY report_years
ORDER BY report_years;

-- List bad "winter" months (excess deaths exceeds 5 year average)
SELECT *
FROM monthly_deaths
WHERE report_month BETWEEN 5 AND 8
AND excess_deaths > 0
ORDER BY actual_year, actual_month;

-- List bad "non-winter" months (excess deaths exceeds 5 year average)
SELECT *
FROM monthly_deaths
WHERE actual_month BETWEEN 4 AND 11
AND excess_deaths > 0
ORDER BY actual_year, actual_month;

-- List worst "non-winter" months for each reporting year
SELECT report_years, MAX(excess_deaths) AS max_excess_deaths, MAX(excess_deaths_pct) AS max_excess_deaths_pct
FROM monthly_deaths
WHERE actual_month BETWEEN 4 AND 11
GROUP BY report_years
ORDER BY report_years;
