resource "aws_vpc" "vpc" {
  count = var.environment == "prod" ? 1 : 0 // se a variavel estiver setada para prod, será criado, se qualquer outro valor, o recurso nao será criado

  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "vpc-terraform"
  }
}

