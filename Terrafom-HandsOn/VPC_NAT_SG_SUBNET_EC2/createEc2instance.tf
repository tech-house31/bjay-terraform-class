resource "aws_key_pair" "TechHouse_key" {
    key_name = "TechHouse"
    public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "MyFirstInstnace" {
  ami           = lookup(var.AMIS, var.AWS_REGION)
  instance_type = "t2.micro"
  key_name      = aws_key_pair.TechHouse_key.key_name

  vpc_security_group_ids = [aws_security_group.Ec2_server_sg.id]
  subnet_id = aws_subnet.TechHousePub-Sub1.id

  tags = {
    Name = "Server101"
  }

}