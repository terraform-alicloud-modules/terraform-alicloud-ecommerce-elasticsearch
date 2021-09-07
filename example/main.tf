variable "ecs_name" {
  default = "terraform_test"
}

module "example" {
  source   = "../"
  ecs_name = var.ecs_name
}
