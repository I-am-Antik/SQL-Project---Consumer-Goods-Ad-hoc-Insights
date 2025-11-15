SELECT pre.customer_code, c.customer, pre.fiscal_year,
       ROUND(ROUND(AVG(pre.pre_invoice_discount_pct),4)*100,2) 
       AS average_discount_percentage
FROM fact_pre_invoice_deductions pre
INNER JOIN dim_customer c
ON c.customer_code = pre.customer_code
WHERE pre.fiscal_year = 2021 AND c.market = "India"
GROUP BY pre.customer_code
ORDER BY average_discount_percentage DESC
LIMIT 5;

