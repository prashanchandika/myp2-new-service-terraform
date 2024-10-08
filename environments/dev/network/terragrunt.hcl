terraform {
  source = "../../../modules/network/"
  extra_arguments "common_vars" {
    commands = get_terraform_commands_that_need_vars()

    required_var_files = [
      "${get_terragrunt_dir()}/terraform.tfvars"
    ]
  }
}

include {
  path = find_in_parent_folders()
}

/* dependencies {
  paths = ["../ecs", "../iam", "../phpfpm", "../elasticsearch", "../rabbitmq", "../redis"]
} */

inputs = merge(
  jsondecode(
    file("${find_in_parent_folders("general.tfvars")}")
  )
)