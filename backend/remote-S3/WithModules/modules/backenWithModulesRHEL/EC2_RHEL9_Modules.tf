data "aws_ami" "app_amiRHEL9" {
  most_recent = true
  owners      = ["amazon"]


  filter {
    name   = "name"
    values = ["RHEL-9.2.0_HVM-20230503-x86_64-41-Hourly2-GP2" ]
  }
}
resource "aws_instance" "instance-ModuleRHEL9" {
  ami               = data.aws_ami.app_amiRHEL9.id
  instance_type     =var.instancetype
  availability_zone = var.EC2availability_ZoneMap["1b"]## eu-central-1b 
  #key_name = "remoteExec_Terraform" #Name of the remote keeypair that is on AWS
  #vpc_security_group_ids = [aws_security_group.Allow_SSH.id]
  tags = {
    Name = "WithModulesRHEL9-TF-EC2"
  }
}