
resource "aws_security_group" "elb-sg" {
  name        = "myelb-sg"


  ingress {
    description      = "Allow Inbound HTTPS from Secret Application"
    from_port        = local.PortNrHTTPS
    to_port          = local.PortNrHTTPS
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "Allow Inbound from HTTP Secret Application"
    from_port        = local.PortNrHTTP
    to_port          = local.PortNrHTTP
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

locals {
  PortNrHTTPS = 8443
  PortNrHTTP = 80
}