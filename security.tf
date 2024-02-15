resource "aws_security_group" "allow_gui" {
  name        = "amazon_mq_sg"
  description = "Allow access to Amazon MQ instance"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "MQ WebConsole access"
    from_port   = 8162
    to_port     = 8162
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  ingress {
    description = "MQ Openwire access"
    from_port   = 61617
    to_port     = 61617
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    Name = "amazon_mq_sg"
  }
}
