------------------------
---Research Questions---
------------------------
/*
Employment and unemployment by age group

1. How did employment and unemployment rates change in the last 20 years?
The largest visible outliers in the overall employment and unemployment rates are over the 2009-2013 period, with unemployment being abnormally high and Employment being abnormally low. 
Unemployment reached its lowest in 2023, during the job market healing after the pandemic, but has since risen; interestingly, during 2023, employment rates did not have a significant 
rise or fall, so there must have been fewer people looking for work.

2. Which age groups experienced the largest changes?
The most notable age group differences are in the 50-64 and 65+ older generations and the 16-17 younger generation. Since 1992, 50- 64-year-old employment rates rose nearly 20% from 
55.6% to 72.1%, and the 65+ age group rose from 4.9% to 13.3%, nearly tripling. This is due to increasing costs leading to people retiring later. Whereas 16-17 year olds have the opposite 
story, since 1992 the rate of employment has more than halved, from 48.3% at its peak to 19.9% at its lowest in 2026 (not counting the pandemic years). During this time, unemployment for 
the 16-17 age group has nearly doubled, showing an inability to find youth work. 

3. Which patterns appear around and during the Covid-19 pandemic recovery?
Overall, most age groups' employment rates reached their lowest in 2020, except for 16-17, which reached its lowest in 2021; in fact, 2026 and 2025 have a lower employment rate than 2020. 
For 18- 24-year-olds, the employment rates were actually worse after the pandemic, so they did not benefit from the post-pandemic recovery. Unemployment was extremely low during the pandemic 
for 18- 24-year-olds, likely due to most people having just left college or going to university and not needing to look for work. Most age groups follow similar patterns, slightly less 
unemployment during the pandemic and increased afterwards; however, 50-64 year olds experienced a decrease in unemployment after the pandemic whilst their empl;

Vacancies

1. When was competition for jobs highest and lowest?
The highest competition for jobs was in 2009-2012, with some months reaching well over 5 unemployed people per vacancy; 2011 September was the highest recorded month with a 
5.9. Post-pandemic, the healthiest job market, with a near-perfect job-to-unemployment ratio of 1-1, there was 1 job for each person looking for employment. 

2. How did vacancies change during and after COVID-19
Vacancies changed a lot during and after the pandemic. The lowest vacancy level was in April 2020, when it reached 343,000. The period from March 2020 to October 2020 was when vacancies were 
at their lowest. During the job market's recovery, vacancies were relatively high; from June 2021 to December 2022, vacancies were mostly kept above 1,100,000, except for an extreme dip in December 2021, 
when it reached 600,000 (likely a mistake in the data). Since December 2024, there has been a steady decrease in vacancies, going from 910,000 to 691,000 in June 2026.

Workforce Jobs and vacancies by industry

1. Which industries gained or lost the most workforce jobs?
From 1992 to 2026 (the scope of the data), the two industries that had the largest growth were real estate, with a 177% growth and Scientific and technical roles, with 130% growth. Mining & quarrying 
had the greatest decline with -56% growth, followed by manufacturing with -42%. Three industries only marginally changed: Wholesale and Retail roles, Financial & insurance, and 
'Public admin & defence_ compulsory social security1'.

2. Which industries are struggling to fill positions (vacancies increasing)?
Water supply & sewerage roles have had by far the greatest growth in vacancies, with a 250% increase since 2002. The top 3 industries with the largest growth in vacancies are all public service jobs, 
meaning fewer people are getting into this area, or there is a far greater demand for them not being met. 

3. How did jobs compare to vacancies during the pandemic?
Whilst vacancies had a huge downfall, nearly declining 50% in one quarter, jobs stayed extremely stable. There was only a short drop from September 2020 to March 2021, which was quickly recovered from. 
After 2021, vacancies were at their height, consistently being around 1000+, until around 2024, when vacancies began to decline, but jobs were moderately affected. 

4. Which industries were affected by the pandemic the greatest?
In terms of workforce jobs, private households experienced the most growth with nearly 30%, followed by real estate roles with 20%, yet again mining & quarrying had by far the greatest decline at nearly 
18%. In vacancies, water supply & sewerage work experienced by far the largest growth in vacancies, whilst retail had the greatest decline with 30%, likely due to emerging technologies allowing for 
shopless stores. 
*/


--- How did employment and unemployment rates change in the last 20 years?
-- Employment
SELECT EXTRACT (YEAR FROM Parsed_Date) AS Year, ROUND(AVG(Value), 1) AS Average_Value 
  FROM `stoked-droplet-512422-v2.uk_labour_market.Age_Groups_Cleaned` 
  WHERE Measure = 'Employment Rate' AND Parsed_Date > '2005-01-01' AND Age_Group = '16-64'
  GROUP BY Year ORDER BY Year;


-- Unemployment
SELECT EXTRACT (YEAR FROM Parsed_Date) AS Year, ROUND(AVG(Value), 1) AS Average_Value
  FROM `stoked-droplet-512422-v2.uk_labour_market.Age_Groups_Cleaned` 
  WHERE Measure = 'Unemployment Rate' AND Parsed_Date > '2005-01-01' AND Age_Group = '16-64'
  GROUP BY Year ORDER BY Year;

--- Which age groups experienced the largest changes?
-- Employment Rate
SELECT *, Max_Value - Min_Value AS Value_Range 
FROM (SELECT Age_Group, ROUND(MAX(Value), 1) AS Max_Value, ROUND(MIN(Value), 1) AS Min_value
  FROM `stoked-droplet-512422-v2.uk_labour_market.Age_Groups_Cleaned` 
  WHERE Measure = 'Employment Rate' 
  GROUP BY Age_GROUP) ORDER BY Value_Range DESC;

SELECT EXTRACT (YEAR FROM Parsed_Date) AS Year, Age_Group, ROUND(AVG(Value), 1) AS Average_Value
  FROM `stoked-droplet-512422-v2.uk_labour_market.Age_Groups_Cleaned`
  WHERE Measure = 'Employment Rate' AND Age_Group = '16-17'
  GROUP BY Year, Age_Group ORDER BY Age_Group, Year;

-- Unemployment Rate
SELECT *, Max_Value - Min_Value AS Value_Range 
FROM (SELECT Age_Group, ROUND(MAX(Value), 1) AS Max_Value, ROUND(MIN(Value), 1) AS Min_value
  FROM `stoked-droplet-512422-v2.uk_labour_market.Age_Groups_Cleaned` 
  WHERE Measure = 'Unemployment Rate' 
  GROUP BY Age_GROUP) ORDER BY Value_Range DESC;

SELECT EXTRACT (YEAR FROM Parsed_Date) AS Year, Age_Group, ROUND(AVG(Value), 1) AS Average_Value
  FROM `stoked-droplet-512422-v2.uk_labour_market.Age_Groups_Cleaned`
  WHERE Measure = 'Unemployment Rate' AND Age_Group = '16-17'
  GROUP BY Year, Age_Group ORDER BY Age_Group, Year;

--- Which patters appear around and during the Covid-19 pandemic recovery?
-- Employment Rate
SELECT EXTRACT(YEAR FROM Parsed_Date) AS Year, Age_Group, ROUND(AVG(Value), 1) AS Average_Value
  FROM `stoked-droplet-512422-v2.uk_labour_market.Age_Groups_Cleaned` 
  WHERE Parsed_Date > '2019-01-01' AND Measure = 'Employment Rate'
  GROUP BY Age_Group, Year ORDER BY Age_Group, Year;

-- Unemployment Rate
SELECT EXTRACT(YEAR FROM Parsed_Date) AS Year, Age_Group, ROUND(AVG(Value), 1) AS Average_Value
  FROM `stoked-droplet-512422-v2.uk_labour_market.Age_Groups_Cleaned` 
  WHERE Parsed_Date > '2019-01-01' AND Measure = 'Unemployment Rate'
  GROUP BY Age_Group, Year ORDER BY Age_Group, Year;

--- When was competition for jobs highest and lowest?
-- Lowest 
SELECT Parsed_Date, `Number of unemployed people per vacancy` 
  FROM `stoked-droplet-512422-v2.uk_labour_market.Vacancies_to_Unemployment_Cleaned` 
  LIMIT 20;

-- Highest
SELECT Parsed_Date, `Number of unemployed people per vacancy` 
  FROM `stoked-droplet-512422-v2.uk_labour_market.Vacancies_to_Unemployment_Cleaned` 
  ORDER BY `Number of unemployed people per vacancy` DESC 
  LIMIT 20;

--- How did vacancies change during and after COVID-19
SELECT Parsed_Date, `All Vacancies1 _thousands_` 
  FROM `stoked-droplet-512422-v2.uk_labour_market.Vacancies_to_Unemployment_Cleaned`
  WHERE Parsed_Date > '2019-01-01'
  ORDER BY Parsed_Date;

--- Which industries gained or lost the most workforce jobs?
SELECT Industry, Jobs_1992, Jobs_2026, Jobs_2026 - Jobs_1992 AS Job_Change, ROUND(SAFE_DIVIDE(Jobs_2026 - Jobs_1992, Jobs_1992) * 100, 2) AS Job_Percentage_Change
  FROM (SELECT Industry,
    MAX(IF(EXTRACT(YEAR FROM Parsed_Date) = 1992 AND EXTRACT(MONTH FROM Parsed_Date) = 3, Workforce_Jobs, NULL)) AS Jobs_1992, 
    MAX(IF(EXTRACT(YEAR FROM Parsed_Date) = 2026 AND EXTRACT(MONTH FROM Parsed_Date) = 3, Workforce_Jobs, NULL)) AS Jobs_2026
      FROM
      `stoked-droplet-512422-v2.uk_labour_market.Workforce_Jobs_Cleaned`
    WHERE
      (EXTRACT(YEAR FROM Parsed_Date) = 1992 AND EXTRACT(MONTH FROM Parsed_Date) = 3)
      OR
      (EXTRACT(YEAR FROM Parsed_Date) = 2026 AND EXTRACT(MONTH FROM Parsed_Date) = 3)
    GROUP BY Industry)
WHERE Jobs_1992 IS NOT NULL AND Jobs_2026 IS NOT NULL
ORDER BY Job_Percentage_Change DESC;

--- Which industries are struggling to fill positions (vacancies increasing)?
SELECT Industry, Vacancies_2002, Vacancies_2026, Vacancies_2026 - Vacancies_2002 AS Vacancies_Change, ROUND(SAFE_DIVIDE(Vacancies_2026 - Vacancies_2002, Vacancies_2002) * 100, 1) AS Vacancies_Percentage_Change
  FROM (SELECT Industry,
    MAX(IF(EXTRACT(YEAR FROM Quarter_Date) = 2002 AND EXTRACT(MONTH FROM Quarter_Date) = 3, Vacancies, NULL)) AS Vacancies_2002, 
    MAX(IF(EXTRACT(YEAR FROM Quarter_Date) = 2026 AND EXTRACT(MONTH FROM Quarter_Date) = 3, Vacancies, NULL)) AS Vacancies_2026
      FROM
      `stoked-droplet-512422-v2.uk_labour_market.Industry_Vacancies_Quarterly`
    WHERE
      (EXTRACT(YEAR FROM Quarter_Date) = 2002 AND EXTRACT(MONTH FROM Quarter_Date) = 3)
      OR
      (EXTRACT(YEAR FROM Quarter_Date) = 2026 AND EXTRACT(MONTH FROM Quarter_Date) = 3)
    GROUP BY Industry)
WHERE Vacancies_2002 IS NOT NULL AND Vacancies_2026 IS NOT NULL AND Vacancies_2026 - Vacancies_2002 > 0
ORDER BY Vacancies_Percentage_Change DESC;

--- How did jobs compare to vacancies during the pandemic?
SELECT w.Parsed_Date, w.Workforce_Jobs, v.Vacancies 
FROM (SELECT Parsed_Date, Workforce_Jobs
FROM `stoked-droplet-512422-v2.uk_labour_market.Workforce_Jobs_Cleaned`
WHERE Industry = 'All jobs ' AND Parsed_Date > '2019-01-01') w
INNER JOIN (SELECT Quarter_Date, Vacancies
FROM `stoked-droplet-512422-v2.uk_labour_market.Industry_Vacancies_Quarterly`
WHERE Industry = 'All vacancies1' AND Quarter_Date > '2019-01-01') v ON w.Parsed_Date = v.Quarter_Date


--- Which industries were affected by the pandemic the greatest?
-- Workforce Jobs
SELECT Industry, Jobs_2019, Jobs_2024, Jobs_2024 - Jobs_2019 AS Job_Change, ROUND(SAFE_DIVIDE(Jobs_2024 - Jobs_2019, Jobs_2019) * 100, 2) AS Job_Percentage_Change
  FROM (SELECT Industry,
    MAX(IF(EXTRACT(YEAR FROM Parsed_Date) = 2019 AND EXTRACT(MONTH FROM Parsed_Date) = 3, Workforce_Jobs, NULL)) AS Jobs_2019, 
    MAX(IF(EXTRACT(YEAR FROM Parsed_Date) = 2024 AND EXTRACT(MONTH FROM Parsed_Date) = 3, Workforce_Jobs, NULL)) AS Jobs_2024
      FROM
      `stoked-droplet-512422-v2.uk_labour_market.Workforce_Jobs_Cleaned`
    WHERE
      (EXTRACT(YEAR FROM Parsed_Date) = 2019 AND EXTRACT(MONTH FROM Parsed_Date) = 3)
      OR
      (EXTRACT(YEAR FROM Parsed_Date) = 2024 AND EXTRACT(MONTH FROM Parsed_Date) = 3)
    GROUP BY Industry)
WHERE Jobs_2019 IS NOT NULL AND Jobs_2024 IS NOT NULL
ORDER BY Job_Percentage_Change DESC;

--Vacancies
SELECT Industry, Vacancies_2019, Vacancies_2024, Vacancies_2024 - Vacancies_2019 AS Vacancies_Change, ROUND(SAFE_DIVIDE(Vacancies_2024 - Vacancies_2019, Vacancies_2019) * 100, 2) AS Vacancies_Percentage_Change
  FROM (SELECT Industry,
    MAX(IF(EXTRACT(YEAR FROM Quarter_Date) = 2019 AND EXTRACT(MONTH FROM Quarter_Date) = 3, Vacancies, NULL)) AS Vacancies_2019, 
    MAX(IF(EXTRACT(YEAR FROM Quarter_Date) = 2024 AND EXTRACT(MONTH FROM Quarter_Date) = 3, Vacancies, NULL)) AS Vacancies_2024
      FROM
      `stoked-droplet-512422-v2.uk_labour_market.Industry_Vacancies_Quarterly`
    WHERE
      (EXTRACT(YEAR FROM Quarter_Date) = 2019 AND EXTRACT(MONTH FROM Quarter_Date) = 3)
      OR
      (EXTRACT(YEAR FROM Quarter_Date) = 2024 AND EXTRACT(MONTH FROM Quarter_Date) = 3)
    GROUP BY Industry)
WHERE Vacancies_2019 IS NOT NULL AND Vacancies_2024 IS NOT NULL
ORDER BY Vacancies_Percentage_Change DESC;
