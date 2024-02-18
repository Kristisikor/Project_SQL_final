-- zdravechalko
CREATE TABLE t_Kristina_Sikorska_project_SQL_primary_final AS
WITH wage_avg AS (
    SELECT 
    	cp.payroll_year AS year, 
    	cpib.name AS industry, 
    	AVG(cp.value) AS wage
    FROM czechia_payroll cp
    JOIN czechia_payroll_industry_branch cpib 
    ON cp.industry_branch_code = cpib.code
    WHERE cp.value_type_code = 5958
    GROUP BY cp.payroll_year, cpib.name
), price_avg AS (
    SELECT 
    	YEAR(cp2.date_from) AS year, 
    	cpc.name AS category, 
    	ROUND(AVG(cp2.value), 2) AS price
    FROM czechia_price cp2
    JOIN czechia_price_category cpc 
    ON cp2.category_code = cpc.code
    GROUP BY YEAR(cp2.date_from), cpc.name
)
SELECT 
	w.year, 
	w.industry, 
	w.wage, 
	p.category, 
	p.price
FROM wage_avg w
JOIN price_avg p ON w.year = p.year;
  
SELECT *
FROM t_Kristina_Sikorska_project_SQL_primary_final 
    
    
    
    
    
    
    
    
    