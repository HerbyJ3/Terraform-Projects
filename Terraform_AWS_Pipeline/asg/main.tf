#---/asg---
resource "aws_launch_template" "asglaunch" {
  name                   = "${var.project_name}-asgLT"
  image_id               = var.imagge_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [var.ec2_security_group]
}


resource "aws_autoscaling_group" "asg" {
  name                      = "${var.project_name}-asg"
  max_size                  = 3
  min_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 2
  force_delete              = true
  vpc_zone_identifier       = [var.public_subnet1_az1, var.public_subnet1_az2]
  target_group_arns         = [var.target_group_arn]
  
  launch_template {
    id      = aws_launch_template.asglaunch.id
  }


}



# resource "aws_autoscaling_attachment" "asg_attachment_bar" {
#   autoscaling_group_name = aws_autoscaling_group.asg.id
#   elb                    = var.load_balancer
# }


  