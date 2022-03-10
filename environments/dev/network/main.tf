terraform {
  backend "s3" {
    bucket = "myp2-tf-states"
    key    = "tfdev/network.tfstate"
    region = "us-east-2"
#    dynamodb_table = "myp2-tf-lock"
  }
  required_version = "= 1.1.7"

  required_providers {
    aws = "= 4.2.0"
  }
}

provider "aws" {
  region = var.region
}

/* module "network" {
    source = "../../../modules/network/"
} */