WITH temp_1 AS (
				SELECT DISTINCT p.segment, 
					   p.product_code,
                       p.product
				FROM dim_product p),
	 temp_2 AS (
				SELECT DISTINCT p.segment,
					   p.product_code,
                       p.product
				FROM dim_product p
				JOIN fact_sales_monthly f
				ON p.product_code = f.product_code
				WHERE f.fiscal_year = 2021)
SELECT t1.segment,
       t1.product_code,
	   t1.product 
FROM temp_1 AS t1
LEFT JOIN temp_2 AS t2
ON t1.product_code = t2.product_code
WHERE t2.product_code IS NULL;

