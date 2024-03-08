[![License](https://img.shields.io/badge/License-Apache-blue.svg)](https://github.com/boldlink/terraform-aws-efs/blob/main/LICENSE)
[![Latest Release](https://img.shields.io/github/release/boldlink/terraform-aws-efs.svg)](https://github.com/boldlink/terraform-aws-efs/releases/latest)
[![Build Status](https://github.com/boldlink/terraform-aws-efs/actions/workflows/update.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-efs/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-efs/actions/workflows/release.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-efs/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-efs/actions/workflows/pre-commit.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-efs/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-efs/actions/workflows/pr-labeler.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-efs/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-efs/actions/workflows/module-examples-tests.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-efs/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-efs/actions/workflows/checkov.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-efs/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-efs/actions/workflows/auto-merge.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-efs/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-efs/actions/workflows/auto-badge.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-efs/actions)

[<img src="https://avatars.githubusercontent.com/u/25388280?s=200&v=4" width="96"/>](https://boldlink.io)

# Terraform module example of minimum configuration


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.11 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.45.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_minimum_efs"></a> [minimum\_efs](#module\_minimum\_efs) | ../.. | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | The stack name | `string` | `"minimum-efs-example"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | The resource tags to be applied | `map(string)` | <pre>{<br>  "Department": "DevOps",<br>  "Environment": "example",<br>  "InstanceScheduler": true,<br>  "LayerId": "Example",<br>  "LayerName": "Example",<br>  "Owner": "Boldlink",<br>  "Project": "Examples",<br>  "user::CostCenter": "terraform-registry"<br>}</pre> | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Third party software
This repository uses third party software:
* [pre-commit](https://pre-commit.com/) - Used to help ensure code and documentation consistency
  * Install with `brew install pre-commit`
  * Manually use with `pre-commit run`
* [terraform 0.14.11](https://releases.hashicorp.com/terraform/0.14.11/) For backwards compatibility we are using version 0.14.11 for testing making this the min version tested and without issues with terraform-docs.
* [terraform-docs](https://github.com/segmentio/terraform-docs) - Used to generate the [Inputs](#Inputs) and [Outputs](#Outputs) sections
  * Install with `brew install terraform-docs`
  * Manually use via pre-commit
* [tflint](https://github.com/terraform-linters/tflint) - Used to lint the Terraform code
  * Install with `brew install tflint`
  * Manually use via pre-commit

#### BOLDLink-SIG 2024
