# Route to internet
resource "aws_route_table" "route" {
  vpc_id = aws_vpc.demo_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.demo_igw.id
  }

  tags = {
    Name = "route to internet"
  }
}

# Associating public subnets to public route table
resource "aws_route_table_association" "public_rt" {
  subnet_id      = var.subnet_pub_cidr[count.index]
  count          = length(var.subnet_pub_cidr)
  route_table_id = aws_route_table.route.id

}

# Associating private subnets to private route table
resource "aws_route_table_association" "private_rt" {
  subnet_id      = var.subnet_pvt_cidr[count.index]
  count          = length(var.subnet_pvt_cidr)
  route_table_id = aws_route_table.route.id

}