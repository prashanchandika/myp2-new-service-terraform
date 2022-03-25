[
  {
    "name": "${name}",
    "image": "${image}",
    "memory": 200,
    "essential": true,
    "command": ${command},
    "environment": ${env_variables},
    "portMappings": [
      {
        "containerPort": ${port},
        "hostPort": ${port}
      }
    ],
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-group": "${log_group}",
        "awslogs-region": "${region}",
        "awslogs-stream-prefix": "ecs"
      }
    }
  }
]
