resource "aws_instance" "webserver" {
  ami               = "ami-090fa75af13c156b4"
  instance_type     = "t2.micro"
  key_name          = "MYUSKEYPAIR"
  availability_zone = "us-east-1a"
  user_data         = "${file("Auto_scaling_CSA_S8_L4_bootstrap.sh")}"
  vpc_security_group_ids      = [aws_security_group.public_sg.id]
  associate_public_ip_address = true
  subnet_id = aws_subnet.pub_sub_1.id

  tags = {
    Name = "Public Instance"
  }

}

resource "aws_instance" "database" {
  ami                         = "ami-090fa75af13c156b4"
  instance_type               = "t2.micro"
  key_name                    = "MYUSKEYPAIR"
  availability_zone           = "us-east-1b"
  vpc_security_group_ids      = [aws_security_group.private_sg.id]
  associate_public_ip_address = false
  subnet_id = aws_subnet.pvt_sub_1.id

  tags = {
    Name = "Private instance"

  }
}
