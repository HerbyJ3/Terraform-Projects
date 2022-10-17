#--/alb-outputs---
output "load_balancer" {
  value = aws_lb.application-lb.id
}

output "target_group_arn" {
  value = aws_lb_target_group.target-group.arn
}