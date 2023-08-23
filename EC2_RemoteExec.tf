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

  tags = {
    Name = "RemoteExec-TF-EC2"
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
        #"sudo yum -y update",
        #"sudo yum install -y nginx",
        #"sudo systemctl start nginx",
        #"sudo firewall-cmd --permanent --add-port={80/tcp,443/tcp}",
        #"sudo firewall-cmd --reload",
        #"sudo systemctl enable nginx",
        #"sudo systemctl start nginx",
        "sudo amazon-linux-extra install -y nginx1",
        "sudo systemctl start nginx"

     ]
    


  }
}