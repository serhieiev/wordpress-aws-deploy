# Create an Application Load Balancer
resource "aws_lb" "lb" {
  name            = "lb"
  subnets         = var.subnets
  security_groups = var.security_groups

  tags = {
    Name = "WP-LB"
  }
}

# Create a Target Group for the Load Balancer
resource "aws_lb_target_group" "target_group" {
  name        = "tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = var.vpc_id

  health_check {
    healthy_threshold   = "2"
    unhealthy_threshold = "5"
    interval            = "20"
    protocol            = "HTTP"
    matcher             = "200"
    timeout             = "5"
    path                = "/"
  }

  tags = {
    Name = "LB Target Group"
  }
}

resource "aws_alb_listener" "listener" {
  load_balancer_arn = aws_lb.lb.id
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}

# Register the EC2 Instance with the Target Group
resource "aws_lb_target_group_attachment" "tg_instance" {
  target_group_arn = var.target_group_arn
  target_id        = var.target_id
  # target_group_arn = aws_lb_target_group.tg.arn
  # target_id        = aws_instance.instance.id
  port = 80
}