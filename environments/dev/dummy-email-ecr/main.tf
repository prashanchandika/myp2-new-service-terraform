provider "aws" {
region="${var.region}"
access_key = ""
secret_key = ""
}
terraform {
  backend "s3" {
    bucket = "myp2-tf-states"
    key    = "tfdev/test-ecr.tfstate"
    region = "us-east-2"
#    dynamodb_table = "myp2-tf-lock"
  }
  required_version = "= 1.1.7"

  required_providers {
    aws = "= 4.2.0"
  }
}

module "ecs_service" {
  source        = "../../../modules/ecr"
  ecr_name      = "${var.ecr_name}"
  scan_on_push  = "${var.scan_on_push}"
  tags          = "${var.tags}"

}