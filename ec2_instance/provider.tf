# ==============================================
# AWS Provider
# ==============================================
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.15.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.4"
    }
  }
}

# provider region
provider "aws" {
  region = var.region
}