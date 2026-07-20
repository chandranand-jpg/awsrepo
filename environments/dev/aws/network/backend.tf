terraform {
  backend "s3" {
    bucket       = "crksolution-terraform-state-prod"
    key          = "dev/network.tfstate" # Unique path for network
    region       = "ap-southeast-2"
    encrypt      = true
    }
}
