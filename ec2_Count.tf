# Normal

data "aws_ami" "app_amiv2" {
  most_recent = true
  owners      = ["amazon"]
  

  filter {
    name   = "name"
    values = [var.imageName["Amazon"]] ## AMazon image
  }
}
resource "aws_instance" "instance-Amazon" {
  ami               = data.aws_ami.app_amiv2.id
  instance_type     = var.instancetype
  availability_zone = var.EC2availability_ZoneMap["1a"] ## eu-central-1b 
  
  
  tags = {
    Name = "AWS-TF-EC2"
  }
}

### Using Count


data "aws_ami" "app_ami" {
  most_recent = true
  owners      = ["amazon"]
  

  filter {
    name   = "name"
    values = [var.imageName["RHEL9"]] ## AMazon image
  }
}

resource "aws_instance" "instance-RHEL" {
  ami               = data.aws_ami.app_ami.id
  instance_type     = var.instancetype
  availability_zone = var.EC2availability_ZoneMap["1c"] ## eu-central-1b 
  count = 3

  tags = {
    Name = var.ec2_Name_LIST[count.index]
  }
}

