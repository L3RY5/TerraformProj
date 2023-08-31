data "aws_ami" "app_amiWIND" {
  most_recent = true
  owners      = ["amazon"]


  filter {
    name   = "name"
    values = ["Windows_Server-2022-English-Full-Base-2023.08.10"]
  }
}
resource "aws_instance" "instance-ModuleWIND" {
  ami               = data.aws_ami.app_amiWIND.id 
  instance_type     =var.instancetype
  availability_zone = var.EC2availability_ZoneMap["1c"]## eu-central-1c
  #key_name = "remoteExec_Terraform" #Name of the remote keeypair that is on AWS
  #vpc_security_group_ids = [aws_security_group.Allow_SSH.id]
  tags = {
    Name = "WithModulesWIND-TF-EC2"
  }
}