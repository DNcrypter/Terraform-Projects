resource "aws_security_group" "allow_ssh" {
  name_prefix = "allow_ssh-"
  description = "Allow SSH access"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "app_server" {
  ami           = "ami-0c55b159cbfafe1f0"  # Use the latest AMI for your region
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  security_group = aws_security_group.allow_ssh.id

  tags = {
    Name = "AppServer"
  }
}

output "public_ip" {
  value = aws_instance.app_server.public_ip
}
