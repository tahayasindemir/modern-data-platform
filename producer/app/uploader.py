from botocore.client import BaseClient

from .models import TruckTelemetry


class S3Uploader:
    def __init__(self, bucket_name: str, client: BaseClient) -> None:
        self.bucket_name = bucket_name
        self.client = client

    def upload(self, event: TruckTelemetry) -> None:
        key = f"raw/{event.truck_id}/{event.timestamp.isoformat()}.json"

        self.client.put_object(
            Bucket=self.bucket_name,
            Key=key,
            Body=event.model_dump_json(indent=2),
            ContentType="application/json",
        )