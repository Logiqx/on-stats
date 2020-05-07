# ons-stats

A collection of SQL scripts to analyse public data from the [Office for National Statistics](https://www.ons.gov.uk/) (ONS).

## Deaths in England and Wales

These scripts can be used to analyse the number of daily deaths from 1970-01-01 to 2018-07-31.

### Loading the Daily Deaths

Run scripts in the following order to create the base table:

- create_daily_deaths.sql
- insert_daily_deaths_1970-2018.sql
- insert_daily_deaths_provisional_2019.sql
- update_daily_deaths.sql

### Computing Weekly / Monthly / Quadrimester Deaths

Run scripts in the following order to create the summary tables:

- create_weekly_deaths.sql
- create_monthly_deaths.sql
- create_quadrimester_deaths.sql

### Ad-hoc Queries

The following scripts can then be used to query the data:

- query_daily_deaths.sql
- query_weekly_deaths.sql (e.g. "Excess Weekly Deaths")
- query_monthly_deaths.sql (e.g. "Excess Monthly Deaths")
- query_quadrimester_deaths.sql (e.g. "Excess Winter Deaths")

