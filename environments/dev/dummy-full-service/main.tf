provider "aws" {
region="${var.region}"
access_key = ""
secret_key = ""
}

terraform {
  backend "s3" {
    bucket = "myp2-tf-states"
    key    = "tfdev/dummy-full-service.tfstate"
    region = "us-east-2"
#    dynamodb_table = "myp2-tf-lock"
  }
  required_version = "= 1.1.7"

  required_providers {
    aws = "= 4.2.0"
  }
}

data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "myp2-tf-states"
    key    = "tfdev/network.tfstate"
    region = "us-east-2"
  }
}

data "aws_caller_identity" "current" {}

locals {
  acc_id = "${data.aws_caller_identity.current.account_id}"
}

module "ecs_service" {
  source = "../../../modules/ecs-service"

#  depends_on = [ module.ecr_repo ]

  region = var.region
  deployment_identifier = "dev"
  alb_arn = "${var.alb_arn}"
  tg_name = "${var.service_name}-tftg"
  tg_port = "${var.tg_port}"
  service_port = "${var.service_port}"
  listener_port = "${var.listener_port}"
  listener_protocol = "${var.listener_protocol}"
  vpc_id = data.terraform_remote_state.network.outputs.vpc["vpc_id"]
  vpc_private_subnet_ids = data.terraform_remote_state.network.outputs.vpc["private_subnet_ids"]

# Service and Task related inputs ##############################
  service_name = "${var.service_name}"
#  service_image = "${var.service_image_repo}:${var.service_image_tag}"
  service_image = "${module.ecr_repo.ecr_url}:${var.service_image_tag}"
  service_command = "${var.service_command}"
  service_desired_count = "${var.service_desired_count}"
  service_deployment_maximum_percent = "${var.service_deployment_maximum_percent}"
  service_deployment_minimum_healthy_percent = "${var.service_deployment_minimum_healthy_percent}"
  service_role = "${var.service_role}"
  service_volumes = var.service_volumes
  task_cpu = var.task_cpu
  task_memory = var.task_memory
  ecs_cluster_id = "${var.ecs_cluster_id}"
  env_variables = "${var.env_variables}"

#  Autoscalling related inputs
  scale_target_max_capacity = "${var.scale_target_max_capacity}"
  scale_target_min_capacity = "${var.scale_target_min_capacity}"
  min_cpu_threshold         = "${var.min_cpu_threshold}"
  max_cpu_threshold         = "${var.max_cpu_threshold}"
  memory_scale_target_value = "${var.memory_scale_target_value}"

# Just TAGS
  tags = "${var.tags}"
}


module "rds"{
    source              =   "../../../modules/rds"
    allocated_storage   = var.allocated_storage
    engine              = var.engine
    engine_version      = var.engine_version
    instance_class      = var.instance_class
    rds_name            = "${var.rds_name}"
    identifier          = "${var.service_name}-${var.deployment_identifier}"
    username            = var.username
    password            = var.password
    parameter_group_name  = var.parameter_group_name
    skip_final_snapshot = var.skip_final_snapshot

    publicly_accessible = var.publicly_accessible
    deployment_identifier = var.deployment_identifier
    db_subnet_ids       = data.terraform_remote_state.network.outputs.vpc["public_subnet_ids"]
    vpc_id              = data.terraform_remote_state.network.outputs.vpc["vpc_id"]
    db_port             = var.db_port
    tags                = var.tags
}


module "ecr_repo" {
  source        = "../../../modules/ecr"
  ecr_name      = "${var.service_name}-${var.deployment_identifier}"
  scan_on_push  = "${var.scan_on_push}"
  tags          = "${var.tags}"

}