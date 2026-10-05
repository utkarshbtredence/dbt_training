{% snapshot snap_listings %}

{{
    config(
        target_schema = 'tred_utkarsh',
        unique_key='listing_id',
        strategy='timestamp',
        updated_at='updated_at'
    )
}}


with cte_1 as 
(
    select
    *
    from
    {{ref('src_listings')}}
)
select
*
from 
cte_1

{% endsnapshot %}