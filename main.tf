resource "alicloud_vpc" "vpc" {
  vpc_name   = var.vpc_name
  cidr_block = var.vpc_cidr
}

resource "alicloud_vswitch" "vswitch" {
  vpc_id     = alicloud_vpc.vpc.id
  count      = length(var.cidr_blocks)
  cidr_block = lookup(var.cidr_blocks,"az${count.index}")
  zone_id    = lookup(var.availability_zones,"az${count.index}")
}

# ECS
resource "alicloud_instance" "instance" {
  instance_name              = var.ecs_name
  image_id                   = var.image_id
  instance_type              = var.ecs_type
  count                      = var.ecs_count
  security_groups            = alicloud_security_group.group.*.id
  availability_zone          = var.availability_zone
  internet_charge_type       = var.internet_charge_type
  internet_max_bandwidth_out = var.internet_max_bandwidth_out
  password                   = var.ecs_password
  instance_charge_type       = "PostPaid"
  system_disk_category       = var.disk_category
  system_disk_size           = var.system_disk_size
  vswitch_id                 = element(split(",",join(",",alicloud_vswitch.vswitch.*.id)),1)
}

# Security Group
resource "alicloud_security_group" "group" {
  name        = var.security_group_name
  vpc_id      = alicloud_vpc.vpc.id
  description = "ec security group"
}

resource "alicloud_security_group_rule" "rdp" {
  type              = "ingress"
  ip_protocol       = "tcp"
  nic_type          = var.nic_type
  policy            = "accept"
  port_range        = "3389/3389"
  priority          = 1
  security_group_id = alicloud_security_group.group.id
  cidr_ip           = "0.0.0.0/0"
}

resource "alicloud_security_group_rule" "ssh" {
  type              = "ingress"
  ip_protocol       = "tcp"
  nic_type          = var.nic_type
  policy            = "accept"
  port_range        = "22/22"
  priority          = 1
  security_group_id = alicloud_security_group.group.id
  cidr_ip           = "0.0.0.0/0"
}


resource "alicloud_security_group_rule" "icmp" {
  type              = "ingress"
  ip_protocol       = "icmp"
  nic_type          = var.nic_type
  policy            = "accept"
  port_range        = "-1/-1"
  priority          = 1
  security_group_id = alicloud_security_group.group.id
  cidr_ip           = "0.0.0.0/0"
}


resource "alicloud_security_group_rule" "http" {
  type              = "ingress"
  ip_protocol       = "tcp"
  nic_type          = var.nic_type
  policy            = "accept"
  port_range        = "80/80"
  priority          = 1
  security_group_id = alicloud_security_group.group.id
  cidr_ip           = "0.0.0.0/0"
}

# EIP
resource "alicloud_eip" "eip" {
  bandwidth            = "10"
  internet_charge_type = "PayByBandwidth"
}

resource "alicloud_eip_association" "eip_asso" {
  allocation_id = alicloud_eip.eip.id
  instance_id   = alicloud_instance.instance[0].id
}

# RDS
resource "alicloud_db_instance" "rds" {
  engine               = "MySQL"
  engine_version       = "5.7"
  instance_type        = "rds.mysql.s2.large"
  instance_storage     = "100"
  instance_charge_type = "Postpaid"
  zone_id              = var.rds_zone_id
  vswitch_id           = element(split(",",join(",",alicloud_vswitch.vswitch.*.id)),1)
  security_ips         = [alicloud_vpc.vpc.cidr_block]
}

resource "alicloud_db_account" "account" {
  db_instance_id   = alicloud_db_instance.rds.id
  account_name     = var.rds_account_name
  account_password = var.rds_account_pwd
  account_type     = "Normal"
}

resource "alicloud_db_database" "db" {
  instance_id   = alicloud_db_instance.rds.id
  name          = "magento"
  character_set = "utf8"
}

resource "alicloud_db_account_privilege" "privilege" {
  instance_id  = alicloud_db_instance.rds.id
  account_name = alicloud_db_account.account.name
  privilege    = "ReadWrite"
  db_names     = alicloud_db_database.db.*.name
}
