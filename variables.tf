variable "project" {
  description = "Project/tag prefix used for names"
  type        = string
  default     = "reuseablevpnandnat"
}

variable "ec2_instance_type" {
  description = "EC2 instance type for the demo web server"
  type        = string
  default     = "t3.micro"
}

variable "ssh_ingress_cidr" {
  description = "Who can SSH to the instance (keep tight in real use)"
  type        = string
  default     = "0.0.0.0/0"
}

