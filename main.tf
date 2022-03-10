resource "alicloud_vpc" "vpc" {
  vpc_name   = var.vpc_name
  cidr_block = var.vpc_cidr
}

resource "alicloud_vswitch" "vswitch" {
  count      = length(var.cidr_blocks)
  vpc_id     = alicloud_vpc.vpc.id
  cidr_block = var.cidr_blocks[count.index]
  zone_id    = element(var.availability_zones, count.index)
}

# Security Group
resource "alicloud_security_group" "group" {
  name        = var.security_group_name
  vpc_id      = alicloud_vpc.vpc.id
  description = var.description
}

resource "alicloud_security_group_rule" "rdp" {
  type              = var.rule_type
  ip_protocol       = "tcp"
  nic_type          = var.nic_type
  policy            = var.rule_policy
  port_range        = var.rdp_port_range
  priority          = var.rule_priority
  cidr_ip           = var.vpc_cidr
  security_group_id = alicloud_security_group.group.id
}

resource "alicloud_security_group_rule" "ssh" {
  type              = var.rule_type
  ip_protocol       = "tcp"
  nic_type          = var.nic_type
  policy            = var.rule_policy
  port_range        = var.ssh_port_range
  priority          = var.rule_priority
  cidr_ip           = var.vpc_cidr
  security_group_id = alicloud_security_group.group.id
}

resource "alicloud_security_group_rule" "icmp" {
  type              = var.rule_type
  ip_protocol       = "icmp"
  nic_type          = var.nic_type
  policy            = var.rule_policy
  port_range        = var.icmp_port_range
  priority          = var.rule_priority
  cidr_ip           = var.vpc_cidr
  security_group_id = alicloud_security_group.group.id
}

resource "alicloud_security_group_rule" "http" {
  type              = var.rule_type
  ip_protocol       = "tcp"
  nic_type          = var.nic_type
  policy            = var.rule_policy
  port_range        = var.http_port_range
  priority          = var.rule_priority
  cidr_ip           = var.vpc_cidr
  security_group_id = alicloud_security_group.group.id
}

# ECS
resource "alicloud_instance" "instance" {
  count                      = var.ecs_count
  instance_name              = var.ecs_name
  image_id                   = var.image_id
  instance_type              = var.ecs_type
  availability_zone          = var.availability_zone
  vswitch_id                 = element(split(",", join(",", alicloud_vswitch.vswitch.*.id)), 1)
  security_groups            = alicloud_security_group.group.*.id
  internet_charge_type       = var.internet_charge_type
  internet_max_bandwidth_out = var.internet_max_bandwidth_out
  password                   = var.ecs_password
  instance_charge_type       = var.ecs_charge_type != "" ? var.ecs_charge_type : var.instance_charge_type == "Postpaid" ? "PostPaid" : "PrePaid"
  system_disk_category       = var.disk_category
  system_disk_size           = var.system_disk_size
}

# EIP
resource "alicloud_eip_address" "eip" {
  address_name         = var.name
  isp                  = var.eip_isp
  internet_charge_type = var.eip_internet_charge_type
  payment_type         = var.eip_payment_type
}

resource "alicloud_eip_association" "eip_asso" {
  allocation_id = alicloud_eip_address.eip.id
  instance_id   = alicloud_instance.instance[0].id
}

# RDS
resource "alicloud_db_instance" "rds" {
  engine               = var.engine
  engine_version       = var.engine_version
  instance_type        = var.instance_type
  instance_storage     = var.instance_storage
  instance_charge_type = var.instance_charge_type
  zone_id              = var.rds_zone_id
  vswitch_id           = element(split(",", join(",", alicloud_vswitch.vswitch.*.id)), 1)
  security_ips         = [alicloud_vpc.vpc.cidr_block]
}

resource "alicloud_db_account" "account" {
  db_instance_id   = alicloud_db_instance.rds.id
  account_name     = var.rds_account_name
  account_password = var.rds_account_pwd
  account_type     = var.db_account_type
}

resource "alicloud_db_database" "db" {
  instance_id   = alicloud_db_instance.rds.id
  name          = var.db_name
  character_set = var.db_character_set
}

resource "alicloud_db_account_privilege" "privilege" {
  instance_id  = alicloud_db_instance.rds.id
  account_name = alicloud_db_account.account.account_name
  privilege    = var.db_privilege
  db_names     = alicloud_db_database.db.*.name
}