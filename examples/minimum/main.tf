module "minimum_efs" {
  source         = "boldlink/efs/aws"
  creation_token = local.name
  tags           = local.tags
}
