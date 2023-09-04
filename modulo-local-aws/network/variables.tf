variable "cidr_vpc" {
  type        = string
  description = "Cidr block para VPC"
}

variable "cidr_subnet" {
  description = "Cidr block para SUBNET"
  type        = string
}

variable "environment" {
  type        = string
  description = "Ambiente onde o recurso vai ser utilizado"
}
