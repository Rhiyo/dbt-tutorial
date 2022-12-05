{% macro grant_select(schema=target.schema, role=target.role) %}
    {% set query %}
        grant usage on schema {{ schema }} to role {{ role }};
        grant select on tables {{ schema }} to role {{ role }};
        grant select on views {{ schema }} to role {{ role }};
    {% endset %}

    {% do run_query(query) %}

{% endmacro %}