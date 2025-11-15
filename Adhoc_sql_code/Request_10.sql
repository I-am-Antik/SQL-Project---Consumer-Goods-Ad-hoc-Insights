WITH cte AS(
			SELECT p.division, 
				   p.product_code, 
				   p.product,
				   SUM(fs.sold_quantity) AS total_sold_quantity,
				   DENSE_RANK() OVER(PARTITION BY division ORDER BY SUM(fs.sold_quantity) DESC) 
                   AS rank_order
			FROM dim_product p
			LEFT JOIN fact_sales_monthly fs
			ON p.product_code = fs.product_code
			WHERE fs.fiscal_year = 2021 
			GROUP BY p.division,
			         p.product_code)
SELECT * FROM cte
WHERE rank_order<=3;

