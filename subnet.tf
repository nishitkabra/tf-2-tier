resource "aws_subnet" "pub_sub_1" {
  vpc_id                  = aws_vpc.demo_vpc.id
  cidr_block              = var.cidr_pub_sub
  availability_zone       = var.availability_zone_1a
  map_public_ip_on_launch = true
  

  tags = {
    Name = "public_subnet_1"
  }
}

resource "aws_subnet" "pvt_sub_1" {
  vpc_id                  = aws_vpc.demo_vpc.id
  cidr_block              = var.cidr_pvt_sub
  availability_zone       = var.availability_zone_1b
  map_public_ip_on_launch = false

  tags = {
    Name = "private_subnet_1"
  }
}
