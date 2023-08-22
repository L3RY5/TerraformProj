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

}*/

data "aws_ami" "RHEL_ami" {
  most_recent = true
  owners = ["amazon"]


  filter {
    name   = "name"
    values = ["RHEL-9.2.0_HVM-20230503-x86_64-41-Hourly2-GP2"] ## REDHAT9
  }
}

resource "aws_instance" "instance-RHEL" {
    ami = data.aws_ami.RHEL_ami.id
   instance_type = "t2.micro"

    tags = {
     name = "RHEL-TF-Basic"
   }

}