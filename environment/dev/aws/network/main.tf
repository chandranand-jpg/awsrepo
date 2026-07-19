module "network" {
  source   = "../../../modules/aws/network"
  vpc_cidr = "10.0.0.0/16"
  subnets_config = {
    "data10-a" = {
      cidr_block        = "10.0.1.0/24"
      availability_zone = "apse4-az1"
      is_public         = false
      needs_nat         = false
      tier              = "data"
    }
    "data10-b" = {
      cidr_block        = "10.0.2.0/24"
      availability_zone = "apse4-az2"
      is_public         = false
      needs_nat         = false
      tier              = "data"
    }
    "priv10-a" = {
      cidr_block        = "10.0.16.0/20"
      availability_zone = "apse4-az1"
      is_public         = false
      needs_nat         = true
      tier              = "private"
    }
    "priv10-b" = {
      cidr_block        = "10.0.32.0/20"
      availability_zone = "apse4-az2"
      is_public         = false
      needs_nat         = true
      tier              = "private"
      }
    "pub10-a" = {
      cidr_block        = "10.0.160.0/16"
      availability_zone = "apse4-az1"
      is_public         = true
      needs_nat         = false
      tier              = "public"
    }
    "pub10-b" = {
      cidr_block        = "10.0.162.0/16"
      availability_zone = "apse4-az2"
      is_public         = true
      needs_nat         = false
      tier              = "public"
    }
  }
  environment = "Dev"
}