region="us-east-2"

service_name="dummy-service-tftest"
service_image_repo="936341724687.dkr.ecr.us-east-2.amazonaws.com/dummyrepotf"
service_image_tag="v1"

tg_port="80" # Target group port
service_port="3000" # Container Port
service_command=[]
service_desired_count="1"
service_deployment_maximum_percent="50"
service_deployment_minimum_healthy_percent="200"
alb_arn="arn:aws:elasticloadbalancing:us-east-2:936341724687:loadbalancer/app/myp2-test-internal-alb/7a51f868ec11e1f6"
ecs_cluster_id="myp2-test2-cluster"
listener_protocol="HTTP"
task_cpu=1024
task_memory=2048
/* service_volumes=[
    {
      name = "data"
    }
  ] */

deployment_identifier="dev"
container_port="3999"

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

tags = {
    mdo-application-name = "MYP2"
    mdo-environment = "DEV"
    mdo-creator = "Prashan"
  }
