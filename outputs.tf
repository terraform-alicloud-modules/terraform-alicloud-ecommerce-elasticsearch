output "instance_ids" {
  value = join(",",alicloud_instance.instance.*.id)
}

output "availability_zones" {
  value = join(",",alicloud_vswitch.vswitch.*.availability_zone)
}

output "ecs_name" {
  value = alicloud_instance.instance.0.instance_name
}
