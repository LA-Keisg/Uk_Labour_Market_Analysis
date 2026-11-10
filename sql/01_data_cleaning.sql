--- Create Clean Labour Market Age Groups Table

CREATE OR REPLACE TABLE `stoked-droplet-512422-v2.uk_labour_market.Labour_Market_Age_Groups_Cleaned` AS
SELECT l.*, 
CASE
  WHEN TRIM(date) = 'Jun-Aug 20111'
    THEN DATE '2011-06-01'
  ELSE PARSE_DATE(
    '%b %Y',
    CONCAT(
      SPLIT(TRIM(date), '-')[OFFSET(0)],
      ' ',
      SPLIT(TRIM(date), ' ')[OFFSET(1)]
    )
  )
END AS Parsed_Date
FROM `stoked-droplet-512422-v2.uk_labour_market.Labour_Market_Age_Groups` l;

--- Double Unpivot Equivalent

CREATE OR REPLACE TABLE
  `stoked-droplet-512422-v2.uk_labour_market.Age_Groups_Cleaned`
AS

-- Employment Level

SELECT Parsed_Date, '16 and over' AS Age_Group,
       'Employment Level' AS Measure,
       SAFE_CAST(`Aged 16 and over Employment Level` AS FLOAT64) AS Value
FROM `stoked-droplet-512422-v2.uk_labour_market.Labour_Market_Age_Groups_Cleaned`

UNION ALL
SELECT Parsed_Date, '16-64', 'Employment Level',
       SAFE_CAST(`Aged 16-64 Employment Level` AS FLOAT64)
FROM `stoked-droplet-512422-v2.uk_labour_market.Labour_Market_Age_Groups_Cleaned`

UNION ALL
SELECT Parsed_Date, '16-17', 'Employment Level',
       SAFE_CAST(`Aged 16-17 Employment Level` AS FLOAT64)
FROM `stoked-droplet-512422-v2.uk_labour_market.Labour_Market_Age_Groups_Cleaned`

UNION ALL
SELECT Parsed_Date, '18-24', 'Employment Level',
       SAFE_CAST(`Aged 18-24 Employment Level` AS FLOAT64)
FROM `stoked-droplet-512422-v2.uk_labour_market.Labour_Market_Age_Groups_Cleaned`

UNION ALL
SELECT Parsed_Date, '25-34', 'Employment Level',
       SAFE_CAST(`Aged 25-34 Employment Level` AS FLOAT64)
FROM `stoked-droplet-512422-v2.uk_labour_market.Labour_Market_Age_Groups_Cleaned`

UNION ALL
SELECT Parsed_Date, '35-49', 'Employment Level',
       SAFE_CAST(`Aged 35-49 Employment Level` AS FLOAT64)
FROM `stoked-droplet-512422-v2.uk_labour_market.Labour_Market_Age_Groups_Cleaned`

UNION ALL
SELECT Parsed_Date, '50-64', 'Employment Level',
       SAFE_CAST(`Aged 50-64 Employment Level` AS FLOAT64)
FROM `stoked-droplet-512422-v2.uk_labour_market.Labour_Market_Age_Groups_Cleaned`

UNION ALL
SELECT Parsed_Date, '65+', 'Employment Level',
       SAFE_CAST(`Aged 65+ Employment Level` AS FLOAT64)
FROM `stoked-droplet-512422-v2.uk_labour_market.Labour_Market_Age_Groups_Cleaned`


-- Employment Rate

UNION ALL
SELECT Parsed_Date, '16 and over', 'Employment Rate',
       SAFE_CAST(`Aged 16 and over Employment rate _%_` AS FLOAT64)
FROM `stoked-droplet-512422-v2.uk_labour_market.Labour_Market_Age_Groups_Cleaned`

UNION ALL
SELECT Parsed_Date, '16-64', 'Employment Rate',
       SAFE_CAST(`Aged 16-64 Employment rate _%_` AS FLOAT64)
FROM `stoked-droplet-512422-v2.uk_labour_market.Labour_Market_Age_Groups_Cleaned`

UNION ALL
SELECT Parsed_Date, '16-17', 'Employment Rate',
       SAFE_CAST(`Aged 16-17 Employment rate _%_` AS FLOAT64)
FROM `stoked-droplet-512422-v2.uk_labour_market.Labour_Market_Age_Groups_Cleaned`

UNION ALL
SELECT Parsed_Date, '18-24', 'Employment Rate',
       SAFE_CAST(`Aged 18-24 Employment rate _%_` AS FLOAT64)
FROM `stoked-droplet-512422-v2.uk_labour_market.Labour_Market_Age_Groups_Cleaned`

UNION ALL
SELECT Parsed_Date, '25-34', 'Employment Rate',
       SAFE_CAST(`Aged 25-34 Employment rate _%_` AS FLOAT64)
FROM `stoked-droplet-512422-v2.uk_labour_market.Labour_Market_Age_Groups_Cleaned`

UNION ALL
SELECT Parsed_Date, '35-49', 'Employment Rate',
       SAFE_CAST(`Aged 35-49 Employment rate _%_` AS FLOAT64)
FROM `stoked-droplet-512422-v2.uk_labour_market.Labour_Market_Age_Groups_Cleaned`

UNION ALL
SELECT Parsed_Date, '50-64', 'Employment Rate',
       SAFE_CAST(`Aged 50-64 Employment rate _%_` AS FLOAT64)
FROM `stoked-droplet-512422-v2.uk_labour_market.Labour_Market_Age_Groups_Cleaned`

UNION ALL
SELECT Parsed_Date, '65+', 'Employment Rate',
       SAFE_CAST(`Aged 65+ Employment rate _%_` AS FLOAT64)
FROM `stoked-droplet-512422-v2.uk_labour_market.Labour_Market_Age_Groups_Cleaned`


-- Unemployment Level

UNION ALL
SELECT Parsed_Date, '16 and over', 'Unemployment Level',
       SAFE_CAST(`Aged 16 and over Unemployment Level` AS FLOAT64)
FROM `stoked-droplet-512422-v2.uk_labour_market.Labour_Market_Age_Groups_Cleaned`

UNION ALL
SELECT Parsed_Date, '16-64', 'Unemployment Level',
       SAFE_CAST(`Aged 16-64 Unemployment Level` AS FLOAT64)
FROM `stoked-droplet-512422-v2.uk_labour_market.Labour_Market_Age_Groups_Cleaned`

UNION ALL
SELECT Parsed_Date, '16-17', 'Unemployment Level',
       SAFE_CAST(`Aged 16-17 Unemployment Level` AS FLOAT64)
FROM `stoked-droplet-512422-v2.uk_labour_market.Labour_Market_Age_Groups_Cleaned`

UNION ALL
SELECT Parsed_Date, '18-24', 'Unemployment Level',
       SAFE_CAST(`Aged 18-24 Unemployment Level` AS FLOAT64)
FROM `stoked-droplet-512422-v2.uk_labour_market.Labour_Market_Age_Groups_Cleaned`

UNION ALL
SELECT Parsed_Date, '25-34', 'Unemployment Level',
       SAFE_CAST(`Aged 25-34 Unemployment Level` AS FLOAT64)
FROM `stoked-droplet-512422-v2.uk_labour_market.Labour_Market_Age_Groups_Cleaned`

UNION ALL
SELECT Parsed_Date, '35-49', 'Unemployment Level',
       SAFE_CAST(`Aged 35-49 Unemployment Level` AS FLOAT64)
FROM `stoked-droplet-512422-v2.uk_labour_market.Labour_Market_Age_Groups_Cleaned`

UNION ALL
SELECT Parsed_Date, '50-64', 'Unemployment Level',
       SAFE_CAST(`Aged 50-64 Unemployment Level` AS FLOAT64)
FROM `stoked-droplet-512422-v2.uk_labour_market.Labour_Market_Age_Groups_Cleaned`

UNION ALL
SELECT Parsed_Date, '65+', 'Unemployment Level',
       SAFE_CAST(`Aged 65+ Unemployment Level` AS FLOAT64)
FROM `stoked-droplet-512422-v2.uk_labour_market.Labour_Market_Age_Groups_Cleaned`


-- Unemployment Rate

UNION ALL
SELECT Parsed_Date, '16 and over', 'Unemployment Rate',
       SAFE_CAST(`Aged 16 and over Unemployment rate _%_` AS FLOAT64)
FROM `stoked-droplet-512422-v2.uk_labour_market.Labour_Market_Age_Groups_Cleaned`

UNION ALL
SELECT Parsed_Date, '16-64', 'Unemployment Rate',
       SAFE_CAST(`Aged 16-64Unemployment rate _%_` AS FLOAT64)
FROM `stoked-droplet-512422-v2.uk_labour_market.Labour_Market_Age_Groups_Cleaned`

UNION ALL
SELECT Parsed_Date, '16-17', 'Unemployment Rate',
       SAFE_CAST(`Aged 16-17 Unemployment rate _%_` AS FLOAT64)
FROM `stoked-droplet-512422-v2.uk_labour_market.Labour_Market_Age_Groups_Cleaned`

UNION ALL
SELECT Parsed_Date, '18-24', 'Unemployment Rate',
       SAFE_CAST(`Aged 18-24 Unemployment rate _%_` AS FLOAT64)
FROM `stoked-droplet-512422-v2.uk_labour_market.Labour_Market_Age_Groups_Cleaned`

UNION ALL
SELECT Parsed_Date, '25-34', 'Unemployment Rate',
       SAFE_CAST(`Aged 25-34 Unemployment rate _%_` AS FLOAT64)
FROM `stoked-droplet-512422-v2.uk_labour_market.Labour_Market_Age_Groups_Cleaned`

UNION ALL
SELECT Parsed_Date, '35-49', 'Unemployment Rate',
       SAFE_CAST(`Aged 35-49 Unemployment rate _%_` AS FLOAT64)
FROM `stoked-droplet-512422-v2.uk_labour_market.Labour_Market_Age_Groups_Cleaned`

UNION ALL
SELECT Parsed_Date, '50-64', 'Unemployment Rate',
       SAFE_CAST(`Aged 50-64 Unemployment rate _%_` AS FLOAT64)
FROM `stoked-droplet-512422-v2.uk_labour_market.Labour_Market_Age_Groups_Cleaned`

UNION ALL
SELECT Parsed_Date, '65+', 'Unemployment Rate',
       SAFE_CAST(`Aged 65+ Unemployment rate _%_` AS FLOAT64)
FROM `stoked-droplet-512422-v2.uk_labour_market.Labour_Market_Age_Groups_Cleaned`
ORDER BY Parsed_Date;



--- Create Clean Workforce Jobs Table

CREATE OR REPLACE TABLE `stoked-droplet-512422-v2.uk_labour_market.Workforce_Jobs_Cleaned` AS
  SELECT w.*, 
  CASE 
  WHEN TRIM(w.Date) = 'Jun 26 (p)'
    THEN DATE '2026-06-01'
  WHEN TRIM(w.Date) = 'Mar 193'
    THEN DATE '2019-03-01'
  WHEN TRIM(w.Date) = 'Mar 204'
    THEN DATE '2020-03-01'
  WHEN TRIM(w.Date) = 'Mar 26 (r)'
    THEN DATE '2026-03-01'
  ELSE
    SAFE.PARSE_DATE('%b %y', w.Date) 
  END AS Parsed_Date 
  FROM `stoked-droplet-512422-v2.uk_labour_market.Workforce_Jobs` w;
 
CREATE OR REPLACE TABLE `stoked-droplet-512422-v2.uk_labour_market.Workforce_Jobs_Cleaned` AS
  SELECT Parsed_Date, Industry, Workforce_Jobs
  FROM `stoked-droplet-512422-v2.uk_labour_market.Workforce_Jobs_Cleaned`
  UNPIVOT (Workforce_Jobs FOR Industry IN (
    `Agriculture_ forestry & fishing`,	
    `Mining & quarrying`,	
    `Manufacturing`,
    `Electricity_ gas_ steam & air conditioning supply `,
    `Water supply_ sewerage_ waste & remediation activities`,
    `Construction`,
    `Wholesale & retail trade_ repair of motor vehicles and motorcycles`,
    `Transport & storage`,
    `Accommod-ation & food service activities`,
    `Information & communication`,
    `Financial & insurance activities`,
    `Real estate activities`,
    `Professional scientific & technical activities`,
    `Administrative & support service activities`,
    `Public admin & defence_ compulsory social security1`,
    `Education`,
    `Human health & social work activities`,
    `Arts_ entertainment & recreation`,
    `Other service activities`,
    `Private households2`,
    `Total services `,
    `All jobs `
)
) 
ORDER BY Parsed_Date, Industry;

--- Create Clean Industry Vacancies Table

CREATE OR REPLACE TABLE `stoked-droplet-512422-v2.uk_labour_market.Industry_Vacancies_Cleaned` AS
  SELECT i.*,
  CASE 
    WHEN TRIM(i.Date) = 'Nov- Jan 2002'
      THEN DATE '2001-11-01'
  ELSE
    PARSE_DATE(
      '%b %Y',
      CONCAT(
        SPLIT(i.Date, '-')[OFFSET(0)],
        ' ',
        SPLIT(i.Date, ' ')[OFFSET(1)])
        ) END AS Parsed_Date 
      FROM `stoked-droplet-512422-v2.uk_labour_market.Industry_Vacancies` i;


CREATE OR REPLACE TABLE `stoked-droplet-512422-v2.uk_labour_market.Industry_Vacancies_Cleaned` AS
  SELECT Parsed_date, Industry, Vacancies
  FROM `stoked-droplet-512422-v2.uk_labour_market.Industry_Vacancies_Cleaned`
  UNPIVOT (Vacancies FOR Industry IN (
    `All vacancies1`,
    `Mining & quarrying`,
    `Manu-    facturing`,
    `Electricity_ gas_ steam & air conditioning supply2`,
    `Water supply_ sewerage_ waste & remediation activities`,
    `Construc-tion`,
    `Wholesale & retail trade_ repair of motor vehicles and motor cycles`,
    `Transport & storage`,
    `Accomodation & food service activities`,
    `Information & communication`,
    `Financial & insurance activities`,
    `Real estate activities2`,
    `Professional scientific & technical activities`,
    `Administra-tive & support service activities3`,
    `Public admin & defence_ compulsory social security`,
    `Education`,
    `Human health & social work activities`,
    `Arts_ entertainment & recreation`,
    `Other service activities`,
    `Total services `,
    `Motor Trades`,
    `Wholesale`,
    `Retail`
))
ORDER BY Parsed_Date, Industry;

CREATE OR REPLACE TABLE
  `stoked-droplet-512422-v2.uk_labour_market.Industry_Vacancies_Quarterly`
AS
SELECT
  Parsed_Date AS Quarter_Date,
  Industry,
  Vacancies
FROM
  `stoked-droplet-512422-v2.uk_labour_market.Industry_Vacancies_Cleaned`
WHERE
  EXTRACT(MONTH FROM Parsed_Date) IN (3, 6, 9, 12)
  ORDER BY Parsed_Date;

--- Create Clean Vacancies to Unemployed Table

CREATE OR REPLACE TABLE `stoked-droplet-512422-v2.uk_labour_market.Vacancies_to_Unemployment_Cleaned` AS 
SELECT v.*, 
CASE
  WHEN TRIM(date) = 'Nov- Jan 2002'
    THEN DATE '2001-11-01'
  ELSE PARSE_DATE(
    '%b %Y',
    CONCAT(
      SPLIT(TRIM(date), '-')[OFFSET(0)],
      ' ',
      SPLIT(TRIM(date), ' ')[OFFSET(1)]
    )
  )
END AS Parsed_Date
FROM `stoked-droplet-512422-v2.uk_labour_market.Vacancies_to_Unemployment` v;

CREATE OR REPLACE TABLE `stoked-droplet-512422-v2.uk_labour_market.Vacancies_to_Unemployment_Cleaned` AS
SELECT Parsed_Date, 
  SAFE_CAST(
      `All Vacancies1 _thousands_` AS FLOAT64
    ) AS Vacancies, 
  SAFE_CAST(
    `Unemployment 2 _thousands_` AS FLOAT64
  ) AS Unemployment,
  SAFE_CAST(
    `Number of unemployed people per vacancy` AS FLOAT64
  ) AS Unemployed_People_per_Vacancy, 
FROM `stoked-droplet-512422-v2.uk_labour_market.Vacancies_to_Unemployment_Cleaned`;

--- Create Age Group Employment Change Table
CREATE OR REPLACE TABLE `stoked-droplet-512422-v2.uk_labour_market.Employment_Change` AS
SELECT Age_Group, Value_1992, Value_2026, ROUND(Value_2026 - Value_1992, 1) AS Value_Change, ROUND(SAFE_DIVIDE(Value_2026 - Value_1992, Value_1992) * 100, 1) AS Value_Percentage_Change
  FROM (SELECT Age_Group,
    MAX(IF(EXTRACT(YEAR FROM Parsed_Date) = 1992 AND EXTRACT(MONTH FROM Parsed_Date) = 3, Value, NULL)) AS Value_1992, 
    MAX(IF(EXTRACT(YEAR FROM Parsed_Date) = 2026 AND EXTRACT(MONTH FROM Parsed_Date) = 3, Value, NULL)) AS Value_2026
      FROM
      `stoked-droplet-512422-v2.uk_labour_market.Age_Groups_Cleaned`
    WHERE
      Measure = 'Employment Rate' AND
      (EXTRACT(YEAR FROM Parsed_Date) = 1992 AND EXTRACT(MONTH FROM Parsed_Date) = 3)
      OR
      Measure = 'Employment Rate' AND
      (EXTRACT(YEAR FROM Parsed_Date) = 2026 AND EXTRACT(MONTH FROM Parsed_Date) = 3)
    GROUP BY Age_Group)
WHERE Value_1992 IS NOT NULL AND Value_2026 IS NOT NULL
ORDER BY Value_Change DESC;

