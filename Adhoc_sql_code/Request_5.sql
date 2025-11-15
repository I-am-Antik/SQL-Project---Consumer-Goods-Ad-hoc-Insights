SELECT DISTINCT 
       p.product_code,
       p.product,
       m.manufacturing_cost
FROM dim_product p
INNER JOIN fact_manufacturing_cost m
ON p.product_code = m.product_code
INNER JOIN fact_sales_monthly f 
ON p.product_code = f.product_code
AND m.cost_year = f.fiscal_year
WHERE m.manufacturing_cost IN 
       ((SELECT MAX(manufacturing_cost) 
         FROM fact_manufacturing_cost), 
		(SELECT MIN(manufacturing_cost) 
         FROM fact_manufacturing_cost))
ORDER BY manufacturing_cost DESC;

