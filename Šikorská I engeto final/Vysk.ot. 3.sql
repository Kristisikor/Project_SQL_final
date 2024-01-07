CREATE VIEW price_increase AS
SELECT 
  category,
  year,
  price,
  LAG(price) OVER (PARTITION BY category ORDER BY year) as prev_price
FROM 
  t_Kristina_Sikorska_project_SQL_primary_final;

SELECT *
FROM price_increase


CREATE VIEW percentage_increase AS
SELECT
  category,
  year,
  ((price - prev_price) / prev_price) * 100 as percentage_increase
FROM
  price_increase;
 
 
SELECT *
FROM percentage_increase
 

 SELECT 
  category
FROM 
  percentage_increase
GROUP BY 
  category
ORDER BY 
  AVG(percentage_increase) ASC
LIMIT 1;
 
 


