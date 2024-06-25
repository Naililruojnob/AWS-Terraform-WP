resource "aws_alb" "alb-lb" {
  name               = "LB-alb"
  security_groups    = [aws_security_group.web_sg.id]
  subnets            = [for s in aws_subnet.subnet : s.id]
  enable_deletion_protection = false

  tags = {
    Name = "LB-alb"
  }
}

resource "aws_alb_target_group" "tg" {
  name     = "tg-wp"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

  health_check {
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name = "tg-wp"
  }
}

resource "aws_alb_listener" "listener" {
  load_balancer_arn = aws_alb.alb-lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.tg.arn
  }
}