{{ config(materialized='table') }}

WITH CTE_MY_DATE AS (
   SELECT DATEADD(DAY, SEQ4(), '2022-01-04') AS MY_DATE
     FROM TABLE(GENERATOR(ROWCOUNT=>1000)) -- Number of days after reference date in previous line
 )

 SELECT TO_TIMESTAMP_NTZ(concat(to_date(MY_DATE),' 23:59:59:999'),'yyyy-mm-dd HH:MI:SS:FF') as AS_OF_DATE,
       YEAR(MY_DATE) as yr,
       MONTH(MY_DATE) as mth,
       MONTHNAME(MY_DATE) as mth_nm,
       DAY(MY_DATE) as dy
    FROM CTE_MY_DATE