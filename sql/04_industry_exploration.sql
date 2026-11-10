----------------------
---Data Exploration---
----------------------

--- Industry Vacancies Exploration

--- Row Validation (Indutry Vacancies)

SELECT
  COUNT(*) AS total_rows,
  COUNT(DISTINCT Parsed_Date) AS distinct_dates,
  COUNT(DISTINCT Industry) AS distinct_industries,
  MIN(Parsed_Date) AS earliest_date,
  MAX(Parsed_Date) AS latest_date,
  COUNT(DISTINCT Parsed_Date) * COUNT(DISTINCT Industry) AS predicted_rows
FROM
  `stoked-droplet-512422-v2.uk_labour_market.Industry_Vacancies_Cleaned`;

SELECT
  Industry,
  COUNT(*) AS total_rows,
  COUNTIF(Vacancies IS NULL) AS missing_values
FROM
  `stoked-droplet-512422-v2.uk_labour_market.Industry_Vacancies_Cleaned`
GROUP BY Industry
ORDER BY missing_values DESC;

--- Exploration

--- Average Vacancies After 2000 in Scientific or Technical Roles

SELECT Industry, AVG(Vacancies) AS Average_Vacancies, EXTRACT(YEAR FROM Parsed_Date) AS year FROM `stoked-droplet-512422-v2.uk_labour_market.Industry_Vacancies_Cleaned` WHERE Parsed_Date > '2000-01-01' AND Industry = 'Professional scientific & technical activities' GROUP BY year, Industry;

SELECT * FROM `stoked-droplet-512422-v2.uk_labour_market.Industry_Vacancies_Quarterly` ORDER BY Quarter_Date, Industry;

SELECT Industry, AVG(Vacancies) AS Average_Vacancies, EXTRACT(YEAR FROM Parsed_Date) AS year FROM `stoked-droplet-512422-v2.uk_labour_market.Industry_Vacancies_Cleaned` WHERE Parsed_Date > '2000-01-01' AND Industry = 'Professional scientific & technical activities' GROUP BY year, Industry;

SELECT Industry, AVG(Vacancies) AS Average_Vacancies, EXTRACT(YEAR FROM Parsed_Date) AS year FROM `stoked-droplet-512422-v2.uk_labour_market.Industry_Vacancies_Cleaned` WHERE Parsed_Date > '2000-01-01' AND Industry = 'All vacancies1' GROUP BY year, Industry;

SELECT DISTINCT
  Parsed_Date
FROM
  `stoked-droplet-512422-v2.uk_labour_market.Workforce_Jobs_Cleaned`
ORDER BY
  Parsed_Date
LIMIT 20;

--- Workforce Jobs Exploration

--- Row Validation (Indutry Vacancies)

SELECT
  COUNT(*) AS total_rows,
  COUNT(DISTINCT Parsed_Date) AS distinct_dates,
  COUNT(DISTINCT Industry) AS distinct_industries,
  MIN(Parsed_Date) AS earliest_date,
  MAX(Parsed_Date) AS latest_date,
  COUNT(DISTINCT Parsed_Date) * COUNT(DISTINCT Industry) AS predicted_rows
FROM
  `stoked-droplet-512422-v2.uk_labour_market.Workforce_Jobs_Cleaned`;

SELECT
  Industry,
  COUNT(*) AS total_rows,
  COUNTIF(Workforce_Jobs IS NULL) AS missing_values
FROM
  `stoked-droplet-512422-v2.uk_labour_market.Workforce_Jobs_Cleaned`
GROUP BY Industry
ORDER BY missing_values DESC;

--- Exploration

SELECT * FROM `stoked-droplet-512422-v2.uk_labour_market.Workforce_Jobs_Cleaned`;

SELECT Industry, AVG(Workforce_Jobs) AS Average_Jobs, EXTRACT(YEAR FROM Parsed_Date) AS year FROM `stoked-droplet-512422-v2.uk_labour_market.Workforce_Jobs_Cleaned` WHERE Parsed_Date > '2000-01-01' AND Industry = 'Professional scientific & technical activities' GROUP BY year, Industry;

SELECT Industry, AVG(Workforce_Jobs) AS Average_Jobs, EXTRACT(YEAR FROM Parsed_Date) AS year FROM `stoked-droplet-512422-v2.uk_labour_market.Workforce_Jobs_Cleaned` WHERE Parsed_Date > '2000-01-01' AND Industry = 'Mining & quarrying' GROUP BY year, Industry;

SELECT Industry, AVG(Workforce_Jobs) AS Average_Jobs, EXTRACT(YEAR FROM Parsed_Date) AS year FROM `stoked-droplet-512422-v2.uk_labour_market.Workforce_Jobs_Cleaned` WHERE Parsed_Date > '2000-01-01' AND Industry = 'All jobs ' GROUP BY year, Industry;



--------------------
---Table Cleaning---
--------------------

--- Full Table Clean for Industry Vacancies

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

--- Full Table Clean for Workforce_Jobs

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

--- Date Formatting (Workforce_Jobs)
SELECT w.Date AS Original_Date, 
CASE 
  WHEN TRIM(w.Date) = 'Jun 26 (p)'
    THEN DATE '2026-06-01'
  WHEN TRIM(w.Date) = 'Mar 193'
    THEN DATE '1993-03-01'
  WHEN TRIM(w.Date) = 'Mar 204'
    THEN DATE '2004-03-01'
  WHEN TRIM(w.Date) = 'Mar 26 (r)'
    THEN DATE '2026-03-01'
  ELSE
    SAFE.PARSE_DATE('%b %y', w.Date) END AS Parsed_Date FROM `stoked-droplet-512422-v2.uk_labour_market.Workforce_Jobs` w;

--- Date Formatting 2 (Workforce_Jobs)

SELECT w.Date AS Original_Date, SAFE.PARSE_DATE('%b %y', w.Date) AS Parsed_Date FROM `stoked-droplet-512422-v2.uk_labour_market.Workforce_Jobs` w;

--- Date Formatting Check (Workforce_Jobs)

SELECT DISTINCT Date
FROM `stoked-droplet-512422-v2.uk_labour_market.Workforce_Jobs`
WHERE NOT REGEXP_CONTAINS(
  TRIM(date),
  r'^[A-Za-z]{3} \d{2}$'
)
ORDER BY date;

--- Date Formatting 

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
END AS period_start

--- Date Formatting (Industry_Vacancies)

SELECT i.Date AS Original_Date, 
  CASE 
    WHEN TRIM(i.Date) = 'Nov- Jan 2002'
      THEN DATE '2001-11-01'
  ELSE
    PARSE_DATE(
      '%b %Y',
      CONCAT(
        SPLIT(i.Date, '-')[OFFSET(0)],
        ' ',
        SPLIT(i.Date, ' ')[OFFSET(1)]
      )) END AS Parsed_Date FROM `stoked-droplet-512422-v2.uk_labour_market.Industry_Vacancies` i;

--- Date Formatting Check (Industry_Vacancies)

SELECT DISTINCT Date
FROM `stoked-droplet-512422-v2.uk_labour_market.Industry_Vacancies`
WHERE NOT REGEXP_CONTAINS(
  TRIM(date),
  r'^[A-Za-z]{3}-[A-Za-z]{3} \d{4}$'
)
ORDER BY date;

--- Found issue in original Parsing, Assumed Mar 193 and Mar 204 was supposed to be 'Mar 93' and 'Mar 04' but it was instead supposed to be 'Mar 19' and 'Mar 20'

SELECT
  *
FROM
  `stoked-droplet-512422-v2.uk_labour_market.Workforce_Jobs`
WHERE
  Date = 'Mar 20' OR Date = 'Mar 19'
ORDER BY
  Date;

--- Duplicate Check

SELECT
  Industry,
  Parsed_Date,
  COUNT(*) AS occurrences
FROM
  `stoked-droplet-512422-v2.uk_labour_market.Workforce_Jobs_Cleaned`
GROUP BY
  Industry,
  Parsed_Date
HAVING
  COUNT(*) > 1
ORDER BY
  Parsed_Date,
  Industry;

--- Industry Check

SELECT DISTINCT
  v.Industry AS Vacancy_Industry
FROM
  `stoked-droplet-512422-v2.uk_labour_market.Industry_Vacancies_Quarterly` AS v
LEFT JOIN
  `stoked-droplet-512422-v2.uk_labour_market.Workforce_Jobs_Cleaned` AS w
ON
  TRIM(LOWER(v.Industry)) = TRIM(LOWER(w.Industry))
WHERE
  w.Industry IS NULL
ORDER BY
  Vacancy_Industry;

SELECT DISTINCT
  w.Industry AS Workforce_Industry
FROM
  `stoked-droplet-512422-v2.uk_labour_market.Workforce_Jobs_Cleaned` AS w
LEFT JOIN
  `stoked-droplet-512422-v2.uk_labour_market.Industry_Vacancies_Quarterly` AS v
ON
  TRIM(LOWER(w.Industry)) = TRIM(LOWER(v.Industry))
WHERE
  v.Industry IS NULL
ORDER BY
  Workforce_Industry;
