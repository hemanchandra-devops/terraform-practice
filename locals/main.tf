resource "aws_instance" "terraform" {
  ami                    = local.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_all.id]

  tags = local.tags
}

resource "aws_security_group" "allow_all" {
  name = "${local.common_name}-allow-all"

  ingress {
    from_port   = var.ingress_from_port
    to_port     = var.ingress_to_port
    protocol    = var.protocol
    cidr_blocks = var.cidr_blocks
  }

  egress {
    from_port   = var.egress_from_port
    to_port     = var.egress_to_port
    protocol    = var.protocol
    cidr_blocks = var.cidr_blocks
  }

  tags = merge(
    var.common_tags,
    {
      Name = "${local.common_name}-allow-all"
    }
  )
}