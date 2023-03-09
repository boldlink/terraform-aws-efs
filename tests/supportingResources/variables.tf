variable "tags" {
  type        = map(string)
  description = "The resource tags to be applied"
  default = {
    Environment        = "example"
    "user::CostCenter" = "terraform-registry"
    Department         = "DevOps"
    Project            = "Examples"
    Owner              = "Boldlink"
    LayerName          = "Example"
    LayerId            = "Example"
  }
}

variable "name" {
  type        = string
  description = "Name of the stack"
  default     = "terraform-aws-efs"
}

variable "cidr_block" {
  type        = string
  description = "CIDR block of the VPC"
  default     = "10.1.0.0/16"
}
