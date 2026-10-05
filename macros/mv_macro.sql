{% macro mv_macro() %}

    {% set sql %}
        create materialized view if not exists
            `{{ target.project }}.{{ target.dataset }}.utkarsh_materialized_view`
        as 
        select * from {{ref('src_hosts')}}
    {% endset %}

    {% if execute %}
        {{log("This is mv_macro.", info=True)}}
        {% do run_query(sql) %}
        {{log("mv created successfully....", info=True)}}
    {% endif %}

{% endmacro %}