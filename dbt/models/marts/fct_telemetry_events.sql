with telemetry_events as (

    select
        truck_id,
        event_timestamp,
        latitude,
        longitude,
        speed,
        fuel_level,
        temperature,
        status,
        is_moving,
        source_file,
        loaded_at
    from {{ ref('int_telemetry_events') }}

)

select
    truck_id,
    event_timestamp,
    latitude,
    longitude,
    speed,
    fuel_level,
    temperature,
    status,
    is_moving,
    source_file,
    loaded_at
from telemetry_events