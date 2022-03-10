#alicloud_vpc
variable "vpc_name" {
  description = "The name of the VPC."
  type        = string
  default     = "tf-testacc-vpc"
}

#alicloud_security_group
variable "security_group_name" {
  description = "The name of the security group."
  type        = string
  default     = "tf-testacc-sec"
}

#alicloud_instance
variable "ecs_name" {
  description = "The name of the ECS."
  type        = string
  default     = "tf-testacc-ecs"
}

variable "internet_charge_type" {
  description = "Internet charge type of the instance, Valid values are PayByBandwidth, PayByTraffic."
  type        = string
  default     = "PayByBandwidth"
}

variable "ecs_password" {
  description = "Password to an instance is a string of 8 to 30 characters."
  type        = string
  default     = "YourPassword123!"
}

variable "ecs_charge_type" {
  description = "Valid values are PrePaid, PostPaid, The default is PostPaid."
  type        = string
  default     = "PostPaid"
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
  default     = "tf-testacc-eip"
}

#alicloud_db_instance
variable "instance_storage" {
  description = "The specification of the instance storage."
  type        = string
  default     = "100"
}

variable "instance_charge_type" {
  description = "Valid values are PrePaid, PostPaid, The default is PostPaid."
  type        = string
  default     = "Postpaid"
}

#alicloud_db_account
variable "rds_account_pwd" {
  description = "Operation password."
  type        = string
  default     = "YourPassword123!"
}