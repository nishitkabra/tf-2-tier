resource "aws_subnet" "pub_sub_1" {
  vpc_id                  = aws_vpc.demo_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  

  tags = {
    Name = "public_subnet_1"
  }
}

resource "aws_subnet" "pvt_sub_1" {
  vpc_id                  = aws_vpc.demo_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "private_subnet_1"
  }
}
