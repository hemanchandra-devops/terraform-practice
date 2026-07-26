resource "aws_instance" "terraform" {
  ami                    = "ami-0220d79f3f480ecf5"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_all.id]

  tags = {
    Name      = "terraform"
    Terraform = "true"
  }

  provisioner "local-exec" {
    command    = "echo ${self.private_ip} > inventory.ini"
    on_failure = continue
  }

  provisioner "local-exec" {
    command = "echo 'Instance is deleted'"
    when    = destroy
  }
}

resource "aws_security_group" "allow_all" {
  name = "allow-all"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-all"
  }
}