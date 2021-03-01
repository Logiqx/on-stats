-- List all quadrimesters
SELECT *
FROM quadrimester_deaths;

-- Max deaths in a single quadrimester (reporting year)
SELECT report_years, MAX(num_deaths) AS max_quadrimester_deaths
FROM quadrimester_deaths
GROUP BY report_years
ORDER BY report_years;

-- List bad "winter" quadrimesters (excess deaths exceeds 5 year average)
SELECT *
FROM quadrimester_deaths
WHERE report_quadrimester = 2
AND excess_deaths > 0
ORDER BY report_years;

-- List bad "non-winter" quadrimesters (excess deaths exceeds 5 year average)
SELECT *
FROM quadrimester_deaths
WHERE report_quadrimester != 2
AND excess_deaths > 0
ORDER BY report_years;

-- Calculate "excess winter deaths" for each reporting year
-- Note: "ons_excess_deaths" corresponds to the ONS calculation, "alt_excess_deaths" is (arguably) more accurate
SELECT q1.report_years,
    ROUND(q2.num_deaths - (q1.num_deaths + q3.num_deaths) / 2, -1) AS ons_excess_deaths,
    ROUND(q2.num_deaths - (q1.num_deaths + q3.num_deaths) / (q1.num_days + q3.num_days) * q2.num_days, -1) AS alt_excess_deaths
FROM quadrimester_deaths AS q1
JOIN quadrimester_deaths AS q2 ON q2.report_years = q1.report_years
JOIN quadrimester_deaths AS q3 ON q3.report_years = q1.report_years
WHERE q1.report_quadrimester = 1
AND q2.report_quadrimester = 2
AND q3.report_quadrimester = 3;
