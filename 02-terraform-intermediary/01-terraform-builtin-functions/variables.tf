variable "env" {}

variable "aws_region" {
  type = string
}

variable "instance_ami" {
  type        = string
  description = "AMI ID"
  default     = "ami-01d9d7f15bbea00b7"
  validation {
    condition     = length(var.instance_ami) > 4 && substr(var.instance_ami, 0, 4) == "ami-"
    error_message = "The instance_ami  must be a valid AMI ID." // the most ridiculous thing, it needs to end with a period or question mark
  }
}

variable "instance_type" {
  type = object({
    dev  = string
    prod = string
  })
  description = "Type of instances to create"
  default = {
    dev  = "t2.micro"
    prod = "t2.micro"
  }
}

variable "instance_number" {
  type = object({
    dev  = number
    prod = number
  })
  description = "Number of instances to create"
  default = {
    dev  = 1
    prod = 1
  }
}
