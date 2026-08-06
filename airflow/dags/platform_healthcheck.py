from datetime import datetime

from airflow import DAG
from airflow.operators.python import PythonOperator


def platform_healthcheck() -> None:
    print("Modern Data Platform is operational.")


with DAG(
    dag_id="platform_healthcheck",
    description="Validate the local Airflow environment.",
    start_date=datetime(2026, 1, 1),
    schedule=None,
    catchup=False,
    tags=["platform"],
) as dag:
    PythonOperator(
        task_id="healthcheck",
        python_callable=platform_healthcheck,
    )