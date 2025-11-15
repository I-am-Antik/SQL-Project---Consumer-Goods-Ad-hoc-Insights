WITH cte1 AS(
				SELECT p.segment,
					COUNT(DISTINCT p.product_code) AS product_count_2020
				FROM dim_product p
				JOIN fact_sales_monthly f
				ON p.product_code = f.product_code
				WHERE f.fiscal_year = 2020
				GROUP BY p.segment),
     cte2 AS(
				SELECT p.segment,
					COUNT(DISTINCT p.product_code) AS product_count_2021   
				FROM dim_product p
				JOIN fact_sales_monthly f
				ON p.product_code = f.product_code
				WHERE f.fiscal_year = 2021
				GROUP BY p.segment)
SELECT cte1.segment,
	   cte1.product_count_2020,
       cte2.product_count_2021,
       (cte2.product_count_2021 - cte1.product_count_2020) AS difference
FROM cte1 JOIN cte2
ON cte1.segment = cte2.segment
ORDER BY difference DESC;
