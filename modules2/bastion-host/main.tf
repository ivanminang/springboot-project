resource "aws_instance" "bastion-host" {
  count                   = var.instance_count
  ami                     = var.ec2_instance_ami
  instance_type           = var.ec2_instance_type
  key_name                = "springboot-key"
  vpc_security_group_ids  = [aws_security_group.sg.id]
  subnet_id               = var.subnet_id
  disable_api_termination = var.enable_termination_protection

  root_block_device {
    volume_size = var.root_volume_size
  }

  tags = merge(var.tags, {
    Name = format("%s-%s-%s-${var.instance_name}-${count.index + 1}", var.tags["id"], var.tags["environment"], var.tags["project"])
    },
  )
}

# resource "aws_key_pair" "revive_bastion" {
#   key_name   = var.key_name
#   public_key = tls_private_key.revive_bastion_key.public_key_openssh
# }

# resource "local_file" "revive_bastion" {
#   content  = tls_private_key.revive_bastion_key.private_key_pem
#   filename = "revivebastionkeypair"
# }
# resource "tls_private_key" "revive_bastion_key" {
#   algorithm = "RSA"
#   rsa_bits  = 4096
# }


