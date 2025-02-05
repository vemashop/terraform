variable "instances" {
  type = map  
  default = {
    mysql = "t3.small"
    backend = "t3.micro"
    frontend = "t3.micro"
  }
}

variable "zone_id" {
  default = "Z031859619IMAPDSESLXQ"
}

variable "domain_name" {
  default = "vemas.shop"
}