output "subnet_id" {
  value = [for subnet in aws_subnet.subnet : subnet.id] // para cada subnet que esta sendo criada, retorne o id dessa subnet usando o for
}

