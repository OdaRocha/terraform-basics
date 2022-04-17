variable "environment" {
  type = string
}

variable "aws_region" {
  type        = string
  description = "AWS Region"
}

variable "instance_ami" {
  type        = string
  description = "AMI ID"
}

variable "instance_type" {
  type        = string
  description = "AMI Type"
}


variable "instance_tags" {
  type        = map(string)
  description = "instance Tags"
  default = {
    Name    = "Ubuntu"
    Project = "Learning Terraform"
  }
}