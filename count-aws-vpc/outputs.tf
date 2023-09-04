output "subnet_0_id" {
  value = aws_subnet.subnet[0].id // gera o output da primeira subnet
}

output "subnet_1_id" {
  value = aws_subnet.subnet[1].id // gera o output da segunda subnet
}

output "subnet_2_id" {
  value = aws_subnet.subnet[2].id // gera o output da terceira subnet
}
