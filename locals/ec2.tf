resource "aws_instance" "this" { # 'this' refers name for terraform to use

    ami = local.ami_id
    vpc_security_group_ids = [aws_security_group.that.id]
    instance_type = var.instance_type
    tags = {
        Name = local.name
        Purpose="terraform-demo"
    }
  
}

resource "aws_security_group" "that" {      # 'that' refers name for terraform to use

    name = "allow_sg"
    description = "Allow all inbound and outbound traffic"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }   
    
    tags = {
        Name = "allow_sg-tag"
    }

}