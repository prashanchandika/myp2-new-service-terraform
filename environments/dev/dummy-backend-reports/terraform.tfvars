region="us-east-2"

service_name="dummy-backend-reports"
service_image_repo="936341724687.dkr.ecr.us-east-2.amazonaws.com/myp2-backend-reports-dev"
service_image_tag="v1565"

tg_port="80" # Target group port
service_port="3000" # Container Port
listener_port="4000"
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
          "name": "API_CURRENCY_EXCHANGE_KEY",
          "value": "d24f7b3cbefecf7d398f"
        },
        {
          "name": "API_CURRENCY_EXCHANGE_URL",
          "value": "http://free.currencyconverterapi.com/api/v6/convert"
        },
        {
          "name": "CACHE_TTS",
          "value": "180"
        },
        {
          "name": "DB_DEBUG",
          "value": "TRUE"
        },
        {
          "name": "DB_HOST",
          "value": "myp2-dev-reports.cspsockiiy7v.us-east-2.rds.amazonaws.com"
        },
        {
          "name": "DB_NAME",
          "value": "dev_myp2_reports"
        },
        {
          "name": "DB_PASSWORD",
          "value": "CGB4sbN8Hk6Z"
        },
        {
          "name": "DB_PORT",
          "value": "5432"
        },
        {
          "name": "DB_USER",
          "value": "mydigitaloffice"
        },
        {
          "name": "GATEWAY_GRAPHQL",
          "value": "https://myp2_test.mydigitaloffice.com/graphql"
        },
        {
          "name": "MAX_REQ_BODY_SIZE",
          "value": "50mb"
        },
        {
          "name": "MAX_REQ_BODY_SIZE",
          "value": "50mb"
        },
        {
          "name": "PORT",
          "value": "4001"
        },
        {
          "name": "REDIS_HOST",
          "value": ""
        },
        {
          "name": "REDIS_PASSWORD",
          "value": ""
        },
        {
          "name": "REDIS_PORT",
          "value": ""
        },
        {
          "name": "REDIS_SSL",
          "value": "false"
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
