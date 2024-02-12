data "aws_elb_service_account" "root" {}


resource "aws_lb" "Trams4U_lb" {
  name = "${var.naming_prefix}-elb"
  security_groups    = var.ec2_sg
  subnets            = var.subnets
}

resource "aws_lb_target_group" "alb_tg" {
  name     = "${var.naming_prefix}-alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id
}

resource "aws_lb_listener" "alb_http_listener" {
  load_balancer_arn = aws_lb.Trams4U_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_tg.arn
  }
  tags = { Name = "${var.naming_prefix}-alb-http-listener" }
}