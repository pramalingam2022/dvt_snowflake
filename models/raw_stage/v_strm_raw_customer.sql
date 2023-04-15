{{ config(
    pre_hook="CREATE or replace STREAM strm_raw_customer ON view raw_customer SHOW_INITIAL_ROWS = TRUE"
) }}

select * from {{ source('tpch_sample', 'strm_raw_customer') }}

-- This is a test