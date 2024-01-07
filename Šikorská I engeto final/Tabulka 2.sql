CREATE TABLE t_Kristina_Sikorska_project_SQL_secondary_final AS
SELECT 
    e.year,
    e.GDP,
    e.gini,
    e.population,
    c.country
FROM 
    economies e
JOIN 
    countries c 
    ON e.country = c.country
WHERE 
    e.year IN (SELECT year FROM t_Kristina_Sikorska_project_SQL_primary_final)
    AND c.continent = 'Europe';

Select *
FROM t_Kristina_Sikorska_project_SQL_secondary_final







