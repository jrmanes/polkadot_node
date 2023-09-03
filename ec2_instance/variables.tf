
# ==============================================
# Variables
# ==============================================
variable "instance_count" {
  description = "Number of EC2 instances to create"
  default     = 1
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "instance_name" {
  description = "EC2 instance name"
  default     = "ec2-instance"
}

variable "security_group_name" {
  description = "Name of the security group"
  default     = "Allow access to instance"
}

variable "key_name" {
  description = "Name of the SSH key pair"
  default     = "private_key"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instances"
  default     = "ami-04e601abe3e1a910f" # ubuntu 22.04
}

variable "region" {
  description = "Instance name"
  type        = string
  default     = "eu-central-1"
}

variable "private_key_path" {
  description = "Path to save the private key locally"
  default     = "~/.ssh/private_key.pem"
}

variable "ansible_src_path" {
  description = "Local path to the Ansible playbook"
  default     = "./main.yaml"
}
variable "ansible_dst_path" {
  description = "Remote path to the Ansible playbook"
  default     = "/home/ubuntu/ansisble/"
}