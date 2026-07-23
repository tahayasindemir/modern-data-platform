import boto3

from app.config import settings
from app.generator import generate_event
from app.uploader import S3Uploader


def main() -> None:
    client = boto3.client("s3", region_name=settings.aws_region)

    uploader = S3Uploader(
        bucket_name=settings.bucket_name,
        client=client,
    )

    event = generate_event()

    uploader.upload(event)

    print("Telemetry uploaded successfully.")


if __name__ == "__main__":
    main()