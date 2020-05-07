DROP TABLE IF EXISTS daily_deaths;

CREATE TABLE daily_deaths
(
    the_date DATE NOT NULL,
    num_deaths INT(5) NOT NULL,
    actual_year SMALLINT(4),
    actual_month TINYINT(2),
    report_years CHAR(9),
    report_month TINYINT(2),
    report_quadrimester TINYINT(1),
    ons_week INTEGER(6)
);
