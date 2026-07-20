resource "aws_instance" "my_server01" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  subnet_id     = data.aws_subnet.subnet-priv-a.id
  tags = {
    Name = "Terraform-Dynamic-EC2"
  }
}
resource "aws_instance" "my_server02" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  subnet_id     = data.aws_subnet.subnet-priv-b.id
  tags = {
    Name = "Terraform-Dynamic-EC2"
  }
}