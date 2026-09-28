resource "random_string" "suffix" {
  length  = 6
  upper   = false
  special = false
}

locals {
  environment_prefix = "${var.application_name}-${var.environment_name}-${random_string.suffix.result}"
}

module "regionA" {
  source = "./modules/regional-stamp"

  region         = "centralindia"
  name           = "bar"
  min_node_count = 4
  max_node_count = 8
}

module "regionB" {
  source = "./modules/regional-stamp"

  region         = "westindia"
  name           = "foo"
  min_node_count = 4
  max_node_count = 8
}