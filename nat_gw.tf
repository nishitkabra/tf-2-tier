resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.demo_eip.id
  subnet_id     = aws_subnet.pub_sub_1.id

  tags = {
    Name = "NAT gateway"
  }
}
# Elastic IP allocation

resource "aws_eip" "demo_eip" {
}