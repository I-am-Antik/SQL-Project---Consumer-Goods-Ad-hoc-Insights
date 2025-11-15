-- Request 8 part 1
SELECT fiscal_year, get_quarter(date) AS Quarter, 
       SUM(sold_quantity) AS total_sold_quantity
FROM fact_sales_monthly 
WHERE fiscal_year = 2020
GROUP BY get_quarter(date);

-- Request 8 part 2
SELECT fiscal_year, get_quarter(date) AS Quarter,
       MONTHNAME(date) AS Month, 
       SUM(sold_quantity) AS total_sold_quantity
FROM fact_sales_monthly 
WHERE fiscal_year = 2020
GROUP BY get_quarter(date),
         MONTHNAME(date);
