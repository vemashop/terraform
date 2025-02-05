variable "ami_id" {
  default = "ami-09c813fb71547fc4f"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "zone_id" {
  default = "Z02088988U9HY0DW6A7J"
}

variable "instances" {
  default = ["mysql", "backend", "frontend"]

}

variable "domain_name" {
  default = "vemas.shop"
}

variable "from_port" {
  default = "22"
}

variable "to_port" {
  default = "22"
}

variable "cidr_blocks" {
  default = ["0.0.0.0/0"]
}


variable "sg_tags" {
  default = {
    Name = "expense-backend-dev"
  }
}