--- Select All
SELECT * FROM `stoked-droplet-512422-v2.uk_labour_market.Vacancies_to_Unemployment`;

--- Final Date Formatting
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

--- Full Table ordered by number of unemployed people per vacancy descending
SELECT
  date AS period_label,
  CASE 
    WHEN TRIM(date) = 'Nov- Jan 2002'
      THEN DATE '2001-11-01'
  ELSE
    PARSE_DATE(
      '%b %Y',
      CONCAT(
        SPLIT(date, '-')[OFFSET(0)],
        ' ',
        SPLIT(date, ' ')[OFFSET(1)]
      )
  ) END AS period_start, `All Vacancies1 _thousands_`, `Unemployment 2 _thousands_`, `Number of unemployed people per vacancy`
FROM `stoked-droplet-512422-v2.uk_labour_market.Vacancies_to_Unemployment` ORDER BY `Number of unemployed people per vacancy` DESC;

--- Full Table ordered by number of unemployed people per vacancy ascending
SELECT
  date AS period_label,
  CASE 
    WHEN TRIM(date) = 'Nov- Jan 2002'
      THEN DATE '2001-11-01'
  ELSE
    PARSE_DATE(
      '%b %Y',
      CONCAT(
        SPLIT(date, '-')[OFFSET(0)],
        ' ',
        SPLIT(date, ' ')[OFFSET(1)]
      )
  ) END AS period_start, `All Vacancies1 _thousands_`, `Unemployment 2 _thousands_`, `Number of unemployed people per vacancy`
FROM `stoked-droplet-512422-v2.uk_labour_market.Vacancies_to_Unemployment` ORDER BY `Number of unemployed people per vacancy` ASC;

--- Full Table ordered by number of vacancies
SELECT
  date AS period_label,
  CASE 
    WHEN TRIM(date) = 'Nov- Jan 2002'
      THEN DATE '2001-11-01'
  ELSE
    PARSE_DATE(
      '%b %Y',
      CONCAT(
        SPLIT(date, '-')[OFFSET(0)],
        ' ',
        SPLIT(date, ' ')[OFFSET(1)]
      )
  ) END AS period_start, `All Vacancies1 _thousands_`, `Unemployment 2 _thousands_`, `Number of unemployed people per vacancy`
FROM `stoked-droplet-512422-v2.uk_labour_market.Vacancies_to_Unemployment` ORDER BY `All Vacancies1 _thousands_` DESC;

--- Date Formatting Check

SELECT DISTINCT date
FROM `stoked-droplet-512422-v2.uk_labour_market.Vacancies_to_Unemployment`
WHERE NOT REGEXP_CONTAINS(
  TRIM(date),
  r'^[A-Za-z]{3}-[A-Za-z]{3} \d{4}$'
)
ORDER BY date;

--- Average number of unemployed people per vacancy per year
SELECT EXTRACT(YEAR FROM period_start) AS year, AVG(SAFE_CAST (`Number of unemployed people per vacancy` AS FLOAT64)) AS average_Number_of_unemployed_people_per_vacancy FROM (
SELECT
  date AS period_label,
  CASE 
    WHEN TRIM(date) = 'Nov- Jan 2002'
      THEN DATE '2001-11-01'
  ELSE
    PARSE_DATE(
      '%b %Y',
      CONCAT(
        SPLIT(date, '-')[OFFSET(0)],
        ' ',
        SPLIT(date, ' ')[OFFSET(1)]
      )
  ) END AS period_start, `Number of unemployed people per vacancy`
FROM `stoked-droplet-512422-v2.uk_labour_market.Vacancies_to_Unemployment`) GROUP BY year ORDER BY `average_Number_of_unemployed_people_per_vacancy` DESC;
