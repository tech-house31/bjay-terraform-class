#Security Group for levelupvpc
resource "aws_security_group" "Ec2_server_sg" {
  vpc_id      = aws_vpc.TechHouse.id
  name        = "Ec2_server_sg"
  description = "security group that allows ssh connection"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    Name = "Server_Sg"
  }
}