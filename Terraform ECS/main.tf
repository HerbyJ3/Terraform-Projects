resource "aws_ecs_cluster" "cluster" {
  name = "${var.name_prefix}-cluster"
}

resource "aws_ecs_cluster_capacity_providers" "cluster" {
  cluster_name = aws_ecs_cluster.cluster.name

  capacity_providers = ["FARGATE_SPOT", "FARGATE"]

  default_capacity_provider_strategy {
    capacity_provider = "FARGATE_SPOT"
  }
}

module "ecs-fargate" {
  source = "umotif-public/ecs-fargate/aws"

  name_prefix        = "${var.name_prefix}-fargate"
  vpc_id             = aws_vpc.vpc.id
  private_subnet_ids = [aws_subnet.private_subnet_az1.id, aws_subnet.private_subnet_az2.id]
  cluster_id         = aws_ecs_cluster.cluster.id

  task_container_image = "centos"

  // public ip is needed for default vpc, default is false
  task_container_assign_public_ip = true

  // port, default protocol is HTTP
  task_container_port = 80
  task_definition_cpu    = 256
  task_definition_memory = 512
  
  load_balanced = false
  

  health_check = {
    port = "traffic-port"
    path = "/"
  }

  tags = {
    Environment = "dev"
    Project     = "test"

  }
}
