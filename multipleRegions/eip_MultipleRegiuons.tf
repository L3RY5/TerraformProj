resource "aws_eip" "eip01" {
   domain = "vpc" #just creating a ip 
}


## This resource in other region thazn eip01
resource "aws_eip" "eip02" {
   domain = "vpc" #just creating a ip 
   provider = aws.Ireland
}