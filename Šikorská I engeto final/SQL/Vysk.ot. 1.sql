-- zdravechalko --

SELECT 
	industry, 
	year, 
	AVG(wage) as average_wage
FROM t_Kristina_Sikorska_project_SQL_primary_final
GROUP BY industry, year
ORDER BY industry, year;  