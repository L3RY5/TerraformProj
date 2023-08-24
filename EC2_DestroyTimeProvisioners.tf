data "aws_ami" "app_amiv2" {
  most_recent = true
  owners      = ["amazon"]


  filter {
    name   = "name"
    values = [var.imageName["Amazon"]] ## REDHAT image
  }
}
resource "aws_instance" "instance-RemoteExec" {
  ami               = data.aws_ami.app_amiv2.id
  instance_type     = var.instancetype
  availability_zone = var.EC2availability_ZoneMap["1a"] ## eu-central-1b 
  key_name = "remoteExec_Terraform" #Name of the remote keeypair that is on AWS
  vpc_security_group_ids = [aws_security_group.Allow_SSH.id]
  tags = {
    Name = "RemoteExecDestroy-TF-EC2"
  }

      connection {
      type = "ssh"
      host = self.public_ip
      #password = var.rootpasdword
      user = "ec2_user" #root  linux
      private_key = "${file("./remoteExec_Terraform.pem")}" #the generated keyppair in AWS
    }

  provisioner "remote-exec" {
    inline = [ 
        "sudo yum install -y nano ",
      
     ]
    
  }

  provisioner "remote-exec" {
    when = destroy
    inline = [ 
      "sudo yum -y remove nano"
     ]
  }
}