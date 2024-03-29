resource "aws_efs_file_system" "main" {
  creation_token         = var.creation_token
  availability_zone_name = var.availability_zone_name
  encrypted              = var.encrypted
  kms_key_id             = var.kms_key_id

  dynamic "lifecycle_policy" {
    for_each = length(var.transition_to_ia) > 0 ? [1] : []
    content {
      transition_to_ia = try(var.transition_to_ia[0], null)
    }
  }
  dynamic "lifecycle_policy" {
    for_each = length(var.transition_to_primary_storage_class) > 0 ? [1] : []
    content {
      transition_to_primary_storage_class = try(var.transition_to_primary_storage_class[0], null)
    }
  }

  performance_mode                = var.performance_mode
  provisioned_throughput_in_mibps = var.provisioned_throughput_in_mibps
  throughput_mode                 = var.throughput_mode

  tags = merge(
    {
      "Name" = var.creation_token
    },
    var.tags,
  )
}

resource "aws_efs_mount_target" "main" {
  count           = length(var.mount_target_subnet_ids) > 0 ? length(var.mount_target_subnet_ids) : 0
  file_system_id  = aws_efs_file_system.main.id
  subnet_id       = var.mount_target_subnet_ids[count.index]
  ip_address      = var.mount_target_ip_addresses[count.index]
  security_groups = concat(var.external_security_groups, aws_security_group.main.*.id)
}

resource "aws_efs_file_system_policy" "main" {
  count                              = var.file_system_policy != "" ? 1 : 0
  file_system_id                     = aws_efs_file_system.main.id
  bypass_policy_lockout_safety_check = var.bypass_policy_lockout_safety_check
  policy                             = var.file_system_policy
}

resource "aws_efs_backup_policy" "main" {
  file_system_id = aws_efs_file_system.main.id

  backup_policy {
    status = var.backup_policy_status
  }
}

# Efs Security Group
resource "aws_security_group" "main" {
  count       = length(var.mount_target_subnet_ids) > 0 && var.create_security_group ? 1 : 0
  name        = "${var.creation_token}-security-group"
  description = "Efs security Group for ${var.creation_token}"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.security_group_ingress
    content {
      description      = lookup(ingress.value, "description", "Rule to allow port ${try(ingress.value.from_port, null)} inbound traffic")
      from_port        = try(ingress.value.from_port, null)
      to_port          = try(ingress.value.to_port, null)
      protocol         = try(ingress.value.protocol, null)
      cidr_blocks      = try(ingress.value.cidr_blocks, [])
      ipv6_cidr_blocks = try(ingress.value.ipv6_cidr_blocks, [])
    }
  }

  dynamic "egress" {
    for_each = var.egress_rules
    content {
      description      = try(egress.value.description, 0)
      from_port        = try(egress.value.from_port, 0)
      to_port          = try(egress.value.to_port, 0)
      protocol         = try(egress.value.protocol, "-1")
      cidr_blocks      = try(egress.value.cidr_blocks, ["0.0.0.0/0"])
      ipv6_cidr_blocks = try([egress.value.ipv6_cidr_blocks], ["::/0"])
    }
  }

  tags = merge(
    {
      "Name" = var.creation_token
    },
    var.tags,
  )
}
