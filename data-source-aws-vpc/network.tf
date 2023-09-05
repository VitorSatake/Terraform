/*data "aws_vpc" "vpc_data" { vpc_data = nome dado ao bloco
  cidr_block = "10.0.0.0/16"
} bloco data utilizado para chamar um recurso ja criado na aws, nesse caso uma vpc ja criada, nesse caso pelo cidr_block dela
*/

resource "aws_subnet" "subnet" {
  vpc_id     = data.aws_vpc.vpc.id // referencindo o tipo data criado acima
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "subnet-terraform"
  }
}
