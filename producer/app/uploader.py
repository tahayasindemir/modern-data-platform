import json

import boto3

from .models import TruckTelemetry


class S3Uploader:
    def __init__(self, bucket_name: str) -> None:
        self.bucket_name = bucket_name
        self.client = boto3.client("s3")

    def upload(self, event: TruckTelemetry) -> None:
        key = f"raw/{event.truck_id}/{event.timestamp.isoformat()}.json"

        self.client.put_object(
            Bucket=self.bucket_name,
            Key=key,
            Body=json.dumps(event.model_dump(mode="json"), indent=2),
            ContentType="application/json",
        )