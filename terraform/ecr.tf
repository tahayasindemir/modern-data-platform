resource "aws_ecr_repository" "telemetry_producer" {
  name                 = "telemetry-producer"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "AES256"
  }

  tags = {
    Project     = "modern-data-platform"
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}