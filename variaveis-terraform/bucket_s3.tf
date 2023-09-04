resource "aws_s3_bucket" "first_bucket" {
    bucket = "satake-bucket"
    location = var.location // utilizando a variavel criado da regiao
}