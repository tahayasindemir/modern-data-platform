from __future__ import annotations

import random
from datetime import UTC, datetime

from .models import TruckTelemetry

STATUSES = (
    "IN_TRANSIT",
    "STOPPED",
    "LOADING",
    "UNLOADING",
)


def generate_event() -> TruckTelemetry:
    """Generate a synthetic truck telemetry event."""

    return TruckTelemetry(
        truck_id=f"TRK-{random.randint(100, 999)}",
        timestamp=datetime.now(UTC),
        latitude=round(random.uniform(51.5, 53.5), 6),
        longitude=round(random.uniform(4.0, 6.5), 6),
        temperature=round(random.uniform(-5.0, 12.0), 1),
        speed=random.randint(0, 90),
        fuel_level=random.randint(5, 100),
        status=random.choice(STATUSES),
    )