locals {
  public_subnets = [cidrsubnet(local.cidr_block, 8, 1), cidrsubnet(local.cidr_block, 8, 2), cidrsubnet(local.cidr_block, 8, 3)]
  region         = data.aws_region.current.id
  account_id     = data.aws_caller_identity.current.id
  azs            = flatten(data.aws_availability_zones.available.names)
  cidr_block     = "10.1.0.0/16"
  name           = "terraform-aws-secretsmanager"

  tags = {
    Environment        = "examples"
    Name               = local.name
    "user::CostCenter" = "terraform-registry"
    department         = "operations"
    Project            = "Examples"
    Owner              = "Boldlink"
    LayerName          = "cExamples"
    LayerId            = "cExamples"
  }
}
