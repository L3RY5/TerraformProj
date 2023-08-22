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

### Using for count dinamic


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
  count             = length(var.ec2_Name_LIST)
  tags = {
    Name = var.ec2_Name_LIST[count.index]
  }


}


#Using fopr each
data "aws_ami" "app_forEach" {
  most_recent = true
  owners      = ["Windows"]


  filter {
    name   = "name"
    values = [var.imageName["RHEL9"]] ## AMazon image
  }
}

resource "aws_instance" "instance-RHEL" {
  ami               = data.aws_ami.forEach.id
  for_each = {
    keyMicro = "t2.micro"
    keymedium = "t2.medium"
  }
  instance_type     = each.value
  key_name          = each.key
  availability_zone = var.EC2availability_ZoneMap["1c"] ## eu-central-1b 
  count             = length(var.ec2_Name_LIST)
  tags = {
    Name = each.key
  }


}

