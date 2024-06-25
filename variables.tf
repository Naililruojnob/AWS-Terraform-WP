variable "region" {
  description = "La région AWS"
  default     = "eu-west-1"
}

variable "vpc_cidr" {
  description = "Le CIDR du VPC"
  default     = "10.0.0.0/16"
}

variable "subnet_cidrs" {
  description = "Les CIDR des sous-réseaux"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "availability_zones" {
  description = "Les zones de disponibilité"
  type        = list(string)
  default     = ["eu-west-1a", "eu-west-1b"]
}

variable "ami" {
  description = "L'AMI de l'instance EC2"
  default     = "ami-0607a9783dd204cae"
}

variable "instance_type" {
  description = "Le type de l'instance EC2"
  default     = "t3a.small"
}

variable "db_allocated_storage" {
  description = "L'espace de stockage alloué à la base de données"
  default     = 20
}

variable "db_engine" {
  description = "Le moteur de la base de données"
  default     = "mariadb"
}

variable "db_engine_version" {
  description = "La version du moteur de la base de données"
  default     = "10.11.6"
}

variable "db_instance_class" {
  description = "La classe de l'instance de la base de données"
  default     = "db.t3.micro"
}

variable "db_name" {
  description = "Le nom de la base de données"
  default     = "mydb1"
}

variable "db_username" {
  description = "Le nom d'utilisateur de la base de données"
  default     = "admin"
}

variable "db_password" {
  description = "Le mot de passe de la base de données"
  default     = "password"
}
