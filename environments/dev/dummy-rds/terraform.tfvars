region="us-east-2"
allocated_storage=10
engine="postgres"
engine_version="12.7"
instance_class="db.t3.micro"
rds_name="dummyrdstf"
deployment_identifier="dev"
username="root"
password="Mydo1234"
parameter_group_name="default.postgres12"
skip_final_snapshot=true
db_port="5432"
tags = {
    mdo-application-name = "MYP2"
    mdo-environment = "DEV"
    mdo-creator = "Prashan"
  }