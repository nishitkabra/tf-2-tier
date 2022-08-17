resource "aws_instance" "webserver" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = "MYUSKEYPAIR"
  availability_zone           = "us-east-1a"
  vpc_security_group_ids      = [aws_security_group.public_sg.id]
  associate_public_ip_address = true

}

resource "aws_instance" "database" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = "MYUSKEYPAIR"
  availability_zone           = "us-east-1b"
  vpc_security_group_ids      = [aws_security_group.private_sg.id]
  associate_public_ip_address = false

}
