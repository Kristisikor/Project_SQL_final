-- zdravechalko --

WITH milk AS (
  SELECT 
  	year, ROUND(AVG(wage)/AVG(price)) AS liters_of_milk
  FROM t_Kristina_Sikorska_project_SQL_primary_final
  WHERE category LIKE '%mléko%'
  GROUP BY year
), bread AS (
  SELECT 
  	year, ROUND(AVG(wage)/AVG(price)) AS kilograms_of_bread
  FROM t_Kristina_Sikorska_project_SQL_primary_final
  WHERE category LIKE '%chléb%'
  GROUP BY year
)
SELECT 
	milk.year AS year, 
	liters_of_milk, 
	kilograms_of_bread
FROM milk
JOIN bread ON milk.year = bread.year
WHERE milk.year IN (
  (SELECT 
  	MIN(year) 
  	FROM t_Kristina_Sikorska_project_SQL_primary_final),
  (SELECT 
  	MAX(year) 
  	FROM t_Kristina_Sikorska_project_SQL_primary_final)
);






