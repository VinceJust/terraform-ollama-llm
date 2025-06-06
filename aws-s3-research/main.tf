terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region  = var.region
  profile = "default"
}

resource "aws_s3_bucket" "my_research_bucket" {
  bucket = var.bucket_name
}

