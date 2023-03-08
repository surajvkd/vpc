resource "aws_route_table" "rt1" {
  vpc_id = aws_vpc.vpc1.id
  tags = {
    Name = "rt1"
  }
}
resource "aws_route_table_association" "sub1" {
  route_table_id = aws_route_table.rt1.id
  subnet_id      = aws_subnet.sub1.id
}
resource "aws_route_table" "rt2" {
  vpc_id = aws_vpc.vpc1.id
  tags = {
    Name = "rt2"
  }
}
resource "aws_route_table_association" "sub2" {
  route_table_id = aws_route_table.rt2.id
  subnet_id      = aws_subnet.sub2.id
}
resource "aws_route" "pub" {
  route_table_id         = aws_route_table.rt2.id
  gateway_id             = aws_internet_gateway.igw.id
  destination_cidr_block = "0.0.0.0/0"
}