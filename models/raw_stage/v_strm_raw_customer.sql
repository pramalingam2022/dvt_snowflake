
select * from {{ source('tpch_sample', 'CUSTOMER') }} limit 10
