locals {
  name        = "example-complete-efs"
  cidr_block  = "192.168.0.0/16"
  tag_env     = "dev"
  efs_subnet1 = cidrsubnet(local.cidr_block, 7, 50)
  efs_subnet2 = cidrsubnet(local.cidr_block, 7, 60)
  efs_subnet3 = cidrsubnet(local.cidr_block, 7, 70)
  efs_subnets = [local.efs_subnet1, local.efs_subnet2, local.efs_subnet3]

  az1 = data.aws_availability_zones.available.names[0]
  az2 = data.aws_availability_zones.available.names[1]
  az3 = data.aws_availability_zones.available.names[2]
  azs = [local.az1, local.az2, local.az3]
  efs_file_system_policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Id" : "ExamplePolicy01",
      "Statement" : [
        {
          "Sid" : "ExampleStatement01",
          "Effect" : "Allow",
          "Principal" : {
            "AWS" : "*"
          },
          "Resource" : "*",
          "Action" : [
            "elasticfilesystem:ClientMount",
            "elasticfilesystem:ClientWrite"
          ],
          "Condition" : {
            "Bool" : {
              "aws:SecureTransport" : "true"
            }
          }
        }
      ]
  })
}
