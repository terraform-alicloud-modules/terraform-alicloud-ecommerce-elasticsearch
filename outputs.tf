output "instance_ids" {
  value = alicloud_instance.instance.*.id
}

output "availability_zones" {
  value = alicloud_vswitch.vswitch.*.availability_zone
}

output "ecs_name" {
  value = alicloud_instance.instance.0.instance_name
}