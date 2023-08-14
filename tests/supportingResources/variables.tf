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

variable "enable_dns_hostnames" {
  type        = bool
  description = "Whether to enable dns hostnames"
  default     = true
}

variable "enable_dns_support" {
  type        = bool
  description = "Whether to enable dns support for the vpc"
  default     = true
}

variable "enable_public_subnets" {
  type        = bool
  description = "Whether to enable public subnets"
  default     = true
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "Whether assign public IPs by default to instances launched on subnet"
  default     = true
}

variable "nat" {
  type        = string
  description = "Choose `single` or `multi` for NATs"
  default     = "single"
}
