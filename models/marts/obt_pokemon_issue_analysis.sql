{{ config(materialized='table') }}

with base as (

    select * from {{ ref('int_pokemon_issue_summary') }}

),

final as (

    select
        pokemon_id,
        pokemon_name,
        height,
        weight,
        base_experience,
        power_tier,
        issue_state,
        total_issues,
        avg_comments,
        case
            when total_issues >= 1000 then 'very_active'
            when total_issues >= 100 then 'active'
            else 'low_activity'
        end as issue_activity_level
    from base

)

select * from final