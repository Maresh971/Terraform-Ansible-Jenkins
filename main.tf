provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "foo" {
  ami           = "ami-0360c520857e3138f" # Ubuntu 22.04 in us-east-1
  instance_type = "t2.medium"

  tags = {
    Name = "TF-Instance"
  }

  # Save public IP to file for Ansible
  provisioner "local-exec" {
    command = "echo ${self.public_ip} > ec2_ip.txt"
  }
}

# Output public IP for Jenkins
output "public_ip" {
  value = aws_instance.foo.public_ip
}
