WITH cte AS(
SELECT c.customer,
       MONTH(f.date) AS month_number, 
	   MONTHNAME(f.date) AS Month, 
       YEAR(f.date) AS Year,
       f.fiscal_year,
       (f.sold_quantity*g.gross_price) AS `Gross sales Amount`
FROM fact_sales_monthly f 
JOIN dim_customer c
ON f.customer_code = c.customer_code
JOIN fact_gross_price g 
ON f.product_code = g.product_code 
AND f.fiscal_year = g.fiscal_year
WHERE c.customer = "Atliq Exclusive")

SELECT customer, Month, Year, fiscal_year,
       CONCAT("$ ",ROUND(SUM(`Gross Sales Amount`)/1000000,2),"M") 
       AS `Gross Sales Amount`
FROM cte GROUP BY Month, fiscal_year;
      
      