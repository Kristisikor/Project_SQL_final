CREATE VIEW wage_increase AS
SELECT 
  industry,
  year,
  wage,
  LAG(wage) OVER (PARTITION BY industry ORDER BY year) as prev_wage
FROM 
  t_Kristina_Sikorska_project_SQL_primary_final;
 
SELECT *
FROM wage_increase 
 
CREATE VIEW wage_percentage_increase AS
SELECT
  industry,
  year,
  ((wage - prev_wage) / prev_wage) * 100 as wage_percentage_increase
FROM
  wage_increase;
 
SELECT *
FROM wage_percentage_increase
  
CREATE VIEW price_percentage_increase AS
SELECT
  category,
  year,
  ((price - prev_price) / prev_price) * 100 as price_percentage_increase
FROM
  price_increase;

SELECT *
FROM price_percentage_increase
  
SELECT 
  p.year,
  p.category,
  w.industry
FROM 
  price_percentage_increase p
JOIN 
  wage_percentage_increase w 
ON 
  p.year = w.year
WHERE 
  p.price_percentage_increase > w.wage_percentage_increase + 10;

-- vylúčenie duplicít
SELECT DISTINCT 
  p.year,
  p.category,
  w.industry
FROM 
  price_percentage_increase p
JOIN 
  wage_percentage_increase w 
ON 
  p.year = w.year
WHERE 
  p.price_percentage_increase > w.wage_percentage_increase + 10; 
 
 