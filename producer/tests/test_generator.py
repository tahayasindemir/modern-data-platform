from app.generator import generate_event


def test_generate_event() -> None:
    event = generate_event()

    assert event.truck_id.startswith("TRK-")
    assert 0 <= event.speed <= 90
    assert 5 <= event.fuel_level <= 100