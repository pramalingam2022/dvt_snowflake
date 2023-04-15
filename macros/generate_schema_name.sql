

{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}
    {%- if target.name == 'slim_ci_run' -%}

        {{ target.name }}
    
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
    {% do log("Dropping database 'slim_ci_run'", info=True) %}
    {% do run_query(sql) %}
    {% do log("Databse dropped", info=True) %}
{%- endmacro -%}

