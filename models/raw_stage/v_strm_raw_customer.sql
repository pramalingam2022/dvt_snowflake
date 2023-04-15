{{ config(
    pre_hook="CREATE or replace STREAM strm_raw_customer ON view raw_customer SHOW_INITIAL_ROWS = TRUE "],
    post_hook="SQL-statement" | ["SQL-statement"],
) }}

select * from {{ source('tpch_sample', 'strm_raw_customer') }}