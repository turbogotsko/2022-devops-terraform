locals {
  my_bootstrap = file("../FILES/userdata.sh")
}

resource "aws_instance" "web" {
  ami                         = data.aws_ami.example.id 
  instance_type               = var.instance_type
  subnet_id                   = var.public_subnet_1 
  key_name                    = var.ssh_key_name 
  ebs_optimized               = var.ebs_optimized
  user_data                   = local.my_bootstrap
  vpc_security_group_ids      = var.security_group
  #iam_instance_profile        = aws_iam_instance_profile.test_profile.id
  associate_public_ip_address = true
}
