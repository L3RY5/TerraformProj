resource "aws_eip" "pIp" {
  domain = "vpc" #just creating a ip 
} 

output "eip_addr" {
  value = aws_eip.pIp.public_ip
}