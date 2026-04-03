with pokemon as (

    select * from {{ ref('stg_pokeapi__pokemon') }}

),

issues as (

    select * from {{ ref('stg_github__issues') }}

),

pokemon_enriched as (

    select
        pokemon_id,
        pokemon_name,
        height,
        weight,
        base_experience,
        case
            when base_experience >= 100 then 'high'
            else 'normal'
        end as power_tier
    from pokemon

),

issue_summary as (

    select
        state,
        count(issue_id) as total_issues,
        avg(comments_count) as avg_comments
    from issues
    group by state

)

select
    p.pokemon_id,
    p.pokemon_name,
    p.height,
    p.weight,
    p.base_experience,
    p.power_tier,
    i.state as issue_state,
    i.total_issues,
    i.avg_comments
from pokemon_enriched p
cross join issue_summary i