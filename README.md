[![License](https://img.shields.io/badge/License-Apache-blue.svg)](https://github.com/boldlink/terraform-aws-efs/blob/main/LICENSE)
[![Latest Release](https://img.shields.io/github/release/boldlink/terraform-aws-efs.svg)](https://github.com/boldlink/terraform-aws-efs/releases/latest)
[![Build Status](https://github.com/boldlink/terraform-aws-efs/actions/workflows/update.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-efs/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-efs/actions/workflows/release.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-efs/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-efs/actions/workflows/pre-commit.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-efs/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-efs/actions/workflows/pr-labeler.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-efs/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-efs/actions/workflows/module-examples-tests.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-efs/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-efs/actions/workflows/checkov.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-efs/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-efs/actions/workflows/auto-badge.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-efs/actions)

[<img src="https://avatars.githubusercontent.com/u/25388280?s=200&v=4" width="96"/>](https://boldlink.io)

# AWS Elastic File System Terraform module

## Description

This Terraform module facilitates the creation of an AWS Elastic File System, complete with the capability to incorporate additional configurations.

## Why choose this module
- Ensures adherence to AWS security standards through the integration of checkov for code compliance scanning.
- The following features are included in the module:
  - Module based security group with dynamic rule configuration capabilities
  - EFS file system policy feature which can be customized further depending on the required permissions
  - EFS backup policy
  - Encryption
- Provides ease of setup and utilization through clear instructions and examples.

Examples available [`here`](./examples)

**Note on Seurity Group Usage**
- To create a security group for efs using this module set the `create_security_group` argument to `true`
- To provide custom security group rules for the security group created by the module use the `security_group_ingress` block (see complete example).
- To provide external security group that is already configured for efs use the `external_security_groups` block and provide the security group IDs.
- This allows you to use one or more security groups

## Usage
**NOTE**: These examples use the latest version of this module

```hcl
module "complete_efs" {
  source         = "boldlink/efs/aws"
  creation_token = "minimum-efs-example"
  tags = {
    Environment        = "examples"
    "user::CostCenter" = "terraform-registry"
  }
}
```
## Documentation

[AWS Documentation](https://docs.aws.amazon.com/efs/latest/ug/whatisefs.html)

[Terraform module documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/efs_file_system)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.11 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.45.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.63.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_efs_backup_policy.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/efs_backup_policy) | resource |
| [aws_efs_file_system.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/efs_file_system) | resource |
| [aws_efs_file_system_policy.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/efs_file_system_policy) | resource |
| [aws_efs_mount_target.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/efs_mount_target) | resource |
| [aws_security_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_zone_name"></a> [availability\_zone\_name](#input\_availability\_zone\_name) | (Optional) the AWS Availability Zone in which to create the file system. Used to create a file system that uses One Zone storage classes. See user guide for more information. | `string` | `null` | no |
| <a name="input_bypass_policy_lockout_safety_check"></a> [bypass\_policy\_lockout\_safety\_check](#input\_bypass\_policy\_lockout\_safety\_check) | (Optional) A flag to indicate whether to bypass the `aws_efs_file_system_policy` lockout safety check. The policy lockout safety check determines whether the policy in the request will prevent the principal making the request will be locked out from making future `PutFileSystemPolicy` requests on the file system. Set `bypass_policy_lockout_safety_check` to `true` only when you intend to prevent the principal that is making the request from making a subsequent `PutFileSystemPolicy` request on the file system. The default value is `false` | `string` | `false` | no |
| <a name="input_create_security_group"></a> [create\_security\_group](#input\_create\_security\_group) | whether to create security group using module | `bool` | `true` | no |
| <a name="input_creation_token"></a> [creation\_token](#input\_creation\_token) | (Optional) A unique name (a maximum of 64 characters are allowed) used as reference when creating the Elastic File System to ensure idempotent file system creation. By default generated by Terraform. See Elastic File System user guide for more information. | `string` | `null` | no |
| <a name="input_efs_backup_policy_status"></a> [efs\_backup\_policy\_status](#input\_efs\_backup\_policy\_status) | (Required) A status of the backup policy. Valid values: `ENABLED`, `DISABLED`. | `string` | `"ENABLED"` | no |
| <a name="input_efs_file_system_policy"></a> [efs\_file\_system\_policy](#input\_efs\_file\_system\_policy) | (Required) The JSON formatted file system policy for the EFS file system. | `string` | `""` | no |
| <a name="input_efs_mount_target_ip_address"></a> [efs\_mount\_target\_ip\_address](#input\_efs\_mount\_target\_ip\_address) | (Optional) The address (within the address range of the specified subnet) at which the file system may be mounted via the mount target. | `string` | `null` | no |
| <a name="input_efs_mount_target_subnet_ids"></a> [efs\_mount\_target\_subnet\_ids](#input\_efs\_mount\_target\_subnet\_ids) | (Required) The IDs of subnets to add the mount target in. | `list(string)` | `[]` | no |
| <a name="input_egress_rules"></a> [egress\_rules](#input\_egress\_rules) | (Optional) egress rules to add to the security group | <pre>map(object({<br>    description = string<br>    from_port   = number<br>    to_port     = number<br>    protocol    = string<br>    cidr_blocks = list(string)<br>  }))</pre> | `{}` | no |
| <a name="input_encrypted"></a> [encrypted](#input\_encrypted) | (Optional) If true, the disk will be encrypted. | `bool` | `true` | no |
| <a name="input_external_security_groups"></a> [external\_security\_groups](#input\_external\_security\_groups) | IDs of other security groups. NOTE: All these security groups must be in the same vpc as the subnets where the efs is mounted. A maximum of 5 Security Group IDs is allowed. | `list(string)` | `[]` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | (Optional) The ARN for the KMS encryption key. When specifying kms\_key\_id, encrypted needs to be set to `true`. | `string` | `null` | no |
| <a name="input_performance_mode"></a> [performance\_mode](#input\_performance\_mode) | (Optional) The file system performance mode. Can be either `generalPurpose` or `maxIO` (Default: `generalPurpose`) | `string` | `"generalPurpose"` | no |
| <a name="input_provisioned_throughput_in_mibps"></a> [provisioned\_throughput\_in\_mibps](#input\_provisioned\_throughput\_in\_mibps) | (Optional) The throughput, measured in MiB/s, that you want to provision for the file system. Only applicable with throughput\_mode set to `provisioned`. | `string` | `null` | no |
| <a name="input_security_group_ingress"></a> [security\_group\_ingress](#input\_security\_group\_ingress) | Specify the ingress rule for the security group | `any` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A map of tags to assign to the file system. If configured with a provider default\_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level. | `map(string)` | `{}` | no |
| <a name="input_throughput_mode"></a> [throughput\_mode](#input\_throughput\_mode) | (Optional) Throughput mode for the file system. Defaults to `bursting`. Valid values: `bursting`, `provisioned`. When using `provisioned`, also set `provisioned_throughput_in_mibps`. | `string` | `"bursting"` | no |
| <a name="input_transition_to_ia"></a> [transition\_to\_ia](#input\_transition\_to\_ia) | (Optional) Indicates how long it takes to transition files to the IA storage class. Valid values: `AFTER_7_DAYS`, `AFTER_14_DAYS`, `AFTER_30_DAYS`, `AFTER_60_DAYS`, or `AFTER_90_DAYS`. | `list(string)` | `[]` | no |
| <a name="input_transition_to_primary_storage_class"></a> [transition\_to\_primary\_storage\_class](#input\_transition\_to\_primary\_storage\_class) | (Optional) Describes the policy used to transition a file from infequent access storage to primary storage. Valid values: `AFTER_1_ACCESS`. | `list(string)` | `[]` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | (Optional, Forces new resource) VPC ID. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_efs_file_system_arn"></a> [efs\_file\_system\_arn](#output\_efs\_file\_system\_arn) | Amazon Resource Name of the file system. |
| <a name="output_file_system_availability_zone_id"></a> [file\_system\_availability\_zone\_id](#output\_file\_system\_availability\_zone\_id) | The identifier of the Availability Zone in which the file system's One Zone storage classes exist. |
| <a name="output_file_system_dns_name"></a> [file\_system\_dns\_name](#output\_file\_system\_dns\_name) | The DNS name for the filesystem |
| <a name="output_file_system_id"></a> [file\_system\_id](#output\_file\_system\_id) | The ID that identifies the file system `(e.g., fs-ccfc0d65)`. |
| <a name="output_file_system_owner_id"></a> [file\_system\_owner\_id](#output\_file\_system\_owner\_id) | The AWS account that created the file system. If the file system was createdby an IAM user, the parent account to which the user belongs is the owner. |
| <a name="output_file_system_size_in_bytes"></a> [file\_system\_size\_in\_bytes](#output\_file\_system\_size\_in\_bytes) | The latest known metered size (in bytes) of data stored in the file system, the value is not the exact size that the file system was at any point in time. |
| <a name="output_mount_target_availability_zone_id"></a> [mount\_target\_availability\_zone\_id](#output\_mount\_target\_availability\_zone\_id) | The unique and consistent identifier of the Availability Zone (AZ) that the mount target resides in. |
| <a name="output_mount_target_availability_zone_name"></a> [mount\_target\_availability\_zone\_name](#output\_mount\_target\_availability\_zone\_name) | The name of the Availability Zone (AZ) that the mount target resides in. |
| <a name="output_mount_target_dns_name"></a> [mount\_target\_dns\_name](#output\_mount\_target\_dns\_name) | The DNS name for the given subnet/AZ |
| <a name="output_mount_target_id"></a> [mount\_target\_id](#output\_mount\_target\_id) | The ID of the mount target. |
| <a name="output_mount_target_network_interface_id"></a> [mount\_target\_network\_interface\_id](#output\_mount\_target\_network\_interface\_id) | The ID of the network interface that Amazon EFS created when it created the mount target. |
| <a name="output_security_group_arn"></a> [security\_group\_arn](#output\_security\_group\_arn) | ARN of the security group. |
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | ID of the security group. |
| <a name="output_security_group_owner_id"></a> [security\_group\_owner\_id](#output\_security\_group\_owner\_id) | Owner ID. of the security group. |
| <a name="output_tags_all"></a> [tags\_all](#output\_tags\_all) | A map of tags assigned to the resource, including those inherited from the provider default\_tags configuration block. |
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

### Supporting resources:

The example stacks are used by BOLDLink developers to validate the modules by building an actual stack on AWS.

Some of the modules have dependencies on other modules (ex. Ec2 instance depends on the VPC module) so we create them
first and use data sources on the examples to use the stacks.

Any supporting resources will be available on the `tests/supportingResources` and the lifecycle is managed by the `Makefile` targets.

Resources on the `tests/supportingResources` folder are not intended for demo or actual implementation purposes, and can be used for reference.

### Makefile
The makefile contained in this repo is optimized for linux paths and the main purpose is to execute testing for now.
* Create all tests stacks including any supporting resources:
```console
make tests
```
* Clean all tests *except* existing supporting resources:
```console
make clean
```
* Clean supporting resources - this is done separately so you can test your module build/modify/destroy independently.
```console
make cleansupporting
```
* !!!DANGER!!! Clean the state files from examples and test/supportingResources - use with CAUTION!!!
```console
make cleanstatefiles
```

#### BOLDLink-SIG 2023
