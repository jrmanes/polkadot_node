# ==============================================
# AWS EC2
# ==============================================
resource "aws_instance" "ec2" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  security_groups = [aws_security_group.sg.name]
  key_name        = var.key_name

  count = var.instance_count

  provisioner "file" {
    source      = var.ansible_src_path
    destination = var.ansible_dst_path
  }

  provisioner "remote-exec" {
    inline = [
      "sudo add-apt-repository main -y",
      "sudo apt update",
      "sudo apt install -y ansible",
      "ansible-playbook ${var.ansible_dst_path}/main.yaml"
    ]
  }
  connection {
    host        = self.public_ip
    type        = "ssh"
    user        = "ubuntu"
    private_key = tls_private_key.priv_key.private_key_pem
    timeout     = "5m"
  }

  root_block_device {
    volume_size = 1000
    volume_type = "gp3"
  }

  tags = {
    Name = "${var.instance_name}-${count.index + 1}"
  }
}

# ==============================================
# Security Group
# ==============================================
resource "aws_security_group" "sg" {
  name = var.security_group_name

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 30333
    to_port     = 30333
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
    Name = "allow-access-from-internet-jrmanes"
  }
}

# ==============================================
# RSA key of size 4096 bits
# ==============================================
resource "tls_private_key" "priv_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# ==============================================
# AWS Key Pair
# ==============================================
resource "aws_key_pair" "priv_key" {
  key_name   = var.key_name
  public_key = tls_private_key.priv_key.public_key_openssh
}

# ==============================================
# Save the private key locally
# ==============================================
resource "local_file" "private_key" {
  filename        = var.private_key_path
  content         = tls_private_key.priv_key.private_key_pem
  file_permission = 0400
}

// here we will create the inventory file dynamically
# data "template_file" "inventory" {
#     template = "${file("./inventory.tpl")}"

#     vars {
#        host_name = "${element(aws_instance.ec2.*.tags.Name, count.index)}"
#        host_ip = "${element(aws_instance.ec2.*.public_ip, count.index)}"
#        key_path = "~/.ssh/id_rsa"
#     }
# }

# resource "local_file" "save_inventory" {
#   content  = "${data.template_file.inventory.rendered}"
#   filename = "./hosts"
# }
