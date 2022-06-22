# efs file system
variable "availability_zone_name" {
  type        = string
  description = "(Optional) the AWS Availability Zone in which to create the file system. Used to create a file system that uses One Zone storage classes. See user guide for more information."
  default     = null
}

variable "creation_token" {
  type        = string
  description = "(Optional) A unique name (a maximum of 64 characters are allowed) used as reference when creating the Elastic File System to ensure idempotent file system creation. By default generated by Terraform. See Elastic File System user guide for more information."
  default     = null
}

variable "encrypted" {
  type        = bool
  description = "(Optional) If true, the disk will be encrypted."
  default     = true
}

variable "kms_key_id" {
  type        = string
  description = "(Optional) The ARN for the KMS encryption key. When specifying kms_key_id, encrypted needs to be set to `true`."
  default     = null
}

variable "transition_to_ia" {
  type        = string
  description = "(Optional) Indicates how long it takes to transition files to the IA storage class. Valid values: `AFTER_7_DAYS`, `AFTER_14_DAYS`, `AFTER_30_DAYS`, `AFTER_60_DAYS`, or `AFTER_90_DAYS`."
  default     = null
}

variable "transition_to_primary_storage_class" {
  type        = string
  description = "(Optional) Describes the policy used to transition a file from infequent access storage to primary storage. Valid values: `AFTER_1_ACCESS`."
  default     = "AFTER_1_ACCESS"
}

variable "performance_mode" {
  type        = string
  description = "(Optional) The file system performance mode. Can be either `generalPurpose` or `maxIO` (Default: `generalPurpose`)"
  default     = "generalPurpose"
}

variable "provisioned_throughput_in_mibps" {
  type        = string
  description = "(Optional) The throughput, measured in MiB/s, that you want to provision for the file system. Only applicable with throughput_mode set to `provisioned`."
  default     = null
}

variable "throughput_mode" {
  type        = string
  description = "(Optional) Throughput mode for the file system. Defaults to `bursting`. Valid values: `bursting`, `provisioned`. When using `provisioned`, also set `provisioned_throughput_in_mibps`."
  default     = "bursting"
}

variable "efs_mount_target_subnet_ids" {
  type        = list(string)
  description = "(Required) The IDs of subnets to add the mount target in."
  default     = []
}

variable "efs_mount_target_ip_address" {
  type        = string
  description = "(Optional) The address (within the address range of the specified subnet) at which the file system may be mounted via the mount target."
  default     = null
}

variable "bypass_policy_lockout_safety_check" {
  type        = string
  description = "(Optional) A flag to indicate whether to bypass the `aws_efs_file_system_policy` lockout safety check. The policy lockout safety check determines whether the policy in the request will prevent the principal making the request will be locked out from making future `PutFileSystemPolicy` requests on the file system. Set `bypass_policy_lockout_safety_check` to `true` only when you intend to prevent the principal that is making the request from making a subsequent `PutFileSystemPolicy` request on the file system. The default value is `false`"
  default     = false
}

variable "efs_file_system_policy" {
  type        = string
  description = "(Required) The JSON formatted file system policy for the EFS file system."
  default     = ""
}

variable "efs_backup_policy_status" {
  type        = string
  description = "(Required) A status of the backup policy. Valid values: `ENABLED`, `DISABLED`."
  default     = "ENABLED"
}

variable "tags" {
  type        = map(string)
  description = " (Optional) A map of tags to assign to the file system. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  default     = {}
}

# Security Group
variable "vpc_id" {
  description = "(Optional, Forces new resource) VPC ID."
  type        = string
  default     = null
}

variable "ingress_rules" {
  description = "(Optional) Ingress rules to add to the security group"
  type = map(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = {}
}

variable "egress_rules" {
  description = "(Optional) egress rules to add to the security group"
  type = map(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = {}
}
