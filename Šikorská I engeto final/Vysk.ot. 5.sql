-- zdravechalko --

SELECT 
    p.year, 
    ROUND(AVG(p.wage), 1) AS avg_wage, 
    ROUND(AVG(p.price), 1) AS avg_price, 
    ROUND(AVG(s.GDP), 1) AS avg_GDP
FROM 
    t_Kristina_Sikorska_project_SQL_primary_final AS p
JOIN 
    t_Kristina_Sikorska_project_SQL_secondary_final AS s
ON 
    p.year = s.year
GROUP BY 
    p.year
ORDER BY 
    p.year;