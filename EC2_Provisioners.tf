data "aws_ami" "app_amiv2" {
  most_recent = true
  owners      = ["amazon"]


  filter {
    name   = "name"
    values = [var.imageName["Amazon"]] ## AMazon image
  }
}
resource "aws_instance" "instance-Provisioners" {
  ami               = data.aws_ami.app_amiv2.id
  instance_type     = var.instancetype
  availability_zone = var.EC2availability_ZoneMap["1a"] ## eu-central-1b 
  key_name = "Terraform"

  tags = {
    Name = "Provisioners-TF-EC2"
  }

  provisioner "remote-exec" {
    inline = [ 
        "sudo amazon-linux-extra install -y nginx1.12",
        "sudo systemctl start nginx"
     ]
    
    connection {
      type = "ssh"
      host = self.public_ip
      user = "ec2_user"
      private_key = "${file("./terraform.pem")}" 
    }

  }
}