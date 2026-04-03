with source as (

    select * from {{ source('raw', 'pokemon') }}

),

renamed as (

    select
        id as pokemon_id,
        name as pokemon_name,
        height,
        weight,
        base_experience,
        forms,
        moves,
        stats,
        types,
        abilities,
        _airbyte_extracted_at as loaded_at
    from source

)

select * from renamed