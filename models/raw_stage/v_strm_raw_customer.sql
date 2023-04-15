
select * from {{ source('tpch_sample', 'CUSTOMER') }} limit 10

-- this is a test