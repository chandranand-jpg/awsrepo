module "network" {
  source   = "../../../../modules/aws/network"
  vpc_cidr = "10.1.0.0/16"
  subnets_config = {
    "data10-a" = {
      cidr_block        = "10.1.1.0/24"
      availability_zone = "ap-southeast-2a"
      is_public         = false
      needs_nat         = false
      tier              = "data"
    }
    "data10-b" = {
      cidr_block        = "10.1.2.0/24"
      availability_zone = "ap-southeast-2b"
      is_public         = false
      needs_nat         = false
      tier              = "data"
    }
    "priv10-a" = {
      cidr_block        = "10.1.16.0/20"
      availability_zone = "ap-southeast-2a"
      is_public         = false
      needs_nat         = true
      tier              = "private"
    }
    "priv10-b" = {
      cidr_block        = "10.1.32.0/20"
      availability_zone = "ap-southeast-2b"
      is_public         = false
      needs_nat         = true
      tier              = "private"
      }
    "pub10-a" = {
      cidr_block        = "10.1.160.0/20"
      availability_zone = "ap-southeast-2a"
      is_public         = true
      needs_nat         = false
      tier              = "public"
    }
    "pub10-b" = {
      cidr_block        = "10.1.176.0/20"
      availability_zone = "ap-southeast-2b"
      is_public         = true
      needs_nat         = false
      tier              = "public"
    }
  }

  environment = "dev"
}
