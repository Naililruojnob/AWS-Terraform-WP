resource "aws_instance" "web" {
  ami             = var.ami
  instance_type   = var.instance_type
  subnet_id       = aws_subnet.subnet[0].id
  security_groups = [aws_security_group.web_sg.id]
  associate_public_ip_address = true
  key_name        = aws_key_pair.deployer.key_name
  
  user_data = templatefile("./wordpress_install.sh", {

    db_name     = var.db_name
    db_username = var.db_username
    db_password = var.db_password
    db_host     = aws_db_instance.default.address

  })

  tags = {
    Name = "LB-WordPress-Instance"
  }
}
resource "aws_alb_target_group_attachment" "web" {
  target_group_arn = aws_alb_target_group.tg.arn
  target_id        = aws_instance.web.id
  port             = 80
}