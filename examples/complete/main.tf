module "efs_vpc" {
  source               = "git::https://github.com/boldlink/terraform-aws-vpc.git?ref=2.0.3"
  name                 = "${local.name}-vpc"
  account              = data.aws_caller_identity.current.account_id
  region               = data.aws_region.current.name
  tag_env              = local.tag_env
  cidr_block           = local.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  private_subnets      = local.efs_subnets
  availability_zones   = local.azs
}


module "complete_efs" {
  source                      = "./../../"
  creation_token              = local.name
  efs_mount_target_subnet_ids = flatten(module.efs_vpc.private_subnet_id)
  efs_file_system_policy      = local.efs_file_system_policy
  vpc_id                      = module.efs_vpc.id
  ingress_rules = {
    efs_ingress = {
      cidr_blocks = [local.cidr_block]
      description = "efs ingress rule "
      from_port   = 2049
      to_port     = 2049
      protocol    = "tcp"
    }
  }
  egress_rules = {
    efs_egress = {
      cidr_blocks = [local.cidr_block]
      description = "Allow egress traffic"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
    }
  }
  tags = {
    environment        = "examples"
    "user::CostCenter" = "terraform-registry"
  }
}
