# Polkadot Node

![Polkadot](https://wiki.polkadot.network/img/Polkadot_Logo_Horizontal_Pink-Black.svg)

---

## Overview

This Terraform module simplifies the deployment of AWS EC2 instances and the configuration of Ansible, allowing you to automate infrastructure provisioning effortlessly.

---

## Features

- **AWS EC2 Instance Creation**: Easily create AWS EC2 instances to suit your workload requirements.
- **Ansible Configuration**: Configure Ansible on EC2 instances for efficient automation.
- **Customization**: Customize instance counts, types, and security groups to meet your infrastructure needs.
- **Ansible Playbooks**: Specify source and destination paths for Ansible playbooks.

---

## Usage

To use this Terraform module, include it in your Terraform configuration and specify the required variables. Here's an example:

```hcl
module "ec2_instances" {
  source              = "./ec2_instance"
  instance_count      = 2
  instance_type       = "m4.2xlarge"
  instance_name       = "polkadot-node"
  security_group_name = "Allow access to instance"
  key_name            = "private_key"
  ami_id              = "ami-04e601abe3e1a910f" # Ubuntu
  private_key_path    = "/tmp/private_key.pem"
  ansible_src_path    = "ansible"
  ansible_dst_path    = "/home/ubuntu/ansible"
}
```

## How to run?

The easiest way is to use the Makefile commands:

```Makefile
# Create the resources
make apply_auto

# Destroy the resources
make destroy_auto
```

---

## Outputs

- **private_key_content**: The content of the private key.
- **public_ip_addresses**: The public IP addresses of the EC2 instances.

---

## References

- [Reference HW](https://wiki.polkadot.network/docs/maintain-guides-how-to-validate-polkadot#reference-hardware)
- [Installing The Binary](https://wiki.polkadot.network/docs/maintain-guides-how-to-validate-polkadot#installing-the-polkadot-binary)

---

Jose Ramon Mañes