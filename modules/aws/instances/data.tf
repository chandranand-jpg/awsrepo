data "aws_vpc" "vpc-net" {
    filter {
        name = "tag:Environment"
        values = ["Dev"]
    }
}

data "aws_subnet" "subnet-priv-a" {
    vpc_id = data.aws_vpc.vpc-net.id
    filter {
        name = "tag:Name"
        values = ["subnet-apse4-az1-private"]
    }

}

data "aws_subnet" "subnet-priv-b" {
    vpc_id = data.aws_vpc.vpc-net.id
    filter {
        name = "tag:Name"
        values = ["subnet-apse4-az2-private"]
    }

}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023*-x86_64"]
  }
}
