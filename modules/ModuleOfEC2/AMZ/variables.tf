variable "instancetype" {
  type    = string
  default = "t2.small"
}

variable "az" {
  type    = list
  default = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
}

variable "ec2_localName" {
  type    = string
  default = "myEC2_Local"
}

variable "ec2_Name_LIST" {
  type    = list
  default = ["RHEL-TF-Count-01","RHEL-TF-Count-02","RHEL-TF-Count-03"]
}

variable "EC2availability_ZoneMap" {

  type = map

  default = {

    "1a" = "eu-central-1a"

    "1b" = "eu-central-1b"

    "1c" = "eu-central-1c"

  }
} 



variable "imageName" {
  type = map
  default = {

    "Windows" = "Windows_Server-2022-English-Full-Base-2023.08.10"

    "Amazon" = "al2023-ami-2023.1.20230809.0-kernel-6.1-x86_64"

    "RHEL9" = "RHEL-9.2.0_HVM-20230503-x86_64-41-Hourly2-GP2"
  }
} 

variable "elb_names_LIST" {
  type = list
  default = ["dev-loadbalancer", "stage-loadbalanacer","prod-loadbalancer"]
}


variable "IAM_names_LIST" {
  type = list
  default = ["dev-USER", "stage-USER","prod-USER"]
}