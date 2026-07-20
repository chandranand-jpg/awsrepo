terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
 # Keep your remote backend config here
 
}

provider "aws" {
  region = var.aws_region
}