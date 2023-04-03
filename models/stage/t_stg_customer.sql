{%- set yaml_metadata -%}
source_model: 'v_strm_raw_customer'
derived_columns:
  CUSTOMER_KEY: 'CUSTOMER_KEY'
  RECORD_SOURCE: '!TPCH-CUSTOMER'
  SATELLITE_NAME_1: '!SAT_CUST_DETAILS'
  SRC_TIMESTAMP: 'SRC_TIMESTAMP'
hashed_columns:
  CUSTOMER_HK: 'CUSTOMER_KEY'
  CUSTOMER_HASHDIFF:
    is_hashdiff: true
    columns:
      - 'CUSTOMER_KEY'
      - 'CUSTOMER_NAME'
      - 'CUSTOMER_ADDRESS'
      - 'CUSTOMER_PHONE'
      - 'CUSTOMER_ACCBAL'
      - 'CUSTOMER_MKTSEGMENT'
      - 'CUSTOMER_COMMENT'
      - 'CUSTOMER_TIER'
      - 'SRC_TIMESTAMP'
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{% set source_model = metadata_dict['source_model'] %}

{% set derived_columns = metadata_dict['derived_columns'] %}

{% set hashed_columns = metadata_dict['hashed_columns'] %}


WITH staging AS (
{{ dbtvault.stage(include_source_columns=true,
                  source_model=source_model,
                  derived_columns=derived_columns,
                  hashed_columns=hashed_columns,
                  ranked_columns=none) }}
)

SELECT *, 
       CURRENT_TIMESTAMP() AS LOAD_DATE
FROM staging