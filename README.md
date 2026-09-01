# Modern Data Platform on AWS

A production-inspired data engineering project that demonstrates modern cloud data platform practices using Infrastructure as Code, containerization, orchestration, and analytics engineering.

The goal of this project is to simulate how telemetry data flows through a cloud-native data platform—from ingestion to transformation—while following software engineering and DevOps best practices.

## Architecture

```text
Telemetry Generator
        │
        ▼
Python Producer (Docker)
        │
        ▼
Amazon S3 (Raw Data Lake)
        │
        ▼
Apache Airflow
        │
        ▼
dbt Transformations
        │
        ▼
Snowflake
        │
        ▼
Analytics Layer
```

> 🚧 Components marked in the architecture are being implemented incrementally throughout the project.

## Tech Stack

### Languages

* Python
* SQL

### Infrastructure

* Terraform
* Amazon Web Services (AWS)
* Amazon S3
* IAM

### Data Engineering

* Apache Airflow
* dbt
* Snowflake

### Containerization

* Docker
* Amazon ECR

### CI/CD

* GitHub Actions

## Current Features

### Infrastructure
* Infrastructure provisioned with Terraform
* Secure Amazon S3 data lake
* Remote Terraform state stored in Amazon S3
* IAM least-privilege access
* Snowflake database and RAW schema
* Cost-controlled Snowflake warehouse
* Snowflake S3 storage integration
* Snowflake external stage
* Snowflake RAW telemetry landing table

### Data Engineering
* Python telemetry producer
* Dockerized producer
* Apache Airflow orchestration
* S3-based raw data ingestion
* Snowflake `COPY INTO` batch ingestion
* Raw JSON stored as Snowflake `VARIANT`

### CI/CD
* GitHub Actions CI for Python
* GitHub Actions validation for Terraform
* GitHub Actions authentication with AWS using OIDC
* Docker image build validation
* Docker image publishing to Amazon ECR

## Repository Structure

```text
.
├── producer/                 # Python telemetry producer
├── airflow/                  # Apache Airflow orchestration
├── terraform/                # Main infrastructure
├── terraform-bootstrap/      # Remote state bootstrap infrastructure
├── .github/
│   └── workflows/
└── README.md
```

## Getting Started

### Prerequisites

* Python 3.12+
* Docker
* Terraform
* AWS CLI
* Git

### Clone the repository

```bash
git clone https://github.com/tahayasindemir/modern-data-platform.git
cd modern-data-platform
```

### Configure AWS credentials

```bash
aws configure
```

### Provision infrastructure

```bash
cd terraform
terraform init
terraform plan
terraform apply
```

### Run the producer

```bash
cd producer
python main.py
```

## Continuous Integration

GitHub Actions automatically validates changes to the project.

Current checks include:

* Terraform formatting
* Terraform initialization
* Terraform validation
* Python linting
* Python unit tests
* Docker image build validation
* Docker image publishing to Amazon ECR
* AWS authentication using GitHub OIDC

## Roadmap

### Completed

* ✅ Terraform bootstrap infrastructure
* ✅ Secure S3 data lake
* ✅ Remote Terraform state
* ✅ IAM least-privilege access
* ✅ AWS OIDC authentication for GitHub Actions
* ✅ Python telemetry producer
* ✅ Dockerized telemetry producer
* ✅ Amazon ECR
* ✅ Docker image publishing
* ✅ Apache Airflow orchestration
* ✅ Snowflake database and RAW schema
* ✅ Snowflake S3 storage integration
* ✅ Snowflake external stage
* ✅ Snowflake RAW telemetry landing table
* ✅ S3 → Snowflake batch ingestion with COPY INTO

### In Progress

* 🚧 dbt transformation layer
* 🚧 Data quality checks

### Planned

* ⬜ Analytical marts
* ⬜ Observability
* ⬜ Production-oriented CI/CD for data transformations

## Design Principles

* Infrastructure as Code
* Least-Privilege Security
* Reproducible Deployments
* CI/CD Automation
* Modular Terraform Design
* Production-Oriented Development

## License

This project is intended for educational and portfolio purposes.
