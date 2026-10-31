-- =====================================================================
-- West Africa Brewery Sales Analysis (PostgreSQL)
-- Table: breweries   (1,047 sales records, 2017 to 2019, five countries)
-- Territories: Anglophone = Nigeria, Ghana. Francophone = Benin, Togo, Senegal.
-- "Beers" = budweiser, castle lite, eagle lager, trophy.
-- "Malts" = beta malt, grand malt, hero.
-- Run 01_schema_and_load.sql first.
-- =====================================================================

-- ---------------------------------------------------------------------
-- SECTION A: PROFIT ANALYSIS
-- ---------------------------------------------------------------------

-- [A1] Total profit over the three years, both territories included.
SELECT SUM(profit) AS total_profit
FROM breweries;

-- [A2] Total profit by territory, so the territory manager can plan for 2020.
SELECT CASE
           WHEN countries IN ('Nigeria', 'Ghana') THEN 'Anglophone'
           WHEN countries IN ('Benin', 'Togo', 'Senegal') THEN 'Francophone'
       END AS territory,
       SUM(profit) AS total_profit
FROM breweries
GROUP BY territory
ORDER BY total_profit DESC;

-- [A3] Country with the highest profit in 2019.
SELECT countries, SUM(profit) AS total_profit
FROM breweries
WHERE years = 2019
GROUP BY countries
ORDER BY total_profit DESC
LIMIT 1;

-- [A4] Year with the highest profit.
SELECT years, SUM(profit) AS total_profit
FROM breweries
GROUP BY years
ORDER BY total_profit DESC
LIMIT 1;

-- [A5] Month, across the three years, with the least profit.
-- (The first version used MIN(profit), which finds the smallest single sale.
--  The question asks for the month with the lowest total, so this uses SUM.)
SELECT months, years, SUM(profit) AS total_profit
FROM breweries
GROUP BY months, years
ORDER BY total_profit ASC
LIMIT 1;

-- [A6] Minimum profit on a single sale in December 2018.
SELECT months, years, MIN(profit) AS minimum_profit
FROM breweries
WHERE months = 'December' AND years = 2018
GROUP BY months, years;

-- [A7] Each month's share of 2019 profit, in percent.
SELECT months,
       SUM(profit) AS monthly_profit,
       ROUND(SUM(profit) / (SELECT SUM(profit) FROM breweries WHERE years = 2019) * 100, 2) AS profit_percentage
FROM breweries
WHERE years = 2019
GROUP BY months
ORDER BY profit_percentage DESC;

-- [A8] Brand with the highest profit in Senegal.
SELECT brands, SUM(profit) AS total_profit
FROM breweries
WHERE countries = 'Senegal'
GROUP BY brands
ORDER BY total_profit DESC
LIMIT 1;

-- ---------------------------------------------------------------------
-- SECTION B: BRAND ANALYSIS
-- ---------------------------------------------------------------------

-- [B1] Top three brands consumed in the francophone countries, 2018 and 2019.
-- (Consumption is measured by quantity. The first version summed profit and
--  grouped by year and country, so it returned three rows, not three brands.)
SELECT brands, SUM(quantity) AS total_quantity
FROM breweries
WHERE countries IN ('Benin', 'Togo', 'Senegal')
  AND years IN (2018, 2019)
GROUP BY brands
ORDER BY total_quantity DESC
LIMIT 3;

-- [B2] Top two consumer brands in Ghana.
SELECT brands, SUM(quantity) AS total_quantity
FROM breweries
WHERE countries = 'Ghana'
GROUP BY brands
ORDER BY total_quantity DESC
LIMIT 2;

-- [B3] Beers consumed in Nigeria (the most oil-rich country in West Africa),
--      by year, over the three years.
-- (The first version also filtered on region = 'west', which dropped five of
--  Nigeria's six regions.)
SELECT brands, years,
       SUM(quantity) AS total_consumed,
       SUM(profit) AS total_profit
FROM breweries
WHERE countries = 'Nigeria'
  AND brands IN ('budweiser', 'castle lite', 'eagle lager', 'trophy')
GROUP BY brands, years
ORDER BY brands, years;

-- [B4] Favourite malt brand in the anglophone countries, 2018 and 2019.
-- (The first version spelled 'Nigeria' as 'Ngeria', so it only counted Ghana.)
SELECT brands, SUM(quantity) AS total_quantity
FROM breweries
WHERE countries IN ('Nigeria', 'Ghana')
  AND years IN (2018, 2019)
  AND brands IN ('beta malt', 'grand malt', 'hero')
GROUP BY brands
ORDER BY total_quantity DESC;

-- [B5] Brands that sold the most in Nigeria in 2019, by profit.
SELECT brands, SUM(profit) AS total_profit
FROM breweries
WHERE countries = 'Nigeria' AND years = 2019
GROUP BY brands
ORDER BY total_profit DESC;

-- [B6] Favourite brand in Nigeria's south-south region, over all three years.
-- (The first version also grouped by year, so it returned one year's winner.)
SELECT brands, SUM(quantity) AS total_quantity
FROM breweries
WHERE countries = 'Nigeria' AND region = 'southsouth'
GROUP BY brands
ORDER BY total_quantity DESC
LIMIT 1;

-- [B7] Beer consumption in Nigeria.
SELECT brands, SUM(quantity) AS total_consumed
FROM breweries
WHERE countries = 'Nigeria'
  AND brands IN ('budweiser', 'castle lite', 'eagle lager', 'trophy')
GROUP BY brands
ORDER BY total_consumed DESC;

-- [B8] Budweiser consumption by region in Nigeria.
SELECT region, SUM(quantity) AS total_quantity
FROM breweries
WHERE countries = 'Nigeria' AND brands = 'budweiser'
GROUP BY region
ORDER BY total_quantity DESC;

-- [B9] Budweiser by region in Nigeria in 2019, to decide where to run a promotion.
SELECT region,
       SUM(quantity) AS total_quantity,
       SUM(profit) AS total_profit
FROM breweries
WHERE countries = 'Nigeria' AND years = 2019 AND brands = 'budweiser'
GROUP BY region
ORDER BY total_quantity ASC;

-- ---------------------------------------------------------------------
-- SECTION C: COUNTRY ANALYSIS
-- ---------------------------------------------------------------------

-- [C1] Country with the highest beer consumption.
-- (The first version grouped by brand and country, so it returned the best
--  single brand-country pair, not the best country.)
SELECT countries, SUM(quantity) AS total_consumption
FROM breweries
WHERE brands IN ('budweiser', 'castle lite', 'eagle lager', 'trophy')
GROUP BY countries
ORDER BY total_consumption DESC
LIMIT 1;

-- [C2] Top sales representative for Budweiser in Senegal.
SELECT sales_rep, SUM(profit) AS total_profit
FROM breweries
WHERE countries = 'Senegal' AND brands = 'budweiser'
GROUP BY sales_rep
ORDER BY total_profit DESC
LIMIT 1;

-- [C3] Country with the highest profit in the fourth quarter of 2019.
SELECT countries, SUM(profit) AS total_profit
FROM breweries
WHERE years = 2019
  AND months IN ('October', 'November', 'December')
GROUP BY countries
ORDER BY total_profit DESC
LIMIT 1;
