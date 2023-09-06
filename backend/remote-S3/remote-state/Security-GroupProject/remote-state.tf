data "terraform_remote_state" "eip" {
  backend = "s3"

  config = {
    bucket = "lerys-tf-backend" #bucket naam
    key    = "network/eip.tfstate" #directory/filename
    region = "eu-central-1"
    
  }
}