{% snapshot snap_hosts4 %}

{{
    config(
        target_schema = 'tred_utkarsh',
        unique_key='host_id',
        strategy='timestamp',
        updated_at='updated_at',
        dbt_valid_to_current="timestamp('9999-12-31 00:00:00 UTC')",
        hard_deletes='new_record'
    )
}}


with cte_1 as 
(
    select
    *
    from
    {{
        ref('src_hosts')
    }}
)
select
host_id,
host_name,
is_superhost,
created_at,
updated_at
from 
cte_1

{% endsnapshot %}