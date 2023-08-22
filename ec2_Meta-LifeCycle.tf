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

   lifecycle {
        ignore_changes = [tags] # ignore the chages made manually to this resources, averything with TAGS
        create_before_destroy = true #will create the resource befor destroying the new one
        prevent_destroy = true # will not be able to use a new version to destroy the old one. intansce of a db that neess to stay EX.!!"terraform destroy" ==> wil desrtroy it!!.postcondition {
          
        }
    }


