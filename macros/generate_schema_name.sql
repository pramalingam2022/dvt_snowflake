

{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}
    {%- if custom_schema_name.startswith('DBT_CLOUD_PR_') -%}

        {{ custom_schema_name }}
    
    {%- elif custom_schema_name is none -%}

        {{ default_schema }}

    {%- else -%}

        {{ custom_schema_name | trim }}

    {%- endif -%}

{%- endmacro %}

{%- macro drop_schema() -%}
    {% set sql %}
        DROP SCHEMA IF EXISTS slim_ci_run;
    {% endset %}
    {% do log("Dropping Schema 'slim_ci_run'", info=True) %}
    {% do run_query(sql) %}
    {% do log("Schema dropped", info=True) %}
{%- endmacro -%}

