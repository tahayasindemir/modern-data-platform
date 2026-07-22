from .generator import generate_event


def main() -> None:
    telemetry = generate_event()
    print(telemetry.model_dump_json(indent=2))


if __name__ == "__main__":
    main()