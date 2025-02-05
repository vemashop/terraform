resource "aws_instance" "this" { # 'this' refers name for terraform to use
    for_each = var.instances # terraform will give us a variable called each
    ami = "ami-09c813fb71547fc4f"
    vpc_security_group_ids = [aws_security_group.that.id]
    instance_type = each.value
    tags = {
        Name = each.key
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
        Name = "allow_sg_tag"
    }

}

output "ec2_info" {
  value = aws_instance.this
}