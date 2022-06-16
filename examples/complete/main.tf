module "complete_efs" {
  source                      = "./../../"
  creation_token              = local.name
  efs_mount_target_subnet_ids = data.aws_subnets.default.ids
  efs_file_system_policy      = local.efs_file_system_policy
  tags = {
    environment        = "examples"
    "user::CostCenter" = "terraform-registry"
  }
}
