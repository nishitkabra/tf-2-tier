resource "aws_nat_gateway" "Public_nat_1" {
  allocation_id = aws_eip.demo_eip.id
  subnet_id     = aws_subnet.pub_sub_1.id

  tags = {
    Name = "NAT gateway 1"
  }

  depends_on = [aws_internet_gateway.demo_igw]
}

# Another NAT gateway for high availability
resource "aws_nat_gateway" "Public_nat_2" {
  allocation_id = aws_eip.demo_eip.id
  subnet_id     = aws_subnet.pub_sub_2.id

  tags = {
    Name = "NAT gateway 2"
  }

  depends_on = [aws_internet_gateway.demo_igw]
}

# Elastic IP allocation

resource "aws_eip" "demo_eip" {
}