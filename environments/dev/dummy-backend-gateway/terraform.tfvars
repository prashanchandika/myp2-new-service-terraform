region="us-east-2"

deployment_identifier="dev"

service_name="dummy-backend-gateway"
service_image_repo="936341724687.dkr.ecr.us-east-2.amazonaws.com/myp2-backend-gateway-dev"
service_image_tag="v46"

tg_port="80" # Target group port
service_port="3999" # Container Port
listener_port="4999"
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
          "name": "EMAIL_HOST",
          "value": "internal-myp2-test-internal-alb-29066603.us-east-2.elb.amazonaws.com"
        },
        {
          "name": "EMAIL_PORT",
          "value": "5003"
        },
        {
          "name": "FOUNDATION_HOST",
          "value": "internal-myp2-test-internal-alb-29066603.us-east-2.elb.amazonaws.com"
        },
        {
          "name": "FOUNDATION_PORT",
          "value": "5002"
        },
        {
          "name": "REPORTS_HOST",
          "value": "internal-myp2-dev-internal-alb-1455031051.us-east-2.elb.amazonaws.com"
        },
        {
          "name": "REPORTS_PORT",
          "value": "4000"
        },
        {
          "name": "TOKEN_SECRET",
          "value": "dsfjjrfioerfenrferfe9ur3409rum438r34g7rcmg47r64ghr895th54th5mtyy5p60y6my89ch4hreure"
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
