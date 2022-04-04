service_name="dummy-full-service"
service_image_tag="v1"

service_port="8003" # Container Port
listener_port="8003"
external_service=false

#RDS ################
rds_name="dummyfullservicerds"
engine="postgres"
/* engine_version="12.7"
instance_class="db.t3.micro"
parameter_group_name="default.postgres12" */
#################
