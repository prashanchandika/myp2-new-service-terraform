provider "aws" {
region="${var.region}"
}
terraform {
  backend "s3" {
    bucket = "myp2-tf-states"
    key    = "tfdev/test-rds.tfstate"
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

module "rds"{
    source              =   "../../../modules/rds"
    allocated_storage   = var.allocated_storage
    engine              = var.engine
    engine_version      = var.engine_version
    instance_class      = var.instance_class
    rds_name            = "${var.rds_name}"
    identifier          = "${var.rds_name}-${var.deployment_identifier}"
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