resource "aws_ecs_service" "service1" {
  name            = "${var.service_name}"
  cluster         = "${var.ecs_cluster_id}"
  task_definition = aws_ecs_task_definition.td1.arn
  desired_count   = "${var.service_desired_count}"
  depends_on      = [aws_ecs_task_definition.td1]

  tags            = "${var.tags}"

  load_balancer {
    target_group_arn = aws_alb_target_group.tg1.arn
    container_name   = "${var.service_name}"
    container_port   = "${var.service_port}"
  }

  network_configuration {
    security_groups  = [aws_security_group.nsg_service.id]
    subnets          = var.vpc_private_subnet_ids
    assign_public_ip = false
  }

  lifecycle {
    ignore_changes = [
      capacity_provider_strategy
    ]
  }

}


# ALB

resource "aws_alb_listener" "lis1" {
  load_balancer_arn = "${var.alb_arn}"
  port              = "${var.listener_port}"
  protocol          = "${var.listener_protocol}"

  default_action {
    target_group_arn = aws_alb_target_group.tg1.id
    type             = "forward"
  }

  depends_on      = [aws_alb_target_group.tg1]
}

# Target group
resource "aws_alb_target_group" "tg1" {
  name        = "${var.tg_name}"
  port        = "${var.tg_port}"
  protocol    = "${var.listener_protocol}"
  target_type = "ip"
  vpc_id      = "${var.vpc_id}"
}

