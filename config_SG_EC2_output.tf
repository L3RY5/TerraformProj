module "SgmoduleOutput" {
    source = "../modules/ModuleOfSG"
  
}

## now lets use tge ibnformation of the creat es SG tio creat out EC2

##First SG will be created from this module
## then the ID value of the output "elb-sg_id" from the created SG will bve us to creat the ECS


resource "aws_instance" "instance-EC2MioduleOutput" {
  ami               = "ami-03EZDE003"
  instance_type     = "t2.micro"
  availability_zone = "eu-central-1a" 
vpc_security_group_ids = [module.SgmoduleOutput.elb-sg_id] #THis is how you cal ther output odf a specyfic module

}