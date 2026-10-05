 {% if target.project == 'racko-master-project-505113' %}
    SELECT 2+3 as result
{% elif target.project == 'abc'%}
    select 10+30 as result
 
{% endif %}
 
 
 
{% if execute %}
    {% set results = run_query(
    "select count(*) from tredence_utkarsh.src_hosts_old"
)%}
    {% set rowcount = results.columns[0].values()[0] %}
    {{log("rowcount = " ~ rowcount, info = true)}}
 
{% endif %}