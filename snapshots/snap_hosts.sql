{% snapshot snap_hosts %}

{{
    config(
        target_schema = 'tred_utkarsh',
        unique_key='host_id',
        strategy='timestamp',
        updated_at='updated_at',
        hard_deletes='ignore'
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