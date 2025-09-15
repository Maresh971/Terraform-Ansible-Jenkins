provider "aws" {
    region = "us-east-1"  
}

resource "aws_instance" "foo" {
  ami           = "ami-0360c520857e3138f" # us-east-1
  instance_type = "t2.medium"
  tags = {
      Name = "TF-Instance"
  }
}

  # Optionally output public IP for Ansible
  provisioner "local-exec" {
    command = "echo ${self.public_ip} > ec2_ip.txt"
  }
}
