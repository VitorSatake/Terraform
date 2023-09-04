resource "aws_s3_bucket" "first_bucket" {
  bucket = "satake-remote-state"

  versioning {
    enabled = true // invés de sobreescrver o aquivo de nome igual, ele cria uma nova versao
  }

}