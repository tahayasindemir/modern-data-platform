from dataclasses import dataclass
from datetime import datetime


@dataclass(slots=True)
class TruckTelemetry:
    truck_id: str
    timestamp: datetime
    latitude: float
    longitude: float
    temperature: float
    speed: int
    fuel_level: int
    status: str