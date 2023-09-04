variable "portas" {
  type        = list(number)
  default     = [22, 80, 443, 8080]
  description = "Portas que serão abertas no security group"
}
