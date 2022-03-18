region="us-east-2"

deployment_identifier="dev"

service_name="dummy-frontend"
service_image_repo="936341724687.dkr.ecr.us-east-2.amazonaws.com/myp2-frontend-dev"
service_image_tag="v4018"

tg_port="80" # Target group port
service_port="3000" # Container Port
listener_port="4000"
service_command=[]
service_desired_count="1"
service_deployment_maximum_percent="50"
service_deployment_minimum_healthy_percent="200"
alb_arn="arn:aws:elasticloadbalancing:us-east-2:936341724687:loadbalancer/app/myp2-test-alb/71515ebbb0792fed"
ecs_cluster_id="myp2-test2-cluster"
listener_protocol="HTTP"

task_cpu=1024
task_memory=2048



env_variables=[
        {
          "name": "ENV1",
          "value": "90"
        },
        {
          "name": "ENV2",
          "value": "yyyy"
        }
      ]

# Autoscalling related variables
scale_target_max_capacity=5
scale_target_min_capacity=1
min_cpu_threshold=20
max_cpu_threshold=40
memory_scale_target_value=40

tags = {
    mdo-application-name = "MYP2"
    mdo-environment = "DEV"
    mdo-creator = "Prashan"
  }
