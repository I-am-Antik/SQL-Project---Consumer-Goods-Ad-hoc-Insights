SELECT 
      DISTINCT market, 
      customer, 
      region 
FROM dim_customer c 
WHERE customer = 'Atliq Exclusive' 
AND region = 'APAC';

