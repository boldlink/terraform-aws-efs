module "complete_efs_example" {
  source                              = "../../"
  creation_token                      = var.name
  efs_mount_target_subnet_ids         = local.public_subnets
  efs_file_system_policy              = local.efs_file_system_policy
  vpc_id                              = local.vpc_id
  transition_to_ia                    = ["AFTER_90_DAYS"]
  transition_to_primary_storage_class = ["AFTER_1_ACCESS"]
  tags                                = var.tags
  external_security_groups            = [data.aws_security_group.default.id]
  create_security_group               = true

  security_group_ingress = [
    {
      description = "efs ingress rule for port 2049"
      from_port   = 2049
      to_port     = 2049
      protocol    = "tcp"
      cidr_blocks = [local.vpc_cidr]
    }
  ]
}
