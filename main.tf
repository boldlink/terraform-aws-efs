resource "aws_efs_file_system" "main" {
  creation_token         = var.creation_token
  availability_zone_name = var.availability_zone_name
  encrypted              = var.encrypted
  kms_key_id             = var.kms_key_id
  lifecycle_policy {
    transition_to_ia                    = var.transition_to_ia
    transition_to_primary_storage_class = var.transition_to_primary_storage_class
  }

  performance_mode                = var.performance_mode
  provisioned_throughput_in_mibps = var.provisioned_throughput_in_mibps
  throughput_mode                 = var.throughput_mode

  tags = {
    Name = var.name
  }
}

resource "aws_efs_mount_target" "main" {
  file_system_id  = aws_efs_file_system.main.id
  subnet_id       = var.efs_mount_target_subnet_id
  ip_address      = var.efs_mount_target_ip_address
  security_groups = var.security_groups
}

resource "aws_efs_file_system_policy" "main" {
  file_system_id                     = aws_efs_file_system.main.id
  bypass_policy_lockout_safety_check = var.bypass_policy_lockout_safety_check
  policy                             = var.efs_file_system_policy
}

resource "aws_efs_backup_policy" "main" {
  file_system_id = aws_efs_file_system.main.id

  backup_policy {
    status = var.efs_backup_policy_status
  }
}
