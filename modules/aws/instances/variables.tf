variable "instance_type" {
    description = "Defines EC2 instance type"
    type = string
    default = t2.micro
}

variable "environment" {
    description = "Deployment environment (e.g., staging, prod)"
    type = string
}