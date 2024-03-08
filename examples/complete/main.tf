module "complete_efs_example" {
  #checkov:skip=CKV2_AWS_5 "Ensure that Security Groups are attached to another resource"
  source                              = "../../"
  creation_token                      = var.name
  mount_target_subnet_ids             = local.public_subnets
  file_system_policy                  = local.file_system_policy
  vpc_id                              = local.vpc_id
  transition_to_ia                    = ["AFTER_90_DAYS"]
  transition_to_primary_storage_class = ["AFTER_1_ACCESS"]
  tags                                = var.tags
  external_security_groups            = [data.aws_security_group.default.id]
  create_security_group               = true
  performance_mode                    = "maxIO"
  throughput_mode                     = "provisioned"
  provisioned_throughput_in_mibps     = 300
  mount_target_ip_addresses           = local.ip_addresses
  backup_policy_status                = "DISABLED"

  security_group_ingress = [
    {
      description = "efs ingress rule for port 2049"
      from_port   = 2049
      to_port     = 2049
      protocol    = "tcp"
      cidr_blocks = [local.vpc_cidr]
    }
  ]

  egress_rules = {
    allow_all-egress = {
      description = "Allow all egress"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
