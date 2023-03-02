module "vpc" {
  source                = "boldlink/vpc/aws"
  version               = "3.0.2"
  name                  = var.name
  cidr_block            = var.cidr_block
  enable_dns_support    = true
  enable_dns_hostnames  = true
  enable_public_subnets = true
  tags                  = var.tags

  public_subnets = {
    public = {
      cidrs                   = local.public_subnets
      map_public_ip_on_launch = true
      nat                     = "single"
    }
  }
}
