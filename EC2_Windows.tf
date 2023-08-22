terraform {
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

data "aws_ami" "WINDOWS_ami" {
  most_recent = true
  owners = ["amazon"]


  filter {
    name   = "name"
    values = ["Windows_Server-2022-English-Full-Base-2023.08.10"] ## Windows image
  }
}

resource "aws_instance" "instance-WINDOWS" {
    ami = data.aws_ami.WINDOWS_ami.id
   instance_type = "t2.micro"

    tags = {
     name = "WINDOWS-TF-Basic"
   }
}