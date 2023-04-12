{%- set source_model = "v_stg_orders" -%}
{%- set src_pk = "LINK_LINEITEM_ORDER_PK" -%}
{%- set src_fk = ["ORDER_PK", "LINEITEM_PK"] -%}
{%- set src_ldts = "LOAD_DATE","ORDERDATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}
{%- set src_extra_columns = "NATION_PK" -%}

{{ dbtvault.link(src_pk=src_pk, src_fk=src_fk, src_ldts=src_ldts,
                 src_source=src_source, source_model=source_model,src_extra_columns=src_extra_columns) }}
