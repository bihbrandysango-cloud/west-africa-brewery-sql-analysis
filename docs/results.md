# Results

Every answer below was produced by running `sql/02_analysis.sql` on PostgreSQL 13 against `data/breweries.csv` (1,047 sales). Profit is in US dollars as stored in the data, and quantity is units sold.

## Section A: Profit analysis

### A1. Total profit over the three years, both territories included

| total_profit |
|---|
| 105,587,420 |

### A2. Total profit by territory, for the 2020 decision

| territory | total_profit |
|---|---|
| Francophone | 63,198,160 |
| Anglophone | 42,389,260 |

### A3. Country with the highest profit in 2019

| countries | total_profit |
|---|---|
| Ghana | 7,144,070 |

### A4. Year with the highest profit

| years | total_profit |
|---|---|
| 2017 | 38,503,320 |

### A5. Month with the least profit across the three years

| months | years | total_profit |
|---|---|---|
| February | 2019 | 1,366,880 |

### A6. Minimum profit on a single sale in December 2018

| months | years | minimum_profit |
|---|---|---|
| December | 2018 | 38,150 |

### A7. Each month's share of 2019 profit

| months | monthly_profit | profit_percentage |
|---|---|---|
| January | 3,263,160 | 10.87 |
| August | 2,982,800 | 9.94 |
| July | 2,945,340 | 9.81 |
| April | 2,851,470 | 9.50 |
| November | 2,675,610 | 8.91 |
| June | 2,669,080 | 8.89 |
| May | 2,573,040 | 8.57 |
| March | 2,530,620 | 8.43 |
| October | 2,220,870 | 7.40 |
| December | 2,048,780 | 6.82 |
| September | 1,892,600 | 6.30 |
| February | 1,366,880 | 4.55 |

### A8. Brand with the highest profit in Senegal

| brands | total_profit |
|---|---|
| castle lite | 7,012,980 |

## Section B: Brand analysis

### B1. Top three brands consumed in the francophone countries, 2018 and 2019

| brands | total_quantity |
|---|---|
| trophy | 52,899 |
| hero | 50,846 |
| eagle lager | 50,630 |

### B2. Top two consumer brands in Ghana

| brands | total_quantity |
|---|---|
| eagle lager | 25,829 |
| castle lite | 25,806 |

### B3. Beers consumed in Nigeria by year, over the three years

| brands | years | total_consumed | total_profit |
|---|---|---|---|
| budweiser | 2017 | 12,027 | 3,006,750 |
| budweiser | 2018 | 8,636 | 2,159,000 |
| budweiser | 2019 | 5,490 | 1,372,500 |
| castle lite | 2017 | 9,458 | 2,553,660 |
| castle lite | 2018 | 12,835 | 3,465,450 |
| castle lite | 2019 | 3,388 | 914,760 |
| eagle lager | 2017 | 11,968 | 957,440 |
| eagle lager | 2018 | 5,503 | 440,240 |
| eagle lager | 2019 | 8,401 | 672,080 |
| trophy | 2017 | 8,536 | 426,800 |
| trophy | 2018 | 11,404 | 570,200 |
| trophy | 2019 | 5,803 | 290,150 |

### B4. Favourite malt brand in the anglophone countries, 2018 and 2019

| brands | total_quantity |
|---|---|
| hero | 36,900 |
| grand malt | 33,221 |
| beta malt | 32,118 |

### B5. Brands that sold the most in Nigeria in 2019

| brands | total_profit |
|---|---|
| budweiser | 1,372,500 |
| castle lite | 914,760 |
| eagle lager | 672,080 |
| beta malt | 587,230 |
| grand malt | 487,500 |
| hero | 481,100 |
| trophy | 290,150 |

### B6. Favourite brand in Nigeria's south-south region

| brands | total_quantity |
|---|---|
| eagle lager | 4,551 |

### B7. Beer consumption in Nigeria

| brands | total_consumed |
|---|---|
| budweiser | 26,153 |
| eagle lager | 25,872 |
| trophy | 25,743 |
| castle lite | 25,681 |

### B8. Budweiser consumption by region in Nigeria

| region | total_quantity |
|---|---|
| west | 4,620 |
| northcentral | 4,498 |
| southsouth | 4,328 |
| northeast | 4,320 |
| northwest | 4,274 |
| Southeast | 4,113 |

### B9. Budweiser by region in Nigeria in 2019 (promotion decision)

| region | total_quantity | total_profit |
|---|---|---|
| southsouth | 847 | 211,750 |
| west | 884 | 221,000 |
| northwest | 948 | 237,000 |
| northeast | 990 | 247,500 |
| Southeast | 1,821 | 455,250 |

## Section C: Country analysis

### C1. Country with the highest beer consumption

| countries | total_consumption |
|---|---|
| Nigeria | 103,449 |

### C2. Top sales representative for Budweiser in Senegal

| sales_rep | total_profit |
|---|---|
| Jones | 1,479,250 |

### C3. Country with the highest profit in the fourth quarter of 2019

| countries | total_profit |
|---|---|
| Ghana | 2,045,230 |

