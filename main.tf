provider "aws" {
  region = var.aws_region
}

# Output public IP for Jenkins
output "public_ip" {
  value = aws_instance.foo.public_ip
}
