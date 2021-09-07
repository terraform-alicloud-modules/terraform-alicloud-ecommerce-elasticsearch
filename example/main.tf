variable "ecs_name" {
  default = "terraform_test"
}

provider "alicloud" {
  region = "cn-shenzhen"
}

module "example" {
  source   = "../"
  ecs_name = var.ecs_name
}
