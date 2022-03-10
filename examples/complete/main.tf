data "alicloud_db_zones" "default" {
  engine         = "MySQL"
  engine_version = "5.7"
}

data "alicloud_images" "default" {
  name_regex = "^centos_6"
}

data "alicloud_instance_types" "default" {
  availability_zone = data.alicloud_db_zones.default.zones.0.id
}

data "alicloud_db_instance_classes" "default" {
  engine         = "MySQL"
  engine_version = "5.7"
}

module "example" {
  source = "../.."

  #alicloud_vpc
  vpc_name = var.vpc_name
  vpc_cidr = "172.16.0.0/16"

  #alicloud_vswitch
  cidr_blocks        = ["172.16.0.0/21"]
  availability_zones = [data.alicloud_db_zones.default.zones.0.id]

  #alicloud_security_group
  security_group_name = var.security_group_name
  description         = "tf-testacc-description"

  #alicloud_security_group_rule
  rule_type       = "ingress"
  nic_type        = "intranet"
  rule_policy     = "accept"
  rdp_port_range  = "3389/3389"
  ssh_port_range  = "22/22"
  icmp_port_range = "-1/-1"
  http_port_range = "80/80"
  rule_priority   = 1

  #alicloud_instance
  ecs_count = 1

  ecs_name                   = var.ecs_name
  image_id                   = data.alicloud_images.default.images.0.id
  ecs_type                   = data.alicloud_instance_types.default.instance_types.0.id
  availability_zone          = data.alicloud_db_zones.default.zones.0.id
  internet_charge_type       = var.internet_charge_type
  internet_max_bandwidth_out = 0
  ecs_password               = var.ecs_password
  ecs_charge_type            = var.ecs_charge_type
  disk_category              = "cloud_efficiency"
  system_disk_size           = var.system_disk_size

  #alicloud_eip_address
  name                     = var.name
  eip_isp                  = "BGP"
  eip_internet_charge_type = "PayByBandwidth"
  eip_payment_type         = "PayAsYouGo"

  #alicloud_db_instance
  engine               = "MySQL"
  engine_version       = "5.7"
  instance_type        = data.alicloud_db_instance_classes.default.instance_classes.0.instance_class
  instance_storage     = var.instance_storage
  instance_charge_type = var.instance_charge_type
  rds_zone_id          = data.alicloud_db_zones.default.zones.0.id

  #alicloud_db_account
  rds_account_name = "tf_rds_account"
  rds_account_pwd  = var.rds_account_pwd
  db_account_type  = "Normal"

  #alicloud_db_database
  db_name          = "tf-testacc-database"
  db_character_set = "utf8"

  #alicloud_db_account_privilege
  db_privilege = "ReadWrite"

}