resource "aws_security_group" "public_sg" {
  vpc_id = aws_vpc.demo_vpc.id
  name   = "public_sg"

  dynamic "ingress"{
    for_each = var.ingress_ports_pub_sg
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

}

resource "aws_security_group" "private_sg" {
  vpc_id = aws_vpc.demo_vpc.id
  name   = "private_sg"

  dynamic "ingress" {
    for_each = var.ingress_ports_pvt_sg
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

}

