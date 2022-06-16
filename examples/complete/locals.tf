locals {
  name = "example-complete-efs"
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
