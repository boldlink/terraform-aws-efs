output "efs_file_system_arn" {
  value       = aws_efs_file_system.main.arn
  description = "Amazon Resource Name of the file system."
}

output "file_system_availability_zone_id" {
  value       = aws_efs_file_system.main.availability_zone_id
  description = "The identifier of the Availability Zone in which the file system's One Zone storage classes exist."
}

output "file_system_id" {
  value       = aws_efs_file_system.main.id
  description = "The ID that identifies the file system `(e.g., fs-ccfc0d65)`."
}

output "file_system_dns_name" {
  value       = aws_efs_file_system.main.dns_name
  description = "The DNS name for the filesystem"
}

output "file_system_owner_id" {
  value       = aws_efs_file_system.main.owner_id
  description = "The AWS account that created the file system. If the file system was createdby an IAM user, the parent account to which the user belongs is the owner."
}

output "number_of_mount_targets" {
  value       = aws_efs_file_system.main.number_of_mount_targets
  description = "The current number of mount targets that the file system has."
}

output "file_system_size_in_bytes" {
  value       = aws_efs_file_system.main.size_in_bytes
  description = "The latest known metered size (in bytes) of data stored in the file system, the value is not the exact size that the file system was at any point in time."
}

output "tags_all" {
  value       = aws_efs_file_system.main.tags_all
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}

output "mount_target_dns_name" {
  value       = aws_efs_mount_target.main.*.mount_target_dns_name
  description = "The DNS name for the given subnet/AZ"
}

output "mount_target_id" {
  value       = aws_efs_mount_target.main.*.id
  description = "The ID of the mount target."
}

output "mount_target_network_interface_id" {
  value       = aws_efs_mount_target.main.*.network_interface_id
  description = "The ID of the network interface that Amazon EFS created when it created the mount target."
}

output "mount_target_availability_zone_name" {
  value       = aws_efs_mount_target.main.*.availability_zone_name
  description = "The name of the Availability Zone (AZ) that the mount target resides in."
}

output "mount_target_availability_zone_id" {
  value       = aws_efs_mount_target.main.*.availability_zone_id
  description = "The unique and consistent identifier of the Availability Zone (AZ) that the mount target resides in."
}

output "security_group_arn" {
  description = "ARN of the security group."
  value       = aws_security_group.main.*.arn
}

output "security_group_id" {
  description = "ID of the security group."
  value       = aws_security_group.main.*.id
}

output "security_group_owner_id" {
  description = "Owner ID. of the security group."
  value       = aws_security_group.main.*.owner_id
}
