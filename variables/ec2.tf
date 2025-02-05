resource "aws_instance" "this" { # 'this' refers name for terraform to use

  ami                    = var.ami_id
  vpc_security_group_ids = [aws_security_group.that.id]
  instance_type          = var.instance_type
  tags                   = var.ec2_tags

}

resource "aws_security_group" "that" { # 'that' refers name for terraform to use

  name        = "allow_sg"
  description = "Allow all inbound and outbound traffic"

  ingress {
    from_port   = var.from_port
    to_port     = var.to_port
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.sg_tags

}