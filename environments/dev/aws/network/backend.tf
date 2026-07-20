terraform {
  backend "s3" {
    bucket       = "crksolution-terraform-state-prod"
    key          = "aws/${var.environment}/${var.aws_region}/${var.module_name}.tfstate" # Unique path for network
    region       = "${var.aws_region}"
    use_lockfile = true
  }
}
