#---/Modules/alb---

resource "aws_lb_target_group" "target-group" {
  health_check {
    enabled             = true
    interval            = 300
    path                = "/"
    timeout             = 60
    matcher             = 200
    healthy_threshold   = 5
    unhealthy_threshold = 5
  }
  name        = "${var.project_name}-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = var.vpc_id
}

resource "aws_lb" "application-lb" {
  name               = "${var.project_name}-alb"
  internal           = false
  ip_address_type    = "ipv4"
  load_balancer_type = "application"
  security_groups    = [var.alb_security_group]
  subnets            = var.subnet_ids

  tags = {
    Environment = "${var.project_name}-alb"
  }
}

resource "aws_lb_listener" "alb-listener" {
  load_balancer_arn = aws_lb.application-lb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target-group.arn
  }
}



resource "aws_lb_target_group_attachment" "ec2_attach" {
  count            = length(var.aws_instance)
  target_group_arn = aws_lb_target_group.target-group.arn
  target_id        = var.aws_instance[count.index].id

}
