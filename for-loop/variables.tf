variable "instances" {
  default = {
    mongodb = "t3.micro"
    redis   = "t3.micro"
  }
}

variable "zone_id" {
  default = "Z09005143JOTSHTMIUST8"
}

variable "domain_name" {
  default = "heman.icu"
}