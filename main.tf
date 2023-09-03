# ==============================================
# Module EC2
# ==============================================
module "ec2_instances" {
  source              = "./ec2_instance"
  instance_count      = 2
  instance_type       = "m4.2xlarge"
  instance_name       = "polkadot-node"
  security_group_name = "Allow access to instance"
  key_name            = "private_key"
  ami_id              = "ami-04e601abe3e1a910f"
  private_key_path    = "/tmp/private_key.pem"
  ansible_src_path    = "ansible"
  ansible_dst_path    = "/home/ubuntu/ansible"
}

# ==============================================
# Outputs
# ==============================================
output "ec2_instance_ids" {
  description = "IDs of the created EC2 instances"
  value       = module.ec2_instances.instance_ids
}

output "ec2_instance_private_ips" {
  description = "Private IP addresses of the created EC2 instances"
  value       = module.ec2_instances.instance_private_ips
}

output "ec2_instance_public_ips" {
  description = "Public IP addresses of the created EC2 instances"
  value       = module.ec2_instances.instance_public_ips
}