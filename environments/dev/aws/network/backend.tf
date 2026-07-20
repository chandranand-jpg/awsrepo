terraform {
  backend "s3" {
    bucket       = "crksolution-terraform-state-prod"
    key          = "aws/dev/aws/network.tfstate" # Unique path for network
    region       = "ap-southeast-2"
    encrypt      = true
    }
}
