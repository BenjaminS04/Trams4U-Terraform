
resource "aws_launch_configuration" "Trams4U" {
  name                 = "${var.naming_prefix}-launch-configuration"
  
  image_id             = var.ami_id
  instance_type        = var.ec2_type
  security_groups      = var.ec2_sg
  user_data            = file("${path.module}/user-data.sh")
  associate_public_ip_address = true

  lifecycle {
    create_before_destroy = true
  }
}


