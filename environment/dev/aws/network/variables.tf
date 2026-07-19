# Defines the inputs required by this module
variable "cluster_name" { 
    type = string 
}
variable "cluster_version" {
  type    = string
  default = "1.31"
}
variable "vpc_id" { 
    type = string 
}
variable "subnet_ids" { 
    type = list(string) 
}
variable "cluster_endpoint_public_access" { 
    type = bool
    default = true 
}
variable "cluster_endpoint_private_access" {
     type = bool
     default = true 
}
variable "eks_tags" { 
    type = map(string) 
}

variable "node_groups" {
  type = any
  description = "Map of EKS managed node group definitions"
}

variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}
