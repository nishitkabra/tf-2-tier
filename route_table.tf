# Route to internet
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.demo_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.demo_igw.id
  }

  tags = {
    Name = "Public RT"
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.demo_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }
  
  tags = {
    Name = "Private RT"
  }
}
# Associating public subnets to public route table
resource "aws_route_table_association" "public_rt_association" {
  subnet_id      = aws_subnet.pub_sub_1.id
  route_table_id = aws_route_table.public_rt.id
  

}

# Associating private subnets to private route table
resource "aws_route_table_association" "private_rt_association" {
  subnet_id      = aws_subnet.pvt_sub_1.id
  route_table_id = aws_route_table.private_rt.id

}