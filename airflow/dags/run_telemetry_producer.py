import os

from datetime import datetime

from airflow import DAG
from airflow.providers.common.sql.operators.sql import SQLExecuteQueryOperator
from airflow.providers.docker.operators.docker import DockerOperator

from docker.types import Mount


with DAG(
    dag_id="run_telemetry_producer",
    description="Run telemetry producer and transform telemetry data.",
    start_date=datetime(2026, 1, 1),
    schedule=None,
    catchup=False,
    tags=["producer", "snowflake", "dbt"],
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

    load_raw_telemetry = SQLExecuteQueryOperator(
        task_id="load_raw_telemetry",
        conn_id="snowflake_mdp",
        sql="load_raw_telemetry.sql",
        split_statements=False,
    )

    run_dbt = DockerOperator(
        task_id="run_dbt",
        image="modern-data-platform-dbt:latest",
        container_name="airflow-dbt",
        auto_remove="success",
        docker_url="unix://var/run/docker.sock",
        mount_tmp_dir=False,
        environment={
            "SNOWFLAKE_ACCOUNT": os.environ["SNOWFLAKE_ACCOUNT"],
            "SNOWFLAKE_USER": os.environ["SNOWFLAKE_USER"],
            "SNOWFLAKE_ROLE": os.environ["SNOWFLAKE_ROLE"],
            "SNOWFLAKE_PRIVATE_KEY_PATH": (
                "/opt/airflow/secrets/mdp_terraform_key.p8"
            ),
            "SNOWFLAKE_PRIVATE_KEY_PASSPHRASE": os.environ[
                "SNOWFLAKE_PRIVATE_KEY_PASSPHRASE"
            ],
        },
        mounts=[
            Mount(
                source="/Users/taha/.dbt",
                target="/root/.dbt",
                type="bind",
                read_only=True,
            ),
            Mount(
                source="/Users/taha/.snowflake/mdp_terraform_key.p8",
                target="/opt/airflow/secrets/mdp_terraform_key.p8",
                type="bind",
                read_only=True,
            ),
        ],
        command="run --project-dir /app",
    )

    run_producer >> load_raw_telemetry >> run_dbt