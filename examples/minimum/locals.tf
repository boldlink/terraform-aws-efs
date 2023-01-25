locals {
  name = "minimum-efs-example"
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
