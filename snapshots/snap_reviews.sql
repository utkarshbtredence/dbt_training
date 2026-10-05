{% snapshot snap_reviews %}

{{
    config(
        target_schema = 'tred_utkarsh',
        unique_key=['listing_id','reviewer_name','review_text'],
        strategy='check',
        check_cols=['listing_id','reviewer_name','review_text'],
        dbt_valid_to_current="timestamp('9999-12-31 00:00:00 UTC')",
        hard_deletes='invalidate',
        enabled=false
    )
}}


with cte_1 as 
(
    select
    *
    from
    {{
        ref('src_reviews')
    }}
)
select
*
from 
cte_1

{% endsnapshot %}