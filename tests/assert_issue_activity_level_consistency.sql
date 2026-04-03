select
    pokemon_id,
    pokemon_name,
    total_issues,
    issue_activity_level
from {{ ref('obt_pokemon_issue_analysis') }}
where (total_issues >= 1000 and issue_activity_level != 'very_active')
   or (total_issues >= 100 and total_issues < 1000 and issue_activity_level != 'active')
   or (total_issues < 100 and issue_activity_level != 'low_activity')