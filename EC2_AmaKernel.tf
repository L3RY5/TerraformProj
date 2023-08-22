/*terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.13.1"
    }
  }
}

provider "aws" {
  region     = "eu-central-1"

}
*/
data "aws_ami" "AMAZON_ami" {
  most_recent = true
  owners = ["amazon"]


  filter {
    name   = "name"
    values = ["al2023-ami-2023.1.20230809.0-kernel-6.1-x86_64"] ## AMazon image
  }
}

resource "aws_instance" "instance-AMAZON" {
    ami = data.aws_ami.AMAZON_ami.id
   instance_type = "t2.micro"


   tags = {
     name = "AMAZON-TF-Basic"
   }
}