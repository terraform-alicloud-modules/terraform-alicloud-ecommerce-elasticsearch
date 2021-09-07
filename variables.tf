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
