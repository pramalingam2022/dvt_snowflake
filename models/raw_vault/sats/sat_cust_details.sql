 {{ config(materialized='incremental',schema='TPCH_SF1') }}

{%- set source_model = "t_stg_customer" -%}
{%- set src_pk = "CUSTOMER_HK" -%}
{%- set src_hashdiff = "CUSTOMER_HASHDIFF" -%}
{%- set src_payload = ["CUSTOMER_NAME", "CUSTOMER_ADDRESS", "CUSTOMER_PHONE",
                       "CUSTOMER_ACCBAL", "CUSTOMER_MKTSEGMENT", "CUSTOMER_COMMENT","CUSTOMER_TIER"] -%}
{%- set src_eff  = "SRC_TIMESTAMP"-%}
{%- set src_ldts = "LOAD_DATE"-%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ dbtvault.sat(src_pk=src_pk, src_hashdiff=src_hashdiff,
                src_payload=src_payload, src_eff=src_eff,
                src_ldts=src_ldts, src_source=src_source,
                source_model=source_model) }}