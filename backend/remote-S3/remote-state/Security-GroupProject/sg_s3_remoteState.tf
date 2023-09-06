resource "aws_security_group" "Allow_tls" {
  name        = "Allow_tls"
  description = "Allow tls inbound Traffic"

  ingress {
    description = "TLs from theh VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${data.terraform_remote_state.eip.outputs.eip_addr}/32"]
    }
  

  egress {
    description = "outbound Allowed"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  }
