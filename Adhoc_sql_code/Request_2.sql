WITH cte1 AS (
				SELECT  COUNT(DISTINCT p.product_code) AS unique_products_2020 
				FROM dim_product p INNER JOIN fact_sales_monthly f
				ON p.product_code = f.product_code
				WHERE f.fiscal_year = 2020),
      cte2 AS(
				SELECT  COUNT(DISTINCT p.product_code) AS unique_products_2021 
				FROM dim_product p INNER JOIN fact_sales_monthly f
				ON p.product_code = f.product_code
				WHERE f.fiscal_year = 2021),
	  cte3 AS(
				SELECT ROUND(
				((cte2.unique_products_2021-cte1.unique_products_2020)/cte1.unique_products_2020)*100,2)
				AS percentage_chg FROM cte1 CROSS JOIN cte2)

SELECT * FROM cte1 CROSS JOIN cte2 CROSS JOIN cte3;
