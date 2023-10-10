locals {
  subnet_id = [
    for i in data.aws_subnet.public : i.id
  ]

  subnet_cidr = [for s in data.aws_subnet.public : s.cidr_block]

  public_subnets = local.subnet_id
  vpc_id         = data.aws_vpc.supporting.id
  vpc_cidr       = data.aws_vpc.supporting.cidr_block

  ip_addresses = [for cidr in local.subnet_cidr : cidrhost(cidr, 5)]

  file_system_policy = jsonencode(
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
