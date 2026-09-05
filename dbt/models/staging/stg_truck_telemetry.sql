with source_data as (

    select
        event,
        source_file,
        loaded_at
    from {{ source('raw', 'truck_telemetry') }}

),

staged as (

    select
        event:truck_id::varchar as truck_id,
        event:timestamp::timestamp_tz as event_timestamp,
        event:latitude::float as latitude,
        event:longitude::float as longitude,
        event:speed::float as speed,
        event:fuel_level::float as fuel_level,
        event:temperature::float as temperature,
        event:status::varchar as status,

        source_file,
        loaded_at

    from source_data

)

select *
from staged