resource "aws_instance" "webserver" {
  count = 2
  ami               = var.ami
  instance_type     = var.instance_type
  key_name          = var.key_name
  availability_zone = var.availability_zone_1a
  user_data         = "${file("Auto_scaling_CSA_S8_L4_bootstrap.sh")}"
  vpc_security_group_ids      = [aws_security_group.public_sg.id]
  associate_public_ip_address = true
  subnet_id = aws_subnet.pub_sub_1.id

  tags = {
    Name = "Public Instance- ${count.index}"
  }

}

resource "aws_instance" "database" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  availability_zone           = var.availability_zone_1b
  vpc_security_group_ids      = [aws_security_group.private_sg.id]
  associate_public_ip_address = false
  subnet_id = aws_subnet.pvt_sub_1.id

  tags = {
    Name = "Private instance"

  }
}

module "ec2" {
  source = "github.com/nishitkabra/ec2_module.git?ref=main"
  ami                  = "ami-090fa75af13c156b4"
  key_name             = "MYUSKEYPAIR"
  availability_zone_1a = "us-east-1a"
  instance_type        = "t2.micro"
  
}

resource "aws_s3_bucket" "demo" {
  count = 5
  bucket = "${var.bucket}-${count.index}"
  acl = var.acl

  tags = {
    Name = "my demo bucket"
  } 
}

module "s3_bucket" {
  source = "github.com/nishitkabra/s3_module.git?ref=main"
}