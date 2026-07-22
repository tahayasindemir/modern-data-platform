from pprint import pprint

from .generator import generate_event


def main() -> None:
    telemetry = generate_event()
    pprint(telemetry)


if __name__ == "__main__":
    main()