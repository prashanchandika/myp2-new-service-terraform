region="us-east-2"
service_name="dummy-service-tftest"
#service_image="936341724687.dkr.ecr.us-east-2.amazonaws.com/myp2-backend-gateway-dev:v37"
service_image_repo="936341724687.dkr.ecr.us-east-2.amazonaws.com/dummyrepotf"
service_image_tag="v1"
service_port="3000"
service_command=[]
service_desired_count="1"
service_deployment_maximum_percent="50"
service_deployment_minimum_healthy_percent="200"
alb_arn="arn:aws:elasticloadbalancing:us-east-2:936341724687:loadbalancer/app/myp2-test-internal-alb/7a51f868ec11e1f6"
#tg_name=""
vpc_id="vpc-0c2daed33f5159b69"
ecs_cluster_id="myp2-test2-cluster"
listener_protocol="HTTP"
tg_port="80"
/* service_volumes=[
    {
      name = "data"
    }
  ] */
#ecs_cluster_id="arn:aws:ecs:eu-west-2:151388205202:cluster/web-app"
#ecs_cluster_service_role_arn="arn:aws:iam::151388205202:role/cluster-service-role-web-app"
deployment_identifier="dev"
container_port="3999"
vpc_private_subnet_ids=[
    "subnet-0b62dbde68802b7d7",
    "subnet-0635c9f2ac07fd652",
    "subnet-01871adbd2bfd7fb7",
]

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


tags = {
    mdo-application-name = "MYP2"
    mdo-environment = "DEV"
    mdo-creator = "Prashan"
  }
