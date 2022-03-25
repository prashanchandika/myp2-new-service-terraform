remote_state {
  backend = "s3"

  config = {
    encrypt        = true
    region         = "us-east-2"
    bucket         = "myp2-tf-states"
    key            = "myp2-${get_aws_account_id()}/${path_relative_to_include()}/terraform.tfstate"
    dynamodb_table = "terraform-locks"
  }
}