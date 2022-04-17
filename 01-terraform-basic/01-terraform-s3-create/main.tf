terraform {
    required_version = "1.1.8"

    required_providers {
      aws = {
          source = "hashicorp/aws"
          version = "4.10.0"
      }
    }
}

provider "aws" {
    region = "eu-central-1"
}

resource "aws_s3_bucket" "my-test-bucket" {
  bucket = "my-first-tf-test-bucket-00001"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
    Managedby = "Terraform"
  }
}

resource "aws_s3_bucket_acl" "my-test-bucket-acl" {
  bucket = aws_s3_bucket.my-test-bucket.id
  acl    = "private"
}