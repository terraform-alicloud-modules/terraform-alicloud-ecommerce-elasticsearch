variable "ecs_count" {
  default = "1"
}

variable "image_id" {
  default = "m-wz9d9e2n6iw68exr0z9g"
}

variable "availability_zone" {
  default = "cn-shenzhen-e"
}

variable "ecs_name" {
  default = "EC001"
}

variable "ecs_type" {
  default = "ecs.g5.large"
}

variable "ecs_password" {
  default = "Test1234"
}

variable "internet_charge_type" {
  default = "PayByTraffic"
}

variable "internet_max_bandwidth_out" {
  default = 0
}

variable "disk_category" {
  default = "cloud_efficiency"
}

variable "disk_size" {
  default = "100"
}

variable "system_disk_size" {
  default = "100"
}

variable "security_group_name" {
  default = "ali-sg-ec-sz"
}

variable "nic_type" {
  default = "intranet"
}

variable "region" {
  default = "cn-shenzhen"
}

variable "rds_zone_id" {
  default = "cn-shenzhen-MAZ5(d,e)"
}

variable "rds_account_name" {
  default = "xianwang2019"
}

variable "rds_account_pwd" {
  default = "Test1234"
}

variable "availability_zones" {
  type    = map
  default = {
    az0 = "cn-shenzhen-d"
    az1 = "cn-shenzhen-e"
  }
}

variable "cidr_blocks" {
  type    = map
  default = {
    az0 = "192.168.1.0/24"
    az1 = "192.168.2.0/24"
  }
}

variable "vpc_name" {
  default = "ec-sz-vpc"
}

variable "vpc_cidr" {
  default = "192.168.0.0/16"
}

variable "db_privilege" {
  description = "The privilege of database."
  default     = "ReadWrite"
}

variable "db_character_set" {
  default = "utf8"
}

variable "db_name" {
  default = "magento"
}

variable "db_account_type" {
  default = "Normal"
}

variable "engine" {
  default = "MySQL"
}

variable "engine_version" {
  default = "5.7"
}

variable "instance_type" {
  default = "rds.mysql.s2.large"
}

variable "instance_storage" {
  default = "100"
}

variable "instance_charge_type" {
  default = "Postpaid"
}

variable "eip_internet_charge_type" {
  description = "The specification of the eip internet charge type."
  type        = string
  default     = "PayByBandwidth"
}

variable "eip_isp" {
  description = "The ISP of EIP address."
  default     = "BGP"
}

variable "eip_payment_type" {
  description = "The payment type of EIP address."
  default     = "PayAsYouGo"
}

variable "name" {
  description = "The name of module."
  default     = "name"
}

variable "rule_policy" {
  description = "The policy of rule."
  default     = "accept"
}

variable "rule_type" {
  description = "The type of rule."
  default     = "ingress"
}

variable "description" {
  description = "The description of module."
  default     = "description"
}

variable "rule_priority" {
  description = "The priority of rule."
  default     = 1
}

variable "rdp_port_range" {
  description = "The port range of RDP rule."
  default     = "3389/3389"
}

variable "ssh_port_range" {
  description = "The port range of SSH rule."
  default     = "22/22"
}

variable "icmp_port_range" {
  description = "The port range of ICMP rule."
  default     = "-1/-1"
}

variable "http_port_range" {
  description = "The port range of HTTP rule."
  default     = "80/80"
}
