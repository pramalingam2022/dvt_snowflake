
select * from {{ source('tpch_sample', 'strm_raw_customer') }} limit 10

-- this is a test