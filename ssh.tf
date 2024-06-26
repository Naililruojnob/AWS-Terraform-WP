resource "aws_key_pair" "deployer" {
  key_name   = "LB-keys"
  public_key = file("~/.ssh/id_rsa.pub")
}
