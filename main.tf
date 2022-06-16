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

  tags = var.tags
}

resource "aws_efs_mount_target" "main" {
  count           = length(var.efs_mount_target_subnet_ids) > 0 ? length(var.efs_mount_target_subnet_ids) : 0
  file_system_id  = aws_efs_file_system.main.id
  subnet_id       = var.efs_mount_target_subnet_ids[count.index]
  ip_address      = var.efs_mount_target_ip_address
  security_groups = [aws_security_group.main.id]
}

resource "aws_efs_file_system_policy" "main" {
  count                              = var.efs_file_system_policy != "" ? 1 : 0
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

# Efs Security Group
resource "aws_security_group" "main" {
  name        = "${var.creation_token}-security-group"
  description = "Efs security Group for ${var.creation_token}"
  vpc_id      = var.vpc_id
  tags        = var.tags
}

resource "aws_security_group_rule" "ingress" {
  for_each          = var.ingress_rules
  security_group_id = aws_security_group.main.id
  type              = "ingress"
  description       = lookup(each.value, "description", null)
  from_port         = lookup(each.value, "from_port", null)
  to_port           = lookup(each.value, "to_port", null)
  protocol          = lookup(each.value, "protocol", null)
  self              = lookup(each.value, "self", null)
  cidr_blocks       = lookup(each.value, "cidr_blocks", [])
}

resource "aws_security_group_rule" "egress" {
  for_each          = var.egress_rules
  security_group_id = aws_security_group.main.id
  type              = "ingress"
  description       = lookup(each.value, "description", null)
  from_port         = lookup(each.value, "from_port", null)
  to_port           = lookup(each.value, "to_port", null)
  protocol          = lookup(each.value, "protocol", null)
  self              = lookup(each.value, "self", null)
  cidr_blocks       = lookup(each.value, "cidr_blocks", [])
}
