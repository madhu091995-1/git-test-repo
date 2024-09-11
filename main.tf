terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"  # Change to your desired region
}

# Launch an EC2 instance with the specified configurations
resource "aws_instance" "my_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.keypair_name
  security_groups = [var.security_group_id]
  subnet_id     = var.subnet_id  # Assuming you're specifying subnet ID as VPC ID, adjust if necessary

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y > /home/ec2-user/test.txt
              sudo yum install docker -y 
              sudo usermod -aG docker $USER
              sudo systemctl enable docker.service
              sudo systemctl start docker.service
              sudo chown $USER:docker /var/run/docker.sock
              sudo chmod 660 /var/run/docker.sock
              EOF
}

# Output the public IP address of the created instance
output "public_ip" {
  value = aws_instance.my_instance.public_ip
}