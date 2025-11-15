WITH cte1 AS(
			 SELECT c.channel,
					 f.fiscal_year,
                     (f.sold_quantity*g.gross_price) AS `Gross sales Amount`
			 FROM fact_sales_monthly f 
			 JOIN dim_customer c
			 ON f.customer_code = c.customer_code
			 JOIN fact_gross_price g 
			 ON f.product_code = g.product_code 
			 AND f.fiscal_year = g.fiscal_year
			 WHERE f.fiscal_year = 2021),
      cte2 AS(
			 SELECT ROUND(SUM(`Gross Sales Amount`)/1000000,2) AS total_gross_sales FROM cte1
			 WHERE fiscal_year = 2021)

SELECT channel, fiscal_year,
       CONCAT("$ ",ROUND(SUM(`Gross Sales Amount`)/1000000,2),"M") AS `Gross sales Amount`,
       ROUND((SUM(`Gross Sales Amount`)/10000)/total_gross_sales,2) AS percentage
FROM cte1 CROSS JOIN cte2
GROUP BY channel
ORDER BY percentage DESC;
