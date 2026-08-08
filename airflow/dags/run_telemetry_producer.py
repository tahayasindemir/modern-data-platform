import os
from datetime import datetime

from airflow import DAG
from airflow.providers.docker.operators.docker import DockerOperator
from docker.types import Mount


with DAG(
    dag_id="run_telemetry_producer",
    description="Run the telemetry producer as a Docker container.",
    start_date=datetime(2026, 1, 1),
    schedule=None,
    catchup=False,
    tags=["producer", "docker"],
):
    run_producer = DockerOperator(
        task_id="run_producer",
        image="telemetry-producer:latest",
        container_name="airflow-telemetry-producer",
        auto_remove="success",
        docker_url="unix://var/run/docker.sock",
        mount_tmp_dir=False,
        environment={
            "BUCKET_NAME": os.environ["TELEMETRY_BUCKET_NAME"],
            "AWS_REGION": os.environ.get("AWS_REGION", "eu-central-1"),
        },
        mounts=[
            Mount(
                source="/Users/taha/.aws",
                target="/root/.aws",
                type="bind",
                read_only=True,
            ),
        ],
    )