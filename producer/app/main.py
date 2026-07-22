from app.generator import generate_event
from app.uploader import S3Uploader

BUCKET_NAME = "taha-modern-data-platform"


def main() -> None:
    event = generate_event()

    uploader = S3Uploader(BUCKET_NAME)

    uploader.upload(event)

    print("Telemetry uploaded successfully.")


if __name__ == "__main__":
    main()