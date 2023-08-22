
data "aws_ami" "app_amiv2" {
  most_recent = true
  owners      = ["amazon"]
  

  filter {
    name   = "name"
    values = [var.imageName["Amazon"]] ## AMazon image
  }
}

resource "aws_instance" "dev" {
   ami = data.aws_ami.app_amiv2.id
   instance_type = var.instancetype
   availability_zone = var.EC2availability_ZoneMap["1a"] ## eu-central-1b variable "istest" {}
   count = var.istest == true ? 3 : 0
}

#in terrafrorm.tfvars istest is fals so this part has count 2
resource "aws_instance" "prod" {
   ami = "data.aws_ami.app_amiv2.id"
   instance_type = var.instancetype
   availability_zone = var.EC2availability_ZoneMap["1a"] ## eu-central-1b variable "istest" {}
   count = var.istest == false ? 2 : 0
}