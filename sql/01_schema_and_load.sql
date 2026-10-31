-- Schema and data load for the brewery analysis (PostgreSQL 13 or later).
-- Run from psql, from the repository root, so the relative path below resolves:
--   psql -d your_database -f sql/01_schema_and_load.sql

DROP TABLE IF EXISTS breweries;

CREATE TABLE breweries (
    sales_id    INTEGER PRIMARY KEY,
    sales_rep   VARCHAR(50)   NOT NULL,
    brands      VARCHAR(30)   NOT NULL,
    plant_cost  NUMERIC(10,2) NOT NULL,   -- production cost of one unit
    unit_price  NUMERIC(10,2) NOT NULL,   -- selling price of one unit
    quantity    INTEGER       NOT NULL,   -- units sold
    costs       NUMERIC(14,2) NOT NULL,   -- despite the name, this equals quantity x unit_price (sales revenue)
    profit      NUMERIC(14,2) NOT NULL,   -- quantity x (unit_price - plant_cost)
    countries   VARCHAR(20)   NOT NULL,   -- Nigeria, Ghana, Benin, Togo, Senegal
    region      VARCHAR(20)   NOT NULL,   -- sales region inside the country
    months      VARCHAR(10)   NOT NULL,
    years       INTEGER       NOT NULL    -- 2017, 2018 or 2019
);

\copy breweries FROM 'data/breweries.csv' WITH (FORMAT csv, HEADER true)

-- Quick checks: 1,047 rows, three years, five countries.
SELECT COUNT(*) AS rows, COUNT(DISTINCT years) AS years, COUNT(DISTINCT countries) AS countries FROM breweries;
