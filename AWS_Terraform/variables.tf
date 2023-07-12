// define um bloco de código para atribuir a uma variável
// e passa a variável no arquivo main

variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "Example_1"
}
