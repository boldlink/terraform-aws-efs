module "minimum_efs" {
  source         = "../.."
  creation_token = var.name
  tags           = var.tags
}
