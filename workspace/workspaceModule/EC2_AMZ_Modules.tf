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
  instance_type     = lookup(var.instance_typeWorkspace,terraform.workspace)
  #lookup the value of terraform workspace, and show the value of the key that is equal your terraform.workspace that is in the map instance_typeWorkspace
 
}

