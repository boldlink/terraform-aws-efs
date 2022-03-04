data "aws_vpc" "default" {
  default = true
}

data "aws_subnet" "default" {
  vpc_id            = data.aws_vpc.default.id
  availability_zone = data.aws_availability_zones.available.names[0]
  default_for_az    = true
}

data "aws_security_group" "default" {
  vpc_id = data.aws_vpc.default.id

  filter {
    name   = "group-name"
    values = ["default"]
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  name = "boldlink-test-efs-${uuid()}"
}

module "boldlink_test_efs" {
  source                     = "./.."
  creation_token             = local.name
  availability_zone_name     = data.aws_availability_zones.available.names[0]
  performance_mode           = "generalPurpose"
  throughput_mode            = "bursting"
  name                       = local.name
  efs_mount_target_subnet_id = data.aws_subnet.default.id
  security_groups            = [data.aws_security_group.default.id]
  efs_backup_policy_status   = "DISABLED"
  efs_file_system_policy     = <<POLICY
{
    "Version": "2012-10-17",
    "Id": "ExamplePolicy01",
    "Statement": [
        {
            "Sid": "ExampleStatement01",
            "Effect": "Allow",
            "Principal": {
                "AWS": "*"
            },
            "Resource": "*",
            "Action": [
                "elasticfilesystem:ClientMount",
                "elasticfilesystem:ClientWrite"
            ],
            "Condition": {
                "Bool": {
                    "aws:SecureTransport": "true"
                }
            }
        }
    ]
}
POLICY
}

output "outputs" {
  value = [
    module.boldlink_test_efs,
  ]
}
