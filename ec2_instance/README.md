## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.15.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | 4.0.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.15.0 |
| <a name="provider_local"></a> [local](#provider\_local) | n/a |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.4 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_instance.ec2](https://registry.terraform.io/providers/hashicorp/aws/5.15.0/docs/resources/instance) | resource |
| [aws_key_pair.priv_key](https://registry.terraform.io/providers/hashicorp/aws/5.15.0/docs/resources/key_pair) | resource |
| [aws_security_group.sg](https://registry.terraform.io/providers/hashicorp/aws/5.15.0/docs/resources/security_group) | resource |
| [local_file.private_key](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [tls_private_key.priv_key](https://registry.terraform.io/providers/hashicorp/tls/4.0.4/docs/resources/private_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami_id"></a> [ami\_id](#input\_ami\_id) | AMI ID for the EC2 instances | `string` | `"ami-04e601abe3e1a910f"` | no |
| <a name="input_ansible_dst_path"></a> [ansible\_dst\_path](#input\_ansible\_dst\_path) | Remote path to the Ansible playbook | `string` | `"/home/ubuntu/ansisble/"` | no |
| <a name="input_ansible_src_path"></a> [ansible\_src\_path](#input\_ansible\_src\_path) | Local path to the Ansible playbook | `string` | `"./main.yaml"` | no |
| <a name="input_instance_count"></a> [instance\_count](#input\_instance\_count) | Number of EC2 instances to create | `number` | `1` | no |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | EC2 instance name | `string` | `"ec2-instance"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | EC2 instance type | `string` | `"t2.micro"` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | Name of the SSH key pair | `string` | `"private_key"` | no |
| <a name="input_private_key_path"></a> [private\_key\_path](#input\_private\_key\_path) | Path to save the private key locally | `string` | `"~/.ssh/private_key.pem"` | no |
| <a name="input_region"></a> [region](#input\_region) | Instance name | `string` | `"eu-central-1"` | no |
| <a name="input_security_group_name"></a> [security\_group\_name](#input\_security\_group\_name) | Name of the security group | `string` | `"Allow access to instance"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_ids"></a> [instance\_ids](#output\_instance\_ids) | IDs of the created EC2 instances |
| <a name="output_instance_private_ips"></a> [instance\_private\_ips](#output\_instance\_private\_ips) | Private IP addresses of the created EC2 instances |
| <a name="output_instance_public_ips"></a> [instance\_public\_ips](#output\_instance\_public\_ips) | Public IP addresses of the created EC2 instances |
