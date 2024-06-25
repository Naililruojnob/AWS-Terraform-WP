resource "aws_alb" "example" {
  name               = "LB-alb"
  security_groups    = [aws_security_group.web_sg.id]
  subnets            = [for s in aws_subnet.subnet : s.id]
  enable_deletion_protection = false

  tags = {
    Name = "LB-alb"
  }
}
