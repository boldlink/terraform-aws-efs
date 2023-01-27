module "complete_efs_example" {
  source                              = "boldlink/efs/aws"
  creation_token                      = local.name
  efs_mount_target_subnet_ids         = local.public_subnets
  efs_file_system_policy              = local.efs_file_system_policy
  vpc_id                              = local.vpc_id
  transition_to_ia                    = ["AFTER_90_DAYS"]
  transition_to_primary_storage_class = ["AFTER_1_ACCESS"]
  ingress_rules = {
    efs_ingress = {
      cidr_blocks = [local.vpc_cidr]
      description = "efs ingress rule"
      from_port   = 2049
      to_port     = 2049
      protocol    = "tcp"
    }
  }
  egress_rules = {
    efs_egress = {
      cidr_blocks = [local.vpc_cidr]
      description = "Allow egress traffic"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
    }
  }
  tags = local.tags
}
