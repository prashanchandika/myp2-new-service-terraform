region="us-east-2"

service_name="dummy-full-service"
service_image_repo="936341724687.dkr.ecr.us-east-2.amazonaws.com/myp2-backend-emails-dev"
service_image_tag="v27"

deployment_identifier="dev"


tg_port="80" # Target group port
service_port="8003" # Container Port
listener_port="8003"
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

env_variables=[
        {
          "name": "AWS_ACCESS_KEY",
          "value": "AKIA26OWYQ4LWVAG7KOW"
        },
        {
          "name": "AWS_REGION",
          "value": "us-east-2"
        },
        {
          "name": "AWS_SECRET_KEY",
          "value": "he6oO5P/dTsHaTl8ZMcqkaTx6AELP3dlG8JztA8i"
        },
        {
          "name": "MAX_REQ_BODY_SIZE",
          "value": "50mb"
        },
        {
          "name": "PORT",
          "value": "4003"
        },
        {
          "name": "SQS_URL",
          "value": "https://sqs.us-east-2.amazonaws.com/752606545687/mdo-ngeneric-uat-email-service"
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



#RDS ################
rds_name="dummyfullservicerds"
allocated_storage=10
engine="postgres"
engine_version="12.7"
instance_class="db.t3.micro"
username="root"
password="Mydo1234"
parameter_group_name="default.postgres12"
skip_final_snapshot=true
db_port="5432"
#################

# ECR ##############
scan_on_push=false
##########################

# TAGS
tags = {
    mdo-application-name = "MYP2"
    mdo-environment = "DEV"
    mdo-creator = "Prashan"
  }