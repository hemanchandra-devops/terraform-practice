variable "instances" {
  default = ["mongodb", "redis", "mysql", "rabbitmq"]
}

variable "zone_id" {
  default = "Z09005143JOTSHTMIUST8"
}

variable "domain_name" {
  default = "heman.icu"
}