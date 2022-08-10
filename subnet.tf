resource "aws_subnet" "pub_sub_1" {
  vpc_id                  = aws_vpc.demo_vpc.id
  cidr_block              = var.subnet_pub_cidr[0]
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet_1"
  }
}

resource "aws_subnet" "pub_sub_2" {
  vpc_id                  = aws_vpc.demo_vpc.id
  cidr_block              = var.subnet_pub_cidr[1]
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet_2"
  }
}

resource "aws_subnet" "pvt_sub_1" {
  vpc_id                  = aws_vpc.demo_vpc.id
  cidr_block              = var.subnet_pvt_cidr[0]
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "private_subnet_1"
  }
}

resource "aws_subnet" "pvt_sub_2" {
  vpc_id                  = aws_vpc.demo_vpc.id
  cidr_block              = var.subnet_pvt_cidr[1]
  availability_zone       = "us-east-2a"
  map_public_ip_on_launch = false

  tags = {
    Name = "private_subnet_2"
  }
}