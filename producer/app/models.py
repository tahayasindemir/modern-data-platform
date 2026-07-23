from datetime import datetime

from pydantic import BaseModel


class TruckTelemetry(BaseModel):
    truck_id: str
    timestamp: datetime
    latitude: float
    longitude: float
    temperature: float
    speed: int
    fuel_level: int
    status: str