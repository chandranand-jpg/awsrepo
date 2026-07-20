variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "environment" {
  description = "Deployment environment (e.g., staging, prod)"
  type        = string
}
variable "subnets_config" {
  type = map(object({
    cidr_block        = string
    availability_zone = string
    is_public         = bool
    needs_nat         = bool
  }))
}