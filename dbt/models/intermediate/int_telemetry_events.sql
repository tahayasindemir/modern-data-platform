with staging as (

    select
        truck_id,
        event_timestamp,
        latitude,
        longitude,
        speed,
        fuel_level,
        temperature,
        status,
        source_file,
        loaded_at
    from {{ ref('stg_truck_telemetry') }}

),

transformed as (

    select
        truck_id,
        event_timestamp,
        latitude,
        longitude,
        speed,
        fuel_level,
        temperature,
        status,

        case
            when status = 'IN_TRANSIT' then true
            else false
        end as is_moving,

        source_file,
        loaded_at

    from staging

)

select *
from transformed