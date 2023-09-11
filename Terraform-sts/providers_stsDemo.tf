terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.13.1"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
  assume_role {
    role_arn = "arn:aws:iam::349267489658:role/Role_sts_TF_TestGroundAcc"
    session_name = "sts_demo"
  }
}

#credentials for srt_user
# Secret_key = zpyhY+Fh0zj0AyEazg2lEh9qFc7NPispI0XdEVYX
# access_Key = AKIAVCUPW6N5IIK4M24W