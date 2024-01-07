CREATE TABLE t_Kristina_Sikorska_project_SQL_primary_final AS
SELECT 
    cp.payroll_year AS year,
    cp.value AS wage,
    cp2.value AS price, 
    cpib.name AS industry,
    cpc.name AS category
FROM 
    czechia_payroll cp
JOIN 
    czechia_payroll_industry_branch cpib 
    ON cp.industry_branch_code = cpib.code
JOIN 
    czechia_price cp2
	ON YEAR(cp2.date_from) = cp.payroll_year 
    AND cp.value_type_code = 5958
JOIN 
    czechia_price_category cpc 
    ON cp2.category_code = cpc.code
GROUP BY cp.payroll_year, cpib.name, cpc.name     
    
SELECT 
	year, 
	industry, 
	wage, 
	category, 
	price
FROM t_Kristina_Sikorska_project_SQL_primary_final;    
 

  
    
    
    
    
    
    
    
    
    
    