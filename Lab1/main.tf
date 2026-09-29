resource "random_string" "suffix" {
  length  = 6
  upper   = false
  special = false
}

locals {
  environment_prefix = "${var.application_name}-${var.environment_name}-${random_string.suffix.result}"

  # regional_stamps = [
  #   {
  #     region         = "centralindia"
  #     name           = "bar"
  #     min_node_count = 4
  #     max_node_count = 8
  #   },
  #   {
  #     region         = "westindia"
  #     name           = "foo"
  #     min_node_count = 4
  #     max_node_count = 8
  #   }
  # ]

  regional_stamps = {
    "bar" = {
      region         = "centralindia"
      min_node_count = 4
      max_node_count = 8
    },
    "foo" = {
      region         = "westindia"
      min_node_count = 4
      max_node_count = 8
    }
  }
}

module "regional_stamps" {
  source = "./modules/regional-stamp"

  # count = length(local.regional_stamps)

  # region         = local.regional_stamps[count.index].region
  # name           = local.regional_stamps[count.index].name
  # min_node_count = local.regional_stamps[count.index].min_node_count
  # max_node_count = local.regional_stamps[count.index].max_node_count

  for_each = local.regional_stamps

  # region         = local.regional_stamps[each.key].region
  # name           = each.key
  # min_node_count = local.regional_stamps[each.key].min_node_count
  # max_node_count = local.regional_stamps[each.key].max_node_count

  region         = each.value.region
  name           = each.key
  min_node_count = each.value.min_node_count
  max_node_count = each.value.max_node_count
}