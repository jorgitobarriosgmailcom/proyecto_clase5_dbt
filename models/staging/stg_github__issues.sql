with source as (

    select * from {{ source('raw', 'issues') }}

),

renamed as (

    select
        id as issue_id,
        number as issue_number,
        title,
        body,
        state,
        draft as is_draft,
        comments as comments_count,
        url as issue_url,
        created_at,
        closed_at,
        user,
        labels,
        assignee,
        assignees,
        html_url,
        _airbyte_extracted_at as loaded_at
    from source

)

select * from renamed