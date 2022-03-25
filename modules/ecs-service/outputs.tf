output "task_definition_arn" {
  description = "The ARN of the created ECS task definition."
  value       = aws_ecs_task_definition.td1.arn
}

output "log_group" {
  description = "The name of the log group capturing all task output."
  value       = var.include_log_group == "yes" ? aws_cloudwatch_log_group.service[0].name : ""
}

output "listener_port" {
  description = "The Port listener ALB listener is configured to listen on"
  value       = aws_alb_listener.lis1.port
}
