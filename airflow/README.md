# Apache Airflow

This directory contains the local Apache Airflow environment used to orchestrate the data platform.

## Prerequisites

* Docker Desktop
* Docker Compose

## Setup

Copy the example environment file:

```bash
cp .env.example .env
```

If needed, update `AIRFLOW_UID` to match your local user ID.

Initialize Airflow:

```bash
docker compose up airflow-init
```

Start the services:

```bash
docker compose up -d
```

Access the Airflow UI:

* URL: http://localhost:8080
* Username: `airflow`
* Password: `airflow`

Stop the environment:

```bash
docker compose down
```
