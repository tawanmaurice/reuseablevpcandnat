############################################
# Demo EC2 (optional, simple and reusable) #
############################################

# Ubuntu LTS AMI (Canonical)
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}

# Minimal SG: SSH + HTTP out to the world; all egress
resource "aws_security_group" "web" {
  name        = "${var.project}-sg-web"
  description = "Allow SSH/HTTP to demo web server"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ssh_ingress_cidr]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "${var.project}-sg-web"
    Project = var.project
    Managed = "terraform"
  }
}

# One tiny instance in your existing public subnet (1a)
resource "aws_instance" "web" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.ec2_instance_type
  subnet_id                   = aws_subnet.public1a.id
  vpc_security_group_ids      = [aws_security_group.web.id]
  associate_public_ip_address = true

  user_data = <<-EOT
    #!/bin/bash
    apt-get update -y
    apt-get install -y nginx
    systemctl enable nginx
    systemctl start nginx
    echo "<h1>${var.project} - nginx up</h1>" > /var/www/html/index.html
  EOT

  tags = {
    Name    = "${var.project}-web"
    Project = var.project
    Managed = "terraform"
  }
}

output "web_public_ip" {
  description = "Public IP of the demo web server"
  value       = aws_instance.web.public_ip
}

