locals {
  ami_id = data.aws_ami.joindevops.id
  ami_name="RHEL-9-DevOps-Practice"
  owner_id="973714476881"
  name ="${var.project}-${var.component}-${var.environment}"
}