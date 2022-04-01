service_name="dummy-full-service"
service_image_tag="v1"

service_port="8003" # Container Port
listener_port="8003"
external_service=false

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





#RDS ################
rds_name="dummyfullservicerds"
allocated_storage=10
engine="postgres"
engine_version="12.7"
instance_class="db.t3.micro"
username="root"
password="Mydo1234"
parameter_group_name="default.postgres12"
db_port="5432"
#################
