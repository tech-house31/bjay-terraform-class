#Define External IP 
resource "aws_eip" "TechHouse-eip" {
  vpc = true
}

resource "aws_nat_gateway" "levelup-nat-gw" {
  allocation_id = aws_eip.TechHouse-eip
  subnet_id     = aws_subnet.TechHousePub-Sub1.id
  depends_on    = [aws_internet_gateway.TechHouse-gw.id]
}

resource "aws_route_table" "TechHouse-Pri-Rt" {
  vpc_id = aws_vpc.TechHouse.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_internet_gateway.TechHouse-gw.id
  }

  tags = {
    Name = "TechHouse-Pri-Rt"
  }
}

# route associations private
resource "aws_route_table_association" "TechHousePriAss1a" {
  subnet_id      = aws_subnet.TechHousePri-Sub1.id
  route_table_id = aws_route_table.TechHouse-Pri-Rt.id
}

resource "aws_route_table_association" "TechHousePriAss1b" {
  subnet_id      = aws_subnet.TechHousePri-Sub2.id
  route_table_id = aws_route_table.TechHouse-Pri-Rt.id
}
resource "aws_route_table_association" "TechHousePriAss1c" {
  subnet_id      = aws_subnet.TechHousePri-Sub3.id
  route_table_id = aws_route_table.TechHouse-Pri-Rt.id
}