output "subnet_id" {
  value = aws_subnet.subnet[*].id // para cada subnet que esta sendo criada, retorne o id dessa subnet usando o splat
}

