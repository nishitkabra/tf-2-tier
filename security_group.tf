resource "aws_security_group" "public_sg" {
  vpc_id = aws_vpc.demo_vpc.id
  name   = "public_sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_security_group" "private_sg" {
  vpc_id = aws_vpc.demo_vpc.id
  name   = "private_sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [aws_security_group.public_sg.id]
  }

}

# Application load balancer security group
resource "aws_security_group" "alb_sg" {
    vpc_id = aws_vpc.demo_vpc.id
    name = "application load balancer"
    

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
  
}
