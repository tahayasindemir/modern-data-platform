# Terraform Infrastructure

This directory contains the Infrastructure as Code (IaC) used to provision AWS resources for the Modern Data Platform project.

## Current Resources

- Amazon S3 bucket
- Bucket versioning
- Server-side encryption
- Public access block

## Usage

```bash
terraform init
terraform plan
terraform apply
```

## Requirements

- Terraform >= 1.9
- AWS CLI
- Configured AWS credentials