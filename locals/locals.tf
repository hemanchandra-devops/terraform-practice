locals {
  common_name = "${var.project}-${var.environment}"
  ami_id      = data.aws_ami.heman.id
  tags = merge(
    var.common_tags,
    {
      Name = "${local.common_name}-locals"
    }
  )
}