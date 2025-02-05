resource "aws_instance" "this" { # 'this' refers name for terraform to use

    ami = "ami-09c813fb71547fc4f"
    vpc_security_group_ids = [aws_security_group.that.id]
    instance_type = "t2.micro"
    tags = {
        Name = "terraform-demo"
    }
  
}

resource "aws_security_group" "that" {      # 'that' refers name for terraform to use

    name = "allow_sg"
    description = "Allow all inbound and outbound traffic"

    dynamic "ingress" {
        for_each = var.ingress_ports
        content {
            from_port = ingress.value["from_port"]
            to_port = ingress.value["to_port"]
            protocol = ingress.value["protocol"]
            cidr_blocks = ingress.value["cidr_blocks"]
        }
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }   
    
    tags = {
        Name = "allow_sg_tag"
    }

}