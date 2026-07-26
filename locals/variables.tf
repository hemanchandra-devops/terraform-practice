variable "project" {
  default = "roboshop"
}

variable "environment" {
  default = "dev"
}


variable "ami" {
  type    = string
  default = "ami-0220d79f3f480ecf5"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "common_tags" {
  type = map(any)
  default = {
    Terraform   = "true"
    Project     = "roboshop"
    environment = "dev"
  }
}

variable "sg" {
  type        = string
  default     = "allow-all"
  description = "Allow all traffic"
}

variable "ingress_from_port" {
  type    = number
  default = 0
}

variable "ingress_to_port" {
  type    = number
  default = 0
}

variable "egress_from_port" {
  type    = number
  default = 0
}

variable "egress_to_port" {
  type    = number
  default = 0
}

variable "protocol" {
  type    = string
  default = "-1"
}

variable "cidr_blocks" {
  type    = list(any)
  default = ["0.0.0.0/0"]
}