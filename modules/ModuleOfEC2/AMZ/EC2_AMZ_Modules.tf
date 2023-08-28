data "aws_ami" "app_amiAMZ" {
  most_recent = true
  owners      = ["amazon"]


  filter {
    name   = "name"
    values = ["al2023-ami-2023.1.20230809.0-kernel-6.1-x86_64"] 
  }
}
resource "aws_instance" "instance-ModuleAMZ" {
  ami               = data.aws_ami.app_amiAMZ.id
  instance_type     =var.instancetype
  availability_zone = var.EC2availability_ZoneMap["1a"]#"eu-central-1a" eu-central-1b 
  key_name = "remoteExec_Terraform" #Name of the remote keeypair that is on AWS
  #vpc_security_group_ids = [aws_security_group.Allow_SSH.id]
  tags = {
    Name = "WithModulesAMZ-TF-EC2"
  }
}