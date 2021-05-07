variable "x" {
  type = string
  default = "linux world"
}

output "myvalue" {
  value = "Hello ${var.x} What's up !!!"
}
