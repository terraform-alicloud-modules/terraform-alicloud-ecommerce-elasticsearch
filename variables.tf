#alicloud_vpc
variable "vpc_name" {
  description = "The name of the VPC."
  type        = string
  default     = ""
}

variable "vpc_cidr" {
  description = "The secondary CIDR blocks for the VPC."
  type        = string
  default     = ""
}

#alicloud_vswitch
variable "cidr_blocks" {
  description = "Set of cidr blocks used to launch several new vswitches."
  type        = list(string)
  default     = []
}

variable "availability_zones" {
  description = "Set of available zones used to launch several new vswitches."
  type        = list(string)
  default     = []
}

#alicloud_security_group
variable "security_group_name" {
  description = "The name of the security group."
  type        = string
  default     = ""
}

variable "description" {
  description = "The security group description."
  type        = string
  default     = ""
}

#alicloud_security_group_rule
variable "rule_type" {
  description = "The type of rule."
  type        = string
  default     = "ingress"
}

variable "nic_type" {
  description = "Network type, can be either internet or intranet, the default value is internet."
  type        = string
  default     = "intranet"
}

variable "rule_policy" {
  description = "The policy of rule."
  type        = string
  default     = "accept"
}

variable "rdp_port_range" {
  description = "The port range of RDP rule."
  type        = string
  default     = "3389/3389"
}

variable "ssh_port_range" {
  description = "The port range of SSH rule."
  type        = string
  default     = "22/22"
}

variable "icmp_port_range" {
  description = "The port range of ICMP rule."
  type        = string
  default     = "-1/-1"
}

variable "http_port_range" {
  description = "The port range of HTTP rule."
  type        = string
  default     = "80/80"
}

variable "rule_priority" {
  description = "The priority of rule."
  type        = number
  default     = 1
}

#alicloud_instance
variable "ecs_count" {
  description = "The number of instances to be created."
  type        = number
  default     = 1
}

variable "ecs_name" {
  description = "The name of the ECS."
  type        = string
  default     = ""
}

variable "image_id" {
  description = "The Image to use for the instance."
  type        = string
  default     = ""
}

variable "ecs_type" {
  description = "The type of instance to start."
  type        = string
  default     = ""
}

variable "availability_zone" {
  description = "The Zone to start the instance in."
  type        = string
  default     = ""
}

variable "internet_charge_type" {
  description = "Internet charge type of the instance, Valid values are PayByBandwidth, PayByTraffic."
  type        = string
  default     = "PayByTraffic"
}

variable "internet_max_bandwidth_out" {
  description = "Maximum outgoing bandwidth to the public network, measured in Mbps (Mega bit per second)."
  type        = number
  default     = 0
}

variable "ecs_password" {
  description = "Password to an instance is a string of 8 to 30 characters."
  type        = string
  default     = ""
}

variable "ecs_charge_type" {
  description = "Valid values are PrePaid, PostPaid, The default is PostPaid."
  type        = string
  default     = "PostPaid"
}

variable "disk_category" {
  description = "Valid values are ephemeral_ssd, cloud_efficiency, cloud_ssd, cloud_essd, cloud."
  type        = string
  default     = "cloud_efficiency"
}

variable "system_disk_size" {
  description = "Size of the system disk, measured in GiB."
  type        = number
  default     = 100
}

#alicloud_eip_address
variable "name" {
  description = "The name of module."
  type        = string
  default     = ""
}

variable "eip_isp" {
  description = "The ISP of EIP address."
  type        = string
  default     = "BGP"
}

variable "eip_internet_charge_type" {
  description = "The specification of the eip internet charge type."
  type        = string
  default     = "PayByBandwidth"
}

variable "eip_payment_type" {
  description = "The payment type of EIP address."
  type        = string
  default     = "PayAsYouGo"
}

#alicloud_db_instance
variable "engine" {
  description = "The specification of the engine."
  type        = string
  default     = "MySQL"
}

variable "engine_version" {
  description = "The specification of the engine version."
  type        = string
  default     = "5.7"
}

variable "instance_type" {
  description = "The specification of the rds instance type."
  type        = string
  default     = ""
}

variable "instance_storage" {
  description = "The specification of the instance storage."
  type        = string
  default     = "100"
}

variable "instance_charge_type" {
  description = "Valid values are Prepaid, Postpaid, Default to Postpaid."
  type        = string
  default     = "Postpaid"
}

variable "rds_zone_id" {
  description = "The Zone to launch the DB instance."
  type        = string
  default     = ""
}

#alicloud_db_account
variable "rds_account_name" {
  description = "Operation account requiring a uniqueness check."
  type        = string
  default     = ""
}

variable "rds_account_pwd" {
  description = "Operation password."
  type        = string
  default     = ""
}

variable "db_account_type" {
  description = "Privilege type of account."
  type        = string
  default     = "Normal"
}

#alicloud_db_database
variable "db_name" {
  description = "Name of the database requiring a uniqueness check."
  type        = string
  default     = ""
}

variable "db_character_set" {
  description = "Character set."
  type        = string
  default     = "utf8"
}

#alicloud_db_account_privilege
variable "db_privilege" {
  description = "The privilege of database."
  type        = string
  default     = "ReadWrite"
}

variable "disk_size" {
  description = "The specification of the disk size."
  type        = number
  default     = 100
}

variable "region" {
  description = "The region used to launch this module resources."
  type        = string
  default     = ""
}