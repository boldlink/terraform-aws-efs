module "minimum_efs" {
  source         = "./../../"
  creation_token = "example-minimum-efs"
  tags = {
    environment        = "examples"
    "user::CostCenter" = "terraform-registry"
  }
}
