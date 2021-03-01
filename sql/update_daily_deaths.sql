/*
    The following fields are created for the calculation of excess winter deaths (December to March):
    - report_years (yyyy-yyyy)
    - report_month (1-4 = Aug-Nov, 5-8 = Dec-Mar, 9-12 = Apr-Jul)
    - report_quadrimester (1 = Aug-Nov, 2 = Dec-Mar, 3 = Apr-Jul)

    The following fields are used for weekly stats that align with ONS weekly deaths:
    - ons_week (yyyyww)
*/

UPDATE daily_deaths
SET actual_year = YEAR(the_date),
    actual_month = MONTH(the_date),
    report_years = CONCAT(YEAR(the_date) - IF(MONTH(the_date) < 8, 1, 0), '-', YEAR(the_date) - IF(MONTH(the_date) < 8, 1, 0) + 1),
    report_month = MONTH(the_date) + IF(MONTH(the_date) < 8, 5, -7),
    report_quadrimester = FLOOR((MONTH(the_date) + IF(MONTH(the_date) < 8, 5, -7) - 1) / 4) + 1,
    ons_week = YEARWEEK(DATE_ADD(the_date, INTERVAL 2 DAY), 3);

-- Indices are not used (yet)
-- ALTER TABLE daily_deaths ADD UNIQUE INDEX (actual_year, actual_month);
-- ALTER TABLE daily_deaths ADD UNIQUE INDEX (report_year, report_month);
