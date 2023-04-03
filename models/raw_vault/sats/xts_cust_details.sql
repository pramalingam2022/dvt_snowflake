{{ config(materialized='incremental') }}
{%- set source_model = "t_stg_customer" -%}
{%- set src_pk = "CUSTOMER_HK" -%}
{%- set src_satellite = {"SAT_CUST_DETAILS": {"sat_name": {"SATELLITE_NAME": "SATELLITE_NAME_1"}, "hashdiff": {"HASHDIFF": "CUSTOMER_HASHDIFF"}}} -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ dbtvault.xts(src_pk=src_pk, src_satellite=src_satellite, src_ldts=src_ldts,src_source=src_source, source_model=source_model) }}