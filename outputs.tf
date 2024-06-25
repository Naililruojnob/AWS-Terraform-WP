output "vpc_id" {
  description = "L'ID du VPC"
  value       = aws_vpc.main.id
}

output "subnet_ids" {
  description = "Les IDs des sous-réseaux"
  value       = [for s in aws_subnet.subnet : s.id]
}

output "web_sg_id" {
  description = "L'ID du groupe de sécurité du serveur web"
  value       = aws_security_group.web_sg.id
}

output "db_sg_id" {
  description = "L'ID du groupe de sécurité de la base de données"
  value       = aws_security_group.db_sg.id
}

output "web_instance_id" {
  description = "L'ID de l'instance EC2 du serveur web"
  value       = aws_instance.web.id
}

output "alb_id" {
  description = "L'ID de l'Application Load Balancer"
  value       = aws_alb.example.id
}

output "db_instance_id" {
  description = "L'ID de l'instance de la base de données"
  value       = aws_db_instance.default.id
}
output "web_instance_public_ip" {
  description = "L'adresse IP publique de l'instance EC2 du serveur web"
  value       = aws_instance.web.public_ip
}