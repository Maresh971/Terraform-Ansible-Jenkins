provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  ami           = "ami-0c94855ba95c71c99" # Ubuntu 18.04 LTS
  instance_type = "t2.micro"

  tags = {
    Name = "WebServer"
  }

  # Optionally output public IP for Ansible
  provisioner "local-exec" {
    command = "echo ${self.public_ip} > ec2_ip.txt"
  }
}
