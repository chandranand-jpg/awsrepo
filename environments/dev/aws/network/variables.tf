variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "module_name" {
  description = "Module name"
  type        = string
}

variable "dummy" {
  description = "dummy"
  type  = string
  default = "dummy"
}
